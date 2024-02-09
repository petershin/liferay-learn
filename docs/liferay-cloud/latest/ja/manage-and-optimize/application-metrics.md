# アプリケーションメトリクス

Liferay Cloudに組み込まれたモニタリング機能により、各環境サービスが使用しているリソースを把握することができます。 これらのアプリケーションメトリクスには、メモリとCPUの使用量、およびネットワークデータ転送量が含まれます。 メトリクスは、デフォルトの Liferay Cloud スタックサービスで利用可能です。Webserver、Liferay、Search、Database、Backupです。

## サービスポップオーバー

Liferay Cloud 環境の **Overview** と **Services** ページ、および個々のサービスページなど、いくつかのページからサービスの現在のリソース使用量を素早く確認できます。 サービスのアイコンにカーソルを合わせると、そのサービスのリソース使用状況のポップオーバーが表示されます。

![サービスのアイコンにカーソルを合わせます。](./application-metrics/images/01.png)

## 拡張アプリケーションメトリクス

ユーザーは、 ［**モニタリング**］ ページから拡張サービスメトリクスを表示できます：

1. 環境メニューの ［**モニタリング**］ をクリックします。
1. ドロップダウンメニューを使って、モニターしたいサービスと時間帯を選択します。

![Liferay Cloudを使用して、サービスを監視することができます。](./application-metrics/images/02.png)

ユーザーは、 ［**Services**］ ページから拡張サービスメトリクスを表示できます：

1. 環境メニューの ［**サービス**］ をクリックします。

1. モニターしたい ［**Service**］ をクリックします。

1. ［**メトリクス**］ タブをクリックします。

![サービスのページからメトリクスを表示します。](./application-metrics/images/03.png)

## サービスに割り当てられるリソースの決定

サービスの `LCP.json` ファイルの設定により、そのサービスに割り当てられたメモリとCPUの合計が決定され、アプリケーションのメトリクスには、これらのリソースの使用状況が時系列で表示されます。

以下は `liferay` サービスの `LCP.json` ファイルにおけるCPUとMemoryの割り当ての例です：

```
"id": "liferay",

"memory": 8192,
"cpu": 8
```

ユーザーは、Liferay Cloud コンソールから割り当てられたリソースを確認することができます。

![Liferay Cloudのコンソールから、環境サービスに割り当てられたリソースを確認できます。](./application-metrics/images/04.png)

## 高度なアプリケーションメトリクス（本番環境のみ）

Liferay Cloudでは、 [Dynatraceの](https://www.dynatrace.com/) 高度なパフォーマンス監視を本番環境と統合することができます。

詳しくは、 [Dynatrace limitations](../reference/platform-limitations.md#dynatrace) を参照してください。

### Dynatraceと本番環境の統合

以下の手順でDynatraceを統合します：

1. Dynatraceのアカウントを作成します。

1. `トークン` および `テナント` 値を生成します。

1. Liferayサービスに、Dynatrace`token`値を[Secret](../tuning-security-settings/managing-secure-environment-variables-with-secrets.md)として追加します。

1. Liferayサービスの本番環境の`LCP.json`ファイルにDynatrace`テナント` Dynatrace環境変数を追加します。 以下に例を示します。

```json
{
    "environments": {
      "prd": {
        "env": {
          "LCP_PROJECT_MONITOR_DYNATRACE_TENANT": "tot02934"
        }
      }
    }
}
```

| 名前 | Description |
|:-- |:----------- |
|    |             |


`LCP_PROJECT_MONITOR_DYNATRACE_TENANT` | Dynatrace SaaSアカウントのURL（敬称）の一部である文字列です。 | `LCP_PROJECT_MONITOR_DYNATRACE_TOKEN` | Dynatraceアカウントにある文字列です。 トークンを取得するには、 ［**Manage**］ &rarr; ［**Deploy Dynatrace**］ &rarr; ［**Set up PaaS Integration**］ にナビゲートします。次に環境IDを入力し、 ［**Generate new token**］ をクリックします。 |

これらの値の詳細については、 [official Dynatrace documentation](https://www.dynatrace.com/support/help/dynatrace-api/basics/dynatrace-api-authentication/) を参照してください。

### Dynatraceへのアクセス

Liferay Cloudのコンソールから、Dynatraceの高度なパフォーマンス監視にアクセスできるようになりました。

1. 本番環境に移動します。

1. 環境メニューの ［**モニタリング**］ をクリックします。

1. ［**Advanced**］ タブをクリックします。

1. [**Go to Dynatrace Dashboard**] ボタンをクリックして、 [Dynatrace] ダッシュボードにアクセスします。

    ![Liferay Cloud ConsoleからDynatraceダッシュボードにアクセスします。](./application-metrics/images/05.png)

Dynatraceの認証情報でログインすると、ログの軌跡を確認したり、カスタムダッシュボードを作成したりできます。

## 関連トピック

* [Liferay DXPサービスの使用](../customizing-liferay-dxp-in-the-cloud.md)
* [リアルタイムアラート](./real-time-alerts.md)
* [割り当て](./quotas.md)
