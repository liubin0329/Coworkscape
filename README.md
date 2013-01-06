# はじめに

もともとは、[みんなで作るコワーキングスペース情報サイト](http://blog.non-standardworld.co.jp/non-standard_world/news/coworkscape/)として運用していたサイトをMITライセンスで配布していたものです。
汎用性の高い作りをしているので、Ruby on Railsがわかる方が少し手を加えれば、ユーザーから写真や文章や住所の投稿を受け付けて、情報を表示するタイプのWEBサービスが簡単に作れると思います。

## 動作環境について

Rails 3.2.X/Heroku/Amazon S3(データストレージ)で動作していました。

### ご参考：Herokuで使用していたアドオン

検索にSolrを使用しているため、サーバー上でもSolrを動かせる環境が必要になります。

- Email Hook
- Heroku Postgres Dev
- Hostname SSL
- MemCachier
- New Relic Standard
- PG Backups Auto
- Websolr Cobalt

## 設定方法

ソースコードをCloneもしくはZIPでダウンロードして、以下を設定すると動作します。

###メールの差出人設定

/config/environments内の各ファイルの以下の部分にメールの配信元となるアドレスのsmtpのホスト、ID/PWを設定します。

    config.action_mailer.default_url_options = { :host => 'cowork.so' }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
     :address => "smtp.gmail.com",
     :port => 587,
     :domain => "",
     :authentication => :login,
     :user_name => "",
     :password => "" 
     }

###amazon S3設定

/config/s3.ymlの以下部分にユーザーが投稿した画像の保管場所となるamazon S3のバケットを設定します。

     bucket: 'バケット名'
     access_key_id: 'アクセスキーID'
     secret_access_key: 'アクセスキー'
     s3_host_name: ホスト名

###Facebookの認証の設定

認証にはFacebookを利用しています。そのため、FacebookのアプリケーションIDが必要になります。

     config.omniauth :facebook, "FacebookのアプリケーションID", "シークレットトークン", {:scope => 'email, offline_access', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}

以上で動作すると思います。