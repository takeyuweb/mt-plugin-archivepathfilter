package ArchivePathFilter::Plugin;
use strict;
use MT;
use File::Spec;

sub list_prop {
    my $app = MT->instance;
    my $plugin = MT->component( 'ArchivePathFilter' );
    $plugin->translate( 'Archive Path' );
}

sub cb_pre_save {
    my ( $cb, $obj, $original ) = @_;
    if ( my $blog = $obj->blog ) {
        $obj->filter_archive_path( $obj->archive_file() );
    }
    1;
}

sub cb_set_notification_dashboard {
    my $cb = shift;
    my ( $loop_notification_dashboard ) = @_;
    my $plugin = MT->component( 'ArchivePathFilter' );
    my $installed = $plugin->get_config_value( 'installed', 'system' );
    unless ( $installed ) {
        push @$loop_notification_dashboard, {
            level  => 'warning',
            text   => $plugin->translate( 'ArchivePath Filter plug-in installation is not complete.' ),
            detail => '<a href="?__mode=install_archive_path_filter">'.$plugin->translate( 'Store archive paths' ).'</a>',
        };
    }
}

sub install_archive_path_filter {
    my $app = shift;
    my %params = ();
    $app->build_page( 'install_archive_path_filter.tmpl', \%params );
}

sub do_install_archive_path_filter {
    my $app = shift;
    $app->validate_magic or return $app->trans_error( 'Invalid request.' );
    
    my $limit = 100;
    my $page = $app->param( 'page' ) || 1;
    my $offset = ($page - 1) * $limit;
    my @entries = MT->model( 'entry' )->load( { class => '*' }, { offset => $offset, limit => $limit } );
    foreach my $obj ( @entries ) {
        if ( my $blog = $obj->blog ) {
            $obj->filter_archive_path( $obj->archive_file() );
            $obj->save or die $obj->errstr;
        }
    }
    
    my $total = MT->model( 'entry' )->count( { class => '*' } );
    my $current = $offset + scalar( @entries );
    my $remnant = $total - $current;
    if ( $remnant ) {
        my %params = (
            next_page   => $page + 1,
            total       => $total,
            current     => $current,
            remnant     => $remnant,
        );
        $app->build_page( 'do_install_archive_path_filter.tmpl', \%params );
    } else {
        my $plugin = MT->component( 'ArchivePathFilter' );
        $plugin->set_config_value( 'installed', 1, 'system' );
        my %params = ();
        $app->build_page( 'done_install_archive_path_filter.tmpl', \%params );
    }
}

1;