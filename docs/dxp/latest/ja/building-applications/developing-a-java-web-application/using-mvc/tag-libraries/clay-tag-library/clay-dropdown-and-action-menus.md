# Clayドロップダウンメニューとアクションメニュー

ドロップダウンメニューは、`clay:dropdown-menu` taglibおよび`clay:actions-menu` taglibを介してアプリに追加できます。 Clay taglibは、選択できるいくつかのメニューバリエーションを提供します。 両方のtaglibをいくつかの例とともに以下に示します。

## ドロップダウンメニュー

基本的なドロップダウンメニュー：

```jsp
<clay:dropdown-menu
    items="<%= dropdownsDisplayContext.getDefaultDropdownItems() %>"
    label="Default"
/>
```

![Clay taglibは、アプリにドロップダウンメニューを追加するために必要なものを提供します。](./clay-dropdown-and-action-menus/images/01.png)

ドロップダウンメニューの項目は、そのJavaクラス（この場合は`dropdownDisplayContext`）で定義されます。 メニュー項目は`NavigationItem`オブジェクトです。 `setDisabled(true)`メソッドを使用してメニュー項目を無効にし、`setActive(true)`メソッドを使用してメニュー項目を有効にすることができます。 `href`属性は`setHref()`メソッドで設定され、ラベルは`setLabel()`メソッドで定義されます。  `dropdownDisplayContext`クラスの実装例を次に示します。

```java
if (_defaultDropdownItems != null) {
  return _defaultDropdownItems;
}

_defaultDropdownItems = new ArrayList<>();

for (int i = 0; i < 4; i++) {
  NavigationItem navigationItem = new NavigationItem();

  if (i == 1) {
    navigationItem.setDisabled(true);
  }
  else if (i == 2) {
    navigationItem.setActive(true);
  }

  navigationItem.setHref("#" + i);
  navigationItem.setLabel("Option " + i);

  _defaultDropdownItems.add(navigationItem);
}

return _defaultDropdownItems;
}
```

`NavigationItem`のタイプを`TYPE_GROUP`に設定し、項目を個別の`ArrayList`にネストすることで、メニュー項目をグループにまとめることができます。 `setSeparator(true)`メソッドを使用して、グループを視覚的に分離するための水平セパレータを追加できます。 以下は、`dropdownsDisplayContext`クラスのコードスニペットです。

```java
group1NavigationItem.setSeparator(true);
group1NavigationItem.setType(NavigationItem.TYPE_GROUP);
```

対応するtaglib：

```jsp
<clay:dropdown-menu
    items="<%= dropdownsDisplayContext.getGroupDropdownItems() %>"
    label="Dividers"
/>
```

![ドロップダウンメニュー項目をグループにまとめることができます。](./clay-dropdown-and-action-menus/images/02.png)

ドロップダウンメニューに入力を追加することもできます。 ドロップダウンメニューに入力を追加するには、`setType()`メソッド（`NavigationItem.TYPE_CHECKBOX`など）を使用して入力のタイプを設定し、`setInputName()`メソッドを使用して名前を設定し、`setInputValue()`メソッドを使用して値を設定します。 以下に実装例を示します。

```java
navigationItem.setInputName("checkbox" + i);
navigationItem.setInputValue("checkboxValue" + i);
navigationItem.setLabel("Group 1 - Option " + i);
navigationItem.setType(NavigationItem.TYPE_CHECKBOX);
```

対応するtaglib：

```jsp
<clay:dropdown-menu
    buttonLabel="Done"
    items="<%= dropdownsDisplayContext.getInputDropdownItems() %>"
    label="Inputs"
    searchable="<%= true %>"
/>
```

![入力はドロップダウンメニューに含めることができます。](./clay-dropdown-and-action-menus/images/03.png)

メニュー項目にアイコンを含めることもできます。 メニュー項目にアイコンを追加するには、`setIcon()`メソッドを使用します。 以下に例を示します。

```java
navigationItem.setIcon("check-circle-full")
```

対応するtaglib：

```jsp
<clay:dropdown-menu
    items="<%= dropdownsDisplayContext.getIconDropdownItems() %>"
    itemsIconAlignment="left"
    label="Icons"
/>
```

![ドロップダウンメニューにアイコンを含めることができます。](./clay-dropdown-and-action-menus/images/04.png)

## アクションメニュー

基本アクションメニュー：

```jsp
<clay:dropdown-actions
    items="<%= dropdownsDisplayContext.getDefaultDropdownItems() %>"
/>
```

![Clay taglibを使用してアクションメニューを作成することもできます。](./clay-dropdown-and-action-menus/images/05.png)

アクションメニューでは、ユーザーにヘルプテキストを表示することもできます。

```
<clay:dropdown-actions
    buttonLabel="More"
    buttonStyle="secondary"
    caption="Showing 4 of 32 Options"
    helpText="You can customize this menu or see all you have by pressing \"more\"."
    items="<%= dropdownsDisplayContext.getDefaultDropdownItems() %>"
/>
```

![アクションメニューでヘルプテキストを提供できます。](./clay-dropdown-and-action-menus/images/06.png)

Clay taglibを使用すると、アプリにドロップダウンメニューとアクションメニューを簡単に追加できます。

## 関連トピック

* [Clay Form Elements](./clay-form-elements.md)
* [Clay Navigation Bars](./clay-navigation-bars.md)
* [Clay Progress Bars](./clay-progress-bars.md)