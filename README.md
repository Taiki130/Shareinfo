# README

## Shareinfo
![image](https://user-images.githubusercontent.com/50824605/71142472-ce31e980-225a-11ea-9c8b-d08b8b0f795c.jpg)

Shareinfoは情報共有webサービスです。就活用ポートフォリオとして作成しました。（PCでの閲覧推奨）

## リンク
https://shareinfo.org

ログイン画面からテストユーザーログインができます。

Terraformのリポジトリはこちら
https://github.com/Taiki130/Shareinfo-terraform

## 使用技術
* Ruby 2.5.1
* Rails 5.2.4
* Slim
* MySQL 5.7
* Bootstrap
* Docker 10.03.4
* docker-compose 1.24.1
* Github
* Terraform 0.12.7
* AWS
  * VPC
  * EC2
  * ECS
  * ECR
  * SSM
  * RDS for MySQL
  * ALB
  * Route 53
  * ACM
  * S3
  * CloudWatch
* CircleCI

## 機能一覧、使用したgemなど
* 投稿一覧表示機能
* 投稿詳細表示機能
* 投稿機能
* ユーザー登録機能
* ユーザーログイン機能
* 投稿とユーザーのプロフィールの画像ファイルのアップロード機能（Active Storage, AWS S3）
* 投稿一覧画面とユーザー一覧画面でのページネーション機能（kaminari）
* 投稿一覧画面でタイトルでの検索機能（ransack）

## テスト
 * RSpec
  * 単体テスト
  * 統合テスト

## アーキテクチャ
![shareinfo-archtecture](https://user-images.githubusercontent.com/50824605/71142436-be1a0a00-225a-11ea-891a-69f116e19407.png)

Dockerコンテナで実行されるRailsアプリケーションをECSで管理し公開しました。GitHubとCirclCIを連携して、タスク定義、サービスの更新、migrationをし、masterブランチへのマージでデプロイを実行しています。Terraformでインフラのコード化を行いました。tfstateはS3に保存しています。
