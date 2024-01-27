# ユーザーセグメントへのロールの割り当て

> 利用可能：Liferay DXP 7.2 SP2 +、Liferay CE 7.3.1 GA2

ユーザーセグメントは、動的に割り当てられるユーザーコレクションです。 利用可能な基準 [を使って](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) セグメントをうまく定義できれば、ユーザー管理の管理オーバーヘッドを大幅に削減できる。 その上、サイトスコープで作成されたユーザーセグメントに対して、 [パーソナライズされたエクスペリエンス](../../site-building/personalizing-site-experience.md) を定義することができ、ユーザーがサイト内で最も関連性の高いコンテンツを確実に見ることができます。

| ユーザーセグメントはどこで作成できますか？                                            | 何のために？                      | セグメントに役割を割り当てるには？                                                     |
| :--------------------------------------------------------------- | :-------------------------- | :-------------------------------------------------------------------- |
| サイトセグメント（サイトメニュー &rarr; 人 &rarr; セグメント）                | サイトのユーザーにパーソナライズされた体験を提供する。 | サイトメニュー &rarr; People &rarr; セグメント（アクション）                   |
| インスタンスセグメント（コントロールパネル &rarr; ユーザー &rarr; ロール（通常のロール））。 | ユーザーとその権限を効率的かつ動的に管理します。    | コントロールパネル &rarr; ユーザー &rarr; ロール(通常のロール) |

## 通常のロールをユーザーセグメントに割り当てる

{bdg-secondary}`liferay DXP 7.2 SP2+`.

アナリティクス管理者、ポータル・コンテンツ・レビュアー、パワー・ユーザー、パブリケーション・ユーザー、および作成したその他の通常のロールは、グローバル・スコープで作成したユーザー・セグメントに割り当てることができます。 ユーザセグメントに通常のロールを割り当てるには

1. *Product Menu* (![Product Menu](../../images/icon-product-menu.png)) を開き、_Control Panel_ &rarr; _Users_ &rarr; _Roles_ に移動します。

1. 通常のロールの隣にある_Actions_(![Actions](../../images/icon-actions.png))をクリックし、_Edit_を選択します。

   ![Edit a role to assign the user segment to it.](./assigning-roles-to-user-segments/images/01.png)

1. *Assignees* &rarr; _Segments_タブを選択し、_Add_ (![Addボタン](../../images/icon-add.png))をクリックしてユーザーセグメントを選択します。

   ![Go to the Segments tab under Assignees to assign the role.](./assigning-roles-to-user-segments/images/02.png)

1. 既存のユーザーセグメントの横にあるボックスにチェックを入れ、_Add_をクリックしてロールを割り当てます。 ユーザー・セグメントが存在しない場合は、_追加_（！[追加ボタン](../../images/icon-add.png)）をクリックして新しいユーザー・セグメントを作成します。

   ![Check the box next to the user segment you want to assign the role to.](./assigning-roles-to-user-segments/images/03.png)

選択されたユーザセグメントは、ロールの割り当て先リストに表示されます。

![The user segment appears under the list of assignees for the role.](./assigning-roles-to-user-segments/images/04.png)

## ユーザーセグメントへのサイトロールの割り当て

{bdg-secondary}`liferay DXP 7.2 SP3+`.

[サイトの役割](./understanding-roles-and-permissions.md) セグメントに割り当てることができますが、2つの例外があります：サイト管理者とサイト所有者です。

1. 商品メニュー(![商品メニュー](../../images/icon-product-menu.png))を開き、_People_ &rarr; _Segments_に移動します。

1. セグメントの_Actions_(![Actions](../../images/icon-actions.png))を開き、_Assign Site Roles_をクリックします。

1. セグメントにサイト・ロールを割り当て、_Add_をクリックします。

   ![Site roles can be assigned to segments.](./assigning-roles-to-user-segments/images/05.png)

## 関連情報

* [ユーザーセグメントの作成](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)
