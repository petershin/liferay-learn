# Liferay Commerceエンタープライズの有効化

Liferay DXP/Portal 7.3から、CommerceはすべてのLiferayバンドルとDockerコンテナに同梱され、別途インストールする必要はありません。 ただし、Commerceのエンタープライズ機能にアクセスする手順は、使用しているDXPのバージョンによって異なります。 Liferay DXP 7.4 GA1では、すべてのCommerceモジュールがデフォルトで有効になっており、すぐに使用できます。 DXP 7.3 SP3+ では、Commerce は [ポータルプロパティ](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/portal-properties.html) を使用してアクティブ化されますが、それ以前のバージョンでは Commerce ライセンスファイルを使用します。 このプロパティは、Liferay Portalのバンドル/画像にはエンタープライズ機能が含まれていないため、影響を与えません。

```{important}
Liferay 7.4 U48+/GA48+では、コマースモジュールを無効にするためのポータルのプロパティ (`enterprise.product.commerce.enabled`) が削除されました。 有効なDXP 7.4サブスクリプションをお持ちのすべてのお客様に、コマース機能が提供され、サポートされるようになりました。 コマースを無効にすると、他のLiferay DXPモジュールとの間で不整合が発生することがあります。
```

## Liferay DXP 7.4 GA1以降のLiferay Commerceエンタープライズの無効化

{bdg-primary}Liferay DXP サブスクリプションが必要です。

Liferay DXP 7.4 GA1では、すべてのCommerceモジュールがデフォルトで有効になっています。 ユーザーは、`enterprise.product.commerce.enabled` ポータル・プロパティを `false` に設定することで、この機能を無効にすることができます。

### LiferayバンドルのCommerceの無効化

Liferayバンドルを使用している場合、`portal-ext.properties`ファイルを使用して`enterprise.product.commerce.enabled`プロパティを設定することができます。 Liferayサーバーの`portal-ext.properties`ファイルに以下のプロパティを追加するだけです。

```properties
enterprise.product.commerce.enabled=false
```

プロパティを追加したら、Liferayサーバーを再起動して変更を適用します。

portal-ext.properties`ファイルがまだ存在しない場合は、`[Liferay Home]`または`[User Home]`フォルダに作成してください。

```{note}
バンドルにセットアップウィザードを使った場合、ポータルのプロパティは ` [Liferay Home]` フォルダにある `portal-setup-wizard.properties` ファイルを使って設定します。 このファイルは `portal-ext.properties` ファイルよりも優先されるので、`enterprise.product.commerce.enabled` プロパティの値が競合していないことを確認してください。 詳しくは [ポータルプロパティ](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/portal-properties.html) ]を参照してください。
```

### DockerコンテナのCommerceの無効化

Docker コンテナでは、`portal-ext.properties` ファイルまたは Docker `env` 変数を使用して `enterprise.product.commerce.enabled` プロパティを設定できます。

portal-ext.properties`ファイルに次のプロパティを追加する：

```properties
enterprise.product.commerce.enabled=false
```

または、このDocker `env` 変数を使う：

```properties
LIFERAY_ENTERPRISE_PERIOD_PRODUCT_PERIOD_COMMERCE_PERIOD_ENABLED=false
```

