# クロスオリジン・リソース共有の実現

異なるドメインのサーバーがLiferayのWebサービスにアクセスしようとすると、CORS（Crossorigin Resource Sharing）ポリシーが各リクエストを許可または拒否します。 詳しくは、 [settings up CORS](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors) をご覧ください。

Delectable Bonsaiは、 [Liferayオブジェクト](https://learn.liferay.com/w/dxp/building-applications/objects) 、ユーザーがカスタマイズされたプロフィールフィールドを持つことができます。 以下の手順に従って、ローカルで実行するReactアプリケーションの例をご覧ください。

1. Liferay オブジェクトを作成します。

   * **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **コントロールパネル** &rarr; **オブジェクト** に移動する。
   * **追加**（![Add icon](../../../images/icon-add.png)） をクリックします。
   * 以下のオブジェクトを入力する：
     * ラベル `J4X7-Object`
     * 複数のラベル `J4X7-オブジェクト`
     * 名前 `J4X7Object`
   * ［**保存**］ をクリックします。
   * 先ほど作成したJ4X7-Objectを選択します。 **Fields** タブをクリックする。
   * **Add**(![アイコンの追加](../../../images/icon-add.png))に以下のフィールドを追加する：
     * ラベル： `名前：`
     * フィールド名： `name`
     * タイプ `テキスト`
   * ［**保存**］ をクリックします。
   * **Add**(![アイコンの追加](../../../images/icon-add.png))に以下のフィールドを追加する：
     * ラベル： `説明：`
     * フィールド名： `説明：`
     * タイプ `テキスト`
   * ［**保存**］ をクリックします。
   * **詳細** タブに戻り、 **パブリッシュ** をクリックします。

1. Reactアプリケーションをダウンロードして解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/developing-a-javascript-application/using-react/liferay-j4x7.zip -O
   ```

   ```bash
   unzip liferay-j4x7.zip
   ```

   ```bash
   cd liferay-j4x7
   ```

1. アプリケーションのフォルダに移動し、Reactサーバーを起動する。

   ```bash
   cd j4x7-custom-element
   ```

   ```bash
   yarn start
   ```

1. J4X7オブジェクトエントリを追加してみてください。 名前と説明に `foo` と入力し、 **Add** をクリックする。

   ![J4X7オブジェクトエントリを追加してみてください。](./cross-origin-resource-sharing/images/01.png)

   エントリーの追加が阻止されたことを確認する。

1. Liferay で **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Instance Settings** に移動します。

1. オブジェクトのCORSポリシーを追加する。

   * **セキュリティツール** をクリックする。
   * 左ナビゲーションの **Portal Cross-Origin Resource Sharing (CORS)**をクリックします。
   * **Add** をクリックします。
   * 名前は **Foo** と入力してください。
   * `/o/c/j4x7objects/*` の値で **URLパターン** を追加し、 **更新** をクリックする。

1. Reactアプリに戻って、J4X7オブジェクトのエントリーを追加する。 名前と説明に `foo` と入力し、 **Add** をクリックする。

   ![J4X7 オブジェクトエントリが正常に追加された。](./cross-origin-resource-sharing/images/02.png)

   CORSポリシーが更新され、J4X7オブジェクトエントリが正常に追加されました。

これでCORSの設定が完了し、Securing Web Servicesモジュールが完成しました。

次へ [認証とシングルサインオン](../authorizing-and-single-sign-on.md)
