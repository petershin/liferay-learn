---
toc:
  - ./implementing-business-logic/validating-fields.md
  - ./implementing-business-logic/managing-access-to-data.md
  - ./implementing-business-logic/defining-a-state-field.md
  - ./implementing-business-logic/adding-an-approval-workflow.md
  - ./implementing-business-logic/adding-notification-templates.md
  - ./implementing-business-logic/adding-notification-actions.md
  - ./implementing-business-logic/automating-account-creation.md
---
# ビジネスロジックの実装

ビジネスロジックとは、ビジネスニーズを満たすためにアプリケーションがシステム内でどのように動作するかを決定するルールとプロセスを指す。 ビジネスロジックを効果的に実装することで、業務を合理化し、効率を向上させ、組織全体の一貫性を促進することができます。

例を挙げよう、

* [フィールドの検証](#validations)
* [データアクセスの管理](#permissions)
* [ワークフローの定義](#workflows)
* [通知の自動化](#notifications)


<!--TASK:
* Integrating with External Systems
* Calculations
* Data Transformation
* Localization
* Logging

Use cron...
-->

## 検証

バリデーションは、ユーザーの入力が基準を満たしていることを確認するためのルールを設定します。 入力時点でデータを検証することで、アプリケーションはデータが必要な形式、タイプ、制約を満たしていることを確認でき、データエラーを防ぎ、手作業によるデータのクリーンアップの必要性を減らすことができる。 このようにして、バリデーションは収集されたデータ（電子メールアドレスや電話番号など）の整合性と一貫性を向上させることができる。 ここでは、オブジェクト定義に直接バリデーションルールを追加します。 Liferayはこれらのルールを使って、エントリー送信時にフィールドの値をチェックします。 値が無効な場合、Liferayはエラーメッセージを表示します。

![Liferayはバリデーションルールを使って、入力送信時にフィールドの値をチェックします。](./implementing-business-logic/images/01.png)

## 権限設定

データへのアクセスを管理することは、データのプライバシーとセキュリティにとって不可欠である。 ロールパーミッションとアカウントメンバーシップを使用して、機密オブジェクトデータへのアクセスを制限できます。 これらの許可は、アプリケーションとエントリーのレベルで管理することができる。

![パーミッションとアカウントメンバーシップを使用して、オブジェクトデータへのアクセスを管理します。](./implementing-business-logic/images/02.png)

## ワークフロー

ワークフローは、アプリケーションエンティティの承認プロセスを定義し、タスクの可視性を向上させ、ビジネスプロセスのボトルネックを解消し、タスクを完了するために必要な時間とリソースを削減することができます。 カスタムオブジェクトのカスタム承認プロセスを構築し、有効にすることができます。 さらに、ピックリストを使用して、独自のフローを持つカスタム状態フィールドを定義できます。

![オブジェクトに状態フィールドを追加する。](./implementing-business-logic/images/03.png)

## お知らせ

通知は、オブジェクト入力イベントのリアルタイム更新をユーザーやシステム管理者に提供することで、アプリケーションの可視性を向上させることができます。 これは、通知テンプレートを作成し、それらのテンプレートをオブジェクトアクションで使用することを含む。 テンプレートは通知内容とデザインを提供し、オブジェクトアクションは通知を送るトリガーと条件（例えば、エントリー作成時、エントリー更新時）を決定する。

![通知テンプレートとオブジェクトアクションを使用して、エントリーイベントの通知を自動化します。](./implementing-business-logic/images/04.png)

## ディストリビューターアプリケーションフローのビジネスロジックの実装

ディストリビューター・アプリケーション・オブジェクトをモデリングしたら、このロジックを組み込んで、ソリューションがDelectable Bonsaiのビジネス要件を満たすようにします。 一度導入すれば、迅速かつ安全にディストリビューターを乗せることができる。

準備完了?

[続きはこちら](./implementing-business-logic/validating-fields.md)
