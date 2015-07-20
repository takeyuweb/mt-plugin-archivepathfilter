package ArchivePathFilter::L10N::ja;
use strict;
use utf8;
use base 'ArchivePathFilter::L10N::en_us';

our %Lexicon = (
    # config.yaml
    '_PLUGIN_DESCRIPTION'   =>  <<"HTML",
ウェブページの検索フィルタに『アーカイブパス』を追加します。<br />
利用前に既存の記事・ウェブページのアーカイブパスをデータベースに登録する必要があります。<br />
（プラグインインストール後に保存された記事については自動で登録されるため、次回以降の操作は不要です）<br />
<a href="?__mode=install_archive_path_filter">アーカイブパスを登録</a>
HTML
    # ArchivePathFilter::Plugin
    'Archive Path'           => 'アーカイブパス',
    'ArchivePath Filter plug-in installation is not complete.' => 'ArchivePath Filterプラグインのインストールは完了していません。',
    # install_archive_path_filter
    'Store archive paths'   => 'アーカイブパスを登録',
    'Start'                 => '開始',
    'Please back to your dashboard.'    => 'ダッシュボードにお戻り下さい。',
);

1;