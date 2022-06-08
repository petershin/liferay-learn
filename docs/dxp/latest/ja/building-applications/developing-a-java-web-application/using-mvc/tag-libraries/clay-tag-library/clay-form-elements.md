# Clayフォーム要素

Liferay Clayタグライブラリは、フォーム要素を作成するためのいくつかのタグを提供します。 以下に各タグの例を示します。

## チェックボックス

チェックボックスは、ユーザーにtrueまたはfalseの入力を提供します。

```jsp  
<clay:checkbox 
        checked="<%= true %>" 
        hideLabel="<%= true %>" 
        label="My Input" 
        name="name" 
/>
```

属性:

**checked:** チェックボックスがオンになっているかどうか

**disabled:** チェックボックスが有効になっているかどうか

**hideLabel:** チェックボックスラベルを表示するかどうか

**indeterminate:** 複数選択用のチェックボックス変数

**label:** チェックボックスのラベル

**name:** チェックボックスの名前

![Clay taglibはチェックボックスを提供します。](./clay-form-elements/images/01.png)

## ラジオ

ラジオボタンを使用すると、ユーザーはフォーム内の一連のオプションから1つの選択肢を選択できます。

```jsp
<clay:radio 
        checked="<%= true %>" 
        hideLabel="<%= true %>" 
        label="My Input" 
        name="name" 
/>
```

属性:

**checked:** ラジオボタンがオンになっているかどうか

**hideLabel:** ラジオボタンラベルを表示するかどうか

**disabled:** ラジオボタンが有効になっているかどうか

**label:** ラジオボタンのラベル

**name:** ラジオボタンの名前

![Clay taglibはラジオボタンを提供します。](./clay-form-elements/images/02.png)

## セレクター

セレクターは、ユーザーが選択できる一連のオプションを備えたセレクトボックスを提供します。

以下のJavaスクリプトレットは、セレクター用に8つのダミーオプションを作成します。

```java
<%
List<Map<String, Object>> options = new ArrayList<>();

for (int i = 0; i < 8; i++) {
    Map<String, Object> option = new HashMap<>();

    option.put("label", "Sample " + i);
    option.put("value", i);

    options.add(option);
}
%>
```

```jsp
<clay:select 
        label="Regular Select Element" 
        name="name" 
        options="<%= options %>" 
/>
```

![Clay taglibは選択ボックスを提供します。](./clay-form-elements/images/03.png)

ユーザーが一度に複数のオプションを選択できるようにする場合は、`multiple`属性を`true`に設定します。

```jsp
<clay:select 
        label="Multiple Select Element" 
        multiple="<%= true %>" 
        name="name" 
        options="<%= options %>" 
/>
```

![ユーザーが選択メニューから複数のオプションを選択できるようにすることができます。](./clay-form-elements/images/04.png)

属性:

**disabled:** セレクターが有効かどうか **label:** セレクターのラベル **multiple:** 複数のオプションを選択できるかどうか **name:** セレクターの名前

これで、Clay taglibを使用して、アプリに一般的なフォーム要素を追加する方法がわかりました。

## 関連トピック

* [Clayボタン](./clay-buttons.md)
* [Clayアイコン](./clay-icons.md)
* [Clayラベルとリンク](./clay-links-and-labels.md)