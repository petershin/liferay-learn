# Importing Knowledge Base Articles

{bdg-secondary}`liferay 7.4 U72+/GA72+`.

ナレッジベースの記事を [Markdown](https://www.markdownguide.org/) ファイルとして下書きし、Liferay にインポートすることができます。 そのためには、各Markdownファイルが適切にフォーマットされ、ZIPアーカイブにパッケージされていることを確認する必要があります。 インポートされた記事は自動的にHTMLに変換され、ナレッジベースUIに表示されます。

こうすることで、Liferayに記事を公開する前に、外部ツールを使って記事の下書き、ホスト、共同作業を行うことができます。

```{note}
ナレッジベース > ナレッジベース：Markdown記事をインポートするには、*記事のインポート*権限が必要です。
```

## インポート用Markdownファイルの準備

Knowledge Baseは [Multi-Markdown](https://fletcherpenney.net/multimarkdown) 方言をサポートしています。この方言は基本的なMarkdownを表組み、画像キャプション、脚注などの機能で拡張します。 言語として、Markdownは読みやすく、直感的で、多機能だ。 GitHubのようなサービスを使えば、あなたや他の人がドキュメントをレビューし、共同作業することができる。

### ファイル要件

Markdownファイルをインポートするには

* ZIPファイルにパッケージされていること。
* `.md`または`.markdown`ファイルの拡張子を使用してください。
* 記事のタイトルを設定するためにH1（例：`# Some Heading`）で始める。
* 記事のフレンドリーURLを設定するために、H1の後にユニークなIDを含める（例：`# Some Heading [](id=some-heading) `）。

例えば、`modern-pentathlon.md`という名前の記事にはこのような内容を含めることができる：

```markdown
# Modern Pentathlon [](id=modern-pentathlon) 

The modern pentathlon is a competition across five different sport disciplines.

Each athlete must compete in fencing, shooting, swimming, horseback riding, and running.
```

各ZIPファイルには、新しいファイルや変更されたファイルをいくつでも含めることができます。

### オプション構成

ファイル名に数字の接頭辞をつけることで、インポート時の記事の順番を決めることができる（例：`00-foo.md`、`01-bar.md`）。 さらに、インポートされた記事の親/子階層を作成するために、`.markdown`拡張子のファイルに接尾辞`-intro`を追加することができます。

例えば、これらのファイルが同じフォルダにある場合を考えてみましょう：`00-foo-intro.markdown`、`01-bar.markdown`、`02-goo.markdown`です。 インポートされると、これが記事の順序と階層になる：

```bash
└── Foo
    ├── Bar
    └── Goo
```

記事が画像を参照している場合、ZIPファイルのルートにある `/images` フォルダに画像を追加することで、インポートに画像を含めることができます。 サポートされている添付ファイルの拡張子は `.bmp`、`.gif`、`.jpeg`、`.jpg`、`.png` です。

```{note}
画像リソースは、記事の中で参照されている場合のみインポートされます。 それ以外は無視される。
```

システム設定により、ナレッジベースのインポート設定を表示および設定することができます。 詳しくは [ナレッジベース システム設定](knowledge-base-system-settings.md) をご覧ください。

### ソースURLの設定

[GitHub](https://github.com) のようなサービスでMarkdownファイルをホストしている場合、リポジトリの場所を指定するソースURLを設定することができます。 この機能を使用するには、まず [Knowledge Base System Settings](knowledge-base-system-settings.md) でソース URL を有効にします。 次に、ZIPファイルのルートに `.METADATA` ファイルを追加し、目的のリポジトリのベースURLを記述します。 インポーターはZIPアーカイブの各ファイルのパスをこのベースURLに追加し、完全なソースURL(`[ベースURL]/[記事ファイルパス]`)を形成します。

例えば、このベースURLのシナリオを考えてみよう：

```
https://github.com/clarity/clarity-guide/blob/master/docs/latest/en
```

もし`folder-01/file.md`でZIPアーカイブをインポートした場合、これが結果のソースURLになる：

```
https://github.com/clarity/clarity-guide/blob/master/docs/latest/en/folder-01/file.md
```

## Markdownファイルのインポート

1. [サイトメニュー](../../images/icon-menu.png)を開き、_コンテンツとデータ_ &rarr; _ナレッジベース_に移動します。

1. 記事とフォルダ(![記事とフォルダ](../../images/icon-pages-tree.png))セクションで、目的のフォルダに移動し、_追加_(![追加ボタン](../../images/icon-add.png))をクリックし、_インポート_を選択します。

   ![Go to the desired folder, click Add, and select Import.](./importing-knowledge-base-articles/images/01.png)

   または、目的のフォルダの_Actions_ボタン（！[Action Button](../../images/icon-actions.png)）をクリックし、_Import_を選択します。

   ![Click the Actions button for the desired folder and select Import.](./importing-knowledge-base-articles/images/02.png)

1. *ファイルを選択*をクリックし、目的のZIPファイルを選択します。

   ![Upload your ZIP file.](./importing-knowledge-base-articles/images/03.png)

1. 有効/無効 _記事ファイルの数字の接頭辞を優先順位として適用_。 これは、Knowledge Baseが各ファイルの数字の接頭辞を使って順番を決めるかどうかを決定します。

1. ［_保存_］をクリックします。

保存されると、インポーターが各ファイルのMarkdownをHTMLに変換し、出来上がった記事が公開される。

```{important}
インポートされた記事は、ワークフロー設定に依存しません。 つまり、インポートされた記事は自動的に承認される。
```

## 輸入プロセスを理解する

インポートが開始されると、Markdownインポーターは各ファイルのH1とIDが既存のナレッジベースの記事と一致するかどうかをチェックします。 一致した場合、インポーターは既存の記事の内容を置き換えます。 一致するものがない場合は、新しい記事が作成されます。

インポーターは記事を作成および更新するだけです。 既存の記事は削除されない。 手動で記事を削除する必要があります。

```{tip}
ファイルの数字のプレフィックスを更新することで、Liferayでの順番を更新することができます（例：`00-file.md`を`01-file.md`に変更する）。

アーティクルのヘッダーIDを更新すると、新しいフレンドリーURLで新しいアーティクルが作成され、既存のアーティクルは更新も削除もされません。
```

## 関連トピック

* [ナレッジ・ベース記事の作成](./creating-knowledge-base-articles.md)
* [ナレッジベースの管理](./managing-the-knowledge-base.md)