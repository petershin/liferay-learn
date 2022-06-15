# OSGiコンポーネントのブラックリスト登録

コンポーネントブラックリストは、複数の [OSGi宣言型サービスコンポーネント](https://help.liferay.com/hc/articles/360028846452-Declarative-Services) （コンポーネント）を管理する便利な方法です。 リストは、DXPがコンポーネントを無効にするために使用する [OSGi設定](../../configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) です。 これらのリストを使用すると、[アプリケーションマネージャー](./using-the-app-manager.md)や[Gogoシェル](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)で個別に変更する手間が省けます。

ブラックリストは、コントロールパネルからOSGi構成（`.config`）ファイルにエクスポートできます。 ファイルを変更してDXPにデプロイすると、次のような追加の効果があります。

* DXPサーバーの起動時の変更を保持します
* ローカルクラスターノードから他のすべてのノードに変更を伝播します。

UIと構成ファイルを使用してコンポーネントをブラックリストに登録する方法を示します。

## コンポーネントのブラックリスト登録

OSGiコンポーネントを無効にするには、次の手順に従います。

1. ［コントロールパネル］から、 ［**設定**］ &rarr; ［**システム設定**］ &rarr; ［**モジュール・コンテナー**］ へ行きます。 ［コンポーネントブラックリスト］画面が表示されます。

1. ［コンポーネントブラックリスト］画面で、無効にするコンポーネントの名前を追加し、 ［**保存**］ ボタンをクリックします。 コンポーネントはすぐに無効になります。

    ![このブラックリストは、コンポーネントcom.liferay.portal.security.ldap.internal.authenticator.LDAPAuthおよびcom.liferay.ip.geocoder.sample.web.internal.portlet.IPGeocoderSamplePortletを無効にします。](./blacklisting-osgi-components/images/01.png)

1. ブラックリストをエクスポートするには、コンポーネントブラックリストモジュールのアクションボタン（![操作](./blacklisting-osgi-components/images/02.png)）から ［**エクスポート**］ をクリックします。 ブラックリスト構成ファイルがダウンロードされます（`com.liferay.portal.component.blacklist.internal.ComponentBlacklistConfiguration.config`）。 サンプルのリストから作成されたファイルの内容は次のとおりです。

    ```properties
    blacklistComponentNames=["com.liferay.portal.security.ldap.internal.authenticator.LDAPAuth","com.liferay.ip.geocoder.sample.web.internal.portlet.IPGeocoderSamplePortlet "]
    ```

1. まだリストにない有効にしたくないコンポーネント（たとえば、まだインストールされていないモジュールのコンポーネント）の名前を追加します。

    ```{important}
    構成値に余分なスペースを含めることはできません。 余分なスペースがあると、リストが短絡したり、構成エントリが無効になったりする可能性があります。
    ```

1. 構成ファイルをデプロイするには、フォルダ`[Liferay Home]/osgi/configs`にコピーします。 Liferay Homeフォルダは通常、アプリケーションサーバーの親フォルダです。

## ブラックリストに登録されたコンポーネントを再度有効にする

ブラックリストに登録されたOSGiコンポーネントの再有効化と有効化を許可するには、次の手順に従います。

1. 構成ファイル`[Liferay Home]/osgi/configs/com.liferay.portal.component.blacklist.internal.ComponentBlacklistConfiguration.config`を開きます。

1. `blacklistComponentNames`リストからコンポーネントの名前を削除し、ファイルを保存します。

ブラックリストに登録されている **すべての** コンポーネントを有効にするには、構成ファイルを削除します。

```{note}
ブラックリストに登録されているコンポーネントを一時的に再度有効にするには、システム設定でコンポーネントブラックリスト設定モジュールからその名前を削除し、［*アップデート*］をクリックします。 コンポーネントのブラックリスト構成ファイル（`[Liferay Home]/osgi/configs`フォルダ内）を使用していて、その後のサーバー起動時にコンポーネントを有効にする場合は、そのコンポーネントの名前をファイルから忘れずに削除してください。
```

　 これで、単純なリストを使用して複数のコンポーネントを管理できるようになりました。

## 追加情報

* [アプリのブラックリスト登録](./blacklisting-apps.md)
* [アプリケーションマネージャーの使用](./using-the-app-manager.md)
* [Felix Gogoシェルの使用](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)