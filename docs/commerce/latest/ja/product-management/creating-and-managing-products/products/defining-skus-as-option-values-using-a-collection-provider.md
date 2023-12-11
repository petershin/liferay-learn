# コレクションプロバイダーを使用したオプション値としてのSKUの定義

商品のオプションを設定する際、コレクションプロバイダとして1つまたは複数のカテゴリを指定できます。 これを使用して、独自のカスタムロジックを定義し、SKUのグループを商品のオプション値としてリンクすることができます。

例えば、互いに関連性のない2つの製品を考えてみよう。 これらを商品オプションとして追加するには、カテゴリーを作成し、それをこれら2つの商品にリンクし、そのカテゴリーを新しい商品のコレクションプロバイダとして使用します。

```{note}
グローバル・スコープでカテゴリーを作成し、製品で使用できるようにする必要があります。
```
## コレクション・プロバイダーとしてのカテゴリーの選択

カテゴリの作成と商品への割り当ての詳細については、 [新しい商品カテゴリを作成する](https://learn.liferay.com/w/commerce/product-management/creating-and-managing-products/products/creating-a-new-product-category) および [商品カテゴリでカタログを整理する](https://learn.liferay.com/w/commerce/product-management/creating-and-managing-products/products/organizing-your-catalog-with-product-categories) を参照してください。

カテゴリーを作成し、商品に割り当てたら、

1. *グローバルメニュー* ([アプリケーションメニューアイコン](../../../images/icon-applications-menu.png))を開き、_Commerce_ &rarr; _Products_に移動します。

1. コレクションプロバイダとしてカテゴリを追加したい製品を見つけて選択します。

1. *オプション*タブをクリックします。

1. オプションの名前を入力し、_Create New_をクリックする。

   ![Create a new option on the selected product.](./using-categories-as-a-collection-provider-for-skus-as-options/images/01.png)

   これで新しいオプションが作成され、商品に割り当てられる。 ここで、新しいオプションを選択する。 あるいは、すでにオプション・テンプレートが作成されている場合は、それを選択する。

1. *外部定義*トグルを有効にする。

1. Price Type_ドロップダウンを*Dynamic*に設定します。

1. ［_Save_］をクリックします。

   これにより、_価格タイプ_ドロップダウンの下に、コレクションプロバイダーとカテゴリーを定義するための2つの新しいドロップダウンが追加されます。

1. コレクションプロバイダとして _SKUs by Categories_ を選択します。

1. ［_Save_］をクリックします。

1. カテゴリのドロップダウンから、1つまたは複数のカテゴリを選択します。

    ![Choose the categories to add associated SKUs as option values.](./using-categories-as-a-collection-provider-for-skus-as-options/images/02.png)

1. ［_Save_］をクリックします。

    これにより、選択されたカテゴリーがオプション値としてSKUに入力されます。

```{important}
外部でオプションを定義する前に、製品にアクティブなSKUが1つ必要です。 現在、複数SKU商品を外部オプションとして追加することはできません。
```