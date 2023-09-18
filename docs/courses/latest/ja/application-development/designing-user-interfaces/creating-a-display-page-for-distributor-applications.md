# ディストリビューター申請用の表示ページの作成

公開オブジェクトはInfoフレームワークと統合されているため、表示ページテンプレートのコンテンツタイプとして選択することができます。 選択すると、オブジェクトがテンプレートのマッピングソースとして設定されるので、フラグメントフィールドをオブジェクトフィールドにマッピングして、個々のオブジェクトエントリに対して柔軟なページ表示を作成することができます。

ユーザーがアプリケーションを送信すると、Liferay はアプリケーションの表示ページを表示するためのフレンドリーな URL を割り当てます。 この URL を使用してアプリケーションのデータを表示するには、Distributor Application オブジェクトにデフォルトの表示ページテンプレートを作成する必要があります。 ここでは、このテンプレートを作成し、提供されたフラグメント・コンポジションを使ってデザインする。

<!-- Refine intro. -->

1. **Site Menu**(![Site Menu](../../images/icon-product-menu.png)) を開き、 **Design** を展開し、 **Page Templates** をクリックします。

1. **Display Page Template** タブに移動し、 **Add**(![Add Button](../../images/icon-add.png)) をクリックします。

1. **Blank** マスターテンプレートを選択する。

1. これらの詳細を入力し、 **Save** をクリックします。

   | 項目       | 値            |
   |:-------- |:------------ |
   | 名称       | アプリケーション表示   |
   | コンテンツの種類 | ディストリビューター申請 |

   ![名前を入力し、コンテンツタイプに「Distributor Application」を選択します。](./creating-a-display-page-for-distributor-applications/images/01.png)

   ディストリビューター・アプリケーション・コンテンツタイプを選択することで、ページのフラグメントをディストリビューター・アプリケーションのフィールドにマッピングし、現在のアプリケーションの値をページに入力することができます。

1. **表示ページ** を空のテンプレートにドラッグ・アンド・ドロップする。

   ![表示ページのフラグメントを空のテンプレートにドラッグ＆ドロップします。](./creating-a-display-page-for-distributor-applications/images/02.png)

   このコンポジションには、ディストリビューター・アプリケーションのフィールドにマッピングされる多数のフラグメントが含まれる。

   ![フラグメントはディストリビューター・アプリケーションのフィールドにマッピングされる。](./creating-a-display-page-for-distributor-applications/images/03.png)

1. ［**Publish**］ をクリックします。

1. 表示ページテンプレートの「**Actions**」 ボタン（![Actions Button](../../images/icon-actions.png)）をクリックし、「**Mark as Default**」 を選択する。

   これにより、Liferayはディストリビューターアプリケーションにテンプレートを使用するようになります。

   ![テンプレートをデフォルトに設定する。](./creating-a-display-page-for-distributor-applications/images/04.png)

これで、ユーザーがアプリケーションのフレンドリーURLに移動すると、表示ページテンプレートにそのデータが入力されます。

![表示ページのテンプレートには、アプリケーションのデータが入力される。](./creating-a-display-page-for-distributor-applications/images/05.png)

サクセス・ページと同様に、表示ページには、申請書の概要ページにアクセスするための「Edit Your Application（申請書を編集）」ボタンが含まれています。 これで、このページの設定を終えることができる。

次へ [概要ページへのディストリビューター・アプリケーション・ウィジェットの追加](./adding-the-distributor-application-widget-to-the-overview-page.md)
