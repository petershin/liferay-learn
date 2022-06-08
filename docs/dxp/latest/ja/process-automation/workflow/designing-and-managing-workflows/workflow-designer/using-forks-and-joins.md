# フォークと結合の使用

{bdg-primary}`サブスクリプション`

ここでは、 _フォーク_、_結合_および_XOR 結合_ノードの使用方法を学びます。 これらのノードは、[Legal-Marketing Definition](https://github.com/liferay/liferay-learn/blob/master/docs/dxp/latest/en/process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview/resources/legal-marketing-definition.xml)サンプルのような複数のレビュアがいるワークフロープロセスに役立ちます。

レビュータスクを分割することで、2つのレビューを同時に行うことができます。 Legal-Marketingのワークフロー例では、プロセスは線形です。ワークフローは公開前にMarketingからLegalに移行しますが、_フォーク_および_結合_（またはXOR 結合）を使用して並行ワークフロープロセスを構築できます。

## フォークノードと結合ノードの使用

1. _［グローバルメニュー］_&rarr;_［アプリケーション］_&rarr;_［ワークフロー］_に移動します。
1. _［ワークフロー］_タブをクリックします。
1. （![Add icon](../../../../images/icon-add.png)）をクリックして新規ワークフローを追加します。
1. ワークフローデザイナーのキャンバスで、開始ノードと終了ノードを接続するトランジションがある場合、マウスで選択し、キーボードのDeleteキーで削除します。
1. _フォーク_ノードをキャンバスにドラッグアンドドロップしてから、_開始_ノードを_フォーク_ノードに接続します。 ノードやコネクタの名前は後で変更することができます。
1. 2つの_タスク_ノードをドラッグアンドドロップします。 _フォーク_ノードを2つの_タスク_ノードに接続します。

    ![フォークノードを追加して、次にタスクノードを追加します。](./using-forks-and-joins/images/02.png)

1. _結合_ノードをドラッグアンドドロップします。 2つの_タスクノード_を_結合_ノードに接続します。
1. _結合_ノードを_終了_ノードに接続します。
1. ノードやコネクターの名前を変更し、[アクションや通知](./configuring-workflow-actions-and-notifications.md)を追加します。

    ![ワークフローが完了したら公開します。](./using-forks-and-joins/images/01.png)

1. 完了したら、_［公開］_をクリックします。

### XOR結合ノードの使用

通常の結合ノードでは、ワークフローを結合を超えて進めるには、両方の並列実行からのトランジションが呼び出される必要があります。 しかし、代わりにXOR 結合ノードを使用する場合は、いずれかの並列実行からのトランジションが起動している限り、ワークフローは進行します。

## 追加情報

* [ワークフローの有効化](../../using-workflows/activating-workflow.md)
* [ワークフローノード](./workflow-nodes.md)
* [ワークフロータスクの作成](./creating-workflow-tasks.md)
* [条件ノードの使用](./using-condition-nodes.md)
* [ワークフローのアクションと通知の設定](./configuring-workflow-actions-and-notifications.md)
