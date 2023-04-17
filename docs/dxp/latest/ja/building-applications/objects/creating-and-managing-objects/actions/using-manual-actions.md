# マニュアルアクションの使用

{bdg-secondary}`利用可能 Liferay 7.4 U60+/GA60+`

オブジェクトアクションにスタンドアローントリガーを使用すると、アクションは自動ではなく手動になります。 これらのアクションを引き起こすには、次のいずれかを使用します。

* オブジェクトのUI
* 専用アクションAPI

この例では、通知を送信するためのスタンドアロンアクションを作成します。

![スタンドアローントリガーを使って、あらゆるタイプのオブジェクトアクションを手動で実行することができます。](./using-manual-actions/images/01.png)

オブジェクト定義にスタンドアロンアクションを追加する方法については、 [オブジェクトアクションの定義](./defining-object-actions.md) を参照してください。

## UIによるアクションのトリガー

アクティブなスタンドアロンアクションは、オブジェクトエントリーの「アクション」メニューに表示されます。 UIでこれらのアクションを起こすには

1. オブジェクト定義のアプリケーションページに移動します。

1. 目的のエントリーの「 *アクション」* ボタン (![Action Button](../../../../images/icon-actions.png)) をクリックし、スタンドアロンアクションを選択します。

   この例では、アクションは「リマインダーを送信」です。

   ![目的のエントリーの［アクション］ボタンをクリックし、スタンドアロン・アクションを選択します。](./using-manual-actions/images/02.png)

## APIによるトリガーアクション

Liferayは公開されたオブジェクト定義に対してREST APIを自動生成します。 これらには、アクティブなスタンドアローンアクションのためのAPIが含まれています。

これらのAPIを表示するには

1. Liferay の API Explorer を `[server]:[port]/o/api` で開きます(例: `localhost:8080/o/api`）。

1. *REST Applications* をクリックし、目的のオブジェクト定義を選択します。 カスタムオブジェクトは、 `c/[pluralobjectlabel]` の命名パターンを使用します(例： `c/tickets`）。

各スタンドアローンアクションに対して、Liferayは2つのPUT APIを生成します：1つはエントリーのIDを使用し、もう1つはエントリーの外部参照コード(ERC）を使用します。

![Liferayは、エントリーのIDを使用するものと、エントリーのERCを使用するものの2つのPUT APIを生成します。](./using-manual-actions/images/03.png)

いずれかのAPIを呼び出すと、指定されたエントリーのアクションがトリガーされます。

![APIを呼び出すと、指定されたエントリーのアクションがトリガーされます。](./using-manual-actions/images/04.png)

## アクションパーミッション

Liferayは、どのロールがスタンドアロンアクションをトリガーできるかを管理するためのパーミッションを自動的に生成します。 各許可は、 `action.[actionName]` の命名パターンに従う(例： `action.sendReminder`)。 オブジェクトのパーミッションについては、 [Permissions Framework Integration](../../understanding-object-integrations/permissions-framework-integration.md) を参照してください。

![スタンドアロンパーミッションは、アクションを使用します。[actionName] ネーミングパターンを使用します。](./using-manual-actions/images/05.png)

## 追加情報

* [オブジェクトアクションの定義](./defining-object-actions.md)
* [アクションの種類について](./understanding-action-types.md)
* [ヘッドレスフレームワークの統合](../../understanding-object-integrations/headless-framework-integration.md)
