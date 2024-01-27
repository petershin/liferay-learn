# コンテントページの翻訳

{bdg-secondary}`Liferay 7.4 U15+ および GA15+`

Liferayは、_コンテンツページ_を翻訳するための統合されたツールを提供しますので、グローバルユーザーのために魅力的でローカライズされたエクスペリエンスを作成することができます。 これらのツールを使って、コンテントページのエクスペリエンスを手動で翻訳したり、翻訳をXLIFFファイルとしてインポートしたりすることができます。

```{important}
コンテントページを翻訳する場合、ユーザーはページの名前とインラインフラグメントテキスト（例：HTML、ヘッダーなど）のみを翻訳することができます。 ウィジェットやマッピングされたフラグメントフィールドを翻訳することはできません。
```

[必要であれば、カスタムワークフロー](./enabling-workflows-for-translations.md) を有効にして、翻訳のレビューとパブリッシングプロセスを指示することができます。

```{note}
翻訳可能な言語は、インスタンスのローカライズ設定により決定されます。 詳しくは [初期インスタンスのローカライゼーション](../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md) および [仮想インスタンスのローカライゼーション](../../system-administration/configuring-liferay/virtual-instances/localization.md) を参照のこと。
```

## コンテントページの手動翻訳

```{note}
コンテントページのエクスペリエンスを手動で翻訳するには、コンテントページの*表示*権限と*更新*権限、または1つ以上の言語に対する翻訳権限のいずれかをユーザーが持っている必要があります。 詳細は [Managing Translation Permissions](./managing-translation-permissions.md) を参照してください。
```

次の手順に従い、コンテントページのエクスペリエンスを手動で翻訳します。

1. *サイトメニュー* (![サイトメニュー](../../images/icon-product-menu.png))を開き、_サイトビルダー_を展開し、_ページ_に進みます。

1. 翻訳したいコンテンツページの_アクション_ボタン(![アクションボタン](../../images/icon-actions.png))をクリックし、_翻訳_を選択します。

   これにより、翻訳インターフェースにリダイレクトされ、コンテンツの元のテキストを翻訳と一緒に表示できます。

   左側の列には翻訳元の言語が表示され、右側の列には翻訳に使用できる編集可能なフィールドが表示されます。

   ![Selecting Translate redirects you to the translation interface.](./translating-content-pages/images/01.png)

1. 翻訳したい*経験*と*言語*を選択してください。

   ページの更新権限を持つユーザーは、元のテキストを任意の言語に翻訳できます。

   翻訳権限を持つユーザーは、元のテキストを権限が割り当てられている言語にのみ翻訳できます。

   ```{important}
   ページエクスペリエンスを切り替えると、未保存の変更が破棄されます。 作業内容を失わないためには、変更内容を保存してから別のエクスペリエンスに切り替えてください。
   ```

   ![Select the experience and language you want to translate.](./translating-content-pages/images/02.png)

1. 利用可能なフィールドに翻訳を入力してください。

1. *Publish*または*Save as Draft*をクリックします。

   翻訳を公開すると、コンテントページに翻訳が適用され、下書きとして保存されます。

   また、ワークフローが有効な場合、翻訳を公開すると、ページに適用され、下書きとして保存される前に、レビュープロセスが開始されます。

   または、_下書きとして保存_をクリックして、後で翻訳を適用することもできます。

## 翻訳のエクスポートとインポート

```{note}
コンテンツを翻訳用にエクスポートしたり、XLIFFの翻訳をインポートするには、選択されたページに対して*表示*および*更新*する権限が必要です。 詳細は [Managing Translation Permissions](./managing-translation-permissions.md) を参照してください。
```

Liferayでは、翻訳用のコンテンツページエクスペリエンスを `.xliff` または `.xlf` ファイルとしてエクスポートすることができます。 これらのファイルを翻訳者に送り、`.zip`ファイルとしてまとめてインポートすることもできますし、`.xliff`ファイルや`.xlf`ファイルとして個別にインポートすることもできます。

```{important}
Liferay は XLIFF 1.2 と 2.0 の両方のファイルをサポートしています。 ただし、これらのフォーマットが提供するすべての機能・性能をサポートしているわけではありません。
```

### 翻訳用のページのエクスポート

次の手順を実行します：

1. *サイトメニュー* (![サイトメニュー](../../images/icon-product-menu.png))を開き、_サイトビルダー_を展開し、_ページ_に進みます。

1. 翻訳したいコンテンツページの_アクション_ボタン(![アクションボタン](../../images/icon-actions.png))をクリックし、_翻訳のためにエクスポート_を選択します。 エクスポートの設定を行うためのモーダルウィンドウが表示されます。

   ![Select Export for Translation.](./translating-content-pages/images/03.png)

1. エクスポート形式を選択します：_XLIFF 1.2_または_XLIFF 2.0_。

1. コンテンツページの原語を選択します。

1. 翻訳先の言語を選択します。

1. 翻訳したいエクスペリエンスを選択します。

   ![Configure the export.](./translating-content-pages/images/04.png)

1. *エクスポート*をクリックします。

Liferayは、選択された各エクスペリエンスのXLIFFファイルを含むZIPアーカイブを生成します。 これらのファイルは、対応する翻訳ソフトウェアで使用することができます。

### ページ翻訳のインポート

次の手順を実行します：

1. *サイトメニュー* (![サイトメニュー](../../images/icon-product-menu.png))を開き、_サイトビルダー_を展開し、_ページ_に進みます。

1. 翻訳されたコンテンツページの_Actions_ボタン(![Actions Button](../../images/icon-actions.png)) をクリックし、_Import Translation_を選択します。

   ![Select Import Translation.](./translating-content-pages/images/05.png)

1. インポートしたい `.xliff`、`.xlf`、`.zip` ファイルを選択する。

   ![Select the translation files you want to import.](./translating-content-pages/images/06.png)

   ```{important}
   Liferay は [Export for Translation](#exporting-pages-for-translation) アクションを使用して作成された XLIFF ファイルのインポートをサポートしていますが、他の方法で生成されたファイルのインポートが成功することは保証できません。
   ```

1. *［公開］*をクリックします。

   正常なインポートが行われた場合、Liferayはインポートしたファイルとともに成功メッセージを表示します。 翻訳がコンテントページに適用され、ページが下書きとして保存されます。 ワークフローが有効な場合、翻訳がページに適用される前に承認される必要があります。

   ![If import is successful, Liferay displays a success message with the imported files.](./translating-content-pages/images/07.png)

   しかし、インポート中にエラーが発生した場合、Liferayは失敗したファイルを通知し、ダウンロード可能なCSVエラーレポートを提供します。

   ![If errors occur during import, Liferay notifies you of the failing files and provides a downloadable CSV error report.](./translating-content-pages/images/08.png)

## サードパーティーのサービスを利用したコンテントページの翻訳

[Google Cloud Translation](./using-third-parties-for-translation.md#enabling-google-cloud-translation) , [Amazon Translate](./using-third-parties-for-translation.md#enabling-amazon-translate) , [Microsoft Translator](./using-third-parties-for-translation.md#enabling-microsoft-translator) とLiferayの統合を有効にした場合、それらを使ってWebコンテンツを自動的に翻訳することができます。 詳しくは、 [Using Third Parties for Translation](./using-third-parties-for-translation.md) をご覧ください。

## 関連トピック

* [ウェブコンテンツの翻訳](./translating-web-content.md)
* [翻訳における第三者の利用](./using-third-parties-for-translation.md)
* [翻訳ワークフローの実現](./enabling-workflows-for-translations.md)
