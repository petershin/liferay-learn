# Liferay Commerceエンタープライズの有効化

Liferay DXP/Portal 7.3から、CommerceはすべてのLiferayバンドルとDockerコンテナに同梱されているため、別途インストールする必要はありません。 ただし、Commerceのエンタープライズ機能にアクセスして利用するためには、実行するDXPのバージョンによって手順が異なります。 Liferay DXP 7.4 GA1では、すべてのCommerceモジュールがデフォルトで有効になっており、すぐに使用できます。 DXP 7.3 FP3/SP2以降では、Commerceは [ポータルプロパティ](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/portal-properties.html) を使用して有効化されますが、それ以前のバージョンではCommerceライセンスファイルが使用されます。 このプロパティは、Liferay Portalのバンドル/画像にはエンタープライズ機能が含まれていないため、影響を与えません。

```{important}
Liferay 7.4 U48+/GA48+ では、Commerce モジュールを無効にするためのポータルのプロパティ (`enterprise.product.commerce.enabled`) が削除されました。 DXP 7.4の有効なサブスクリプションをお持ちのすべてのお客様に、コマース機能が提供され、サポートされるようになりました。 Commerce を無効にすると、他の Liferay DXP モジュールとの間で不整合が発生することがあります。
```

## Liferay DXP 7.4 GA1以降のLiferay Commerceエンタープライズの無効化

{bdg-primary}`Liferay DXP サブスクリプションが必要です`

Liferay DXP 7.4 GA1では、すべてのCommerceモジュールがデフォルトで有効になっています。 ユーザーは、 `enterprise.product.commerce.enabled`ポータルプロパティを`false`に設定することで、これらを無効にすることができます。

### LiferayバンドルのCommerceの無効化

Liferayバンドルを使用している場合、`portal-ext.properties`ファイルを使用して`enterprise.product.commerce.enabled`プロパティを構成することができます。 構成するには、Liferayサーバーの`portal-ext.properties` ファイルに以下のプロパティを追加するだけです。

```properties
enterprise.product.commerce.enabled=false
```

プロパティを追加したら、Liferayサーバーを再起動して変更を適用します。

`portal-ext.properties`ファイルが存在しない場合は、 `[LIFERAY_HOME]`または`[USER_HOME]`に作成してください。

```{note}
バンドルにセットアップウィザードを使用した場合、ポータルプロパティは`[LIFERAY_HOME]`フォルダの中の`portal-setup-wizard.properties` にあります。 このファイルは `portal-ext.properties` ファイルよりも優先されるので、`enterprise.product.commerce.enabled` プロパティの値が競合していないことを確認してください。 詳しくは [ポータルプロパティ](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/portal-properties.html) を参照してください。
```

### DockerコンテナのCommerceの無効化

Dockerコンテナ上では、`enterprise.product.commerce.enabled`プロパティを`portal-ext.properties`ファイル、またはDockerの `env`変数で設定することができます。

`portal-ext.properties`ファイルには、このプロパティを追加します。

```properties
enterprise.product.commerce.enabled=false
```

または、このDockerの`env`変数を使用します。

```properties
LIFERAY_ENTERPRISE_PERIOD_PRODUCT_PERIOD_COMMERCE_PERIOD_ENABLED=false
```

