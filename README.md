# WebPortFolio

## ローカル開発用
- rubyインストール
```bash
sudo apt update
sudo apt install -y build-essential libssl-dev libreadline-dev zlib1g-dev
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# Ruby 3.1.4をインストールする場合
rbenv install 3.1.4
rbenv global 3.1.4

# インストール確認
ruby -v
```

- Node.jsインストール
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
source ~/.bashrc

# v23.6.0をインストールする場合
nvm install 23.6.0
nvm use 23.6.0
nvm alias default 23.6.0

# インストール確認
node -v
npm -v
```

- gemインストール
```bash
# 必要なパッケージをインストール
sudo apt install -y postgresql libpq-dev libyaml-dev

# gemインストール
bundle install --path vendor/bundle
```

- マイグレーション
```bash
rails db:migrate
```

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
make run
```
