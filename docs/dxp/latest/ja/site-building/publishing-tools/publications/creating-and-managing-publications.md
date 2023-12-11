# パブリケーションの作成と管理

{bdg-secondary}`Liferay DXP/Portal 7.3+`.

パブリケーションを使用すると、ユーザーはインスタンススコープの変更ブロックを作成できます。 各パブリケーションはインスタンススコープであるため、Liferay UIのどこからでもアクセスでき、複数のサイトからの変更を含めることができます。 デフォルトでは、ユーザーは自分が作成したパブリケーションのみを表示および管理できます。 ただし、ユーザーはお互いに招待し合い、自分のパブリケーションで共同作業を行うことができます。 詳細は、 [Collaborating on Publications](./collaborating-on-publications.md) を参照してください。

[$LIFERAY_LEARN_YOUTUBE_URL$]=https://www.youtube.com/embed/QifaRHHuoX8

パブリケーションを [有効](./enabling-publications.md) にすると、［Publications］アプリケーションページまたは［Publications］ドロップダウンメニューを使用して、パブリケーションを作成、編集、公開、または削除できます。

```{important}
Liferayのバージョンをアップグレードする前に、すべてのアクティブなパブリケーションを公開していることを確認してください。 アップグレード後、有効なパブリケーションは有効期限切れとしてマークされ、公開や変更を行うことができなくなります。 また、アップグレード前に発行された出版物を元に戻すことはできません。 これらのパブリケーションでは、*元に戻す*オプションは削除されます。
```

## 出版物の作成

1. Publications*ドロップダウンメニューをクリックし、_Create New Publication_を選択します。

   ![Click Create New Publication in the Publications drop-down menu.](./creating-and-managing-publications/images/01.png)

   または、Publicationsアプリケーションを開き、_進行中_タブの_追加_（！[追加ボタン](../../../images/icon-add.png)）をクリックします。

1. 出版物の_名前_と_説明_を入力してください。

   または、 [パブリケーション・テンプレート](./using-publication-templates.md) を選択すると、これらのフィールドが自動入力されます。

   ```{note}
   パブリケーション名は一意である必要はありません。 ただし、整理するために一意の名前を使用することをお勧めします。
   ```

1. *作成*をクリックする。

![Enter a name and description for your publication, and click Create.](./creating-and-managing-publications/images/02.png)

パブリケーションが作成されたら、それに変更を加えることができるようになります。 編集と公開のプロセスの詳細は、 [Making and Publishing Changes](./making-and-publishing-changes.md) を参照してください。

```{note}
作成後、各パブリケーションは、パブリケーションで行われた変更と競合しない限り、プロダクションで行われた変更で自動的に更新されます。
```

## 進行中のパブリケーションの管理

*進行中*タブでは、閲覧権限のあるすべてのアクティブな未発表出版物の表を見ることができます。 テーブルは_更新日_順に並び、各パブリケーションの名前、説明、最終更新時刻、作成時刻、所有者を含みます。

![The Ongoing tab lists all active, unpublished publications.](./creating-and-managing-publications/images/03.png)

ここから、パブリケーションのアクションボタン（[アクションボタン](../../../images/icon-actions.png)）をクリックして、以下のアクションを実行できます：

**出版物の作業**：変更を加えるために出版物を選択してください。 選択すると、［Publications］ドロップダウンメニューからパブリケーションと本番環境を簡単に切り替えることができます。 詳細は、 [Making Changes in a Publication](./making-and-publishing-changes.md#making-changes-in-a-publication) を参照してください。

**編集**：出版物の名前や説明を変更します。

**変更点の確認**：出版物に含まれるすべての変更点を表示します。 詳細は、 [Reviewing Publication Changes](./making-and-publishing-changes.md#reviewing-publication-changes) を参照してください。

**ユーザーを招待する**: ユーザーを招待して、出版物に共同作業をさせる。詳細は[Collaborating on Publications](./collaborating-on-publications.md)をご覧ください。

**出版**:する：出版物の出版プロセスを開始します。 これにより、ユーザーは公開設定ページにリダイレクトされ、そこで競合を解決できます。 コンフリクトがなければ、_Publish_をクリックして変更を反映させることができる。 詳細については、 [Publishing Changes](./making-and-publishing-changes.md#publishing-changes) および [Resolving Conflicts](./resolving-conflicts.md) を参照してください。

**スケジュール**：出版物の変更をプロダクションに適用するスケジュールを設定します。 詳細は、 [Publishing Changes](./making-and-publishing-changes.md#publishing-changes) を参照してください。

**パーミッション**：ユーザ・ロールにパブリケーション固有の権限を割り当てます。 このように設定された権限は、個々のパブリケーションに範囲指定されます。 <!--TASK: Link to the permissions article once finished.-->

**削除**：インスタンスからパブリケーションを削除します。 選択すると、選択項目を確認するように求められます。

```{warning}
パブリケーションを削除すると、データベースからすべての変更が完全に削除され、元に戻すことはできません。 パブリケーションを削除する前に、保存するデータがすべて保存されていることを確認してください。
```

## スケジュール設定されたパブリケーションの管理

Schedule_タブでは、あなたが閲覧する権限を持っているすべてのスケジュールされた出版物の表を見ることができます。 デフォルトでは、スケジュールされた出版物は_名前*順に表示されますが、更新日や各出版物の出版スケジュール順に並べることもできます。

![The Schedule tab lists all scheduled publications for your instance.](./creating-and-managing-publications/images/04.png)

スケジュールが設定されると、変更をパブリケーションに追加することはできません。 ただし、「アクション」ボタン(![アクションボタン](../../../images/icon-actions.png))をクリックすると、以下のアクションを実行できる：

**スケジュール解除**：予定されていたパブリッシュをキャンセルし、パブリッシュを_進行中_ステータスに戻します。

**リスケジュール**：変更をプロダクションに公開する別の日時を設定します。

**変更点の確認**：出版物に含まれるすべての変更点を表示します。

## パブリケーションの履歴の管理

History_タブでは、他のユーザーによって発行されたものを含め、DXPインスタンスに対して発行されたすべてのパブリケーションのテーブルを表示できます。 デフォルトでは、出版物は_出版日*順に並べられますが、名前順に並べることもできます。

![The History tab lists all previously published publications for your instance.](./creating-and-managing-publications/images/05.png)

ここから、パブリケーションの_取り消し_をクリックすると、変更を取り消した新しいパブリケーションが自動的に作成されます。 ［元に戻す］パブリケーションの一部として、DXPインスタンスに追加の変更を加えることもできます。 詳細は、 [Reverting Changes](./reverting-changes.md) を参照してください。

```{note}
インスタンス上で発行されたすべてのパブリケーションが[履歴]タブにリストされますが、パブリケーションの所有者と共同作業者のみが、パブリケーションの変更リストを表示したり、パブリケーションを元に戻したりできます。
```

## 関連トピック

* [出版物の概要](../publications.md) 
* [出版を可能にする](./enabling-publications.md) 
* [変更の作成と公開](./making-and-publishing-changes.md) 
