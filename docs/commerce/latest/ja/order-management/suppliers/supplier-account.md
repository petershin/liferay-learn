# サプライヤーアカウント

{bdg-secondary}`liferay DXP 7.4 U84+/GA84+`

**Supplier**アカウントタイプには、アドレス、ユーザー、組織、アカウントグループ、ロールの追加と管理など、Liferayアカウントのすべての機能があります。 さらに、サプライヤーと顧客を明確に区別している。 新しいアカウントを作成する際、Type drop-downから **Supplier** オプションを選択します。 新規アカウント作成に関する詳細は、 [アカウント](https://learn.liferay.com/w/dxp/users-and-permissions/accounts) をご参照ください。

他のアカウント・タイプと異なり、サプライヤー・アカウントをチャネルおよびカタログにリンクすることができます。 これはサプライヤー・ロールと併用することができる。 チャネルとカタログの両方をサプライヤー・アカウントにリンクさせることで、サプライヤーは自分の注文と自分の商品カタログを管理することができる。

## チャンネルとサプライヤー・アカウントのリンク

1. グローバルメニュー( ![グローバルメニュー](../../images/icon-applications-menu.png) )を開き、 **Commerce** &rarr; **Channels** に移動します。

1. チャンネルを選択します。

1. Detailsカードで、 **Link Channel to a Supplier** ドロップダウンを使用して、サプライヤー・アカウントを選択します。

   ![Choose a supplier account from the dropdown to link to the channel.](./supplier-account/images/01.png)

1. ［**保存**］をクリックします。

## カタログとサプライヤーアカウントのリンク

1. **グローバルメニュー**(![グローバルメニュー](../../images/icon-applications-menu.png))を開き、 **Commerce** &rarr; **Catalogs** に移動します。

1. すでにサプライヤーカタログが作成されている場合は既存のカタログを選択するか、 **Add**(![Add](../../images/icon-add.png)) をクリックして新しいカタログを作成します。

1. カタログを選択した後、 **Link Channel to a Supplier** ドロップダウンを使用してサプライヤーアカウントを選択します。

   ![Choose a supplier account from the dropdown to link to the catalog.](./supplier-account/images/02.png)

1. ［**保存**］をクリックします。

```{note}
Supplier*ロールを持つユーザーは、独自のカタログを作成できます。 サプライヤーとして新規カタログを作成する場合、作成時にサプライヤーアカウントを選択するドロップダウンが利用できます。 サプライヤーがアカウントを正しくリンクしない限り、カタログは作成されない。

サプライヤーは、カタログやチャネルにリンクされているサプライヤー・アカウントを変更したり、独自のチャネルを作成したりすることはできません。 これは管理者のみ可能である。
```

## 関連トピック

* [サプライヤー](../../users-and-accounts/roles-and-permissions/commerce-roles-reference.md#supplier)
* [アカウント・サプライヤー](../../users-and-accounts/roles-and-permissions/commerce-roles-reference.md#account-supplier)
* [サプライヤーの役割](./supplier-role.md)
