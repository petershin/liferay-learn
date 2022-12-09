---
toc:
- ./staging/understanding-the-publishing-process.md
- ./staging/configuring-local-live-staging.md
- ./staging/configuring-remote-live-staging.md
- ./staging/managing-data-and-content-types-in-staging.md
- ./staging/page-versioning.md
- ./staging/publishing-single-assets-and-widgets.md
- ./staging/configuring-automatic-publishing-of-displayed-content.md
- ./staging/configuring-page-publishing.md
- ./staging/managing-staging-permissions.md
- ./staging/using-staging-in-asset-libraries.md
- ./staging/site-staging-ui-reference.md
---
# ステージングの概要

```{toctree}
:maxdepth: 3

staging/understanding-the-publishing-process.md
staging/configuring-local-live-staging.md
staging/configuring-remote-live-staging.md
staging/managing-data-and-content-types-in-staging.md
staging/page-versioning.md
staging/publishing-single-assets-and-widgets.md
staging/configuring-automatic-publishing-of-displayed-content.md
staging/configuring-page-publishing.md
staging/managing-staging-permissions.md
staging/using-staging-in-asset-libraries.md
staging/site-staging-ui-reference.md
```

Liferayのステージングアプリケーションは、本番環境に変更を公開する前に、サイトやアセットライブラリを変更するための作業環境を提供します。 これを使えば、ステージングされたアプリケーションのデータやページを裏で修正し、準備ができ次第、個別に、あるいはまとめて、変更内容を公開することができ、Live環境ではユーザーの受信トラフィックを処理することができます。

ステージングを設定する際、サイトまたはアセットライブラリをローカル（つまり同じサーバー上）またはリモート（つまりネットワークで接続された別々のサーバー上）のどちらでホストするかを決定します。 次に、ステージングするアプリケーションデータをカスタマイズします。 サイトの場合、ウィジェットページとコンテンツページのページバージョニングを有効にすることも可能です。

```{important}
Liferay DXP 7.4 と 7.3.10 FP1 からアセットライブラリでステージングがサポートされました。 ただし、ステージングされたサイトとステージングされたsssetライブラリを接続することだけが必要で、その逆もまた然りです。 詳しくは、 [アセットライブラリでのステージングの使用](./staging/using-staging-in-asset-libraries.md) をご覧ください。
```

## 設定オプション

ステージングを設定するには、 ［**ローカル現行環境ステージング**］ と ［**リモート本番環境ステージング**］ の2つのオプションがあります。

**ローカル現行環境ステージング** ：ステージング環境と本番環境の両方を同じLiferayサーバーでホストできます。 有効にすると、Liferay DXPはあなたのサイトやアセットライブラリのローカルクローンを作成してステージング環境とし、元のサイトやアセットライブラリはライブ環境となります。

**リモート本番環境ステージング** ：ステージング環境と本番環境を別々のLiferayサーバーでホストできます。 有効にすると、Staging の設定に使用したサイトまたはアセットライブラリが Staging 環境になり、設定したリモートサーバーが Live 環境になります。

どちらのオプションも、ステージングされたページ、アプリケーション、およびコンテンツの管理と公開に同じインターフェイスを使用しますが、その設定には違いがあります。 ニーズに最適な設定オプションを選択したら、 [ローカル現行環境ステージングの設定](./staging/configuring-local-live-staging.md) または [リモート本番環境ステージングの設定](./staging/configuring-remote-live-staging.md) を参照してセットアップ手順を確認してください。

### ステージングされたデータとコンテンツタイプ

ステージング設定の一部として、ステージングするコンテンツグループとアプリケーションデータを選択できます。 ステージングされると、選択されたデータとコンテンツはステージング環境によって管理されます。 また、アプリケーションまたはコンテンツグループを選択すると、含まれているすべてのエンティティ（アプリケーションフォルダなど）もステージングされます。 詳細は、[ステージングでのデータとコンテンツタイプの管理](./staging/managing-data-and-content-types-in-staging.md)を参照してください。

### ページバージョニング

サイトのステージングを設定する際に、 **ページのバージョニング** 機能を有効にすることができます。 この機能により、サイトのコンテンツページとウィジェットページのバリエーションを同時に開発することができます。 ページのバージョン履歴をすべて見ることができ、必要に応じてページを以前のバージョンに戻すことができます。 バリエーションの作成と管理の方法については [ページバージョニング](./staging/page-versioning.md) を、各バリエーションの権限を管理する方法については[ステージング権限の管理](./staging/managing-staging-permissions.md)を参照してください。

```{note}
Liferay DXP 7.4, 7.3 Fix Pack 1, 7.2 Fix Pack 11 から、ウィジェットページとコンテンツページでページのバージョニングを使用することができるようになりました。 以前のバージョンでは、ウィジェットページにのみバリエーションを作成することができました。 ページの種類ごとのバリエーションについては、 [バリエーションの種類](./staging/page-versioning.md#types-of-variations) を参照してください。
```

## 公開プロセスを理解する

下位の観点からは、ステージングは、エンティティが別の場所にミラーリングされる同値関係です。 高度な観点からは、ステージングプロセスは、エクスポート、検証、およびインポートの3つの連続したフェーズで実行されます。

このプロセスを理解すると、効率が向上し、シームレスな公開エクスペリエンスを実現するための事前の計画に役立ちます。 詳細は、[公開プロセスを理解する](./staging/understanding-the-publishing-process.md)を参照してください。

```{important}
ステージングでは、 [Commerce アプリケーション](https://learn.liferay.com/commerce/latest/ja/index.html) および [カスタムオブジェクト](../../building-applications/objects.md) をサポートしません。 発行処理中、Commerceのエンティティおよびオブジェクトはステージングされません。 
```

```{raw} html
:file: ../../landingpage_template.html
```

```{raw} html
:file: staging/landing.html
```
