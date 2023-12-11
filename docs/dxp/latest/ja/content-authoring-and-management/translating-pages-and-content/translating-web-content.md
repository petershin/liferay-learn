# ウェブコンテンツの翻訳

{bdg-secondary}`Liferay DXP/Portal 7.3+が利用可能です。`

Liferayは、ウェブコンテンツの記事を翻訳するための統合ツールを提供しているので、グローバルなユーザーのために魅力的でローカライズされたコンテンツを作成することができます。 これらのツールを使用すると、手動でWebコンテンツを翻訳したり、XLIFFファイルとして翻訳をインポートすることができます。

必要に応じて、 [カスタムワークフローを有効](./enabling-workflows-for-translations.md) にして、翻訳のレビューと公開プロセスを指示できます。

```{note}
翻訳可能な言語は、インスタンスのローカライズ設定により決定されます。 詳しくは、 [初期インスタンスのローカリゼーション](../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md) および [Localization](../../system-administration/configuring-liferay/virtual-instances/localization.md) を参照してください。
```

## コンテンツの手動翻訳

```{note}
手動でウェブコンテンツを翻訳するために、ユーザーは1つまたは複数の言語の資産または翻訳許可のための表示および更新許可のどちらかを持っている必要があります。 詳細については、 [Managing Permissions for Translation](./managing-translation-permissions.md) を参照してください。
```

1. *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) を開き、_Content & Data_ &rarr; _Web Content_ を展開します。

1. 翻訳したいコンテンツの_アクション_ (![アクションアイコン](../../images/icon-actions.png))をクリックし、_翻訳_を選択します。

   これにより、翻訳インターフェースにリダイレクトされ、コンテンツの元のテキストを翻訳と一緒に表示できます。

   左側の列には翻訳元の言語が表示され、右側の列には翻訳に使用できる編集可能なフィールドが表示されます。

   ![Selecting translate redirects you to the translation interface.](./translating-web-content/images/01.png)

1. 翻訳したい*言語*を選択してください。

   ```{important}
   コンテンツの更新権限を持つユーザーは、原文を任意の言語に翻訳することができます。

   翻訳権限を持つユーザーは、原文の翻訳を、権限を持つ言語にのみ行うことができます。

   ```

   ![Select the language you want to translate.](./translating-web-content/images/02.png)

1. 利用可能なフィールドに翻訳を入力します。

1. ウェブコンテンツの新バージョンを作成したり、ワークフローが有効な場合はそれを開始するには、_公開_をクリックします。

   または、_下書きとして保存_をクリックして、翻訳を保存し、後で公開することもできます。

## 翻訳のエクスポートとインポート

```{note}
コンテンツページのエクスペリエンスを手動で翻訳するには、コンテンツページの表示および更新権限か、1つまたは複数の言語の翻訳権限を持っている必要があります。 詳細は [Managing Translation Permissions](./managing-translation-permissions.md) を参照してください。
```

Liferay では、翻訳用の Web コンテンツを `.xliff` または `.xlf` ファイルとしてエクスポートできます。 これらのファイルを翻訳者に送り、`.zip`ファイルとしてまとめてインポートすることもできますし、`.xliff`ファイルや`.xlf`ファイルとして個別にインポートすることもできます。

```{important}
Liferay は XLIFF 1.2 と 2.0 の両方のファイルをサポートしています。 ただし、これらのフォーマットが提供するすべての機能・性能をサポートしているわけではありません。
```

### 翻訳用のコンテンツのエクスポート

1. *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) を開き、_Content & Data_ &rarr; _Web Content_ を展開します。

1. 翻訳したいコンテンツの_アクション_ (![アクションアイコン](../../images/icon-actions.png))をクリックし、_翻訳用にエクスポート_を選択します。 エクスポートの設定を行うためのモーダルウィンドウが表示されます。

   ![Select Export for Translation.](./translating-web-content/images/03.png)

   Liferay Portal 7.4 GA26+では、複数の記事を選択して_Export for Translation_ボタンをクリックすることができます。

   ![Select multiple articles and click Export for Translation](./translating-web-content/images/04.png)

1. エクスポート形式を選択します：_XLIFF 1.2_または_XLIFF 2.0_。

1. ウェブコンテンツのオリジナル言語を選択します。

1. 翻訳先の言語を選択します。

   ![Select the languages you want to translate the content into.](./translating-web-content/images/05.png)

1. エクスポート*をクリックします。

Liferayは、選択された各言語のXLIFFファイルを含むZIPアーカイブを生成します。 これらのファイルは、対応する翻訳ソフトウェアで使用することができます。

### コンテンツ翻訳のインポート

1. *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) を開き、_Content & Data_ &rarr; _Web Content_ を展開します。

1. 翻訳されたウェブコンテンツの_アクション_ (![アクションアイコン](../../images/icon-actions.png))をクリックし、_インポート翻訳_を選択します。

   ![Select Import Translation.](./translating-web-content/images/06.png)

   Liferay Portal 7.4 GA26+では、アプリケーションバーの_Actions_ボタン(![Actions Button](../../images/icon-actions.png)) をクリックし、_Import Translations_を選択することで、複数の記事の翻訳を一度にインポートすることができます。

   ![Upload translations for multiple articles.](./translating-web-content/images/07.png)

1. インポートしたい `.xliff`、`.xlf`、`.zip` ファイルを選択する。

   ![Select the translation files you want to import.](./translating-web-content/images/08.png)

   ```{important}
   Liferay は [Export for Translation](#exporting-content-for-translation) アクションを使用して作成された XLIFF ファイルのインポートをサポートしていますが、他の方法で生成されたファイルのインポートが成功することは保証できません。
   ```

1. *［公開］*をクリックします。

   成功した場合、Liferayはインポートしたファイルと共に成功メッセージを表示します。 ウェブコンテンツは、翻訳ファイルに含まれるすべての変更で更新されます。 ワークフローが有効になっている場合、この変更は他のコンテンツの更新と同様に承認が必要になります。

   ![If successful, Liferay displays a success message with the imported files.](./translating-web-content/images/09.png)

   しかし、インポート中にエラーが発生した場合、Liferayは失敗したファイルを通知し、ダウンロード可能なCSVエラーレポートを提供します。

   ![If errors occur during import, Liferay notifies you of the failing files and provides a downloadable CSV error report.](./translating-web-content/images/10.png)

## サードパーティーのサービスを利用したWebコンテンツの翻訳

[Google Cloud Translation](https://cloud.google.com/translate/docs/setup) , [Amazon Translate](https://docs.aws.amazon.com/translate/latest/dg/what-is.html) , または [Microsoft Translator](https://docs.microsoft.com/en-us/azure/cognitive-services/translator/) とLiferayの統合を有効にした場合、それらを使用してWebコンテンツを自動的に翻訳することが可能です。 詳しくは、 [翻訳にかかるサードパーティーの利用](./using-third-parties-for-translation.md) をご覧ください。

## 関連トピック

[コンテンツページの翻訳](./translating-content-pages.md) 

[翻訳における第三者の利用](./using-third-parties-for-translation.md) 

[翻訳ワークフローの実現](./enabling-workflows-for-translations.md) 
