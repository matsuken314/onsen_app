# ととのい

## 概要 
サウナ好きの人達がサ活（サウナ・水風呂・外気浴の時間）を記録して管理するためのサービスです。


サービスURL : https://totonoi.org/

## 読む前に知ってほしいこと
「ととのう」・・・ サウナ・水風呂・外気浴を繰り返すことで身体はリラックスし、頭は興奮するトランス状態になること。
参考サイト　: https://www.pen-online.jp/article/008062.html

## なぜ作ったのかというストーリー

## メインのターゲットユーザー
サウナ好き（サウナー）

# 使用画面のイメージ

"hoge"の魅力が直感的に伝えわるデモ動画や図解を載せる

# 使用技術

## フロントエンド
- HTML
- CSS,Sass
- JQuery 3.6.0

## バックエンド
- Ruby 2.6.8
- Ruby on Rails 6.1.4.1

## インフラ
- Heroku(ステージング環境→本番環境)＋AWS(S3)
- Cloudflare(Herokuに適用した独自ドメインをSSL化するために使用)

## データベース
- PostgreSQL14.0

## その他
- Visual Studio Code（エディター）
- Github(ソースコード管理)
- Rubocop (静的コード解析ツール)
- Draw.io (ER図の作成)
- unDraw(イラスト素材)
- COOL COLORS（全体の配色選定）
- Notion（タスク管理、コードのドキュメント）

# 工夫した点

"hoge"を動かすのに必要なライブラリなどを列挙する

* huga 3.5.2
* hogehuga 1.0.2

# 基本機能

Requirementで列挙したライブラリなどのインストール方法を説明する

```bash
pip install huga_package
```

# ER図

DEMOの実行方法など、"hoge"の基本的な使い方を説明する

```bash
git clone https://github.com/hoge/~
cd examples
python demo.py
```

# 今後の課題

注意点などがあれば書く

# 作者情報

- Kenei Matsuo
- Twitter: https://twitter.com/matsuken_web314
- E-mail: kenei031455@gmail.com

# License


### 制作背景(なぜこのサービスを作りたいのか？)

① 訪れた施設は何度のサウナにどれくらい入って、何度の水風呂にどれくらい入ってから外気浴をどれくらいすると、ととのい度がマックスに至るのかを記録したいというサウナーとしての思い。

② ととのった配分（サウナ・水風呂・外気浴のそれぞれの時間）を記録し、みんなで共有することで
最高のととのいを探求できるんじゃないかという思い