詳しくは、 [コンテナの設定](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.html#portal-properties) を参照してください。

成功すると、コマースモジュールはグローバルメニューに表示されなくなります (![グローバルメニュー](../images/icon-applications-menu.png))。

## Liferay DXP 7.3 SP3+ 用の Liferay Commerce Enterprise のアクティベーション

{bdg-primary}Liferay DXPとCommerceのサブスクリプションが必要です。

DXP 7.3 SP3+ では、`enterprise.product.commerce.enabled` ポータル・プロパティを `true` に設定して Commerce を有効にします。

### LiferayバンドルのCommerceの有効化

`portal-ext.properties`ファイルを使用して、`enterprise.product.commerce.enabled`プロパティを設定することができます。 このプロパティをLiferayサーバーの`portal-ext.properties`ファイルに追加します：

```properties
enterprise.product.commerce.enabled=true
```

プロパティを追加したら、Liferayサーバーを再起動して変更を適用します。

`portal-ext.properties`ファイルがまだ存在しない場合は、`[Liferay Home]`または`[User Home]`フォルダに作成してください。

### DockerコンテナのCommerceの有効化

Dockerコンテナを使用している場合、`enterprise.product.commerce.enabled`プロパティは、`portal-ext.properties`ファイルを使用して設定するか、Dockerの`env`変数を使用してオーバーライドすることができます。

`portal-ext.properties`ファイルを使用するには、次のプロパティを新しい行に追加するだけでよい：

```properties
enterprise.product.commerce.enabled=true
```

ポータル・プロパティをオーバーライドするには、以下のDocker `env` 変数を使用する：

```properties
LIFERAY_ENTERPRISE_PERIOD_PRODUCT_PERIOD_COMMERCE_PERIOD_ENABLED=true
```

### 有効化の完了確認

プロパティが正常に追加されたことを確認するには、Liferay DXP を起動し、 **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開きます。 正常に追加されていれば、［コマース］タブでコマースモジュールを表示し、アクセスできます。 または、 **グローバル・メニュー**( [グローバル・メニュー](../images/icon-applications-menu.png) )を開き、 **コントロール・パネル** &rarr; **サーバー管理** &rarr; **プロパティ** &rarr; **ポータル・プロパティ** に進みます。 新しいプロパティは、他のプロパティと一緒に表示されます。

## Liferay DXP 7.1-7.3 FP2用のLiferay Commerceエンタープライズの有効化

{bdg-primary}`Liferay DXPとCommerceのサブスクリプションが必要です。`

Liferay DXP 7.1-7.3 FP2の場合、Commerceを使用するには有効なライセンスが必要です。 このライセンスはXML (`.xml`) アクティベーションキーとして提供され、コマースモジュールを有効にするにはLiferayサーバーにデプロイする必要があります。

コマースライセンスはDXPライセンスと同じパラメータを使用し、`product-version`、`license-type`、`expiration-date`などがあります。 ただし、システムリソース（プロセッサコア数など）やプラグインのバージョンによる制限は、Commerceライセンスには実装されていません。

```{important}
DXPとCommerceのアクティベーションキーは、両方とも同じ`license-type`（例：`production`，`developer`，`enterprise`）でなければなりません。 アクティベーションキータイプが一致しない場合は、サーバーの起動ログに警告が出力されます。

また、プロダクション・ライセンスの検証には、一致するホスト名、IPアドレス、またはmacアドレスが必要です。
```

* [コマース・アクティベーション・キーの入手](#obtaining-commerce-activation-keys)
* [コマース・アクティベーション・キーの展開](#deploying-commerce-activation-keys)
* [期限切れの Commerce Enterprise ライセンスの更新](#updating-an-expired-commerce-enterprise-license)

### Commerceのアクティベーションキーの入手

Commerceサブスクリプションが [購入済](https://www.liferay.com/contact-sales) の場合は、以下のいずれかの方法でアクティベーションキーをダウンロードして入手できます。

* アクティベーション・キー/プロジェクト管理コンポーネントを使用して、 [ヘルプセンター](https://liferay-support.zendesk.com/agent/) チケットを開きます。

* 各地域のプロビジョニングチーム（例：provisioning-[region]@liferay.com）にメールでリクエストを送信してください。

* Commerceのアクティベーションキーは、 [こちら](https://customer.liferay.com/en_US/activation-key) からダウンロードできます。

### Commerceのアクティベーションキーのデプロイ

XML アクティベーションキーを取得したら、DXP インスタンスの `deploy` フォルダにコピーして Commerce Enterprise をアクティベートできます。 このプロセスは、Liferay DXPを有効化するのと同じです。

```{note}
Liferay 7.3 SP1では、コマースをアクティブ化した後にインスタンスのインデックスを再作成する必要がなくなりました。
```
#### DXP Bundlesへのデプロイ

XML ファイルを DXP インスタンスの [Liferay Home](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/liferay-home.html) フォルダにコピーします。 アクティベーションキーを処理する間、Liferay はこのファイルを `${liferay.home}/osgi/modules` フォルダに再配置し、ライセンスファイル (`.li`) を `${liferay.home}/data/license` フォルダに生成します。 詳しくは、 [Liferay DXPのアクティブ化](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/setting-up-liferay/activating-liferay-dxp.html) をご覧ください。

#### Dockerコンテナへのデプロイ

XML ファイルをコンテナの `/opt/liferay/deploy` フォルダにコピーする。 アクティベーションキーを処理する間、Liferay はこのファイルを `opt/liferay/osgi/modules` フォルダに再配置し、ライセンスファイル (`.li`) を `opt/liferay/data/license` フォルダに生成します。 Dockerコンテナへのファイルのデプロイについては、 [コンテナへのファイルの提供](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/installing-liferay/using-liferay-docker-images/providing-files-to-the-container.html?highlight=opt) を参照してください。

#### Liferay Cloudへのデプロイ

プロジェクトの中央 Git リポジトリの [Liferayサービスへのデプロイ](https://learn.liferay.com/liferay-cloud/latest/ja/using-the-liferay-dxp-service/deploying-to-the-liferay-service.html#deploying-licenses) フォルダにキーをコピーし、変更をコミットします。 次に、LiferayサービスのJenkinsビルドを起動し、目的のプロジェクト環境にデプロイします。 環境の Liferayサービスへのファイルのデプロイについては、 [Liferay Cloud 導入ワークフローの概要](https://learn.liferay.com/liferay-cloud/latest/ja/updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.html) を参照してください。

```{important}
Liferay Cloudの契約でCommerceを購入した場合、アクティベーションキーはLiferay Cloudチームがクラウドインフラストラクチャーを通じて管理するため、お客様自身で管理する必要はありません。 ただし、既存の Liferay Cloud プロジェクトに Commerce を追加する場合は、手動でライセンスをデプロイする必要があります。 
```

#### デプロイの確認

コンソールでキーが正常にデプロイされたことを確認します：

```bash
INFO  [com.liferay.portal.kernel.deploy.auto.AutoDeployScanner][AutoDeployDir:271] Processing activation-key-commercesubscriptiondevelopment-1-developeractivationkeys.xml
...
INFO  [fileinstall-directory-watcher][LicenseManager:?] Commerce Subscription Development license validation passed
INFO  [fileinstall-directory-watcher][LicenseManager:?] License registered for Commerce Subscription Development
```

### 期限切れのCommerceエンタープライズライセンスの更新

Commerceエンタープライズのライセンスは、ユーザーのサブスクリプションの条件に基づいて、一定期間のみ有効となります。 ライセンスの有効期限が近づくと（つまり、ほとんどのライセンスで30日未満、30日ライセンスで7日未満）、管理者向けのCommerceアプリケーションに警告メッセージが表示されます。 ライセンスは、与えられた有効期限の後、2日間の猶予期間を経て失効します。

ライセンスの有効期限が切れた場合、Commerceモジュールは有効なままですが、ライセンスが更新されるまでUIでの使用やAPIの呼び出しはできなくなります。 すべてのユーザーのCommerceアプリケーションに、Commerceアプリケーションが使用できないことを示す通知が表示されます。 管理者はライセンスの更新を、その他のユーザーは管理者への問い合わせを求められます。

また、サーバーの再起動時に、コンソールにエラーメッセージが表示されます：

```bash
ERROR [main][LicenseManager:?] Liferay Commerce license is expired
```

Liferay Commerce Enterprise を再有効化するには、まずサーバーから期限切れのファイルを削除し、 新しいキーを [デプロイ](#deploying-commerce-activation-keys) します。

   ```{tip}
   サーバーの実行中にアクティベーション・キーを削除したり追加したりすることができます。
   ```
#### DXPバンドルの更新

`${liferay.home}/osgi/modules` フォルダから期限切れの XML キーを削除し、`${liferay.home}/data/license`フォルダから期限切れのライセンスファイルを削除します。 次に、新しいアクティベーション・キーを`${liferay.home}/deploy` フォルダーに追加します。

#### Dockerコンテナの更新

`opt/liferay/osgi/modules` フォルダから期限切れの XML キーを、`opt/liferay/data/licenses`フォルダから期限切れのライセンスファイルを削除します。 次に、新しいアクティベーションキーをコンテナ内の`/opt/liferay/deploy` フォルダに追加します。

#### Liferay CloudプロジェクトでのLiferayサービスの更新

DXP と Commerce のライセンスは Liferay Cloud チームが管理しており、ユーザーが手動で更新する必要はありません。

## 関連トピック

* [インストールの概要](./installation-overview.md)
* [Liferay Commerce](./upgrading-liferay-commerce.md)のアップグレード
* [プロキシサーバー経由でのマーケットプレイスアプリの有効化](https://help.liferay.com/hc/ja/articles/360018427391)
