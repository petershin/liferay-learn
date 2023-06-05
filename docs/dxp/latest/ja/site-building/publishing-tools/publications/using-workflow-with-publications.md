# ワークフローを出版物で使う

{bdg-secondary}`7.4 U44+/GA44+`

PublicationsはLiferayの [Workflow](../../../process-automation/workflow/introduction-to-workflow.md) フレームワークと統合されているので、Publicationsを有効にしてもコンテンツやページのレビューのためにカスタムワークフローを使い続けることができます。 これにより、追跡されたすべての変更は、本番環境に公開する前に、必要な承認プロセスを通過することになります。

![Publicationsは、LiferayのWorkflowフレームワークと完全に統合されています。](./using-workflow-with-publications/images/01.png)

出版物の場合は、変更が行われた環境（本番環境または出版物など）にスコープされます。 コンテンツのレビュアーは、変更を確認し承認するために、適切な環境にアクセスできなければなりません。 例えば、サイトの貢献者が出版物に変更を加えた場合、ワークフローのレビュー担当者もその出版物にアクセスできなければなりません。 パブリケーションへのユーザーの招待と権限の割り当てについては、 [Collaboration on Publications](./collaborating-on-publications.md) を参照してください。

貢献者が承認のために変更を送信すると、ワークフローの通知には、変更が行われた環境が含まれます。 レビュアーは、変更内容を確認し承認する前に、適切な環境に切り替える必要があります。

![ワークフローの通知には、変更が行われた環境が表示されます。](./using-workflow-with-publications/images/02.png)

レビュアーは、すべての変更を本番に公開する前に承認する必要があります。 未承認の変更を公開しようとすると、エラーメッセージが表示される。

![未承認の変更を公開しようとすると、エラーメッセージが表示される。](./using-workflow-with-publications/images/03.png)

変更が承認されると、同じエンティティに対する追加の編集は、出版物の別の変更として追跡され、それぞれ独自のワークフローステータスが設定されます。

![同じエンティティに対する追加の編集は、出版物の個別の変更として追跡されます。](./using-workflow-with-publications/images/04.png)

## 関連トピック

* [ワークフローの概要](../../../process-automation/workflow/introduction-to-workflow.md)
* [パブリケーションの作成と管理](./creating-and-managing-publications.md)
* [パブリケーションでのコラボレーション](./collaborating-on-publications.md)
