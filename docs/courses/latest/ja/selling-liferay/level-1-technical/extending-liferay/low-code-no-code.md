# ローコード/ノーコードと統合によるLiferayの拡張

**概要**

* Liferayを拡張することは、プラットフォームの可能性をフルに活用する上で非常に重要です。
* 特定のビジネスニーズを念頭に置いてLiferayをカスタマイズすることで、ユーザーのニーズに合わせたデジタル体験を作成することができます。
* Low-Code/No-Code機能により、コードをほとんど書かずにプラットフォームを拡張できる。
* 外部システムとの統合により、外部システムのデータをLiferayアプリケーションに取り込むことが可能

## Liferayの拡張 - ローコード/ノーコード

Low-CodeやNo-Codeのアプローチは、開発者やビジネスユーザーが豊富なコーディング知識や経験を持たずにカスタム機能を作成できるため、ますます人気が高まっています。

LiferayにとってLow-CodeやNo-Codeは新しい概念ではありません。Liferay DXPの既存機能の多くはこの原則を念頭に設計されています。

Liferay DXPでの簡単な例をいくつか挙げます：

* フォーム
* ワークフロー
* コレクション
* オブジェクト

### フォーム

![Liferay Formsはノーコードのユーザーインターフェイスで構築されます。](./low-code-no-code/images/01.png)

