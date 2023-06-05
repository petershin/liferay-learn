# ウェブコンテンツの翻訳

{bdg-secondary}`Liferay DXP/Portal 7.3以降で利用可能`

Liferayは、Webコンテンツの記事を翻訳するための統合ツールを提供しており、世界中のユーザーのために魅力的でローカライズされたコンテンツを作成することができます。 これらのツールを使って、Webコンテンツを手動で翻訳したり、翻訳をXLIFFファイルとしてインポートしたりすることができます。

必要に応じて、[カスタムワークフローを有効](./enabling-workflows-for-translations.md)にして、翻訳のレビューと公開プロセスを指示できます。

```{note}
翻訳可能な言語は、インスタンスのローカライズ設定により決定されます。 詳しくは、[初期インスタンスのローカリゼーション](../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md)および[ローカリゼーション](../../system-administration/configuring-liferay/virtual-instances/localization.md)をご参照ください。
```

## 手動でコンテンツを翻訳する

```{note}
手動でWebコンテンツを翻訳するには、ユーザーが資産のいずれかの*ビュー*および*更新*のアクセス権を持っている必要がありますまたは1つ以上の言語のための翻訳アクセス権。 詳しくは、[翻訳権限の管理](./managing-translation-permissions.md)をご覧ください。
```

Webコンテンツを手動で翻訳するには、次の手順に従います。

1. **サイトメニュー**(![Site Menu](../../images/icon-product-menu.png)) を開き、 **コンテンツ & データ** を展開し、 **Web コンテンツ** へと進みます。

1. 翻訳したいコンテンツの **Actions** ボタン ( ![Actions Button](../../images/icon-actions.png) ) をクリックし、 **Translate** を選択します。

   これにより、翻訳インターフェースにリダイレクトされ、コンテンツの元のテキストを翻訳と一緒に表示できます。

   左側の列には翻訳元の言語が表示され、右側の列には翻訳に使用できる編集可能なフィールドが表示されます。

   ![translateを選択すると、翻訳インターフェースにリダイレクトされます。](./translating-web-content/images/01.png)

1. 翻訳したい **言語** を選択します。

   ```{important}
   コンテンツの更新権限を持つユーザーは、元のテキストを任意の言語に翻訳できます。

   翻訳権限を持つユーザーは、原文の翻訳を、権限を持つ言語にのみ行うことができます。
   ```

   ![翻訳したい言語を選択します。](./translating-web-content/images/02.png)

1. 利用可能なフィールドに翻訳を入力してください。

1. [**Publish**] をクリックして、Webコンテンツの新しいバージョンを作成するか、ワークフローを開始します（有効になっている場合）。

   または、 ［**Save as Draft**］ をクリックして、翻訳を保存して後で公開することもできます。

## 翻訳のエクスポートとインポート

```{note}
コンテントページのエクスペリエンスを手動で翻訳するには、コンテントページの*表示*権限と*更新*権限、または1つ以上の言語に対する翻訳権限のいずれかをユーザーが持っている必要があります。 詳しくは、[翻訳権限の管理](./managing-translation-permissions.md)をご覧ください。
```

Liferayでは、翻訳用のWebコンテンツを `.xliff` または `.xlf` ファイルとしてエクスポートすることが可能です。 これらのファイルを翻訳者に送り、翻訳を一緒に `.zip` ファイルとして、または個別に `.xliff` または `.xlf` ファイルとしてインポートできます。

```{important}
Liferay は XLIFF 1.2 と 2.0 の両方のファイルをサポートしています。 ただし、これらのフォーマットが提供するすべての機能・性能をサポートしているわけではありません。
```

### 翻訳用のコンテンツのエクスポート

次の手順を実行します：

1. **サイトメニュー**(![Site Menu](../../images/icon-product-menu.png)) を開き、 **コンテンツ & データ** を展開し、 **Web コンテンツ** へと進みます。

