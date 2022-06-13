# テンプレートへのウィジェットの埋め込み

ウィジェットはWebコンテンツテンプレートに埋め込むことができます。コアアプリ、カスタムアプリ、インスタンス化可能、インスタンス化不可能であるかどうかは関係ありません。 以下は、FreeMarkerにWebコンテンツウィジェットを埋め込む例です。

```markup
<@liferay_portlet["runtime"] portletName="com_liferay_journal_content_web_portlet_JournalContentPortlet" />
```

Webコンテンツテンプレートへのウィジェットの埋め込みを開始するには、次の手順に従います。

1. サイト（この例ではデフォルトのDXPサイト）の **サイト管理** に移動します。
1. ［**コンテンツ&データ**］ &rarr; ［**Webコンテンツ**］ をクリックします。
1. ［**テンプレート**］ タブをクリックします。

    ![ [テンプレート]タブには、サイトのテンプレートが表示されます。](./embedding-widgets-in-templates/images/01.png)

1. 追加（![Add Icon](../../../images/icon-add.png)）アイコンをクリックします。
1. テンプレートの名前を入力します（たとえば、 **テンプレート1**）
1. ［**Properties**］ セクションから ［**選択**］ をクリックして、ストラクチャーを選択します（たとえば、 **ストラクチャー1**）。

    ![ストラクチャーを選択します。](./embedding-widgets-in-templates/images/02.png)

1. マクロ（たとえば`<@liferay_portlet["runtime"] portletName="com_liferay_journal_content_web_portlet_JournalContentPortlet" />`）をテンプレートエディタに貼り付けます。 ポートレットがインスタンス化可能かどうかによっては、ポートレットIDの入力が必要になる場合があります。

    ![ポートレットマクロを入力します。](./embedding-widgets-in-templates/images/03.png)

1. 完了したら、 ［**保存**］ をクリックします。

```{important}
FreeMarker のコンテキストに `theme` 変数が注入されなくなりました。 DXP 7.0 でテーマ変数が削除された理由と、コードの更新に関する提案については、 [Taglibs Are No Longer Accessible via theme Variable in FreeMarker](https://help.liferay.com/hc/articles/360017892092-Introduction-to-Breaking-Changes-#taglibs-are-no-longer-accessible-via-the-theme-variable-in-freemarker) breaking change エントリをご覧ください。
```

## 他のテンプレートの埋め込み

テンプレートにウィジェットを埋め込むことに加えて、別のテンプレート内にテンプレートを埋め込むことができます。 これにより、再利用可能なコード、JavaScriptライブラリのインポート、スクリプト、またはマクロが可能になります。

以下は、FreeMarkerにテンプレートを埋め込む例です。

```markup
<#include "${templatesPath}/[template-key]" />
```

以前に公開されたテンプレートを編集するときに、 **テンプレートキー** を確認できます。

![テンプレートの編集ページを表示すると、テンプレートキーを確認できます。](./embedding-widgets-in-templates/images/04.png)

## 追加情報

* [Embedding a Portlet by Portlet Name](https://help.liferay.com/hc/articles/360028746512-Embedding-a-Portlet-by-Portlet-Name)
