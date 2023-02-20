# 変更を元に戻す

Liferay Publicationsは、公開されたすべての変更の履歴を保持しています。 この公開履歴を使用して、本番環境への以前の変更を元に戻すパブリケーションを作成できます。 出版物を元に戻す間、追加の変更を行うこともできます。

[$LIFERAY_LEARN_YOUTUBE_URL$]=https://www.youtube.com/embed/1o6lDhV3AnM

```{important}
Liferayのバージョンをアップグレードした後、アップグレード前に公開したパブリケーションを元に戻すことはできません。 これらの出版物では、*Revert*オプションは削除されます。

また、ユーザーは同じ出版物を2回戻すことはできません。 これを実行しようとすると、*追加の競合*が発生します。 コンフリクトの種類については、[コンフリクトの解決](./resolving-conflicts.md)を参照してください。
```

公開された変更を元に戻すには、次の手順に従います。

1. *［Publications］*概要ページに移動して、*［History］*タブをクリックします。

   ![[Publications]概要ページに移動し、[履歴]をクリックします。](./reverting-changes/images/01.png)

1. 目的の出版物の *Revert* をクリックします。

1. 新しいパブリケーションの*名前*と*説明*を設定します。 デフォルト名は`Revert "[Publication Name]"`です。

   ![パブリケーションの名前と説明を入力し、公開日時を決定します。](./reverting-changes/images/02.png)

1. パブリケーションをいつ公開するかを決定します（*［Now］*または*［Later］*）。

   **Now**：復元がすぐに公開されます。

   **Later**：パブリケーションが作成され、ユーザーは公開前にパブリケーションに追加の変更を加えることができます。

1. *Revert and Create Publication*をクリックします。

これにより、選択したパブリケーションを元に戻すために必要なすべての変更を含む新しいパブリケーションが作成されます。

![新しい復元パブリケーションが作成されます。](./reverting-changes/images/03.png)

*［Now］*の公開設定を選択した場合は、公開設定ページにリダイレクトされます。 競合がなければ、*［公開］*をクリックして、元のパブリケーションの変更を本番環境に復元することができます。

*［Later］*の公開設定を選択した場合は、新しいパブリケーションの［変更の確認］ページにリダイレクトされます。 この時点で、パブリケーションにさらに変更を加え、準備ができたら公開できます。

## 追加情報

* [Creating and Managing Publications](./creating-and-managing-publications.md)
* [変更の作成と公開](./making-and-publishing-changes.md)
* [競合の解決](resolving-conflicts.md)
