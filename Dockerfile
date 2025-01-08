# ベースイメージ
FROM ruby:3.1.4

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y nodejs

# 作業ディレクトリを設定
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile* ./

# 必要なgemをインストール
RUN bundle install

# ポート3000を開放
EXPOSE 3000

# サーバーの起動コマンド
CMD ["rails", "server", "-b", "0.0.0.0"]