[フォーム](https://learn.liferay.com/w/dxp/process-automation/forms) は、必要なユーザーデータを収集するための堅牢な機能を提供します。 例えば、顧客からのフィードバックや求人応募など。

Formsアプリケーションは、アンケートのような簡単なフォームから、複雑な複数ページのアプリケーションまで、ユーザーの事前入力に基づいてフォームフィールドを動的に変更するルールを使って作成することができます。

## ワークフロー

![Liferayのビジュアルワークフローデザイナーは、管理者がドラッグ＆ドロップのユーザーインターフェイスを使用してコンテンツ承認ワークフローを実装することを可能にします。](./low-code-no-code/images/02.png)

[ワークフロー](https://learn.liferay.com/w/dxp/process-automation/workflow) 管理者は、ブログ、ウェブコンテンツ、Wikiなどのコンテンツを公開前にレビューし、承認することができます。

ワークフロープロセスは、レビュワーや承認者としてユーザー、グループ、ロールを統合することもできます。

### コレクション

![コレクションは、ページ上でエンドユーザーに簡単に表示できるアセットのセットを作成する簡単な方法を提供します。](./low-code-no-code/images/03.png)

[コレクション](https://learn.liferay.com/w/dxp/content-authoring-and-management/collections-and-collection-pages) は、情報のグループ化やフィルタリングに使用できる、コンテンツアイテムやその他のアセットのセットです。

コレクションの典型的なユースケースは、例えば、製品ウェブページにセクションを設け、新しい顧客のサクセスストーリーが公開されると自動的に表示することです。

### オブジェクト

![オブジェクトを使えば、コードを書かずにビジネス・アプリケーションを作成できる。](./low-code-no-code/images/04.png)

[Objects](https://learn.liferay.com/w/dxp/building-applications/objects) は、コードを書いたりモジュールをデプロイすることなくビジネス・アプリケーションを作成できる新機能です。

ここでの注意点

* エンティティやプロセスをオブジェクトでモデル化し、優れたデジタル体験の創造に役立てる。
* 住宅ローンシミュレーターからeラーニングプラットフォームまで、Liferayに含める必要のあるほとんどすべての機能をObjectsで作成することができます。
* このようなすぐに使える機能により、開発者はLiferay DXPのコアを変更することなく、新しい機能を追加したり、Liferayのネイティブ機能をオーバーライドしたりすることができます。

## Liferayを拡張する - 統合

Liferay DXPは、インテグレーションを使用して拡張することもできます。 これにより、Liferayは、顧客関係管理（CRM）システムや企業資源計画（ERP）システムなど、既存のシステムやツールと接続することができます。

Liferayは、お客様が外部システム、サービス、またはアプリケーションと統合することを可能にするいくつかの統合ポイントを提供します。

例は次のとおりです：

* オープンオフィスとリブレオフィス
* マイクロソフト・オフィス365
* Google ドライブ
* ライブチャット & チャットボット
* DocuSign
* ETLツール
* エンタープライズ・サービス・バス
* ERPプラットフォーム
* Headless API

### オープンオフィスとリブレオフィス

[OpenOfficeとLibreOffice](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/enabling-openoffice-libreoffice-integration) をLiferayと統合することで、ユーザーはLiferay内蔵のドキュメントビューアとエディタを使って、ポータル内で直接オフィスドキュメントを閲覧・編集することができます。 これは、Liferayポータル内でドキュメントを共同編集する際に、ドキュメントをダウンロードしてローカルで編集し、ポータルにアップロードし直す必要がなく便利です。

### マイクロソフト・オフィス365

[Microsoft Office 365](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/uploading-and-managing/creating-documents/creating-and-editing-documents-with-microsoft-office-365) OneDrive for Businessとの統合により、ユーザーはMicrosoft Office 365アプリケーションを使用して文書を作成・編集し、LiferayのDocuments and Mediaライブラリに保存することができます。

また、Office 365のExchange Onlineカレンダーと統合されていれば、ユーザーはLiferayポータル内で直接カレンダーを表示・管理できる。

### Google ドライブ

Liferayは、2つの異なる方法でGoogle Driveと統合することもできます：

1. [Googleドライブでドキュメントの作成と編集を有効にする](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/google-drive-integration/enabling-document-creation-and-editing-with-google-drive)
2. [Googleドライブドキュメントへのリンクを有効にする](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/google-drive-integration/enabling-links-to-google-drive-documents)

この2つのモードの根本的な違いは、ドキュメントが最終的に保存される場所である。どちらの場合も、ドキュメントはグーグルのブラウザベースのアプリケーションを使って作成・編集される。

* 最初のモードでは、ドキュメントは最終的にLiferayのDocuments and Mediaライブラリに直接保存されます。
* 2つ目は、Google Driveに保存され、Liferayに保存されたドキュメントへのショートカットがあります。

### ライブチャット & チャットボット

Liferay DXP は、多数の [ライブ チャット](https://learn.liferay.com/w/dxp/site-building/personalizing-site-experience/enabling-automated-live-chat-systems) プラットフォームを包括的にサポートします。 この統合を有効にすると、Liferayインスタンス上のサイトにチャットウィンドウが追加され、ユーザーのサポートやサイト体験の向上に利用できます。

Liferayはまた、自動化されたチャット機能を提供するために、ZendeskやHubspotなどのチャットボットサービスと統合しています。 これは、通常の営業時間外にユーザーにサポートを提供する場合や、簡単な問い合わせに対応する場合に便利です。

### DocuSign

[DocuSign](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/documents-and-media/uploading-and-managing/enabling-docusign-digital-signatures) 電子署名もLiferay文書と統合できる。

DocuSignは、電子署名される文書を管理するサービスである。 この統合により、文書への署名の管理と収集が可能になる。

### ETLツール

Liferayは、 [Talend](https://learn.liferay.com/web/guest/w/dxp/system-administration/data-integration/liferay-talend-components-overview)のようなETL（Exchange-Transform-Load）ツールと統合することができます。 LiferayのTalendコンポーネントのおかげで、顧客はLiferayとの間でデータをインポートおよびエクスポートできます。 例えば、ユーザーデータ、ウェブコンテンツ、商品などは、CRM、ERP、データベースなどの他のシステムからインポートしたり、他のシステムへエクスポートしたりすることができます。

### エンタープライズ・サービス・バス

Liferayはまた、エンタープライズサービスバス（ESB）のようなアーキテクチャと統合することができます。 [MuleSoft](https://learn.liferay.com/w/commerce/add-ons-and-connectors/mulesoft) は有名なESBで、Liferayコネクタもある。 Liferayの典型的なユースケースは、顧客がLiferayとERPやCRMシステムなどの他のアプリケーション間のワークフローを自動化することです。

### ERP

LiferayはSAPのようなERPプラットフォームとの統合を可能にする。 SAPのLiferay Connectorは、LiferayからSAPシステム上へのデータのインポートやエクスポートに使用できます。

例えば、顧客データ、商品データ、販売データなどである。 しかし、もっと多くの使用例が考えられる。

### Headless API

Liferay [ヘッドレス統合](https://learn.liferay.com/w/dxp/headless-delivery/using-liferay-as-a-headless-platform) は、最新のREST APIを使用して、Liferayのバックエンド機能を独自のアプリケーションと統合する柔軟で効率的な方法を開発者に提供します。

* このアプローチにより、開発者はユーザーエクスペリエンスをよりコントロールしやすくなり、アプリケーションの市場投入までの時間を短縮できる。

```{note}
* Liferay Experience Cloud SaaS
* Liferay Experience Cloud SaaS をご利用の場合は、サポートされる最新の統合について Liferay の担当者にご確認ください。
```

次 [クライアント拡張機能でLiferayを拡張する](./client-extensions.md)
