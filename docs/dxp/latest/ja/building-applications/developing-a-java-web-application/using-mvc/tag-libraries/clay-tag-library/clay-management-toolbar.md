# Clay Management Toolbar

管理ツールバーを使用すると、管理者はアプリ内の検索コンテナの結果を制御できます。 検索結果のビュータイプをフィルタリング、並べ替え、選択できるため、ドキュメント、Webコンテンツ、アセットエントリーなど、探しているものをすばやく特定できます。 管理ツールバーは完全にカスタマイズ可能であるため、すべてのコントロールまたはアプリに必要なコントロールのみを実装できます。

![The Management ToolBar lets the user customize how the app displays content.](./clay-management-toolbar/images/01.png)

管理ツールバーを作成するには、`clay:management-toolbar` taglib を使います。 ツールバーには、いくつかの重要なセクションが含まれています。 各セクションは、さまざまな属性を使用してグループ化および構成されます。 これらの属性について、以下で詳しく説明します。

## 表示コンテキストを使用した管理ツールバーの構成

管理ツールバーの表示オプションを設定するための別のクラスであるDisplay Contextを使用している場合、ツールバーの設定オプションのすべてまたは一部を定義するために、`displayContext`属性でDisplay Contextを指定することができます。 例を以下に示します。

```jsp
<clay:management-toolbar 
    displayContext="<%= viewUADEntitiesManagementToolbarDisplayContext %>" 
/>
```

