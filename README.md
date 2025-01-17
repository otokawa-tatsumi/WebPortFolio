# WebPortFolio

## 概要

## 機能

## 実行手順

## 開発環境の構築と実行
- VSCode拡張機能のインストール
    - Dev Containers

- VSCodeのメニューから「表示」＞「コマンドパレット」を選択

- コマンドパレットで以下を入力し、実行
    ```
    Dev Containers: Reopen in Container
    ```

- VSCode上でウィンドウが再読み込みされる

- .env.exampleをコピーして.envを作成する
    ```bash
    cp .env.example .env
    # .envのPG_HOSTは"localhost"ではなく"db"としていする(別コンテナでDBを実行しているため)
    ```

- F5キー もしくは VSCodeの左メニューの「実行とデバッグ」から実行

- ブラウザから http://localhost:3000 にアクセス
