# 出版物の許可

{bdg-secondary}`7.4+`

Publications は Liferay のパーミッションのフレームワークと連動しているので、 [アプリケーション](#application-permissions) と [リソース](#resource-permissions) のパーミッションを通常のロールに割り当てることができます。 また、共同研究者を招待する際に、個々の出版物にスコープされたパーミッション [を割り当てることができます](#assigning-roles-to-publication-collaborators) 。 許可されたユーザーのみが、パブリケーションにアクセスし、そのリソースに対してアクションを実行することができます。

```{note}
出版物の許可には、ページおよびコンテンツの編集権限は含まれません。 出版物のユーザーは、彼らが行動することが期待されているアプリケーションとリソース（例えば、Webコンテンツ、ブログ、ページ）に対して明示的な許可を必要とします。
```

デフォルトでは、Liferay は [**Publications User**](#publications-user-role) ロールにパブリケーションを作成しアクセスするための基本的なパーミッションを提供します。

![Liferay はデフォルトで Publications User ロールを提供します。](./publications-permissions/images/01.png)

必要に応じて、 [通常ロール](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) を追加作成したり、コンテンツクリエイター、レビュアー、パブリッシャー用の既存ロールを設定することができます。 詳細は、[ロールの作成と管理](../../../users-and-permissions/roles-and-permissions/creating-and-managing-roles.md) と [ロール権限の定義](../../../users-and-permissions/roles-and-permissions/defining-role-permissions.md)を参照してください。

![通常のロールを追加したり、その他のロールの権限を設定することができます。](./publications-permissions/images/02.png)

```{note}
出版物に関する権限は、*通常のロール*にのみ割り当てることができます。 詳しくは、[Understanding Roles and Permissions](../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) をご覧ください。
```

## アプリケーションの権限

アプリケーションパーミッションは、Publicationsアプリケーション自体へのアクセスを許可するもので、 [リソースパーミッションは含まれません](#resource-permissions) .

| 権限              | 説明                                                                                                                           |
|:--------------- |:---------------------------------------------------------------------------------------------------------------------------- |
| コントロールパネルへのアクセス | グローバルメニュー（ ![Global Menu](../../../images/icon-applications-menu.png) ）から「Publications」アプリケーションにアクセスします。                     |
| ページに追加する        | 該当なし                                                                                                                         |
| 設定              | [](./enabling-publications.md) Publications と Sandbox Only モードの有効・無効を設定します。                                                  |
| 権限の設定           | Publicationsアプリケーションの権限を表示、変更することができます。                                                                                      |
| 表示設定            | 該当なし                                                                                                                         |
| 表示              | グローバルメニュー（ ![Global Menu](../../../images/icon-applications-menu.png) ）で「Publications」アプリケーションを表示し、「Publications」バーにアクセスします。 |
| 本番環境で作業         | Publicationsが有効な状態で、本番環境にアクセスし、作業することができます。                                                                                  |

Publicationsを使用するには、最低限、Access in Control PanelとViewの権限を持つ通常のロールが必要です。

```{important}
Sandbox Only を有効にし、ユーザーに本番環境で作業させたくない場合は、ユーザーに Work on Production 権限がないことを確認してください。
```

## リソース権限

リソース権限は、パブリケーションアプリケーションのリソースを閲覧したり操作したりするためのアクセス権を付与するものです。これらの権限の中には、 [パブリケーションの作成に関連](#publications-related-to-creating-publications) するものもあれば、 [既存のパブリケーションに対するアクションを実行する](#publication-for-performing-actions-on-existing-publications) ものもあります（例：編集、削除、公開）。

### 出版物（出版物の作成）

| 権限          | 説明                                                                                                                                      |
|:----------- |:--------------------------------------------------------------------------------------------------------------------------------------- |
| 出版物の追加 (1)  | パブリケーションを作成します。 この許可がない場合、ユーザーは、 [招待されたときのみ、出版物にアクセスし、寄稿することができます](./collaborating-on-publications.md#inviting-users-to-a-publication) . |
| パーミッション (2) | パブリケーションの作成に関連するパーミッションの表示と変更。パブリケーションの追加とパーミッション。                                                                                      |


これらの権限を持つユーザーは、Publicationsアプリケーションでこれらのアクションを実行することができます。

![ユーザーは、パブリケーションを追加したり、パブリケーションを追加するための権限を管理したりすることができます。](./publications-permissions/images/03.png)


### パブリケーション（既存出版物への対応）

| 権限   | 説明                                                                                                                           |
|:---- |:---------------------------------------------------------------------------------------------------------------------------- |
| 削除   | 閲覧可能な出版物を削除する。                                                                                                               |
| 権限設定 | 閲覧可能な出版物の閲覧・編集権限を設定できます。 これには、 [ユーザー](./collaborating-on-publications.md#inviting-users-to-a-publication) を出版物に招待する機能が含まれます。 |
| 公開   | 閲覧可能な出版物を発行する。                                                                                                               |
| 更新   | 閲覧可能な出版物の更新。これには、出版物内での作業や、出版物の名前と説明を編集する機能が含まれます。                                                                           |
| 参照   | Liferayインスタンスのすべてのパブリケーションを表示します。これには、各パブリケーションの変更を確認する機能が含まれます。                                                             |


これらの権限を持つユーザーは、既存の出版物に対してアクションを実行することができます。

![ユーザーは、既存のパブリケーションの閲覧、更新、公開、削除、およびパーミッションの管理を行うことができます。](./publications-permissions/images/04.png)

## 出版物 ユーザーロール

デフォルトでは、 **Publications User** ロールはこれらの権限を持っています。

* Portal: View Control Panel Menu
* 出版物コントロールパネルからアクセス
* 出版物見る
* 出版物 > 出版物。出版物を追加する

![Liferay は、これらの権限を持つデフォルトの Publications User ロールを提供します。](./publications-permissions/images/05.png)

## 出版協力者への役割の割り当て

デフォルトでは、パブリケーションの作成者には **owner** ロールが自動的に割り当てられ、そのパブリケーションに対してすべてのアクションを実行できます。 [自分のパブリケーションにユーザーを招待するとき](./collaborating-on-publications.md#inviting-users-to-a-publication) オーナーは、これらのパブリケーションの役割を割り当てることができます。

| 出版物の役割 | 参照       | 更新       | 公開       | 権限の設定    | 削除       |
|:------ |:-------- |:-------- |:-------- |:-------- |:-------- |
| 閲覧者    | &#10004; | &#10008; | &#10008; | &#10008; | &#10008; |
| 編集者    | &#10004; | &#10004; | &#10008; | &#10008; | &#10008; |
| 発行者    | &#10004; | &#10004; | &#10004; | &#10008; | &#10008; |
| システム管理 | &#10004; | &#10004; | &#10004; | &#10004; | &#10008; |


![パブリケーションにユーザーを招待する際に、そのパブリケーションにスコープされたロールを割り当てることができます。](./publications-permissions/images/06.png)

各パブリケーションのロールは、現在のパブリケーションにスコープされ、他のパブリケーションでのパーミッションは付与されません。

パブリケーションロールは、通常のロールパーミッションを制限するものではありません。 たとえば、削除権限を持つユーザーがパブリケーションに招待され、 **viewer** ロールが割り当てられた場合、通常のロール権限により、パブリケーションを削除することができます。

## 追加情報

* [変更リスト](../publications.md)
* [パブリケーションの作成と管理](./creating-and-managing-publications.md)
* [パブリケーションでのコラボレーション](./collaborating-on-publications.md)
* [ロール権限の定義](../../../users-and-permissions/roles-and-permissions/defining-role-permissions.md)
