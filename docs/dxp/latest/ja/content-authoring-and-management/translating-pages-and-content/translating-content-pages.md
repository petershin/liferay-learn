---
uuid: f2b9e469-c8cc-44ca-a7e6-cff4d6dbe2b4
---
# コンテンツページの翻訳

{bdg-secondary}`Liferay 7.4 U15以降およびGA15以降で利用可能`

Liferayには、 **コンテントページ** を翻訳するための統合ツールがあり、世界中のユーザー向けに魅力的でローカライズされたエクスペリエンスを作成できます。 これらのツールを使って、コンテントページのエクスペリエンスを手動で翻訳したり、翻訳をXLIFFファイルとしてインポートしたりすることができます。

```{important}
コンテントページを翻訳する場合、ユーザーはページの名前とインラインフラグメントテキスト（例：HTML、ヘッダーなど）のみを翻訳することができます。 ウィジェットやマッピングされたフラグメントフィールドを翻訳することはできません。
```

必要に応じて、[カスタムワークフローを有効](./enabling-workflows-for-translations.md)にして、翻訳のレビューと公開プロセスを指示できます。

```{note}
翻訳可能な言語は、インスタンスのローカライズ設定により決定されます。 詳しくは、[初期インスタンスのローカリゼーション](../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md)および[ローカリゼーション](../../system-administration/configuring-liferay/virtual-instances/localization.md)をご参照ください。
```

## コンテントページの手動翻訳

```{note}
コンテントページのエクスペリエンスを手動で翻訳するには、コンテントページの*表示*権限と*更新*権限、または1つ以上の言語に対する翻訳権限のいずれかをユーザーが持っている必要があります。 詳しくは、[翻訳権限の管理](./managing-translation-permissions.md)をご覧ください。
```

次の手順に従い、コンテントページのエクスペリエンスを手動で翻訳します。

1. ［**サイトメニュー**］(![Site Menu](../../images/icon-product-menu.png))を開き、 ［**サイトビルダー**］ を展開して、 ［**ページ**］ に移動します。

1. 翻訳したいコンテントページの **アクション** メニュー（ ![Actions Button](../../images/icon-actions.png) ）をクリックし、 ［**翻訳**］ を選択してください。

   これにより、翻訳インターフェースにリダイレクトされ、コンテンツの元のテキストを翻訳と一緒に表示できます。

   左側の列には翻訳元の言語が表示され、右側の列には翻訳に使用できる編集可能なフィールドが表示されます。

   ![Translateを選択すると、翻訳インターフェースにリダイレクトされます。](./translating-content-pages/images/01.png)

1. 翻訳したい **エクスペリエンス** と **言語** を選択します。

   ページの更新権限を持つユーザーは、元のテキストを任意の言語に翻訳できます。

   翻訳権限を持つユーザーは、元のテキストを権限が割り当てられている言語にのみ翻訳できます。

   ```{important}
   ページエクスペリエンスを切り替えると、未保存の変更が破棄されます。 作業内容を失わないためには、変更内容を保存してから別のエクスペリエンスに切り替えてください。
   ```

   ![翻訳したい経験や言語を選択します。](./translating-content-pages/images/02.png)

1. 利用可能なフィールドに翻訳を入力してください。

1. ［**Publish**］ または ［**Save as Draft**］ をクリックします。

   翻訳を公開すると、コンテントページに翻訳が適用され、下書きとして保存されます。

   また、ワークフローが有効な場合、翻訳を公開すると、ページに適用され、下書きとして保存される前に、レビュープロセスが開始されます。

   また、 ［**Save as Draft**］ をクリックすると、後で翻訳を適用することができます。

## 翻訳のエクスポートとインポート

```{note}
コンテンツを翻訳用にエクスポートしたり、XLIFFの翻訳をインポートするには、選択されたページに対して*表示*および*更新*する権限が必要です。 詳しくは、[翻訳権限の管理](./managing-translation-permissions.md)をご覧ください。
```

