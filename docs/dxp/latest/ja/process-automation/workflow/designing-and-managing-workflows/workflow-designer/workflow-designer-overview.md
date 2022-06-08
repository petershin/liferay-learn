# ワークフローデザイナーの概要

{bdg-primary}`サブスクリプション`

ワークフローのワークフローデザイナーは、ワークフローのプロセス定義を作成するためのグラフィカルなインターフェイスです。 便利なドラッグアンドドロップのインターフェースにより、 [XML定義を手作業で書く](../../developer-guide/crafting-xml-workflow-definitions)よりも簡単にワークフローのデザインができます</0>。 ［コントロールパネル］&rarr; ［ワークフロー］&rarr;［ワークフロー］からアクセスできます。

![デザイナーのキャンバスにノードをドラッグアンドドロップします。](./workflow-designer-overview/images/01.png)

```{tip}
また、［ワークフロー］の［ソース］ビューからXML定義を書き込んだり、アップロードしたりすることもできます。 [新規ワークフロー定義のアップロード](../managing-workflows.md#uploading-a-new-workflow-definition)をご参照ください。
```

ワークフローデザイナーは、すべての[ワークフローノード](./workflow-nodes.md)タイプをサポートしています。

* [開始ノードと終了ノード](./workflow-nodes.md#start-and-end-nodes)
* [フォークノードと結合ノード](./using-forks-and-joins.md)
* [条件ノード](./using-condition-nodes.md)
* [ステータスノード](./workflow-nodes.md#state-nodes)
* [タスクノード](./creating-workflow-tasks.md)

ドラッグアンドドロップインターフェイスで提供される機能に加えて、Groovy（Java ベースのスクリプト言語）をフル活用して、ワークフローで移動するアセットに対して[プログラム操作](./../../developer-guide/using-the-script-engine-in-workflow.md)を実行することができます。

デフォルトでは、1つのワークフロー定義（唯一の承認者ワークフローの定義）のみがインストールされています。 Liferayのソースコードで他の例を見ることができます。

* [Category-Specific Definition](https://github.com/liferay/liferay-learn/blob/master/docs/dxp/latest/en/process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview/resources/category-specific-definition.xml)
* [Legal Marketing Definition](https://github.com/liferay/liferay-learn/blob/master/docs/dxp/latest/en/process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview/resources/legal-marketing-definition.xml)
* [Single Approver Definition with Scripted Assignment](https://github.com/liferay/liferay-learn/blob/master/docs/dxp/latest/en/process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview/resources/single-approver-definition-scripted-assignment.xml)
* [Single Approver Definition](https://github.com/liferay/liferay-learn/blob/master/docs/dxp/latest/en/process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview/resources/single-approver-definition.xml)

## ワークフローの構築

ワークフローを構築するには、グローバルメニュー（![Global Menu](../../../../images/icon-applications-menu.png)）&rarr; ［コントロールパネル］&rarr; ［ワークフロー］と進みます。

（![Add icon](../../../../images/icon-add.png)）をクリックして開始します。

各ワークフローノードは、レビュープロセスの開始、アセットの承認または拒否、タスクの再割り当てなど、承認プロセスにおける特定のポイントを表します。

[ワークフロートランジション](./workflow-transitions.md)では、各ノードをリンクして、レビュープロセスで必要なフローを作成することができます。 最初のノードの処理が終了すると、トランジションで示された次のノードに処理が進みます。

ワークフローに取り組む準備はできましたか？ 次のステップは、[ワークフローのタスクを作成](./creating-workflow-tasks.md)することです。

## ワークフローのローカライズ

ユーザーはワークフロープロセスのテキストを下記のように体験します。

- 管理者およびワークフロー参加者（ワークフロータスクの担当者など）には、ワークフローのリストでワークフロー定義のタイトルが表示されます。
- ワークフロー参加者（ワークフロータスクの担当者など）は、ワークフローコンテンツの管理中（マイワークフロータスクなど）にノードおよびトランジションラベルを確認することができます。

<!-- TODO: adjust this update number as needed -->
Liferay 7.4 U20では、UIに表示されるワークフローのテキストは翻訳可能です。

ワークフローを翻訳するには、以下の手順を行います。

1. グローバルメニュー &rarr; ［アプリケーション］&rarr; ［ワークフロー］からワークフローを開くか、新規ワークフローを追加します。
1. 新規ワークフローの場合、開始ノードと終了ノードを [トランジション](./workflow-transitions.md)で接続します。
1. ローカライズ可能なフィールドはすべてインスタンスのデフォルト言語で作成されました。 翻訳を開始するには、ワークフローのタイトル欄の近くにある［言語セレクター］をクリックします。

   ![言語セレクターで翻訳言語を選択します。](./workflow-designer-overview/images/02.png)

1. 翻訳を開始する言語を選択します。
1. ワークフローを実行し、ワークフローのノードラベル、トランジションラベル、ワークフロータイトルを翻訳します。
1. ワークフローを保存します。

ワークフローの定義が公開され、 [アセット](../../using-workflows/activating-workflow.md)に関連付けられると、ワークフロータスクの担当者のような参加者が自分の言語でワークフローと対話することになります。

## 追加情報

* [ワークフローの管理](../managing-workflows.md)
* [ワークフローノード](./workflow-nodes.md)
* [フォークと結合の使用](./using-forks-and-joins.md)
* [条件ノードの使用](./using-condition-nodes.md)
* [ワークフロータスクの作成](./creating-workflow-tasks.md)
* [ワークフローのアクションと通知の設定](./configuring-workflow-actions-and-notifications.md)
