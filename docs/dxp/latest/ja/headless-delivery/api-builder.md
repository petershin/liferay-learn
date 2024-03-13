# API ビルダー

{bdg-secondary}Liferay DXP 2023.Q4+/Portal 7.4 GA102+
{bdg-link-primary}`[Beta Feature](../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

```{important}
APIビルダーはベータ機能で、現在はLiferayオブジェクトのみをサポートしています。 APIエンドポイントは現在、エンティティのコレクションの取得をサポートしている。
```

APIビルダーを使えば、LiferayでカスタムAPIアプリケーションを簡単に作成できます。 お客様のニーズを正確に満たすAPIスキーマとエンドポイントを作成します。

APIビルダーを有効にする、

1. グローバルメニューに移動する（！ [グローバルメニュー](../images/icon-applications-menu.png) &rarr; **コントロールパネル** &rarr; **インスタンス設定** .

1. プラットフォーム」の下にある「機能フラグ」をクリックします。

1. 左のナビゲーションで **Beta** を選択。 APIビルダーをオンにする。 APIビルダーが有効になりました。

## APIアプリケーションを理解する

各カスタムAPIアプリケーションは複数のエンドポイントとスキーマを持つことができる。 これはLiferayのすぐに使えるAPIアプリケーションに似ている。 例えば、`headless-admin-user` API アプリケーションには `accounts`、`organizations`、`roles`、`user-accounts` などのエンドポイントがある。

カスタムAPIアプリケーションを管理するには、 **Global Menu**( [Global Menu](../images/icon-applications-menu.png) ) に移動します。 &rarr; **コントロールパネル** &rarr; **APIビルダー** . カスタムAPIアプリケーションのリストをご覧ください。 APIアプリケーションごとに、タイトル、URL、説明、最終更新日、ステータスが表示される。

![See a list of your custom API applications.](./api-builder/images/01.png)

新しいAPIアプリケーションを作成するには、 **Add**（ [Add icon](../images/icon-add.png) ）をクリックし、詳細を入力します。

アプリケーションを編集または削除するには、 **Options**(![Options icon](../images/icon-options.png)) をクリックし、 **Edit** または **Delete** をクリックします。 なお、ドラフト状態のAPIアプリケーションは、公開後でなければ使用できない。 いったん公開されると、生成されたAPIはLiferayのすぐに使えるAPIと同じ機能を持ちます（ページネーション、フィルタリング、ソートなど）。

## スキーマを理解する

APIスキーマは、APIが返す（あるいは受け取る）エンティティを指定する。 スキーマを管理するには、カスタムAPIアプリケーションの1つをクリックし、 **Schemas** タブをクリックします。 カスタムスキーマの一覧を見る。 各スキーマの名前、説明、最終更新日が表示される。

![See a list of your custom schemas](./api-builder/images/02.png)

新しいスキーマを作成するには、 **Add**(![Add icon](../images/icon-add.png)) をクリックし、詳細を入力します。 次に、新しいスキーマの **Properties** タブをクリックし、含ませたいエンティティを選択する。 [Liferayオブジェクト](../building-applications/objects/creating-and-managing-objects.md) から利用可能な様々なエンティティから選択します。 オブジェクトが [オブジェクト関係](../building-applications/objects/creating-and-managing-objects/relationships.md) を持っている場合、それらのオブジェクトのエンティティも選択できる。

なお、オブジェクトのプロパティ名は必要に応じて変更できる。 例えば、スクリーンショットの `student` オブジェクトでは、`First Name` を `Given Name` に変更する。

![Select the entities you want included in your schema.](./api-builder/images/03.png)

スキーマを編集または削除するには、 **Options**（！ [オプション・アイコン](../images/icon-options.png) ）をクリックし、 **Edit** または **Delete** をクリックする。

## エンドポイントを理解する

APIエンドポイントは、リクエストを受け付ける特定のURLの場所である。 エンドポイントを管理するには、カスタムAPIアプリケーションの1つをクリックし、 **Endpoints** タブをクリックしてカスタムエンドポイントのリストを表示します。 各エンドポイントについて、メソッド、URLパス、説明、最終更新が表示される。

新しいエンドポイントを作成するには、 **Add**(![Add icon](../images/icon-add.png)) をクリックし、詳細を入力します。 エンドポイントは、インスタンスまたはサイトにスコープすることができます。 オブジェクトのスコープに基づいてスコープを選択します。 Configuration_タブをクリックしてエンドポイントを設定します。 エンドポイントで使用するスキーマを選択します。

![Select the configuration tab to configure the endpoint.](./api-builder/images/04.png)

JSONフィルタリングをエンドポイントに組み込むことができる。 例えば、`filter=lastName eq 'Smith'`を使用すると、Smithという姓を含むエントリに対してエンドポイントをフィルタリングすることができます。

JSONソートも組み込むことができる。 例えば、`sort=firstName:asc`を使えば、エントリーをアルファベット順に並べ替えることができる。

フィルタリングとソートの詳細については、 [APIクエリパラメータ](./consuming-apis/api-query-parameters.md) を参照してください。

エンドポイントを編集または削除するには、 **Options**(![Options icon](../images/icon-options.png)) をクリックし、 **Edit** または **Delete** をクリックします。

## 次のステップ

* [サンプルAPIアプリケーションの構築](./api-builder/building-a-sample-api-application.md) 