Liferayでは、翻訳用のコンテントページエクスペリエンスを `.xliff` または `.xlf`ファイルとしてエクスポートすることが可能です。 これらのファイルを翻訳者に送り、翻訳を一緒に `.zip` ファイルとして、または個別に `.xliff` または `.xlf` ファイルとしてインポートできます。

```{important}
Liferay は XLIFF 1.2 と 2.0 の両方のファイルをサポートしています。 ただし、これらのフォーマットが提供するすべての機能・性能をサポートしているわけではありません。
```

### 翻訳用のページのエクスポート

次の手順を実行します：

1. ［**サイトメニュー**］(![Site Menu](../../images/icon-product-menu.png))を開き、 ［**サイトビルダー**］ を展開して、 ［**Pages**］ に移動します。

1. 翻訳したい［Content Page］の **アクション** メニュー（ ![Actions Button](../../images/icon-actions.png) ）をクリックし、 ［**Export for Translation**］ を選択してください。 エクスポートの設定を行うためのモーダルウィンドウが表示されます。

   ![翻訳用にエクスポートを選択します。](./translating-content-pages/images/03.png)

1. エクスポート形式を選択します： **XLIFF 1.2** または **XLIFF 2.0** 。

1. コンテンツページの原語を選択します。

1. 翻訳先の言語を選択します。

1. 翻訳したいエクスペリエンスを選択します。

   ![エクスポートの設定を行います。](./translating-content-pages/images/04.png)

1. ［**Export**］ をクリックします。

Liferayは、選択された各エクスペリエンスのXLIFFファイルを含むZIPアーカイブを生成します。 これらのファイルは、対応する翻訳ソフトウェアで使用することができます。

### ページ翻訳のインポート

次の手順を実行します：

1. ［**サイトメニュー**］(![Site Menu](../../images/icon-product-menu.png))を開き、 ［**サイトビルダー**］ を展開して、 ［**Pages**］ に移動します。

1. 翻訳されたコンテンツページの **アクション** ボタン（![Actions Button](../../images/icon-actions.png)）をクリックし、 **インポート翻訳** を選択します。

   ![［翻訳のインポート］を選択します。](./translating-content-pages/images/05.png)

1. インポートする `.xliff`、 `.xlf`、 `.zip` ファイルを選択します。

   ![インポートしたい翻訳ファイルを選択します。](./translating-content-pages/images/06.png)

   ```{important}
   Liferayは [Export for Translation](#exporting-pages-for-translation) アクションで作成したXLIFFファイルのインポートをサポートしていますが、それ以外の方法で作成したファイルのインポートが成功することは保証できません。
   ```

1. ［**Publish**］ をクリックします。

   インポートが成功した場合、Liferayはインポートしたファイルとともに成功メッセージを表示します。 コンテンツページに翻訳が適用され、ページが下書きとして保存されます。 ワークフローが有効な場合、翻訳がページに適用される前に承認される必要があります。

   ![インポートが成功した場合、Liferayはインポートしたファイルとともに成功メッセージを表示します。](./translating-content-pages/images/07.png)

   しかし、インポート中にエラーが発生した場合、Liferayは失敗したファイルを通知し、ダウンロード可能なCSVエラーレポートを提供します。

   ![インポート中にエラーが発生した場合、Liferayは失敗したファイルを通知し、ダウンロード可能なCSVエラーレポートを提供します。](./translating-content-pages/images/08.png)

## サードパーティーのサービスを利用したコンテンツページの翻訳

[Google Cloud Translation](./using-third-parties-for-translation.md#enabling-google-cloud-translation) , [Amazon Translate](./using-third-parties-for-translation.md#enabling-amazon-translate) , または [Microsoft Translator](./using-third-parties-for-translation.md#enabling-microsoft-translator) とLiferayの統合を有効にした場合、それらを使用してWebコンテンツを自動的に翻訳することが可能です。 詳しくは、 [翻訳にかかるサードパーティーの利用](./using-third-parties-for-translation.md) をご覧ください。

## 追加情報

* [ウェブコンテンツの翻訳](./translating-web-content.md)
* [翻訳にかかるサードパーティーの利用](./using-third-parties-for-translation.md)
* [翻訳のワークフローの有効化](./enabling-workflows-for-translations.md)
