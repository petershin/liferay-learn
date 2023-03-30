---
uuid: afe56739-fa42-4145-a09a-24c56a0b9ec8
---
# フラグメントツールキットコマンドリファレンス

[フラグメントツールキット](../../developing-page-fragments/using-the-fragments-toolkit.md)は、現在実行中の Liferay DXP インスタンスに接続して、フラグメントをインポートおよびエクスポートできます。 ツールキットで作成したフラグメントをポータルに自動的にインポートすることもできます。 次のコマンドを使用できます。

<!-- TODO: The description for `npm run preview` is probably too long, it's overrunning the column width into a new table cell when the site is built. Probably should consider adding an asterisk and adding the version specific info separately after the table. -->

| コマンド                               | Description                                                                                                                                                                                                                          |
|:---------------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `npm run add-collection`           | フラグメントを整理するために、新しいコレクションを作成します。 プラットフォームではFragment Setsと呼ばれる。                                                                                                                                                                        |
| `npm run add-fragment`             | コンポーネント、入力、またはReactフラグメントを新規または既存のコレクションに追加します。                                                                                                                                                                                      |
| `npm run add-fragment-composition` | 新規または既存のコレクションに、新しいフラグメントコンポジションを追加します。                                                                                                                                                                                              |
| `npm run add-page-template`        | 表示ページテンプレート、ページテンプレート、マスターページのいずれかを新規に作成します。                                                                                                                                                                                         |
| `npm run build`                    | `.sass` または `.scss` `fragment.json`'の `cssPath` キーで指定されたファイルをコンパイルし、コンパイルした CSS コードを `build/liferay-fragments`に格納します。 コンパイルされたCSSのみが保存され、SCSSはデータベースには保存されません。 外部フラグメントは、外部リポジトリに保存する必要があります。                                        |
| `npm run compress`                 | Portal に手動でインポートできる `.zip` ファイルを作成します。                                                                                                                                                                                               |
| `npm run export`                   | 実行中のサーバーからコレクションとフラグメントを取得します                                                                                                                                                                                                        |
| `npm run import`                   | コレクションとフラグメントを現在のプロジェクトから実行中のサーバーに送信します。 フラグメントの構成 JSON (利用可能な場合) が無効な場合、インポートは失敗し、エラー メッセージが表示されます。                                                                                                                                 |
| `npm run import:watch`             | 作成または変更されたコレクションとフラグメントをポータルに自動的にインポートします.                                                                                                                                                                                           |
| `npm run preview`                  | インポートする前にフラグメントをプレビューする。 フラグメントに加えられた変更は、自動でリロードされ、更新を表示します。 なお、この機能はLiferay DXP 7.2 SP1+とLiferay Portal 7.2 GA2+で利用可能で、ポータルインスタンスに [OAuth 2](https://web.liferay.com/marketplace/-/mp/application/109571986) プラグインをインストールする必要があります。 |

```{note}
フラグメントセットプロジェクトの `package.json` にある `scripts` セクションの中に、利用可能なタスクがすべて含まれていることが確認できます。
```

これらのツールを自由に使用できるため、ローカル環境のコマンド ラインからページ フラグメントの作成と編集を効率的に管理できます。