1. 翻訳したいコンテンツの **Actions** ボタン ( ![Actions Button](../../images/icon-actions.png) ) をクリックし、 **Export for Translation** を選択します。 エクスポートの設定を行うためのモーダルウィンドウが表示されます。

   ![翻訳用にエクスポートを選択します。](./translating-web-content/images/03.png)

   また、複数の記事を選択して、 **Export for Translation** ボタンをクリックすることもできます。

   ![複数の記事を選択し、「Export for Translation」をクリックします。](./translating-web-content/images/04.png)

1. エクスポート形式を選択します： **XLIFF 1.2** または **XLIFF 2.0** 。

1. ウェブコンテンツのオリジナル言語を選択します。

1. 翻訳先の言語を選択します。

   ![Webコンテンツを翻訳する言語を選択します。](./translating-web-content/images/05.png)

1. ［**Export**］ をクリックします。

Liferay は、選択された各言語の XLIFF ファイルを含む ZIP アーカイブを生成します。 これらのファイルは、対応する翻訳ソフトウェアで使用することができます。

### コンテンツ翻訳のインポート

次の手順を実行します：

1. **サイトメニュー**(![Site Menu](../../images/icon-product-menu.png)) を開き、 **コンテンツ & データ** を展開し、 **Web コンテンツ** へと進みます。

1. 翻訳された Web コンテンツの **Actions** ボタン ( ![Actions Button](../../images/icon-actions.png) ) をクリックし、 **Import Translation** を選択します。

   ![翻訳のインポート」を選択します。](./translating-web-content/images/06.png)

   また、アプリケーションバーの **Actions** ボタン (![Actions Button](../../images/icon-actions.png)) をクリックし、 **Import Translations** を選択すると、複数の記事の翻訳を一度にインポートすることができます。

   ![複数の記事の翻訳をアップロードすることができます。](./translating-web-content/images/07.png)

1. インポートする `.xliff`、 `.xlf`、 `.zip` ファイルを選択します。

   ![インポートしたい翻訳ファイルを選択します。](./translating-web-content/images/08.png)

   ```{important}
   Liferayは [Export for Translation](#exporting-content-for-translation) アクションで作成したXLIFFファイルのインポートをサポートしていますが、他の手段で作成したファイルのインポートが成功することは保証できません。
   ```

1. ［**Publish**］ をクリックします。

   成功した場合、Liferayはインポートしたファイルと共に成功メッセージを表示します。 Webコンテンツは、翻訳ファイルに含まれるすべての変更内容で更新されます。 ワークフローが有効になっている場合、この変更は他のコンテンツの更新と同様に承認が必要になります。

   ![成功した場合、Liferayはインポートしたファイルと共に成功メッセージを表示します。](./translating-web-content/images/09.png)

   しかし、インポート中にエラーが発生した場合、Liferayは失敗したファイルを通知し、ダウンロード可能なCSVエラーレポートを提供します。

   ![インポート中にエラーが発生した場合、Liferayは失敗したファイルを通知し、ダウンロード可能なCSVエラーレポートを提供します。](./translating-web-content/images/10.png)

## サードパーティーのサービスを利用したウェブコンテンツの翻訳

[Google Cloud Translation](https://cloud.google.com/translate/docs/setup) , [Amazon Translate](https://docs.aws.amazon.com/translate/latest/dg/what-is.html) , または [Microsoft Translator](https://docs.microsoft.com/en-us/azure/cognitive-services/translator/) とLiferayの統合を有効にした場合、それらを使用してWebコンテンツを自動的に翻訳することが可能です。 詳しくは、 [翻訳のための第三者機関の利用](./using-third-parties-for-translation.md) をご覧ください。

## 関連トピック

* [コンテンツページの翻訳](./translating-content-pages.md)
* [翻訳のための第三者機関の利用](./using-third-parties-for-translation.md)
* [翻訳のワークフローの有効化](./enabling-workflows-for-translations.md)
