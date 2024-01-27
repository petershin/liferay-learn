# 数式フィールド

{bdg-secondary}`Liferay 7.4 2023.Q4+/GA107+`

数式フィールドは、オブジェクト定義の数値フィールドを使用して計算された読み取り専用の値を格納します。 使用例としては、保留中のリクエストを差し引いた後の従業員の利用可能なPTO時間の計算、注文の合計に基づく代理店の手数料の計算などがあります。

フィールドの作成時に、フィールドの値を整数として保存するか、10進数として保存するかを決定できます。 フィールドを作成した後、フィールドを編集して値を計算する数式を定義する必要があります。 使用可能な関数は、加算(`+`)、減算(`-`)、乗算(`*`)、除算(`/`)である。 これらの関数は、オブジェクト内のすべての整数、長整数、10進数、高精度10進数フィールドで使用できます。

![Determine the formula used for the field.](./formula-fields/images/01.png)

例えば、`totalRevenue`（精度は10進数）と`totalExpenses`（精度は10進数）という2つの数値フィールドを持つシナリオを考えてみよう。 この式を数式フィールドに追加して、純利益を計算することができます：

```
totalRevenue - totalExpenses
```

![Calculate the net profit.](./formula-fields/images/02.png)

さらに、この式で数式フィールドを追加して、利益率を計算することもできる：

```
(totalRevenue - totalExpenses) / totalRevenue * 100
```

![Calculate the profit margin.](./formula-fields/images/03.png)

数式フィールドの値は、エントリが作成または更新されるたびに、これらの式を使用して動的に設定されます。

![Formula field values are set dynamically.](./formula-fields/images/04.png)

## 関連トピック

* [オブジェクトへのフィールドの追加](./adding-fields-to-objects.md) 
* [集計フィールド](./aggregation-fields.md) 
<!-- * [Numeric Fields](./numeric-fields.md) -->
