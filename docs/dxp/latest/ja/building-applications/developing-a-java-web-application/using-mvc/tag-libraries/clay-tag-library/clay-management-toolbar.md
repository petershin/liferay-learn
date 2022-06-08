# Clay管理ツールバー

管理ツールバーを使用すると、管理者はアプリ内の検索コンテナの結果を制御できます。 検索結果のビュータイプをフィルタリング、並べ替え、選択できるため、ドキュメント、Webコンテンツ、アセットエントリーなど、探しているものをすばやく特定できます。 管理ツールバーは完全にカスタマイズ可能であるため、すべてのコントロールまたはアプリに必要なコントロールのみを実装できます。

![管理ツールバーを使用すると、ユーザーはアプリがコンテンツを表示する方法をカスタマイズできます。](./clay-management-toolbar/images/01.png)

管理ツールバーを作成するには、`clay:management-toolbar` taglibを使用します。 ツールバーには、いくつかの重要なセクションが含まれています。 各セクションは、さまざまな属性を使用してグループ化および構成されます。 これらの属性について、以下で詳しく説明します。

## 表示コンテキストを使用した管理ツールバーの構成

表示コンテキスト（管理ツールバーの表示オプションを構成するための別個のクラス）を使用している場合、ツールバーの構成オプションのすべてまたは一部を定義するために、`displayContext`属性を使用して表示コンテキストを指定できます。 例を以下に示します。

```jsp
<clay:management-toolbar 
    displayContext="<%= viewUADEntitiesManagementToolbarDisplayContext %>" 
/>
```

