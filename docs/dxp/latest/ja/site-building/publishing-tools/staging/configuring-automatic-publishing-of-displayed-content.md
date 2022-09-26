# 表示されたコンテンツの自動公開の設定

{bdg-secondary}`7.4以降で利用可能`

デフォルトでは、パブリッシングプロセスに明示的に含まれるコンテンツのみがLiveにパブリッシュされます。 必要に応じて、以下のウィジェットを使用して表示されるコンテンツを常に公開するようにインスタンスを構成できます。動的データリスト表示、フォーム、Webコンテンツ表示、およびWiki表示。 これにより、表示されるコンテンツが常にLiveで最新の状態に保たれるようにすることができます。

このステージング動作を構成するには、次の手順に従います。

1. **グローバルメニュー**（![Global Menu](../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ をクリックして、 ［**システム設定**］ &rarr; ［**Infrastructure**］ に移動します。

1. 左側のメニューの［仮想インスタンススコープ］の下にある ［**ステージング**］ をクリックします。

1. ［**Publish Displayed Content by Default**］ をオンまたはオフにします。

   有効にすると、公開プロセスの構成に関係なく、表示されたコンテンツが動的データリスト(DDL)表示、フォーム、Webコンテンツの表示、およびWiki表示のウィジェットに対して再公開されます。

   無効にすると、公開プロセスの構成に含まれているコンテンツのみが公開されます。

   ```{tip}
   表示されたコンテンツを常にLiveに再パブリッシュすることは不要であり、公開が遅くなる可能性があることを念頭に置いてください。
   ```

1. ［**Save**］ をクリックします。

![［Publish Displayed Content by Default］をオンまたはオフにします。](./configuring-automatic-publishing-of-displayed-content/images/01.png)

## Asset Publisherのパブリッシングを設定する

デフォルトでは、Asset Publisherは表示されたコンテンツを自動的にLiveにエクスポートしません。 これは、ウィジェットのコンテンツが通常Liveで提供されるためです。 Liferay は、Asset Publisher ウィジェットを使って表示されるコンテンツ・アイテムのための追加設定を提供します。

以下の手順に従って、Asset Publisherウィジェットの動的または手動エクスポートを有効にしてください。

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** をクリックし、 **システム設定** &rarr; **資産** に進みます。

1. 左メニューの System Scope の下にある **Asset Publisher** をクリックします。

1. チェック／アンチェック **動的書き出しを有効にする** .

   有効にすると、Asset Publisher のエクスポートには、 **Dynamic Export Limit** 内のすべての関連アセットが含まれます。

1. チェック **Enable Manual Export** .

   この機能を有効にすると、エクスポートに含める関連資産をユーザーが手動で選択できるようになります。

1. ［**Save**］ をクリックします。

## 追加情報

* [ステージング](../staging.md)
* [公開プロセスを理解する](./understanding-the-publishing-process.md)
* [サイトステージングUIリファレンス](./site-staging-ui-reference.md)
