ArchivePath Filter プラグイン
===========

* Author:: Yuichi Takeuchi <uzuki05@takeyu-web.com>
* Website:: http://takeyu-web.com/
* Copyright:: Copyright 2015 Yuichi Takeuchi
* License:: MIT License

記事やウェブページの書き出しパスでの検索フィルタを管理画面に追加します。

![利用イメージ](https://raw.github.com/uzuki05/mt-plugin-archivepathfilter/master/ArchivePathFilter.png)

大量の階層化されたカテゴリやフォルダで管理された記事を探したいときなど、「フォルダ」の検索フィルタではサブフォルダが考慮されず使いづらいと指摘されたので作りました。

動作要件
-----------

* MT(MTOS) 6.0 / 6.1
* CGI / PSGI対応

インストール
-----------

1. plugins/ArchivePathFilter を MT_DIR/plugins/ にコピーして下さい。
2. ダッシュボード上の通知メッセージまたはシステムのプラグイン設定「ArchivePathFilter」から、アーカイブパスの登録操作を行って下さい。（初回インストール時のみ、各記事の書き出し先パスをDBに登録する操作が必要）

設定
-----------

不要。

利用方法
-----------

インストールすると、ブログ記事およびウェブページの一覧で選択できるフィルタに「アーカイブパス」が追加されます。

お約束
-----------

ご利用は自己責任で。
