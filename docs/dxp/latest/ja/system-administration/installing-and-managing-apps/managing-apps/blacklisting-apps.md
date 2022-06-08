# アプリのブラックリスト登録

バンドルブラックリストは、複数のアプリ、OSGiバンドル（モジュール）、WARプラグインを一度にアンインストールまたは再インストールする便利な方法です。 [アプリケーションマネージャー](./using-the-app-manager.md)または[Gogoシェル](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)を使用して、アプリ、モジュール、プラグインのインストールを個別に管理する手間を省きます。

```{important}
ブラックリストは、DXP がアプリのアンインストールに使用する [OSGi 設定](../../configuring-liferay/configuration-files and-factories/using-configuration-files.md#creating-configuration-files) です。 これを使用すると、リストされているアプリは削除されるまでインストールされなくなります。
```

リスト [は、コントロールパネル](#blacklisting-via-the-control-panel) で設定するか、 [コントロールパネルから](../../configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) エクスポートすることでOSGi構成</a> （`.config`）ファイルを使用して
設定できます。</p> 



## ブラックリスト登録

DXPは、ブラックリストにあるインストール済みのアプリ、モジュール、プラグインをすべて削除します。 ブラックリストに登録されている間はインストールできません。 ログには、各アンインストールが記録されます。



```{note}
LPKGをブラックリストに登録すると、その内部モジュールがすべてアンインストールされます。
```




### コントロールパネルを介したブラックリスト登録

次の手順に従って、アプリ、モジュール、プラグインをブラックリストに登録します。

1. ［コントロールパネル］から、_ ［設定］_ &rarr; _［System Settings］ _ &rarr; _［Module Container］_へ行きます。 ［Bundle Blacklist］画面が表示されます。

1. ［Bundle Blacklist］画面で、アンインストールするLPKGファイル、[モジュール](https://help.liferay.com/hc/articles/360035467532-OSGi-and-Modularity#modules)JAR、またはWARのバンドルシンボリック名を追加します。 各項目について、追加ボタン（![Add](../../../images/icon-add.png)）をクリックし、項目のバンドルシンボル名（ [下の表](#blacklist-bundle-symbolic-names)を参照）を入力します。 完了したら、_［保存］_ボタンをクリックします。 DXPはブラックリストに登録された項目をすぐにアンインストールします。
   
   ![このブラックリストは、classic-theme プラグイン WAR、Liferayコラボレーション - Liferay Blogs - API モジュール、および com.acme.greeter モジュールをアンインストールするものです。](./blacklisting-apps/images/02.png)



### 構成ファイルによるブラックリスト登録

ブラックリストは、コントロールパネルからOSGi構成（`.config`）ファイルにエクスポートすることもできます。 ファイルを変更してDXPにデプロイすると、次のような追加の効果があります。

* DXPサーバーの起動時の変更を保持します
* ローカルクラスターノードから他のすべてのノードに変更を伝播します。

次の手順に従って、構成ファイルを使用してブラックリストに登録します。

1. 現在使用中のブラックリストをエクスポートするには、そのアクションボタン（![操作](./blacklisting-apps/images/03.png)）から_［エクスポート］_ をクリックします。 ブラックリスト構成ファイルがダウンロードされます（`com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config`）。 次に、サンプルのブラックリストをエクスポートしたときのファイルの内容を示します。 
   
   

    ```properties
    blacklistBundleSymbolicNames=[ \
      "classic-theme", \
      "Liferay\ Collaboration\ -\ Liferay\ Blogs\ -\ API", \
      "com.acme.greeter", \
    ]
    ```


1. アンインストールして以降のDXPサーバーの起動時にインストールしないようにする、リストにまだないアプリ、モジュール、またはプラグインのバンドルシンボリック名を追加します。 
   
   

    ```{warning}
    構成値に余分なスペースを含めることはできません。 余分なスペースがあると、リストが短絡したり、構成エントリが無効になったりする可能性があります。
    ```


1. 構成ファイルをデプロイするには、フォルダ`[Liferay Home]/osgi/configs`にコピーします。 [Liferay Home](../../../installation-and-upgrades/reference/liferay-home.md)フォルダは通常、アプリケーションサーバーの親フォルダです。



### バンドルシンボリック名をブラックリストに追加

| タイプ           | バンドルのシンボリック名                                                                                          |
|:------------- |:----------------------------------------------------------------------------------------------------- |
| アプリ           | [App Manager](./using-the-app-manager.md)に表示されるアプリ名                                                   |
| LPKG          | 拡張子`.lpkg`なしのLPKGファイル名                                                                                |
| モジュール/バンドルJAR | `bnd.bnd`または`MANIFEST.MF`ファイルの`Bundle-SymbolicName`                                                   |
| WAR           | `liferay-plugin-package.properties`ファイル内のサーブレットコンテクスト名、またはサーブレットコンテクスト名プロパティがない場合はWARファイル名（`.war`を削除） |




## ブラックリスト登録されているアイテムの再インストール

ブラックリストに登録されたアイテムを再インストールするには、次の手順に従います。

1. 構成ファイル`com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config`を開きます。

1. LPKG、モジュールJAR、またはWARのシンボリック名を`blacklistBundleSymbolicNames`リストから削除し、ファイルを保存します。

ブラックリスト登録されている_すべての_アイテムを再インストールするには、次のいずれかのオプションを実行します。

* 構成ファイルを削除します。
* [アプリケーションマネージャー](./using-the-app-manager.md)または[Felix Gogo シェル](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)を使用して、モジュール`com.liferay.portal.bundle.blacklist`をアンインストールします。



```{tip}
ブラックリストに登録されているアイテムを一時的に再インストールするには、[*システム設定*]のバンドルブラックリストモジュールからそのシンボリック名を削除し、[*アップデート*]ボタンをクリックします。 ブラックリストの構成ファイル（``[Liferay Home]/osgi/configs``フォルダ内）を使用していて、その後のサーバー起動時にアイテムをインストールする場合は、アイテムのシンボリック名をファイルから忘れずに削除してください。
```


ログには、各アイテムのインストールが記録されます。

　 簡単なリストを使用して、複数のアプリ、モジュール、プラグインのインストールを管理できるようになりました。



## 追加情報

* [アプリケーションマネージャーの使用](./using-the-app-manager.md)
* [Felix Gogoシェルの使用](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)
* [OSGiコンポーネントのブラックリスト登録](./blacklisting-osgi-components.md)
* [ポートレット、テーマ、およびレイアウトテンプレートの構成](./configuring-portlets-themes-and-layout-templates.md)