[Filtering and Sorting Items with the Management Toolbar](https://help.liferay.com/hc/ja/articles/360029526932-Filtering-and-Sorting-Items-with-the-Management-Toolbar) で、表示コンテキストの使用例を確認できます。 管理ツールバーの構成には、表示コンテキストは必要ありません。 表示コンテキストを介して、管理ツールバーの構成オプションを必要なだけ指定できます。

## チェックボックスとアクション

actionDropdownItems`、`itemsTotal`、`searchContainerId`、`selectable` 属性では、ツールバーにチェックボックスを追加して、すべての検索コンテナの結果を選択し、一括アクションを実行することができます。 アクションとアイテムの総数は、個々の結果がオンになっている場合、またはツールバーのマスターチェックボックスがオンになっている場合に表示されます。

`actionDropdownItems`：結果がチェックされたとき、または管理ツールバーのマスターチェックボックスがチェックされたときに表示されるドロップダウン項目のリスト。 ページ間で複数の結果を選択できます。 管理ツールバーは、選択された結果の数を記録します。

`itemsTotal`：ページネーションに含まれるアイテムの総数。 この数字は、1つまたは複数の項目が選択されている場合に表示される。

`searchContainerId`：管理ツールバーに接続されている検索コンテナのID。

`選択可能`：管理ツールバーにチェックボックスを含めるかどうか

以下に構成例を示します。

```jsp
actionDropdownItems="<%=
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

![Actions are also listed in the Management Toolbar's dropdown menu when an item, multiple items, or the master checkbox is checked.](./clay-management-toolbar/images/02.png)

上記の例の削除アクションやダウンロードアクションなど、アクションにアイコンが指定されている場合は、アクションメニューの横にもアイコンが表示されます。

![The Management Toolbar keeps track of the results selected and displays the actions to execute on them.](./clay-management-toolbar/images/03.png)

## 検索結果のフィルタリングとソート

`filterItems`属性、`sortingOrder`属性、`sortingURL`属性を使うと、検索コンテナの結果をフィルタリングしたりソートしたりすることができる。 フィルタリングとソートは、1つの便利なドロップダウンメニューにグループ化されています。

`filterItems`：検索コンテナのフィルタリングオプションを設定する。 このフィルターは、すべてのコントロールパネルアプリケーションに含まれている必要があります。 フィルタリングオプションには、ソート条件、ソート順序などを含めることができます。

`filterLabelItems`：表示する検索コンテナのフィルターラベルを設定する。 これにより、ユーザーは現在適用されているフィルターを把握できます。

`sortingOrder`：現在のソート順。昇順か降順か。

ソートURL`：ソート順を変更するためのURL

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

![You can also sort and filter search container results.](./clay-management-toolbar/images/04.png)

![You can also sort and filter search container results.](./clay-management-toolbar/images/05.png)

## 検索フォーム

`clearResultsURL`、`searchActionURL`、`searchFormName`、`searchInputName`、`searchValue` 属性で検索フォームを設定することができる。 管理ツールバーの主要部分は、検索フォーム用に予約されています。

`clearResultsURL`：検索結果をリセットするURL

`searchActionURL`：検索フォームを送信するアクションの URL

検索フォーム名`：検索フォームの名前

`searchInputName`：検索入力の名前

検索値`：検索入力の値

以下に構成例を示します。

```jsp
<clay:management-toolbar
    clearResultsURL="<%= searchURL %>"
    disabled="<%= isDisabled %>"
    itemsTotal="<%= itemsTotal %>"
    namespace="<%= renderResponse.getNamespace() %>"
    searchActionURL="<%= searchURL %>"
    searchFormName="fm"
    searchInputName="<%= DisplayTerms.KEYWORDS %>"
    searchValue="<%= ParamUtil.getString(request, searchInputName) %>"
    selectable="<%= false %>"
/>
```

![The search form comprises most of the Management Toolbar, letting users search through the search container results.](./clay-management-toolbar/images/06.png)

## 情報パネル

`infoPanelId`属性と `showInfoButton` 属性を使うと、検索コンテナの結果に関連する追加情報を表示する開閉可能なサイドバーパネルを追加することができます。

`infoPanelId`：トグルする情報パネルのID

`showInfoButton`：情報ボタンを表示するかどうか

以下の設定例では、`showInfoButton` 属性は `displayContext` 属性で指定された Display Context で提供され、`infoPanelId` は JSP で明示的に設定される：

```jsp
<clay:management-toolbar
    displayContext="<%= journalDisplayContext %>"
    infoPanelId="infoPanelId"
    namespace="<%= renderResponse.getNamespace() %>"
    searchContainerId="<=% searchContainerId %>"
/>
```

![The info panel keeps your UI clutter-free.](./clay-management-toolbar/images/07.png)

## 表示タイプ

`viewTypes` 属性は検索コンテナの結果の表示オプションを指定する。 選択できる表示オプションは3つあります。

**カード:** 検索結果の列を横または縦のカードに表示します。

![The Management Toolbar's icon display view gives a quick summary of the content's description and status.](./clay-management-toolbar/images/08.png)

**List:** 検索結果の列の要約された詳細とともに詳細な説明を表示します。

![The Management Toolbar's List view type gives the content's full description.](./clay-management-toolbar/images/09.png)

**テーブル：** デフォルトのビュー。 検索結果の列を左から右に一覧表示します。

![The Management Toolbar's Table view type list the content's information in individual columns.](./clay-management-toolbar/images/10.png)

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

![The Management Toolbar offers three view type options.](./clay-management-toolbar/images/11.png)

## 作成メニュー

`creationMenu`属性は、1つまたは複数の項目のメニュー追加ボタンを作成します。 これは、新しいエンティティ（新しいブログエントリなど）を作成するために使用されます。

トップレベルの項目をドロップダウンメニューに追加するには `addPrimaryDropdownItem()` メソッドを、セカンダリの項目をドロップダウンメニューに追加するには `addFavoriteDropdownItem()` メソッドを使用します。

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

![The Management Toolbar lets you optionally add a Creation Menu for creating new entities.](./clay-management-toolbar/images/12.png)

## 関連トピック

* [ドロップダウンメニューとアクションメニュー](./clay-dropdown-and-action-menus.md) 
* [クレイ・アイコン](./clay-icons.md) 
* [クレイ・ナビゲーション・バー](./clay-navigation-bars.md) 
