---
toc:
  - ./publications/enabling-publications.md
  - ./publications/creating-and-managing-publications.md
  - ./publications/using-publication-templates.md
  - ./publications/making-and-publishing-changes.md
  - ./publications/using-workflow-with-publications.md
  - ./publications/collaborating-on-publications.md
  - ./publications/resolving-conflicts.md
  - ./publications/reverting-changes.md
  - ./publications/publications-permissions.md
---
# 公開

{bdg-secondary}`liferay DXP/Portal 7.3+`.

**Publications** を使用して、DXPインスタンス全体の変更を開発、追跡、公開できます。 これは、データベース列を作成して、本番環境のサイトに表示されるコンテンツのバージョンを決定することによって機能します。 これを使えば、ユーザーは自分の変更を公開可能なブロックにグループ化するために、個別の **公開** を作成することができます。

![Group changes into publishable blocks.](./publications/images/01.png)

変更を加える際には、 **編集** モードと **本番** モードを切り替えることができます。 これにより、インスタンスのマイナーな変更やメジャー変更を、本番環境に公開する前に編集環境で作業することができます。 その後、変更を確認してすぐに公開するか、後で公開するようにスケジュールすることができます。

あなたとあなたのチームは、変更内容を整理して展開するために必要な数のパブリケーションを作成できます。 また、同じパブリケーションまたは異なるパブリケーションでチームメンバーと同時に作業することもでき、自分のタイムラインで作業することができます。

各パブリケーションはインスタンスに範囲指定されており、どこからでもアクセスできます。 つまり、パブリケーションを使用して、複数のサイトにわたる多様で複雑な変更を追跡できます。 パブリケーションが公開されると、すべての変更がまとめて適用されます。

さらに、パブリケーションはプロセスの透明性が高いため、公開時の競合をより簡単に特定して解決することができます。 また、完全な公開履歴を保持しているので、インスタンスへの変更を確認したり、元に戻したりするのに利用できます。

まずは、 [パブリケーションの有効化](./publications/enabling-publications.md) をご覧ください。