[Filtering and Sorting Items with the Management Toolbar](https://help.liferay.com/hc/ja/articles/360029526932-Filtering-and-Sorting-Items-with-the-Management-Toolbar) で、表示コンテキストの使用例を確認できます。 管理ツールバーの構成には、表示コンテキストは必要ありません。 表示コンテキストを介して、管理ツールバーの構成オプションを必要なだけ指定できます。

## チェックボックスとアクション

`actionItems`、`searchContainerId`、`selectable`、および`totalItems`属性を使用すると、ツールバーにチェックボックスを含めて、すべての検索コンテナの結果を選択し、それらに対して一括アクションを実行できます。 アクションとアイテムの総数は、個々の結果がオンになっている場合、またはツールバーのマスターチェックボックスがオンになっている場合に表示されます。

`actionItems`：1つの結果がオンになっている場合、または管理ツールバーのマスターチェックボックスがオンになっている場合に表示されるドロップダウンアイテムのリスト。 ページ間で複数の結果を選択できます。 管理ツールバーは、選択された結果の数を記録します。

`searchContainerId`：管理ツールバーに接続されている検索コンテナのID

`selectable`：管理ツールバーにチェックボックスを含めるかどうか

`totalItems`：ページネーション全体のアイテムの総数。 この数字は、1つまたは複数のアイテムが選択されたときに表示されます。

以下に構成例を示します。

```jsp
actionItems="<%=
    new JSPDropdownItemList(pageContext) {
        {
          add(
            dropdownItem -> {
              dropdownItem.setHref("#edit");
              dropdownItem.setLabel("Edit");
            });

          add(
            dropdownItem -> {
              dropdownItem.setHref("#download");
              dropdownItem.setIcon("download");
              dropdownItem.setLabel("Download");
              dropdownItem.setQuickAction(true);
            });

          add(
            dropdownItem -> {
              dropdownItem.setHref("#delete");
              dropdownItem.setLabel("Delete");
              dropdownItem.setIcon("trash");
              dropdownItem.setQuickAction(true);
            });
        }
    }
%>"
```

アクションアイテムは、ページネーション全体で選択されたアイテムの数とともに、［Actions］メニューに一覧表示されます。

![アイテム、複数のアイテム、またはマスターチェックボックスがオンになっている場合、アクションは管理ツールバーのドロップダウンメニューにも表示されます。](./clay-management-toolbar/images/02.png)

上記の例の削除アクションやダウンロードアクションなど、アクションにアイコンが指定されている場合は、アクションメニューの横にもアイコンが表示されます。

![管理ツールバーは、選択された結果を追跡し、それらに対して実行するアクションを表示します。](./clay-management-toolbar/images/03.png)

## 検索結果のフィルタリングとソート

`filterItems`、`sortingOrder`、および`sortingURL`属性を使用すると、検索コンテナの結果をフィルタリングしたりソートしたりできます。 フィルタリングとソートは、1つの便利なドロップダウンメニューにグループ化されています。

`filterItems`：検索コンテナのフィルタリングオプションを設定します。 このフィルターは、すべてのコントロールパネルアプリケーションに含まれている必要があります。 フィルタリングオプションには、ソート条件、ソート順序などを含めることができます。

`filterLabelItems`：表示する検索コンテナのフィルターラベルを設定します。 これにより、ユーザーは現在適用されているフィルターを把握できます。

`sortingOrder`：現在のソート順序（昇順または降順）。

`sortingURL`：ソート順を変更するURL

次の例では、2つのフィルターオプションと2つのソートオプションを追加しています。

```jsp
filterItems="<%=
    new DropdownItemList(_request) {
        {
            addGroup(
                dropdownGroupItem -> {
                    dropdownGroupItem.setDropdownItemList(
                        new DropdownItemList(_request) {
                            {
                                add(
                                    dropdownItem -> {
                                        dropdownItem.setHref("#1");
                                        dropdownItem.setLabel("Filter 1");
                                    });

                                add(
                                    dropdownItem -> {
                                        dropdownItem.setHref("#2");
                                        dropdownItem.setLabel("Filter 2");
                                    });
                            }
                        }
                    );
                    dropdownGroupItem.setLabel("Filter By");
                });

            addGroup(
                dropdownGroupItem -> {
                    dropdownGroupItem.setDropdownItemList(
                        new DropdownItemList(_request) {
                            {
                                add(
                                    dropdownItem -> {
                                        dropdownItem.setHref("#3");
                                        dropdownItem.setLabel("Order 1");
                                    });

                                add(
                                    dropdownItem -> {
                                        dropdownItem.setHref("#4");
                                        dropdownItem.setLabel("Order 2");
                                    });
                            }
                        }
                    );
                    dropdownGroupItem.setLabel("Order By");
                });
        }
    }
%>"
```

```jsp
filterLabelItems="<%=
  new LabelItemList() {
    {
      add(
        labelItem -> {
          labelItem.setLabel("Filter 1");
        });

      add(
        labelItem -> {
          labelItem.setLabel("Filter 2");
        });
    }
  };
%>"
```

![検索コンテナの結果を並べ替えてフィルタリングすることもできます。](./clay-management-toolbar/images/04.png)

![検索コンテナの結果を並べ替えてフィルタリングすることもできます。](./clay-management-toolbar/images/05.png)

## 検索フォーム

`clearResultsURL`、`searchActionURL`、`searchFormName`、`searchInputName`、および`searchValue`属性を使用すると、検索フォームを構成できます。 管理ツールバーの主要部分は、検索フォーム用に予約されています。

`clearResultsURL`：検索をリセットするためのURL

`searchActionURL`：検索フォームを送信するアクションURL

`searchFormName`：検索フォームの名前

`searchInputName`：検索入力の名前

`searchValue`：検索入力の値

以下に構成例を示します。

```jsp
<clay:management-toolbar
    clearResultsURL="<%= searchURL %>"
    disabled="<%= isDisabled %>"
    namespace="<%= renderResponse.getNamespace() %>"
    searchActionURL="<%= searchURL %>"
    searchFormName="fm"
    searchInputName="<%= DisplayTerms.KEYWORDS %>"
    searchValue="<%= ParamUtil.getString(request, searchInputName) %>"
    selectable="<%= false %>"
    totalItems="<%= totalItems %>"
/>
```

![検索フォームは管理ツールバーの大部分を構成し、ユーザーは検索コンテナの結果を検索できます。](./clay-management-toolbar/images/06.png)

## 情報パネル

`infoPanelId`属性と`showInfoButton`属性を使用すると、検索コンテナの結果に関連する追加情報を表示する格納式のサイドバーパネルを追加できます。

`infoPanelId`：切り替える情報パネルのID

`showInfoButton`：情報ボタンを表示するかどうか

以下の構成例では、`showInfoButton`属性は表示コンテキスト（`displayContext`属性で指定）で提供され、`infoPanelId`はJSPで明示的に設定されます。

```jsp
<clay:management-toolbar
    displayContext="<%= journalDisplayContext %>"
    infoPanelId="infoPanelId"
    namespace="<%= renderResponse.getNamespace() %>"
    searchContainerId="<=% searchContainerId %>"
/>
```

![情報パネルでUIがすっきりと表示されます。](./clay-management-toolbar/images/07.png)

## 表示タイプ

`viewTypes`属性は、検索コンテナの結果の表示オプションを指定します。 選択できる表示オプションは3つあります。

**カード：** 横型または縦型のカードに検索結果の列を表示します。

![管理ツールバーのアイコン表示ビューには、コンテンツの説明とステータスの概要が表示されます。](./clay-management-toolbar/images/08.png)

**リスト：** 検索結果の列に関する詳細な説明と要約された詳細を表示します。

![管理ツールバーのリスト表示タイプは、コンテンツの詳細な説明を提供します。](./clay-management-toolbar/images/09.png)

**テーブル：** デフォルトビュー。 検索結果の列を左から右に一覧表示します。

![管理ツールバーのテーブル表示タイプには、コンテンツの情報が個々の列に一覧表示されます。](./clay-management-toolbar/images/10.png)

以下に構成例を示します。

```jsp
viewTypes="<%=
    new JSPViewTypeItemList(pageContext, baseURL, selectedType) {
        {
            addCardViewTypeItem(
                viewTypeItem -> {
                    viewTypeItem.setActive(true);
                    viewTypeItem.setLabel("Card");
                });

            addListViewTypeItem(
                viewTypeItem -> {
                    viewTypeItem.setLabel("List");
                });

            addTableViewTypeItem(
                viewTypeItem -> {
                    viewTypeItem.setLabel("Table");
                });
        }
    }
%>"
```

上記の例は、JSPで表示タイプを設定する方法を示していますが、 [各表示タイプをいつ使用するかも指定する](https://help.liferay.com/hc/ja/articles/360029848351-Implementing-the-View-Types) 必要があります。

![管理ツールバーには、3つの表示タイプオプションがあります。](./clay-management-toolbar/images/11.png)

## 作成メニュー

`creationMenu`属性は、1つまたは複数のアイテムに対し［メニューを追加］ボタンを作成します。 これは、新しいエンティティ（新しいブログエントリなど）を作成するために使用されます。

`addPrimaryDropdownItem()`メソッドを使用して一番上のレベルのアイテムをドロップダウンメニューに追加するか、`addFavoriteDropdownItem()`メソッドを使用してセカンダリアイテムをドロップダウンメニューに追加します。

以下の構成例では、2つのプライマリ作成メニュー項目と2つのセカンダリ作成メニュー項目が追加されています。

```jsp
creationMenu="<%= 
    new JSPCreationMenu(pageContext) {
            {
                addPrimaryDropdownItem(
                    dropdownItem -> {
                        dropdownItem.setHref("#1");
                        dropdownItem.setLabel("Sample 1");
                    });

                addPrimaryDropdownItem(
                    dropdownItem -> {
                        dropdownItem.setHref("#2");
                        dropdownItem.setLabel("Sample 2");
                    });

                addFavoriteDropdownItem(
                    dropdownItem -> {
                        dropdownItem.setHref("#3");
                        dropdownItem.setLabel("Favorite 1");
                    });

                addFavoriteDropdownItem(
                    dropdownItem -> {
                        dropdownItem.setHref("#4");
                        dropdownItem.setLabel("Other item");
                    });
            }
    };
%>"
```

![管理ツールバーを使用すると、オプションで、新しいエンティティを作成するための作成メニューを追加できます。](./clay-management-toolbar/images/12.png)

## 関連トピック

* [Clayドロップダウンメニューとアクションメニュー](./clay-dropdown-and-action-menus.md)
* [Clayアイコン](./clay-icons.md)
* [Clayナビゲーションバー](./clay-navigation-bars.md)