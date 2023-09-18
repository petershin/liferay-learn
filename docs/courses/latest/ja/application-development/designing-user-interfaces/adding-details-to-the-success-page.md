# サクセス・ページに詳細を追加する

ユーザーがディストリビューター申請を行うと、サクセスページが表示されます：申請書の提出 現在、このページにはバナー画像しかありません。 デレクタブル・ボンサイは次のことを望んでいる。

* 新しいアプリケーションの基本情報を表示する
* アプリケーションの閲覧・編集用リンクの提供

1. 申請書提出ページに移動し、 **Edit**(![Edit Button](../../images/icon-edit.png)) をクリックします。

   ![申請書提出ページに移動する。](./adding-details-to-the-success-page/images/01.png)

1. **Success Page** をページ下部の空のコンテナにドラッグ＆ドロップする。

   ![サクセス・ページのフラグメントを空のコンテナにドラッグ・アンド・ドロップする。](./adding-details-to-the-success-page/images/02.png)

   このコンポジションには、Distributor Application のコレクションプロバイダを使用する Collection Display フラグメントが含まれます。 Collection Display」には、これらの「Distributor Application」フィールドにマッピングされたサブフラ グメントも含まれます：

   * 事業名
   * ID
   * 制作日
   * アプリケーションの状態

   ![Collection Display フラグメントは、Distributor Application のコレクション・プロバイダを使用するように構成されています。](./adding-details-to-the-success-page/images/03.png)

   また、「View Your Application」をクリックしてアプリケーションの表示ページにアクセスしたり、「Edit Your Application」をクリックしてアプリケーションの概要ページにアクセスすることもできます。

1. ［**公開**］ をクリックします。

これで、ユーザーがこのサクセス・ページを見ると、アプリケーションからのデータが入力される。 さらに、自分の申請書を閲覧したり編集したりすることもできる。

現在、ディストリビューターの申請書を表示するページがないため、「申請書を表示」をクリックしてもどこにもつながりません。 次はそれを直してくれ。

次へ [ディストリビューター申請用の表示ページの作成](./creating-a-display-page-for-distributor-applications.md)
