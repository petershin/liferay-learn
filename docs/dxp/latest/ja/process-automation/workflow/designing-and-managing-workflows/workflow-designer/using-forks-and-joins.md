# フォークと結合の使用

{bdg-primary}`サブスクリプション`

ここでは、 **フォーク** 、 **結合** および **XOR 結合** ノードの使用方法を学びます。 これらのノードは、 [Legal-Marketing Definition](https://github.com/liferay/liferay-learn/blob/master/docs/dxp/latest/en/process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview/resources/legal-marketing-definition.xml) サンプルのような複数のレビュアがいるワークフロープロセスに役立ちます。

レビュータスクを分割することで、2つのレビューを同時に行うことができます。 Legal-Marketingのワークフロー例では、プロセスは線形です。ワークフローは公開前にMarketingからLegalに移行しますが、 **フォーク** および **結合**（またはXOR 結合）を使用して並行ワークフロープロセスを構築できます。

## フォークノードと結合ノードの使用

1. ［**グローバルメニュー**］ &rarr; ［**アプリケーション**］ &rarr; ［**ワークフロー**］ に移動します。
1. ［**ワークフロー**］ タブをクリックします。
1. （![Add icon](../../../../images/icon-add.png)）をクリックして新規ワークフローを追加します。
1. ワークフローデザイナーのキャンバスで、開始ノードと終了ノードを接続するトランジションがある場合、マウスで選択し、キーボードのDeleteキーで削除します。
1. **フォーク** ノードをキャンバスにドラッグアンドドロップしてから、 **開始** ノードを **フォーク** ノードに接続します。 ノードやコネクタの名前は後で変更することができます。
1. 2つの **タスク** ノードをドラッグアンドドロップします。 **フォーク** ノードを2つの **タスク** ノードに接続します。

    ![フォークノードを追加して、次にタスクノードを追加します。](./using-forks-and-joins/images/02.png)

1. **結合** ノードをドラッグアンドドロップします。 2つの **タスクノード** を **結合** ノードに接続します。
1. **結合** ノードを **終了** ノードに接続します。
1. ノードやコネクターの名前を変更し、[アクションや通知](./configuring-workflow-actions-and-notifications.md)を追加します。

    ![ワークフローが完了したら公開します。](./using-forks-and-joins/images/01.png)

1. 完了したら、 ［**公開**］ をクリックします。

### XOR結合ノードの使用

通常の結合ノードでは、ワークフローを結合を超えて進めるには、両方の並列実行からのトランジションが呼び出される必要があります。 しかし、代わりにXOR 結合ノードを使用する場合は、いずれかの並列実行からのトランジションが起動している限り、ワークフローは進行します。

## 追加情報

* [ワークフローのアクティブ化](../../using-workflows/activating-workflow.md)
* [ワークフローノード](./workflow-nodes.md)
* [ワークフロータスクの作成](./creating-workflow-tasks.md)
* [条件ノードの使用](./using-condition-nodes.md)
* [ワークフローのアクションと通知の設定](./configuring-workflow-actions-and-notifications.md)