詳しくは、 [コンテナの設定](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.html#portal-properties) を参照してください。

正しく行われると、グローバルメニューにCommerceモジュールが表示されなくなります（![Global Menu](../images/icon-applications-menu.png)）。

## Liferay DXP 7.3 FP3/SP3+用のLiferay Commerceエンタープライズの有効化

{bdg-primary}`Liferay DXPとCommerceのサブスクリプションが必要`

DXP 7.3 FP3/SP2+では、`enterprise.product.commerce.enabled`ポータルプロパティを`true`に設定して、Commerceを有効にします。

### LiferayバンドルのCommerceの有効化

`portal-ext.properties`ファイルを使用して`enterprise.product.commerce.enabled`プロパティを構成することができます。 Liferayサーバーの`portal-ext.properties`ファイルに以下のプロパティを追加してください。

```properties
enterprise.product.commerce.enabled=true
```

プロパティを追加したら、Liferayサーバーを再起動して変更を適用します。

`portal-ext.properties`ファイルが存在しない場合は、 `[LIFERAY_HOME]`または`[USER_HOME]`に作成してください。

### DockerコンテナのCommerceの有効化

Dockerコンテナを使用している場合、`enterprise.product.commerce.enabled`プロパティは`portal-ext.properties`ファイルを使用して構成するか、Dockerの`env`変数を使用してオーバーライドすることができます。

`portal-ext.properties`ファイルを使用するには、以下のプロパティを新しい行に追加するだけです。

```properties
enterprise.product.commerce.enabled=true
```

ポータルプロパティをオーバーライドするには、以下のDocker `env` 変数を使用します。

```properties
LIFERAY_ENTERPRISE_PERIOD_PRODUCT_PERIOD_COMMERCE_PERIOD_ENABLED=true
```

### 有効化の完了確認

プロパティが正常に追加されたことを確認するために、Liferay DXP を起動し、グローバルメニュー (![Global Menu](../images/icon-applications-menu.png)) を開いてください。 正常に追加されていれば、［ Commerce］タブでCommerceモジュールを表示し、アクセスできます。 または、 **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **サーバー管理** &rarr; **プロパティ** &rarr; **ポータルプロパティ** を開く。 新しいプロパティは、他のプロパティと一緒に表示されます。

## Liferay DXP 7.1-7.3 FP2用のLiferay Commerceエンタープライズの有効化

{bdg-primary}`Liferay DXPとCommerceのサブスクリプションが必要`

Liferay DXP 7.1-7.3 FP2の場合、Commerceを使用するには有効なライセンスが必要です。 このライセンスは、XML (`.xml`) アクティベーションキーとして提供され、Commerceモジュールを有効にするためには、Liferayサーバーにデプロイする必要があります。

Commerceライセンスには `product-version`、 `license-type`、そして`expiration-date`を含むDXPライセンスと同じパラメータが多く使用されています。 ただし、システムリソース（プロセッサコア数など）やプラグインのバージョンによる制限は、Commerceライセンスには実装されていません。

```{important}
DXPとCommerceのアクティベーションキーは，両方とも同じ`license-type`（例：`production`，`developer`，`enterprise`）でなければなりません。 アクティベーションキータイプが一致しない場合は、サーバーの起動ログに警告が出力されます。 

*本番環境*ライセンスでは、入力値の検証のためにホスト名、IPアドレス、MACアドレスのいずれかが一致する必要があります。
```

* [Commerceのアクティベーションキーの入手](#obtaining-commerce-activation-keys)
* [Commerceのアクティベーションキーのデプロイ](#deploying-commerce-activation-keys)
* [期限切れのCommerceエンタープライズライセンスの更新](#updating-an-expired-commerce-enterprise-license)

### Commerceのアクティベーションキーの入手

Commerceサブスクリプションが [購入済](https://www.liferay.com/contact-sales) の場合は、以下のいずれかの方法でアクティベーションキーをダウンロードして入手できます。

* [ヘルプセンター](https://liferay-support.zendesk.com/agent/) チケットを **アクティベーションキー/Project Administration** コンポーネントを使って開きます。

* 各地域のプロビジョニングチーム（例：provisioning-[region]@liferay.com）にメールでリクエストを送信してください。

* Commerceのアクティベーションキーは、 [こちら](https://customer.liferay.com/en_US/activation-key) からダウンロードできます。

### Commerceのアクティベーションキーのデプロイ

XMLアクティベーションキーを取得したら、それをDXPインスタンスの`デプロイ`フォルダにコピーすることで、Commerceのエンタープライズを有効にできます。 このプロセスは、Liferay DXPを有効化するのと同じです。

```{note}
Liferay 7.3 SP1では、Commerceを有効にした後、ユーザーはインスタンスのインデックスを再作成する必要がなくなりました。
```

#### DXP Bundlesへのデプロイ

XMLファイルをDXPインスタンスの [Liferay Home](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/liferay-home.html) フォルダにコピーしてください。 アクティベーションキーの処理中、Liferayはこのファイルを `${liferay.home}/osgi/modules`フォルダに移動させ、ライセンスファイル(`.li`）`${liferay.home}/data/license`フォルダに生成します。 詳しくは、 [Liferay DXPのアクティブ化](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/setting-up-liferay/activating-liferay-dxp.html) をご覧ください。

#### Dockerコンテナへのデプロイ

XMLファイルをコンテナの`/opt/liferay/deploy`フォルダにコピーします。 アクティベーションキーの処理中、Liferayはこのファイルを `opt/liferay/osgi/modules`フォルダに移動させ、ライセンスファイル(`.li`を`opt/liferay/data/license`フォルダに生成します。 Dockerコンテナへのファイルのデプロイについては、 [Providing Files to a Container](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/installing-liferay/using-liferay-docker-images/providing-files-to-the-container.html?highlight=opt) を参照してください。

#### Liferay Cloudへのデプロイ

プロジェクトのセントラルGitリポジトリ内の [Liferayサービスへのデプロイ](https://learn.liferay.com/liferay-cloud/latest/ja/using-the-liferay-dxp-service/deploying-to-the-liferay-service.html#deploying-licenses) フォルダにキーをコピーし、変更をコミットします。 次に、LiferayサービスのJenkinsビルドを起動し、目的のプロジェクト環境にデプロイします。 環境の Liferay サービスへのファイルのデプロイについては、 [Liferay Cloud 導入ワークフローの概要](https://learn.liferay.com/liferay-cloud/latest/ja/build-and-deploy/overview-of-the-liferay-cloud-deployment-workflow.html) を参照してください。

```{important}
Liferay Cloudの契約でCommerceを購入した場合、アクティベーションキーはLiferay Cloudチームがクラウド基盤を通じて管理するため、お客様自身で管理する必要はありません。 ただし、既存のLiferay CloudプロジェクトにCommerceを追加する場合は、ライセンスを自分で手動でデプロイする必要があります。
```

#### デプロイの確認

キーが正常にデプロイされたことをコンソールで確認します。

   ```bash
   INFO  [com.liferay.portal.kernel.deploy.auto.AutoDeployScanner][AutoDeployDir:271] Processing activation-key-commercesubscriptiondevelopment-1-developeractivationkeys.xml
   ...
   INFO  [fileinstall-directory-watcher][LicenseManager:?] Commerce Subscription Development license validation passed
   INFO  [fileinstall-directory-watcher][LicenseManager:?] License registered for Commerce Subscription Development
   ```

### 期限切れのCommerceエンタープライズライセンスの更新

Commerceエンタープライズのライセンスは、ユーザーのサブスクリプションの条件に基づいて、一定期間のみ有効となります。 ライセンスの有効期限が近づくと（例： < ほとんどのライセンスで30日、 < 30日ライセンスで7日）、管理者向けのCommerceアプリケーションに警告メッセージが表示されます。 ライセンスは、与えられた有効期限の後、2日間の猶予期間を経て失効します。

ライセンスの有効期限が切れた場合、Commerceモジュールは有効なままですが、ライセンスが更新されるまでUIでの使用やAPIの呼び出しはできなくなります。 すべてのユーザーのCommerceアプリケーションに、Commerceアプリケーションが使用できないことを示す通知が表示されます。 管理者はライセンスの更新を、その他のユーザーは管理者への問い合わせを求められます。

また、サーバーの再起動時に、コンソールにエラーメッセージが表示されます：

   ```bash
   ERROR [main][LicenseManager:?] Liferay Commerce license is expired
   ```

Liferay Commerce Enterprise を再アクティブ化するには、まずサーバーから期限切れのファイルを削除し、 [deploy](#deploying-commerce-activation-keys) 、新しいキーを使用します。

   ```{tip}
   アクティベーションキーの削除や追加は、サーバーの稼動中に行うことができます。
   ```

#### DXPバンドルの更新

期限切れのXMLキーを`{liferay.home}/osgi/modules`フォルダから削除し、期限切れのライセンスファイルは`${liferay.home}/data/license`フォルダから削除します。 次に、新しいアクティベーションキーを `${liferay.home}/deploy`フォルダに追加します。

#### Dockerコンテナの更新

期限切れのXMLキーを`opt/liferay/osgi/modules`フォルダから削除し、期限切れのライセンスファイルは `opt/liferay/data/licenses`フォルダから削除します。 次に、新しいアクティベーションキーを、コンテナ内の `/opt/liferay/deploy`フォルダに追加します。

#### Liferay Cloud プロジェクトで Liferay サービスを更新する

DXPとCommerceのライセンスはLiferay Cloudチームが管理しており、ユーザーが自分で手動で更新する必要はありません。

## 追加情報

* [インストールの概要](./installation-overview.md)
* [Liferay Commerceのアップグレード](./upgrading-liferay-commerce.md)
* [プロキシサーバーを介したMarketplaceアプリの有効化](https://help.liferay.com/hc/ja/articles/360018427391)
