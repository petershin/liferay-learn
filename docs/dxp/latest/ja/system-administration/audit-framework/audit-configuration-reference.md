# 監査設定リファレンス

監査に関する構成設定は、システム・スコープで利用できる。 これらの設定は、 *グローバルメニュー* (![Global Menu](../../images/icon-applications-menu.png)) を開き、 *コントロールパネル* &rarr; *システム設定* &rarr; *監査*に移動することで見つけることができます。

## 監査

![インスタンスの監査ロギングを完全に有効または無効にします。](./audit-configuration-reference/images/01.png)

このチェックボックスを使用して、Liferayインスタンスの監査を完全に有効または無効にします。 監査が有効になっている場合、 *Audit Message Maximum Queue Size* フィールドをデフォルト値から調整できることに注意してください。

## CSVログメッセージフォーマッタ

![エクスポートされるCSVファイルの列数を制御します。](./audit-configuration-reference/images/02.png)

これを使用して、監査イベントのCSVエクスポートに存在する列を定義します。 なお、新しい列を追加することはできない。 現在あるものを削除するか、削除後に追加することしかできない。

## Logging Message Audit Message プロセッサ

![Liferay DXP のログとコンソールへのイベントのロギングを有効にします。](./audit-configuration-reference/images/03.png)

以下の手順に従って、Liferay DXP のログとコンソールでログイベントのレポートを設定します：

1. *Enabled* チェックボックスを選択すると、Liferay DXP のログに監査イベントが報告されます。

1. コンソールで監査イベントを報告するには、 *Output to Console* チェックボックスを選択します。

1. *ログメッセージ形式* ドロップダウンで、監査イベントの形式（CSV または JSON）を選択します。

1. *［保存］*をクリックします。

## Persistent Message Audit Message プロセッサー

![監査ログをデータベースに書き込むには、この設定を有効にする。](./audit-configuration-reference/images/04.png)

監査メッセージをデータベースに書き込むには、この設定を有効にする。 このインターフェースは、データベースからのデータを使って監査メッセージを表示する。 無効にするとインターフェイスが空になる。

## 監査ログのコンテキスト

![Log4Jのログに監査情報を追加する。](./audit-configuration-reference/images/05.png)

Log4Jが書き込むログメッセージに、JSON形式で監査情報を追加する。 これを有効にし、XMLファイルを介してLog4Jロギングを設定する必要があります。

*Use Incoming X-Request-ID*を有効にすると、クライアントは `X-Request-ID` ヘッダーを送ることができ、Liferayはすべてのログ文にこの値でタグを付けます。 これにより、複数のシステムを経由した特定のリクエストのトレースが可能になる。

## スケジュールされたジョブの監査イベントの設定

デフォルトでは、Liferayのスケジュールされたジョブは監査イベントをトリガーしません。 デフォルト値を変更するには、

1. *グローバルメニュー* (![Global Menu](../../images/icon-applications-menu.png)) を開き、 *［コントロールパネル］* &rarr; *［システム設定］*に移動します。

1. *Platform* セクションから *Infrastructure* を選択する。

1. 左側の *System Scope* の下で、 *Scheduler Engine Helper*を選択する。

1. *Audit Scheduler Job Enabled*のチェックボックスを有効にします。

1. *［Save］* をクリックします。

## 関連トピック

* [監査イベントの検索とエクスポート](./searching-and-exporting-audit-events.md)
