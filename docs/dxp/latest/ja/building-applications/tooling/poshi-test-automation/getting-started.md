---
toc:
- ./getting-started/setup.md
- ./getting-started/creating-a-path-file.md
- ./getting-started/creating-a-macro-file.md
- ./getting-started/creating-a-testcase-file.md
- ./getting-started/syntax-validation.md
- ./getting-started/running-a-test.md
- ./getting-started/understanding-test-results-and-debugging-tests.md
myst:
  html_meta:
    "documentation-type": "user-guide"
---
# はじめに

これまでPoshiのテストは、 [Liferayのソース コード](https://github.com/liferay/liferay-portal/) 内にテストファイルをダウンロードし、作成することでしか実行できませんでした。 **Poshi Standalone** gradleプロジェクトを使えば、Liferay Portalのgithubリポジトリ全体を取得することなく、好きなディレクトリでPoshiを使用することができます。

::::{grid} 1
:gutter: 3 3 3 3

:::{grid-item-card} セットアップ
:link: ./getting-started/setup.md

Poshi Standaloneのgradleプロジェクトをセットアップします。
:::

:::{grid-item-card} パスファイルの作成
:link: ./getting-started/creating-a-path-file.md

ロケーターのパスファイルを作成します。
:::

:::{grid-item-card} マクロファイルの作成
:link: ./getting-started/creating-a-macro-file.md

マクロファイルでの連携をスクリプトします。
:::

:::{grid-item-card} テストケースファイルの作成
:link: ./getting-started/creating-a-testcase-file.md

テストケースファイルでのユーザー行動をスクリプトします。
:::

:::{grid-item-card} シンタックス バリデーション
:link: ./getting-started/syntax-validation.md

構文を確認してから、テストを実行します。
:::

:::{grid-item-card} テストの実行
:link: ./getting-started/running-a-test.md

Poshiテストの実行
:::

:::{grid-item-card} テスト結果の理解とデバッグ Poshi
:link: ./getting-started/understanding-test-results-and-debugging-tests.md

テスト実行における失敗をデバッグします。

:::

::::