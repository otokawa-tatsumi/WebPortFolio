.DEFAULT_GOAL := help

.PHONY: up-db
up-db: ## 開発用DBの起動
	@docker compose -f compose-dev.yaml up -d --build

.PHONY: down-db
down-db: ## 開発用DBの終了（DBを初期化したい場合はOPTION=-vを指定する）
	@docker compose -f compose-dev.yaml down $(OPTION)

.PHONY: status
status: ## 起動中のサービス一覧
	@docker compose -f compose-dev.yaml ps

.PHONY: log
log: ## ログ表示 Ctrl+Cで終了\n特定のサービスのログのみ表示したい場合はOPTIONにcompose.yaml上のサービス名を指定する\n（例：アプリのログを見たい場合、OPTION=appと指定）
	@docker compose -f compose-dev.yaml logs -f $(OPTION)

.PHONY: help
help: ## ヘルプを表示する
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {gsub(/\\n/, "\n" "                     ", $$2); printf "\033[36m%-20s\033[0m %s\n\n", $$1, $$2}'