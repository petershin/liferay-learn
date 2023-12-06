# セグメント管理設定

{bdg-secondary}`Liferay DXP/Portal 7.3以降で利用可能`

セグメント動作は、システムまたはインスタンスレベルで設定できます。 これらの設定で、セグメンテーションの有効/無効、Analytics CloudセグメントとLiferay DXPの同期間隔の設定、セッションベースのセグメントプロパティの作成などができます。

セグメント設定にアクセスする、

1. **グローバルメニュー** を開く ![グローバルメニュー](../../../images/icon-applications-menu.png)**コントロールパネル** タブをクリックし、 **システム設定** または **インスタンス設定** に進む。

   ```{note}
   Liferay DXP 7.4 U38+/GA38+から、インスタンスレベルでセグメント設定を行うことができます。
   ```

1. コンテンツとデータ」の「**セグメント**」 をクリックする。

システム・スコープとインスタンス・スコープがどのように機能するかについては、 [設定スコープについて](../../../system-administration/configuring-liferay/understanding-configuration-scope.md) を参照してください。

## Analytics Cloud のセグメント

![アナリティクス クラウド セグメントの設定を表示および構成します。](./segments-admin-settings/images/01.png)

[セグメント](https://learn.liferay.com/analytics-cloud/latest/ja/people/segments/segments.html) 共通の属性と行動に基づいて個人を集約。 このデータをLiferay DXPのセグメントと統合することで、既知のユーザーと匿名のユーザーの両方に興味のあるコンテンツを配信することができます。

これらの設定には、 **Analytics Cloud Segments** からアクセスできます：

**Anonymous User Segments Cache Expiration Time** : 匿名セグメントキャッシュを保存する時間制限（秒）を設定します。 時間が経過すると、キャッシュはクリアされる。

**Interest Terms Cache Expiration Time** : 利息条件キャッシュを保存する時間制限（秒）を設定します。 時間が経過すると、キャッシュはクリアされる。 詳しくは [興味のあるトピックの理解](https://learn.liferay.com/analytics-cloud/latest/ja/people/individuals/understanding-interests.html) 。

**Update Interval** : Analytics Cloudセグメントからの更新を受信する間隔（分）を設定します。 この設定はシステム設定の下にのみ表示されます。

## セッションプロパティのボキャブラリ

**セッション・プロパティ・ヴォキャブラリー** を使えば、 [セッション・ベースのセグメント・プロパティ](../../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) を、定義済みの値を使って作成することができます。 これは、ユーザーに定義済みの値のリストからプロパティを選択させたい場合に役立ちます。手入力のエラーを排除しながらセグメントを定義できるからです。 詳細については、 [セッションプロパティのボキャブラリ](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md) 。

## セグメントのサービス

![セグメントサービスの設定を表示および構成します。](./segments-admin-settings/images/02.png)

これらの設定は、 **Segments Service** でアクセスできます：

**Enable Segmentation** : セグメンテーションを有効または無効にする。 無効になっている間、Liferayはエンドユーザーにコレクションとエクスペリエンスのパーソナライズされたバリエーションを表示しません。

**Enable Assign Roles by Segment** : グローバルセグメントを使用して、ユーザにロールを動的に割り当てるかどうかを設定します。 有効にすると、変更する個人のグループに自動的にロールを割り当てることができます。 詳細については、 [ユーザーセグメントにロールを割り当てる](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md) を参照してください。

**Compound Segments Interval** : 複合セグメントをルールに基づいてチェックし、リフレッシュする間隔（分）を設定します。 この設定はシステム設定の下にのみ表示されます。

```{note}
[Configuration Scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md) に注意してください。 システム・レベルで無効にした設定はインスタンス・レベルでは有効にできませんが、システム・レベルで有効にした設定はインスタンス・レベルで無効にできます。
```

## 関連トピック

* [セグメント](https://learn.liferay.com/analytics-cloud/latest/ja/people/segments/segments.html)
* [セッションプロパティのボキャブラリ](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md)
