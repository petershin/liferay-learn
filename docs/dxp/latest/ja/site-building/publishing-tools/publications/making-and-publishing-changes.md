# 変更の作成と公開

{bdg-secondary}`Liferay 7.3+`

パブリケーションは、Liferayインスタンスへの変更を管理するための便利な方法を提供します。 パブリケーションを使用すると、あなたとあなたのチームは、'パブリケーション'と呼ばれる変更のブロックを作成して共同作業できます。 その後、準備ができたら、これらの変更を本番環境に公開できます。

[$LIFERAY_LEARN_YOUTUBE_URL$]=https://www.youtube.com/embed/YNOLwu19oBk

```{note}
デフォルトでは、ユーザーは自分が作成した出版物にのみ投稿できます。 ただし、他のユーザーを招待して、自分のパブリケーションで共同作業を行うことができます。 詳細は、 [パブリケーションでのコラボレーション](./collaborating-on-publications.md) を参照してください。
```

変更を追跡するパブリケーションをまだ作成していない場合は、 [パブリケーションの作成](./creating-and-managing-publications.md#creating-a-publication) を参照してください。

作成されたパブリケーションは、パブリケーションで行われた変更と競合しない限り、本番環境に加えられた変更で自動的に更新されます。 これにより、あなたとあなたのチームは最新バージョンの本番環境で作業をすることができます。

```{important}
Liferayのバージョンをアップグレードした後、既存のパブリケーションを変更、公開、元に戻すことはできません。 すべてのアクティブな出版物は古いものとしてマークされ、表示または削除のみ可能です。 また、アップグレード前に発行された出版物については、*Revert*オプションが削除されます。
```

## パブリケーションに変更を加える

インスタンスに変更を加える前に、正しいパブリケーションで作業していることを確認してください。 これは、パブリケーションバーで確認できます。 現在パブリケーションに参加していない場合は、パブリケーションを作成するか、既存のパブリケーションを選択することができます。

![Select the desired publication or create one.](./making-and-publishing-changes/images/01.png)

パブリケーションでアセットを追加、編集、または削除すると、変更が行われたパブリケーションでのみその変更が表示されます。 パブリケーション内のアセットを削除すると、DXPはアセットに削除のマークを付け、パブリケーションを表示するときにそのアセットを非表示にします。 アセットが削除されるのは論理的な削除に過ぎないため、プロダクションや他の出版物ではアセットが表示可能なままです。

パブリケーションでの作業中、サポートされているLiferayコンポーネントに加えられた変更は、パブリケーションで追跡されます。 これには、複数のサイトにまたがる変更も含まれる。

```{important}
同じ出版物の異なるサイトを編集する場合、追跡されたすべての変更は出版物の発行時に本番環境に適用されることに注意してください。
```

### サポートされていないアプリケーションへの移動

{bdg-link-primary}`[リリース特集](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags)`

{bdg-secondary}`Liferay 7.4 2023.Q3+/GA98`.

パブリケーションをサポートしていないアプリケーションに移動すると、Liferayはアプリケーションの変更をパブリケーションに保存できないことを示します。

アプリケーションによっては、パブリケーションの中でプロダクションを直接編集することができます。

![Directly edit production while in a publication.](./making-and-publishing-changes/images/02.png)

その他のアプリケーションについては、変更を加える前に本番環境に切り替える必要があります。

![Switch to production before making changes in the application.](./making-and-publishing-changes/images/03.png)

## 並行パブリケーションに変更を加える

ユーザーは、同時に複数のアクティブなパブリケーションを持つことができます。 これらの並行パブリケーションで変更が行われると、インスタンスのエンティティの代替編集履歴が作成されます。 これらの変更は、同じコンテンツを変更するか関連するコンテンツを変更するかに応じて、互換性がある場合と競合する場合があります。

### 互換性のある変更

並行パブリケーションに互換性のある変更が含まれている場合、問題なく公開できます。 この場合、両方のパブリケーションの変更履歴が本番環境に適用されます。

### 競合する変更

並行パブリケーションに互換性のない変更が含まれていて、パブリケーションの1つが最初に本番環境に適用された場合、もう一方のパブリケーションで公開設定時に競合が発生します。 これらの競合は、本番環境が直接更新された場合にも発生する可能性があります。 このプロセスの詳細は、 [競合の解決](./resolving-conflicts.md) を参照してください。

## パブリケーションの変更の確認

公開する前に、パブリケーションの変更履歴を確認して、必要な編集のみが含まれていることを確認できます。 これを行うには、出版物のドロップダウンメニューを開き、 **変更を確認** を選択します。

![Open the Publications drop-down menu and select Review Changes.](./making-and-publishing-changes/images/04.png)

また、Publicationsアプリケーションを使用して、出版物の変更履歴を確認することもできます。**進行中**タブに移動し、目的の出版物の**アクション** ボタン(![Actions button](../../../images/icon-actions.png))をクリックし、**変更をレビュー**を選択するだけです。

変更を確認する場合、すべての追跡された変更がリストに表示され、ユーザー、サイト、タイトル、タイプ、ステータス、変更タイプ、最終更新日順に並べることができます。

デフォルトでは、Publicationsは一部の変更のみを表示しますが、すべてのシステム変更を表示することもできます。 パブリケーションの **Actions**(![アクション・ボタン](../../../images/icon-actions.png))をクリックし、 **Show System Changes** を選択します。 これは、出版物に含まれるすべての変更を表示します。

![Select Show System Changes to view all changes included in the publication.](./making-and-publishing-changes/images/05.png)

レビュー中に変更を選択すると、詳細が表示され、追加アクション（編集、破棄など）にアクセスできます。 利用可能なアクションは、エンティティのタイプによって異なる。

![Select a change to view more details and access additional actions.](./making-and-publishing-changes/images/06.png)

### ページへの変更をプレビューする

{bdg-link-primary}`[リリース特集](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags)`

{bdg-secondary}`Liferay 7.4 2023.Q3+/GA98+`

出版物にページの編集が含まれている場合、その変更をオリジナルバージョンのページと一緒にプレビューすることができます。

![View page versions in the Display tab.](./making-and-publishing-changes/images/07.png)

交互の [ユーザー・エクスペリエンス](../../personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md) を持つページへの変更をレビューするとき、エクスペリエンスのドロップダウンメニューを使って切り替えることができます。

![Select the desired user experience to review.](./making-and-publishing-changes/images/08.png)

一度選択すると、各ページのバージョンを個別に表示したり、スプリットビューを選択して並べて確認することができます。

![Review page versions individually or select Split View to review them side by side.](./making-and-publishing-changes/images/09.png)

### 出版物間での変更の移動

{bdg-link-primary}`[ベータ版特集](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

{bdg-secondary}`Liferay 7.4 2023.Q3+/GA98+`

変更点を確認しながら、別の出版物に移動することができます。 これにより、コンテンツを管理する際の柔軟性が高まった：

1. 必要な変更の **アクション** ボタン( ![アクションボタン](../../../images/icon-actions.png))をクリックし、 **変更を移動** を選択します。

   ![Click the Actions button for the desired change and select Move changes.](./making-and-publishing-changes/images/10.png)

1. ご希望の **出版** を選択してください。

1. **移** をクリックする。

これにより、変更は子パブリケーションとともに選択されたパブリケーションに移動します。 また、現在のパブリケーションから変更とその子を削除します。

## 変更内容の公開

変更作業が完了したら、すぐに公開するか、後で公開するようにスケジュールすることができます。 出版されると、出版物は出版物アプリケーションの **履歴** タブにリストされます。 これにより、明確な監査証跡が維持され、必要に応じてサイトの変更を見直したり、元に戻したりすることができる。 詳細は、 [変更を元に戻す](./reverting-changes.md) を参照してください。

公開プロセスを開始すると、Liferayは互換性チェックを実行して、パブリケーションと本番環境の間に競合があるかどうかを判断します。 競合がある場合は、DXPから通知されます。 一部の競合は自動的に解決されますが、その他の競合は手動で解決する必要があります。 変更を公開するには、すべての競合を解決する必要があります。 詳細は、 [競合の解決](./resolving-conflicts.md) を参照してください。

### 今すぐ公開

次の手順に従って、変更をすぐに公開します。

1. 出版物のドロップダウンメニューを開き、 **変更を確認** を選択します。

   または、パブリケーションアプリケーションを開き、目的のパブリケーションをクリックします。

1. ［**公開** をクリックします。

   ![Navigate to the desired publication and click on Publish.](./making-and-publishing-changes/images/11.png)

1. 必要に応じて、検出された競合を手動で解決します。 すべての競合が解決されたら、次に進むことができます。

   ![Resolve all conflicts before publishing.](./making-and-publishing-changes/images/12.png)

1. ［**公開** をクリックします。

パブリケーションの変更はすぐに本番環境に適用され、［履歴］タブにリダイレクトされます。  ここから、パブリッシングの詳細（日付、発行者、ステータスなど）を表示し、必要に応じてパブリケーションの変更を [](./reverting-changes.md) に戻すことができます。

### 後でスケジュールする

次の手順に従って、後日の公開をスケジュールします。

1. 出版物のドロップダウンメニューを開き、 **変更を確認** を選択します。

   または、パブリケーションアプリケーションを開き、目的のパブリケーションをクリックします。

1. **スケジュー** をクリックします。

   ![Navigate to the desired publication and click on Schedule.](./making-and-publishing-changes/images/13.png)

1. 必要に応じて、検出された競合を手動で解決します。 すべての競合が解決されたら、次に進むことができます。

   ```{important}
   公開時に、DXPは2回目の競合検出を実行して、新たな競合する変更がないことを確認します。 DXPが自動的に解決できない新しい競合を検出すると、公開は失敗します。 競合を自動的に解決できる場合、DXPは公開を続行します。
   ```

1. 日付と時刻を入力して、変更が本番環境に公開されるタイミングを決定します。

   ![Set a date and time to publish your changes.](./making-and-publishing-changes/images/14.png)

1. **Schedul** をクリックし、手続きを完了します。

[このタブでは、スケジュールされた出版物の表示と管理](./creating-and-managing-publications.md#managing-scheduled-publications) を行うことができます。

## 不要な出版データの削除

出版物の変更を確認する際、ファイルやページのプレビューがドキュメント・ライブラリに蓄積されることがあります。 必要であれば、このデータを削除することもできる。

1. グローバルメニュー( [グローバルメニュー](../../../images/icon-applications-menu.png) )を開き、 **コントロールパネル** に移動し、 **システム設定** をクリックします。

1. プラットフォーム]の下にあ[アップグレード]をクリックします。

1. **データ削** タブに移動します。

1. **DLプレビュー変更追跡ストアコンテンツデータの削** を選択します。

   ![Check the change tracking options.](./making-and-publishing-changes/images/15.png)

1. ［**Save**］をクリックします。

Liferayは直ちに不要なデータを削除します。

## 関連トピック

* [出版物の概要](../publications.md)
* [出版を可能にする](./enabling-publications.md)
* [出版物の作成と管理](./creating-and-managing-publications.md)
