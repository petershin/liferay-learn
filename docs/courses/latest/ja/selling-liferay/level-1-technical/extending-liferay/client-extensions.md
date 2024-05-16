---
visibility:
- Employee
- Partner
---
# クライアント拡張機能でLiferayを拡張する

**概要**

* Liferayを拡張することは、プラットフォームの可能性をフルに活用する上で非常に重要です。
* 特定のビジネスニーズを念頭に置いてLiferayをカスタマイズすることで、ユーザーのニーズに合わせたデジタル体験を作成することができます。
* Client Extensionsは、プラットフォームコアから切り離されたLiferayを拡張する新しい方法を提供します。
* カスタムコードをLiferayのコアから切り離すことで、アップグレードが迅速かつ容易になり、開発者は使い慣れた言語やフレームワークを使用することができます。

```{note}
* 本モジュールのライブワークショップの [録画](https://learn.liferay.com/documents/d/guest/se1-7-extending-liferay) をご覧ください。
* 上記ワークショップで使用されたプレゼンテーション資料はこちら [PDF](https://learn.liferay.com/documents/d/guest/se1-7-extending-liferay-pdf) からダウンロードしてください。
```

## Liferayを拡張する - クライアント拡張（コード）

![Liferay DXP自体はLiferayによってホスティングされ、管理され、四半期ごとに新機能がアップデートされます。](./client-extensions/images/01.png)

最後になりましたが、Liferay DXPでは、Client Extensionsを介してLiferayをカスタマイズする新しいエキサイティングな方法があります。 実際、コードを使ってLiferayを拡張している。

これまでのモジュールで取り上げたLiferayを拡張する様々な方法が顧客のビジネス上の期待に応えられない場合、クライアント拡張を使用して顧客のビジネス上の問題を解決することができます。

クライアントエクステンションはLiferayの外にありますが、ヘッドレスAPIを使ってLiferay DXPと通信します。 Liferayは、あらゆるタイプのクライアント拡張機能の例と、サポートされているクライアント拡張機能の構築とデプロイを成功させるために必要なツールを提供します。

また、Liferay DXPは四半期ごとに更新されることも重要です。 カスタマイズがLiferayのコアプラットフォームから分離されているため、アップグレードプロセスははるかに簡単です。

この疎結合アプローチの利点は以下の通りである：

* カスタマイズ、コンフィギュレーション、エクステンションをLiferay DXPから切り離すことは、Liferayが新しいアップデートをより早くリリースし、配信を効率化できることを意味します。
* Liferay DXPは、新機能のリリースを1年以上待つ代わりに、四半期ごとにリリースされます。
* これにより、新しい改善や機能の市場投入までの時間が短縮されるだけでなく、パートナーやLiferayのカスタマーサクセスチームは、より頻繁に顧客と関わり、顧客のソリューションに新しい機能を促進し、組み込むことができます。

**分離されたカスタマイズ**

![フロントエンドのクライアント拡張機能は、React、Angularなどの一般的なフロントエンドフレームワークで開発でき、バックエンドのクライアント拡張機能は、Spring Bootなどの一般的なバックエンドフレームワークで開発できる。](./client-extensions/images/02.png)

カスタマイズをDXPコアから切り離すことで、全体的な納品に関する問題も少なくなります。 その代わりに、REACT、Angular、Vueなどの一般的なフロントエンドJavaScriptフレームワークや、Spring Bootなどのバックエンドフレームワークの専門知識を持つ開発者を雇うことができます。

パートナーは顧客を支援する上で重要な役割を果たす：

* エクステンションのSDLCを作成する
* ローコード開発
* バックエンド・サービスまたはフロントエンド開発のためのコード
* カスタムソリューションの性能
* 必要に応じてカスタマイズを維持する

ここでもうひとつ注意しなければならないのは、クライアント・エクステンションはどこにでも住むことができるということだ。 顧客やパートナーは、自分のインフラにクライアント拡張機能を導入することもできる。

