# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

- DB起動
```bash
make up-db
```

- DB終了
```bash
make down-db
# DBを初期化したい場合は以下
make down-db OPTION=-v
```

- アプリ起動
```bash
docker run -it --rm --name my-rails-app --network host -v $(pwd):/app my-rails-app
```

- マイグレーション実行
```bash
docker run -it --rm --name my-rails-app --network host -v $(pwd):/app my-rails-app bash -c "rails db:migrate"
```