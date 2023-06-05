# セグメント管理者設定

{bdg-secondary}`Liferay DXP/Portal 7.3以降で利用可能`

Segmentの動作は、システムレベルまたはインスタンスレベルで設定することができます。 これらの設定により、セグメンテーションの有効化/無効化、Analytics CloudのセグメントとLiferay DXPの同期間隔の設定、セッションベースのセグメントプロパティの作成などを行うことができます。

セグメント設定にアクセスする。

1. **グローバルメニュー** を開く ![グローバルメニュー](../../../images/icon-applications-menu.png)をクリックし、 **コントロールパネル** タブをクリックし、 **システム設定** または **インスタンス設定** に移動します。

   ```{note}
   Liferay DXP 7.4 U38+/GA38+ からは、セグメント設定をインスタンスレベルで設定できるようになりました。
   ```

1. コンテンツとデータ」の「**Segments**」をクリックします。

システムスコープとインスタンススコープの仕組みについては、 [設定スコープについて](../../../system-administration/configuring-liferay/understanding-configuration-scope.md) を参照してください。

## Analytics Cloud のセグメント

![Analytics Cloud Segmentsの設定を表示・設定します。](./segments-admin-settings/images/01.png)

[セグメント](https://learn.liferay.com/analytics-cloud/latest/ja/people/segments/segments.html) 共通の属性や行動に基づいて個人を集約する。 このデータをLiferay DXPのセグメントと統合することで、既知および匿名のユーザーに関心のあるコンテンツを配信することができます。

これらの設定は、 **Analytics Cloud Segments** でアクセスできます。

**Anonymous User Segments Cache Expiration Time** : 匿名セグメントキャッシュを保存する時間制限（秒）を設定します。 時間切れになると、キャッシュがクリアされる。

**Interest Terms Cache Expiration Time** : 金利条件キャッシュを保存する時間制限（秒）を設定します。 時間切れになると、キャッシュがクリアされる。 詳しくは、 [インタレスト・トピックスの管理](https://learn.liferay.com/analytics-cloud/latest/ja/workspace-data/definitions/managing-interest-topics.html#understanding-interests) をご覧ください。

**Update Interval** : Analytics Cloudセグメントからの更新を受け取る間隔（分単位）を設定します。 この設定は、システム設定にのみ表示されます。

## セッションプロパティのボキャブラリ

**Session Property Vocabularies** を使用すると、あらかじめ定義された値を使用して [セッションベースのSegmentプロパティ](../../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) を作成することができます。 これは、ユーザーにあらかじめ定義された値のリストからプロパティを選択させたい場合に、セグメントを定義しつつ、手入力のミスをなくすために役立ちます。 詳しくは、 [セッションプロパティのボキャブラリ](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md) をご覧ください。

## セグメントのサービス

![Segment Serviceの設定を表示・設定することができます。](./segments-admin-settings/images/02.png)

これらの設定は、 **Segments Service** でアクセスできます。

**Enable Segmentation** : セグメンテーションの有効／無効を設定します。 無効になっている間、Liferayはエンドユーザーに対して、コレクションやエクスペリエンスのパーソナライズされたバリエーションを表示することはありません。

**Enable Assign Roles by Segment** : グローバルセグメントを使用してユーザーにロールを動的に割り当てることを有効または無効にします。 有効にすると、変更する個人のグループに自動的にロールを割り当てることができます。 詳しくは、 [ユーザーセグメントにロールを割り当てる](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md) を参照してください。

**Compound Segments Interval** : 複合セグメントをそのルールに基づいてチェックし、リフレッシュする間隔（分）を設定します。 この設定は、システム設定にのみ表示されます。

```{note}
[設定範囲](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)を意識してください。 システムレベルで無効にした設定はインスタンスレベルでは有効にできませんが、システムレベルで有効にした設定はインスタンスレベルで無効にすることができます。
```

## 関連トピック

* [セグメント](https://learn.liferay.com/analytics-cloud/latest/ja/people/segments/segments.html)
* [セッションプロパティのボキャブラリ](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md)