## ビジネスチャンスの拡大

この新しいアプローチは、Liferayのパートナーにも新たなビジネスチャンスをもたらします。 以前は、パートナーはLiferayの新しいバージョンごとに新しいバージョンのアプリケーションを構築しなければなりませんでした。

クライアント・エクステンションを使用すれば、APIがアップデート間で一貫しているため、クリーンな分離を確立することができる。 パートナーは、既存のソリューションの更新にかかる時間を節約できるだけでなく、コネクターやソリューションなどの新しいビジネスチャンスの市場投入までの時間を短縮することができます。

## デモでLiferayの拡張についてどのように話すか

では、なぜこれが重要なのか？ これは何を意味するのか？ そして、なぜ見込み客は、Liferayを拡張するために利用可能なさまざまな方法を知らされなければならないのでしょうか？

核となるメッセージは、たとえLiferayがすぐに使える幅広い機能を備えていたとしても、Liferayはターンキーアプリケーションではないということを覚えておくことが重要だということです。

顧客やパートナーは、ビジネス上の問題を解決するために必要なソリューションを実装する必要があり、Liferayは、プラットフォームのカスタマイズや拡張を使用して、これらのビジネス要件に提供することを可能にする幅広い機能を提供します。

Liferayの柔軟な性質により、顧客のために構築されたアプリケーションとソリューションは、顧客の特定のニーズに合わせて調整することができます。 このようなソリューションは、お客様のビジネスの拡大や変化に応じて成長し、進化することができます。これまで使用されていなかった機能を使用したり、カスタム要件を追加するための拡張機能を構築したりすることができます。

また、ターンキー・ソリューションにはない独自の特徴や機能を提供することで、競合他社との差別化を図ることができるため、顧客やパートナーに競争上の優位性をもたらします。

## 追加情報

* [フラグメントの使用](https://learn.liferay.com/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments) , [公開](https://learn.liferay.com/w/dxp/site-building/publishing-tools/publications) , [テーマ](https://learn.liferay.com/w/dxp/site-building/site-appearance/themes) & [スタイルブック](https://learn.liferay.com/web/guest/w/dxp/site-building/site-appearance/style-books)
* [訪問者の行動](https://learn.liferay.com/w/analytics-cloud/touchpoints/assets/forms) , [ワークフロー](https://learn.liferay.com/w/dxp/process-automation/workflow) , [コレクションとコレクションページ](https://learn.liferay.com/w/dxp/content-authoring-and-management/collections-and-collection-pages) , [オブジェクト](https://learn.liferay.com/w/dxp/building-applications/objects)
* [OpenOffice / LibreOffice統合の有効化](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/enabling-openoffice-libreoffice-integration) , [Microsoft Office 365でドキュメントの作成と編集を有効にする](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/enabling-document-creation-and-editing-with-microsoft-office-365) , [Googleドライブ との連携](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/google-drive-integration) , [LiveChat](https://learn.liferay.com/w/dxp/site-building/personalizing-site-experience/enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/livechat) , [DocuSignデジタル署名の有効化](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/uploading-and-managing/enabling-docusign-digital-signatures) , [Liferay Talendコンポーネントの概要](https://learn.liferay.com/w/dxp/system-administration/data-integration/liferay-talend-components-overview) , [ミュールソフト](https://learn.liferay.com/web/guest/w/commerce/add-ons-and-connectors/mulesoft) , [SAP Connector](https://marketplace.liferay.com/p/sap-business-objects-connector) , [ヘッドレスデリバリー](https://learn.liferay.com/w/dxp/headless-delivery)
* [クライアント拡張](https://learn.liferay.com/w/dxp/building-applications/client-extensions)

おめでとうございます、これでこのモジュールは終わりです。次は [展開戦略](../deployment-strategies.md) for Liferay について学びましょう。
