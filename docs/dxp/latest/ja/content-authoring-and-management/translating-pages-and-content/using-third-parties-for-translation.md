# 翻訳のための第三者機関の利用

{bdg-secondary}`利用可能なLiferay 7.4 U15+およびGA15+`

Liferayは、以下のサービスAPIと連携し、コンテンツページやWebコンテンツの自動翻訳を生成することができます。

* [Googleクラウド翻訳](#enabling-google-cloud-translation)
* [アマゾン翻訳](#enabling-amazon-translate)
* [Microsoft Translator](#enabling-microsoft-translator)

この機能を使用するには、まず使用する翻訳サービスを設定し、Liferayのシステム設定で翻訳サービスを有効にする必要があります。 [有効にすると、このサービスを利用して、コンテンツページとWebコンテンツの翻訳](#using-automatic-translation) を生成することができます。

```{important}
一度にアクティブにできるのは1つのサービスのみです。 複数のサービスを有効にした場合、システムは最初に利用可能なサービスを使用します。
```

## Google Cloud Translationの有効化

Google Cloud Translationを有効にするには、アクティブなアカウントと、Cloud Translation APIが有効になっているGoogle Cloudプロジェクトが必要です。 このプロジェクトには、JSONアカウントキーを持つサービスアカウントも必要です。 詳しくは、 [Google Cloud Translation](https://cloud.google.com/translate/docs/setup) の公式ドキュメントをご覧ください。

準備ができたら、次の手順に従ってください。

1. **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブをクリックし、 **システム設定** &rarr; **翻訳** &rarr; **Google Cloud を使用した翻訳** .

   ![Translator Using Google Cloudへ移動します。](./using-third-parties-for-translation/images/01.png)

1. Check **Enabled** .

1. 有効なGoogle CloudサービスアカウントのキーをJSON形式で入力します。

1. ［**保存**］ をクリックします。

## Amazon Translateを有効にする

{bdg-secondary}`利用可能 7.4 U9+およびGA13+`

Amazon Translateを有効にするには、Amazon AWSのアカウントが有効である必要があります。 </a> 詳しくは、Amazon Translate
公式ドキュメントをご覧ください。</p> 

準備ができたら、次の手順に従ってください。

1. **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブをクリックし、 **システム設定** &rarr; **翻訳** &rarr; **トランスレータ AWS を使用** .
   
   ![AWSを使った翻訳に進む。](./using-third-parties-for-translation/images/02.png)

1. Check **Enabled** .

1. 有効な **アクセスキー** と **シークレットキー** を入力してください。

1. 地域を入力してください。 デフォルト値は、 `us-west-1`。

1. ［**Save**］ をクリックします。



## Microsoft Translatorを有効にする

{bdg-secondary}`利用可能 7.4 U6+およびGA10+`

Microsoft Translatorを有効にするには、Microsoft Azureのアカウントが有効である必要があります。 詳しくは、 [Microsoft Translator](https://docs.microsoft.com/en-us/azure/cognitive-services/translator/) の公式ドキュメントをご覧ください。

準備ができたら、次の手順に従ってください。

1. **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブをクリックし、 **システム設定** &rarr; **翻訳** &rarr; **Azure を使用した翻訳** .
   
   ![Azureを使った翻訳」に進みます。](./using-third-parties-for-translation/images/03.png)

1. Check **Enabled** .

1. 有効な **Subscription Key** と **Resource Location**(地域) を入力します。

1. ［**Save**］ をクリックします。



## 自動翻訳の活用

翻訳サービスを有効にすると、コンテンツページとウェブコンテンツの翻訳インターフェースに自動翻訳ボタンが追加されます。

以下の手順で、フィールドを自動翻訳します。

1. **Pages** または **Web Content** アプリケーションを起動します。

1. 翻訳したいコンテンツやページの **Actions** ボタン (![Actions Button](../../images/icon-actions.png)) をクリックし、 **Translate** を選択します。
   
   ![Webコンテンツの翻訳インターフェイスを開きます。](./using-third-parties-for-translation/images/04.png)

1. 言語フラグを使用して、翻訳したい言語（）** を選択します。 
   
   

   ```{note}
   翻訳可能な言語は、インスタンスのローカライズ設定により決定されます。 詳しくは、[Initial Instance Localization](../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md) と [Virtual Instance Localization](../../system-administration/configuring-liferay/virtual-instances/localization.md) を参照してください。
   ```


1. **Auto Translate** ボタンをクリックすると、すべてのWeb Contentフィールドが選択した言語に翻訳されます。
   
   ![左上のAuto Translateボタンをクリックすると、すべてのWeb Contentフィールドが翻訳されます。](./using-third-parties-for-translation/images/05.png)
   
   また、フィールドの個々の **Auto Translate** ボタン(![Auto Translate Button](../../images/icon-translate.png))をクリックすると、そのテキストだけが翻訳されます。
   
   ![フィールドの個々の自動翻訳ボタンをクリックすると、そのテキストだけが翻訳されます。](./using-third-parties-for-translation/images/06.png)

1. 終了したら、 **Save as Draft** または **Publish** をクリックします。



## 追加情報

* [ウェブコンテンツの翻訳](./translating-web-content.md)
* [コンテンツページの翻訳](./translating-content-pages.md)
