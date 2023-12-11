# オブジェクトアプリケーションの権限

{bdg-secondary}`liferay 7.4 2023.Q4+/GA102+`.

Objectsアプリケーションはパーミッションフレームワークと統合されているため、 [アプリケーション](#application-permissions) と [リソース](#resource-permissions) のパーミッションをユーザーロールに割り当てることで、アプリケーションとそのデータにアクセスできるユーザーを決定することができます。

![Assign Objects permissions when defining role permissions.](./objects-application-permissions/images/01.png)

ユーザーロールへの権限の割り当ての詳細については、 [ロール権限の定義](../../users-and-permissions/roles-and-permissions/defining-role-permissions.md) を参照してください。

## アプリケーションの権限

アプリケーションの権限は、一般的なアプリケーション関連の操作を実行する権限を付与し、 [リソース関連の権限](#resource-permissions) は含まれません。

オブジェクトは、以下のアプリケーション権限を持ちます。

![Objects has the following application permissions.](./objects-application-permissions/images/02.png)

| 権限             | 説明                              |
| :------------- | :------------------------------ |
| コントロールパネルのアクセス | グローバルメニューのオブジェクトにアクセスします.       |
| 設定             | Objects アプリケーションの構成オプションの表示と変更。 |
| 権限の設定          | オブジェクトの権限を表示および変更します.           |
| 詳細設定           | Objects アプリケーションの環境設定の表示と変更。    |
| 表示             | オブジェクトのアプリケーションを表示します。          |

!!! important
Liferay 7.4 2023.Q4+/GA102+では、Objects UIを使用するには_Object Folder > View_権限が必要です。

## リソース権限

リソースパーミッションは、Objects アプリケーションの定義とフォルダの表示、作成、および操作へのアクセス権を付与します。 これらの権限の中には、 [エンティティ](#object-definitions-resource-related-actions) を作成するためのものもあれば、既存のエンティティ（たとえば、 [定義](#object-definition-for-existing-custom-definitions) や [フォルダ](#object-folder-for-existing-object-folders) ）に作用するためのものもある。

オブジェクトは、以下のリソース権限を持ちます。

### オブジェクト定義（リソース関連アクション）

![Manage resource-related actions in the Objects application.](./objects-application-permissions/images/03.png)

| 権限              | 説明                                             |
| :-------------- | :--------------------------------------------- |
| オブジェクト定義を追加     | オブジェクト定義ドラフトを作成する。                             |
| オブジェクトフォルダーを追加  | オブジェクト定義を整理するためのフォルダを作成する。                     |
| システムオブジェクト定義を拡張 | システムオブジェクトにフィールド、リレーションシップ、アクション、バリデーションを追加する。 |
| 権限の設定           | オブジェクトに関連するパーミッションの表示と管理。                      |
| オブジェクト定義を公開     | オブジェクト定義ドラフトを公開する。                             |

### オブジェクト定義（既存のカスタム定義の場合）

![Manage permissions for existing object definitions.](./objects-application-permissions/images/04.png)

| 権限    | 説明                      |
| :---- | :---------------------- |
| 削除    | オブジェクト定義を削除する。          |
| 権限の設定 | オブジェクト定義の権限を表示および変更します。 |
| 更新    | オブジェクト定義を更新する。          |
| 表示    | オブジェクトの定義を表示します。        |

### オブジェクトフォルダ（既存のオブジェクトフォルダの場合）

![Manage permissions for existing object folders.](./objects-application-permissions/images/05.png)

| 権限          | 説明                        |
| :---------- | :------------------------ |
| オブジェクト定義を追加 | オブジェクト定義をフォルダに移動する        |
| 削除          | オブジェクトフォルダを削除します。         |
| 権限の設定       | オブジェクトフォルダのパーミッションの表示と変更。 |
| 更新          | オブジェクトフォルダを更新する。          |
| 表示          | オブジェクトフォルダを表示します。         |

## 個々のオブジェクト定義に対する権限の管理

1. *グローバル・メニュー* (![グローバル・メニュー](../../images/icon-applications-menu.png))から_Objects_アプリケーションを開きます。

1. 目的のオブジェクト定義の_Actions_ボタン(![Actions Button](../../images/icon-actions.png)) をクリックし、_Permissions_を選択します。

   ![Click the Actions button for the desired object definition and select Permissions.](./objects-application-permissions/images/06.png)

1. チェックボックスを使用して、 [オブジェクト定義](#object-definition-for-existing-custom-definitions) 権限を必要なロールに付与します。

   !!! note
   ロール管理者レベルで定義されたパーミッションは、個人レベルで定義されたパーミッションよりも優先されます。

   ![Use the checkboxes to assign permissions to the desired roles.](./objects-application-permissions/images/07.png)

1. ［_保存_］をクリックします。

## 個々のフォルダー定義の権限管理

1. *グローバル・メニュー* (![グローバル・メニュー](../../images/icon-applications-menu.png))から_Objects_アプリケーションを開きます。

1. 目的のオブジェクトフォルダの_Actions_ (![Actions Button](../../images/icon-actions.png)) をクリックし、_Permissions_を選択します。

   ![Click the Actions button for the desired object folder and select Permissions.](./objects-application-permissions/images/08.png)

1. チェックボックスを使用して、 [オブジェクトフォルダ](#object-folder-for-existing-object-folders) の権限を必要なロールに付与します。

   !!! note
   ロール管理者レベルで定義されたパーミッションは、個人レベルで定義されたパーミッションよりも優先されます。

   ![Use the checkboxes to assign permissions to the desired roles.](./objects-application-permissions/images/09.png)

1. ［_保存_］をクリックします。

## 関連トピック

* [オブジェクト](../objects.md)
* [オブジェクトの作成と管理](./creating-and-managing-objects.md)
