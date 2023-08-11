# サイトテンプレートプロパゲーションの設定

{bdg-secondary}`Liferay 7.4 U23+/GA23+ で利用可能`

デフォルトでは、テンプレートが更新された後にユーザーがサイトを訪問すると、サイト テンプレートの変更が接続サイトに自動的に伝搬されます。 しかし、接続されているすべてのサイトに同時に伝播する手動トリガを追加設定することができます。 手動伝搬を有効にするには、Trigger Propagation設定を使用する。 有効になっている場合、サイトテンプレートエディタの [Ready for Propagation](./propagating-template-changes.md#enabling-and-disabling-propagation) ボタンをクリックすると、接続されているすべてのサイトに伝播されます。 この設定を有効にしても、ユーザーが接続されたサイトを訪問したときに発生するテンプレート変更の自動伝播は停止しません。

```{important}
自動伝播は、テンプレートに加えられた変更の範囲によっては、リソースを大量に消費する可能性があります。
```

サイトテンプレートのプロパゲーションを設定するには

1. **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 **Control Panel** タブを開き、 **System Settings** under Configuration をクリックします。

1. Platform」の「**Infrastructure」の**「 settings」を開き、サイドメニューの「Virtual Instance Scope」の「**Site Templates**」をクリックします。

1. Check **Trigger Propagation** .

   チェックをはずすと、ユーザーが最初にサイトを訪れたときに、変更が個別に反映されます。

   チェックした場合、テンプレートで自動プロパゲーションを有効にすると、接続されているすべてのサイトへのプロパゲーションも同時にトリガーされます。

   ![トリガー伝搬をチェックする。](./configuring-site-template-propagation/images/01.png)

1. ［**Save**］ をクリックします。

サイト テンプレートでプロパゲーションが無効になっている場合、プロパゲーションを有効にすると、接続されているサイトに同時に変更が反映されます。 テンプレートに対するプロパゲーションは有効なままですが、その後の変更は、ユーザーが最初にアクセスしたときに個別にサイトにプロパゲーションされます。

## 関連トピック

* [サイトテンプレート](../site-templates.md)
* [テンプレート変更のプロパゲート](./propagating-template-changes.md)
