# 個人データの管理と削除

Liferayは、個人ユーザーデータを管理および削除するためのユーザーデータツールを提供します。 これらのツールはGDPRの要件に役立ちますが、コンプライアンスを保証するものではありません。 詳しくは [ユーザーデータの管理（GDPR）](https://learn.liferay.com/w/dxp/users-and-permissions/managing-user-data) をご覧ください。

## 個人データのエクスポート

道徳的に、そして時には法的に、個人には自分の個人データを要求する権利があり、トミー・タナーは自分の掲示板のデータを要求した。 彼のためにエクスポートする手順に従ってください。

1. 管理者としてLiferayにログインし直します。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。

1. トミー・タナーについては **オプション**(![Options icon](../../images/icon-actions.png)) をクリックしてください。 **個人データのエクスポート** をクリックする。

1. 次のページで、 **Add**(![Add icon](../../images/icon-add.png)) をクリックして、新しいエクスポート・プロセスを開始します。

1. 次のページで、エクスポートしたい項目をすべて選択します。 例えば、掲示板からすべての個人データを選択する。 選択後、 **Export** 。

   ![エクスポートしたい項目を選択します。](./managing-and-deleting-personal-data/images/01.png)

1. 次のページでは、各カテゴリーの個人データのエクスポート手順を示します。 ダウンロードするには、 **オプション**(![Options icon](../../images/icon-actions.png)) をクリックし、 **ダウンロード** を選択します。 個人ユーザーデータはあなたのマシンにダウンロードされます。 これでトミーに送ることができる。

1. ローカルマシンで、ダウンロードしたファイルを解凍します。 このフォルダには、機械でも人間でも読めるXMLファイルが含まれている。

## 個人データの匿名化

個人を特定できる情報を含まない既存のコンテンツを保持したい場合は、個人データの匿名化を選択します。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。

1. トミー・タナーについては **オプション**(![Options icon](../../images/icon-actions.png)) をクリックしてください。 **個人データの削除** をクリックします。 **OK** をクリックすると、ポップアップ・ウィンドウが表示され、まずユーザーを非アクティブにする必要があることを説明する。

1. 次のページには、ユーザーに関連するすべての個人データが表示されます。 匿名化したい各カテゴリーを選択する。 掲示板のカテゴリーを選択します。

   ![匿名化するデータの各カテゴリーを選択します。](./managing-and-deleting-personal-data/images/02.png)

1. **オプション**(![Options icon](../../images/icon-actions.png)) をクリックし、掲示板の横にある **匿名化** をクリックします。 ポップアップウィンドウで **OK** をクリックする。 ユーザーの個人情報は、名前を匿名ユーザーに変更することで匿名化された。

   ![掲示板のスレッドにトミー・タナーが表示されなくなった。](./managing-and-deleting-personal-data/images/03.png)

## 個人データの削除

最後に、個人データを完全に削除することもできます。 このオプションは、ユーザーが生成したデータやコンテンツを削除します。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。

1. **Filter and Order** をクリックし、 **Inactive** を選択する。

1. トミー・タナーについては **オプション**(![Options icon](../../images/icon-actions.png)) をクリックしてください。 **個人データの削除** をクリックします。

1. 次のページには、ユーザーに関連するすべての個人データが表示されます。 **フォーム** カテゴリを選択する。

1. **オプション**(![Options icon](../../images/icon-actions.png)) をクリックし、フォーム・カテゴリーの隣にある **削除** をクリックする。 ポップアップウィンドウで **OK** をクリックする。

   なお、フォームデータなど一部のユーザーデータについては、レビューと匿名化が必要です。 次のページで、 **Anonymize** をクリックします。 ポップアップウィンドウで **OK** をクリックする。

1. 次のポップアップ・ウィンドウでは、ユーザーを削除するオプションが表示されます。 **Cancel** をクリックし、ユーザーを残す。

　 ユーザーデータに関するこのモジュールは終了しました。

## 関連コンセプト

- [ユーザーデータのエクスポート](https://learn.liferay.com/ja/w/dxp/users-and-permissions/managing-user-data/exporting-user-data)

- [ユーザーデータの無害化](https://learn.liferay.com/ja/w/dxp/users-and-permissions/managing-user-data/sanitizing-user-data)

- [匿名ユーザーの設定](https://learn.liferay.com/ja/w/dxp/users-and-permissions/managing-user-data/configuring-the-anonymous-user)
