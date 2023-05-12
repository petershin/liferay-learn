# パブリケーションの有効化

{bdg-secondary}`Liferay 7.3以降で利用可能`

Publicationsは、お客様やお客様のチームが変更を開発、追跡、公開するための便利で柔軟な方法を提供します。 有効にすると、パブリケーションはグローバルにアクティブ化され、どこからでもアクセスしてサポートされているエンティティを編集できます。

[$LIFERAY_LEARN_YOUTUBE_URL$]=https://www.youtube.com/embed/8N6djs7Gcs4

```{important}
ステージングとパブリケーションを同時に有効にすることはできません。 お客様のサイトでStagingが有効になっている場合、Publicationsを有効にする前にStagingを無効にする必要があります。 詳細については、 [Disabling Local Live Staging](../staging/configuring-local-live-staging.md#disabling-local-live-staging) および [Disabling Remote Live Staging](../staging/configuring-remote-live-staging.md#disabling-remote-live-staging) を参照してください。

[Workflow](../../../process-automation/workflow/introduction-to-workflow.md) は、Liferay 7.3 の Publications では使用できません。
```

## パブリケーションを有効にする方法

パブリケーションを有効にするには、次の手順に従います。

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 **アプリケーション** タブを開き、 **出版** をクリックします。

1. Toggle **Enable Publications** .

   ![スイッチを切り替えて、［保存］をクリックします。](./enabling-publications/images/01.png)

1. (オプション)**Sandbox Only** モードを切り替えます。 この機能を有効にすると、ユーザーがログインしたときに、最後に作業した出版物に自動的に誘導されます。 もし持っていない場合は、 `screen.name - date` の命名パターンを使って、その人のために新しい出版物が生成されます。 出版物テンプレートを使用すると、これらの自動生成出版物のデフォルト値を設定することができます。 詳しくは、 [「パブリケーションテンプレートの使用」](./using-publication-templates.md) をご覧ください。

   ```{tip}
   Sandbox Onlyを使用することで、本番での偶発的な編集を減らすことができます。
   ```

1. (オプション)**Allow Unapproved Changes** を有効にして、承認されていない変更を本番環境に公開することをユーザーに許可します。

1. **保存** をクリックして、設定を保存します。 出版物の申し込みページに遷移します。

有効化すると、Liferayインスタンスのどこからでもドロップダウンパブリケーションバーメニューにアクセスできるようになります。

![DXPインスタンスのどこからでもドロップダウンの［Publications］バーメニューにアクセスできます。](./enabling-publications/images/02.png)

このメニューを使用して、新しいパブリケーションを作成したり、作業するパブリケーションを選択したり、編集モードと本番環境モードを切り替えたり、現在のパブリケーションの変更を確認して公開したりできます。 個々のパブリケーションの作成、編集、および削除については、[パブリケーションの作成と管理](./creating-and-managing-publications.md)を参照してください。

## パブリケーションを無効にする方法

必要に応じて、［Publications］アプリケーションページからいつでもパブリケーションを無効にできます。

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 **アプリケーション** タブを開き、 **出版** をクリックします。

1. アプリケーションバーの「**アクション**」(![Actions Button](../../../images/icon-actions.png)) をクリックし、「**設定**」 を選択します。

   ![Publicationsアプリケーションを開き、「Actions」ボタンをクリックし、「Settings」を選択します。](./enabling-publications/images/03.png)

1. スイッチを切り替えて、パブリケーションを無効にします。

1. ［**Save**］ をクリックします。

```{important}
無効にすると、アクティブなすべてのパブリケーションが無効になり、スケジュールされたパブリケーションがキャンセルされ、パブリケーション履歴にアクセスできなくなります。 しかし、Liferayはインスタンスのパブリケーション履歴を保持するので、Publicationsを再度有効にすれば、再びアクセスすることができます。
```

## 7.3.xのパブリケーションの有効化

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 **アプリケーション** タブを開き、出版物の下の **設定** をクリックします。

   ![グローバルメニューで、「出版物」の「設定」をクリックします。](./enabling-publications/images/04.png)

1. スイッチを ［**Yes**］ に切り替えます。

1. **Submit** をクリックし、設定を保存します。

   または、「**保存して概要へ**」 をクリックすると、設定が保存され、Publicationsの概要ページにリダイレクトされます。

   ![ToggleをYesに設定し、SubmitまたはSave and Go to Overviewをクリックします。](./enabling-publications/images/05.png)

## 7.3.xのパブリケーションの無効化

必要に応じて、パブリケーションの ［**Settings**］ ページからいつでもパブリケーションを無効にできます。

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 **アプリケーション** タブを開き、出版物の下の **設定** をクリックします。

1. スイッチを ［**No**］ に切り替えます。

1. ［**Submit**］ をクリックします 。

```{important}
無効にすると、アクティブなすべてのパブリケーションが無効になり、スケジュールされたパブリケーションがキャンセルされ、パブリケーション履歴にアクセスできなくなります。 ただし、DXPはインスタンスのパブリケーション履歴を保持するため、パブリケーションを再度有効にすれば再度アクセスできます。
```

## 追加情報

* [パブリケーションの概要](../publications.md)
* [パブリケーションの作成と管理](./creating-and-managing-publications.md)
* [変更の作成と公開](./making-and-publishing-changes.md)
