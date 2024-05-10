# セグメント管理設定

{bdg-secondary}`liferay DXP/Portal 7.3+`.

セグメント動作は、システムまたはインスタンスレベルで設定できます。 これらの設定で、セグメンテーションの有効/無効、Analytics CloudセグメントとLiferay DXPの同期間隔の設定、セッションベースのセグメントプロパティの作成などができます。

セグメント設定にアクセスする、

1. **グローバル メニュー** ![グローバル メニュー](../../../images/icon-applications-menu.png) を開き、**コントロール パネル**タブをクリックし、**システム設定** または **インスタンス設定** に移動します。

   ```{note}
   Liferay DXP 7.4 U38+/GA38+から、インスタンスレベルでセグメント設定を行うことができます。
   ```

1. コンテンツとデータ]の下にある[セグメント]をクリックします。

システム・スコープとインスタンス・スコープがどのように機能するかについては、 [設定スコープについて](../../../system-administration/configuring-liferay/understanding-configuration-scope.md) を参照してください。

## Analytics Cloud のセグメント

![View and configure Analytics Cloud Segments settings.](./segments-admin-settings/images/01.png)

[セグメント](https://learn.liferay.com/w/analytics-cloud/people/segments/segments) 共通の属性と行動に基づいて個人を集約。 このデータをLiferay DXPのセグメントと統合することで、既知のユーザーと匿名のユーザーの両方に興味のあるコンテンツを配信することができます。

これらの設定には、 **Analytics Cloud Segments** でアクセスできます：

**匿名ユーザーセグメントキャッシュの有効期限** ：匿名セグメントキャッシュの保存期間（秒）を設定します。 時間が経過すると、キャッシュはクリアされる。

**金利条件キャッシュの有効期限** ：金利条件キャッシュの保存期間（秒）を設定します。 時間が経過すると、キャッシュはクリアされる。 詳しくは [興味のあるトピックの理解](https://learn.liferay.com/w/analytics-cloud/people/individuals/understanding-interests) 。

**更新間隔** :Analytics Cloudセグメントからの更新を受信する間隔（分）を設定します。 この設定はシステム設定の下にのみ表示されます。

## セッションプロパティのボキャブラリ

セッション・プロパティ・ヴォキャブラリー*を使えば、 [セッション・ベースのセグメント・プロパティ](../../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) を、定義済みの値を使って作成することができます。 これは、ユーザーに定義済みの値のリストからプロパティを選択させたい場合に役立ちます。手入力のエラーを排除しながらセグメントを定義できるからです。 詳細については、 [セッションプロパティのボキャブラリ](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md) を参照のこと。

## セグメントのサービス

![View and configure Segments Service settings.](./segments-admin-settings/images/02.png)

これらの設定には、 **Segments Service** でアクセスできます：

**Enable Segmentation** ：セグメンテーションを有効または無効にします。 無効になっている間、Liferayはエンドユーザーにコレクションとエクスペリエンスのパーソナライズされたバリエーションを表示しません。

**セグメントによるロールの割り当てを有効にする** ：グローバルセグメントを使用してユーザにロールを動的に割り当てるかどうかを設定します。 有効にすると、変更する個人のグループに自動的にロールを割り当てることができます。 詳細については、 [ユーザーセグメントにロールを割り当てる](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md) を参照してください。

**複合セグメント間隔** ：ルールに基づいて複合セグメントをチェックし、リフレッシュする間隔（分）を設定します。 この設定はシステム設定の下にのみ表示されます。

```{note}
[コンフィギュレーション・スコープ](../../../system-administration/configuring-liferay/understanding-configuration-scope.md) にご注意ください。 システム・レベルで無効にした設定はインスタンス・レベルでは有効にできませんが、システム・レベルで有効にした設定はインスタンス・レベルで無効にできます。
```

## 関連トピック

* [セグメント](https://learn.liferay.com/w/analytics-cloud/people/segments/segments)
* [セッション・プロパティ・ヴォキャブラリー](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md)
