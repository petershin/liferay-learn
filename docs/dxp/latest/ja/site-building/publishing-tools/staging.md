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
# ステージング

Liferayのステージングアプリケーションは、本番環境に変更を公開する前に、サイトやアセットライブラリに変更を加えるための作業環境を提供します。 これを使えば、ステージングされたアプリケーションのデータやページを舞台裏で修正し、準備ができたら変更を公開することができます。

![Liferayは元のサイトやライブラリのコピーを別に作成します。](./staging/images/01.png)

ステージングを設定する際、サイトまたはアセットライブラリをローカル（つまり同じサーバー上）でホストするか、リモート（つまりネットワークで接続された別々のサーバー上）でホストするかを決定します。 次に、ステージングするアプリケーションデータをカスタマイズします。 サイトでは、ウィジェット・ページとコンテンツ・ページのページ・バージョニングを有効にすることもできます。

```{important}
Liferay DXP 7.4および7.3.10 FP1以降、アセットライブラリでステージングがサポートされるようになりました。 ただし、ステージングされたサイトとステージングされたアセット・ライブラリを接続するのは、ステージングされたサイトだけにしてください。 詳しくは [アセットライブラリでのステージングの使用](./staging/using-staging-in-asset-libraries.md) を参照してください。
```

ほとんどのユースケースでは、ステージングよりもパブリケーションが推奨される。 詳しくは [パブリッシングツールの比較](./comparing-publishing-tools.md) をご覧ください。

## 設定オプション

Stagingの設定には2つのオプションがあります： **ローカルライブ** と **リモートライブ** 。

**Local Live Staging** : 同じLiferayサーバー上でステージング環境とライブ環境の両方をホストすることができます。 有効にすると、Liferay DXPはステージング環境として機能するサイトやアセットライブラリのローカルクローンを作成し、元のサイトやアセットライブラリはライブ環境になります。

**Remote Live Staging** : ステージング環境とライブ環境を別々のLiferayサーバーでホストすることができます。 有効にすると、Stagingの設定に使用したサイトまたはアセットライブラリがステージング環境になり、設定したリモートサーバーがライブ環境になります。

どちらのオプションも、ステージングされたページ、アプリケーション、コンテンツの管理と公開に同じインターフェイスを使用しますが、セットアップが異なります。 ニーズに最適な設定オプションを選択したら、 [ローカル現行環境ステージングの設定](./staging/configuring-local-live-staging.md) または [リモート本番環境ステージングの設定](./staging/configuring-remote-live-staging.md) を参照してセットアップ手順を確認してください。

### ステージングされたデータとコンテンツタイプ

ステージング設定の一部として、ステージングするコンテンツグループとアプリケーションデータを選択できます。 ステージングされた場合、選択されたデータとコンテンツはステージング環境によって管理されます。 また、アプリケーションまたはコンテンツグループを選択すると、含まれているすべてのエンティティ（アプリケーションフォルダなど）もステージングされます。 詳細は、[ステージングでのデータとコンテンツタイプの管理](./staging/managing-data-and-content-types-in-staging.md)を参照してください。

### ページバージョニング

サイトのステージングを設定する際、 **ページバージョニング** 機能を有効にすることができます。 この機能により、あなたとあなたのチームは、サイトのコンテンツページとウィジェットページのバリエーションを同時に開発することができます。 ページバージョンの完全な履歴を見ることができ、必要に応じてページを以前のバージョンに戻すことができる。 バリエーションの作成と管理の方法については [ページバージョニング](./staging/page-versioning.md) を、各バリエーションの権限を管理する方法については[ステージング権限の管理](./staging/managing-staging-permissions.md)を参照してください。

## 公開プロセスを理解する

下位の観点からは、ステージングは、エンティティが別の場所にミラーリングされる同値関係です。 高度な観点からは、ステージングプロセスは、エクスポート、検証、およびインポートの3つの連続したフェーズで実行されます。

このプロセスを理解すると、効率が向上し、シームレスな公開エクスペリエンスを実現するための事前の計画に役立ちます。 詳細は、[公開プロセスを理解する](./staging/understanding-the-publishing-process.md)を参照してください。

```{important}
ステージングは [Commerce](https://learn.liferay.com/w/commerce/index) または[カスタムオブジェクト](../../building-applications/objects.md)をサポートしていません。 パブリッシング処理中、コマースとオブジェクトのエンティティはステージングされません。 
```
