# 式ビルダーバリデーションのリファレンス

{bdg-secondary}`Liferay 7.4 U27以降とGA27以降で利用可能`

カスタムオブジェクトでは、Liferayの式ビルダーを使用してフィールドのバリデーションを作成できます。 このツールには、定義済みのフィールド、演算子、関数を使用して複雑なバリデーションルールを迅速に定義するための統合エディターがあります。 利用可能なエレメントは、条件サイドパネルで閲覧できます。

```{important}
式ビルダーバリデーションは、テキスト、数値、日付、ブール値の各フィールドタイプでのみ使用可能です。
```

## テキスト項目

Liferayは、テキストおよび長いテキストフィールドに対して以下の演算子および関数を提供します。 これらのフィールドのいずれかを引数として使用できます。 いくつかの要素では、フィールドの値と比較するためのString値を追加することもできます（例： `"foo"`、`"[A-Za-z]{1,50}"`）。

### 連結

複数の文字列またはテキストフィールドを結合して、他の検証関数で使用できる単一の文字列を返します。

```
concat(<textField>, "<string>")
```

### Condition (with Text)

Check if user input meets one or more conditions and return a boolean value. This function works like `if` statements. Each expression includes at least one `<condition>` (e.g., `<textField> == "foo"`) and returns `true` or `false`. You can add multiple conditions to the same expression and determine a return value if none of the conditions are met (e.g., `<textField> == "foo", <textField> == "bar", true, false`).

```
condition(<condition>, <return-value>)
```

### Contains (with Text)

テキストフィールドが特定のString値を含んでいるかどうかを確認し、ブール値を返します。 If the field *does not* contain the value, it returns `false`.

```
contains(<textField>, "<string>")
```

### Does Not Contain (with Text)

テキストフィールドが特定のString値を含んでいるかどうかを確認し、ブール値を返します。  If the field *does* contain the value, it returns `false`.

```
NOT(contains(<textField>, "<string>"))
```

### URL である

テキストフィールドがURLであるかどうかを確認し、ブール値を返します。 If the field does not match a URL pattern, it returns `false`. To return `true`, entries must use standard URL elements (e.g., `http`, `://`, `.com`)

```
isURL(<textField>)
```

### メールアドレスである

テキストフィールドがメールアドレスであるかどうかを確認し、ブール値を返します。 If the field does not match a specific email or email pattern, it returns `false`. To return `true`, entries must use standard email elements (e.g., `@gmail`, `.com`)

```
isEmailAddress(<textField>)
```

### が空の場合

テキストフィールドが空であるかどうかを確認し、ブール値を返します。  If the field is not empty, it returns `false`.

```
isEmpty(<textField>)
```

### Is Equal To (with Text)

テキストフィールドが特定のString値に等しいかどうかを確認し、ブール値を返します。 If they *are not* equal, it returns `false`.

```
<textField> == "<string>"
```

### Is Not Equal To (with Text)

テキストフィールドが特定のString値と異なるかどうかを確認し、ブール値を返します。 If they *are* equal, it returns `false`.

```
<textField> != "<string>"
```

### 一致

テキストフィールドが特定のString値または正規表現と一致するかどうかを確認し、ブール値を返します。 If the field does not match the value, it returns `false`.

```
match(<textField>, "<string>")

match(<textField>, "<regex>")
```

## 数値フィールド

Liferayでは、整数、長整数、小数、小数の精度フィールドに対して以下の演算子や関数を提供します。 これらのフィールドのいずれかを引数として使用できます。 いくつかの要素では、フィールドの値と比較するための数値を追加することもできます（例：`123`、 `3.1415`）。

### Condition (with Numeric)

Check if user input meets one or more conditions and return a boolean value. This function works like `if` statements. Each expression includes at least one `<condition>` (e.g., `<numericField> == 10`) and returns `true` or `false`. You can add multiple conditions to the same expression and determine a return value if none of the conditions are met (e.g., `<numericField> == 10, <numericField> != 100, true, false`).

```
condition(<condition>, <return-value>)
```

### Contains (with Numeric)

数値フィールドが特定の数値を含んでいるかどうかを確認し、ブール値を返します。 If the field *does not* contain the value, it returns `false`.

```
contains(<numericField>, <number>)
```

### Does not Contain (with Numeric)

数値フィールドが特定の数値を含んでいるかどうかを確認し、ブール値を返します。 If the field *does* contain the value, it returns `false`.

```
NOT(contains(<numericField>, <number>))
```

### 小数である

数値フィールドが小数であるかどうかを確認し、ブール値を返します。 If the field *is not* a decimal, it returns `false`.

```
isDecimal(<numericField>)
```

### 整数である

数値フィールドが整数であるかどうかを確認し、ブール値を返します。 If the field *is not* an integer, it returns `false`.

```
isInteger(<numericField>)
```

### Is Equal To (with Numeric)

数値フィールドが特定の数値に等しいかどうかを確認し、ブール値を返します。 If they *are not* equal, it returns `false`.

```
<numericField> == <number>
```

### Is Not Equal To (with Numeric)

数値フィールドが特定の数値と異なるかどうかを確認し、ブール値を返します。 If they *are* equal, it returns `false`.

```
<numericField> != <number>
```

### 以上

数値フィールドが特定の数値より大きいかどうかを確認し、ブール値を返します。 If the field *is not* greater, it returns `false`.

```
<numericField> > <number>
```

### 以上もしくは等しい

数値フィールドが特定の数値以上もしくは等しいかどうかを確認し、ブール値を返します。 If the field *is not* equal or greater, it returns `false`.

```
<numericField> >= <number>
```

### 以下

数値フィールドが特定の数値以下かどうかを確認し、ブール値を返します。 If the field *is not* less, it returns `false`.

```
<numericField> < <number>
```

### 以下もしくは等しい

数値フィールドが特定の数値以下もしくは等しいかどうかを確認し、ブール値を返します。 If the field *is not* equal or less, it returns `false`.

```
<numericField> <= <number>
```

### 合計

複数の数値フィールドをまとめて追加し、他の検証関数で使用可能な単一の数値を返します。

```
sum(<numericField>, <numericField>)
```

## 日付フィールド

Liferayは、日付フィールドに対して以下の演算子および関数を提供します。 任意の日付フィールドを引数として使用できます。 また、日付フィールドと比較するための日付値を設定できます（例： `2020-03-19`）。

### 日付を比較

Check if a date field's value is the same as a set value. If the field does not match the date, it returns `false`.

```
compareDates(<dateField>, <yyyy-MM-dd>)
```

### Condition (with Date)

Check if user input meets one or more conditions and return a boolean value. This function works like `if` statements. Each expression includes at least one `<condition>` (e.g., `<dateField> == 2020-01-01`) and returns `true` or `false`. You can add multiple conditions to the same expression and determine a return value if none of the conditions are met (e.g., `<dateField> == 2020-01-01, <dateField> != 2022-01-01, true, false`).

```
condition(<condition>, <return-value>)
```

### 未来の日付

日付フィールドの値が将来かどうかを確認し、ブール値をします。 If the field *is not* a future date, it returns `false`.

```
futureDates(<dateField>, "<yyyy-MM-dd>")
```

### 過去の日付

日付フィールドの値が過去かどうかを確認し、ブール値をします。 If the field *is not* a past date, it returns `false`.

```
pastDates(<dateField>, "<yyyy-MM-dd>")
```

### 範囲

日付の範囲が過去の日付で始まり、未来の日付で終わるかどうかを確認します。 If the field *is not* within the date range, it returns `false`.

```
pastDates(<dateField>, "<yyyy-MM-dd>")
AND
futureDates(<dateField>, "<yyyy-MM-dd>")
```

## 数学演算子

数値フィールドには、以下のいずれの数学演算子も使用できます。

### プラス（`+`）

複数の数値フィールドを加算して式を作成します。

```
<numericField> + <numericField>
```

### マイナス（`-`）

複数の数値フィールドをお互いに減算して式を作成します。

```
<numericField> - <numericField>
```

### Divided By ( `/` )

ある数値フィールドを別の数値フィールドで除算して式を作成します。

```
<numericField> / <numericField>
```

### Multiply ( `*` )

複数の数値フィールドを乗算して式を作成します。

```
<numericField> * <numericField>
```

## 論理演算子

論理演算子は複数の要素で使用し、複数の要素から複雑な条件を集計します。 現在、式ビルダーの検証は `AND` と `OR` の演算子を提供しています。

* `AND`：これは依存する関係を表すのによく使用される等位接続詞の一種です。

* `OR`：これは独立した関係を表す別タイプの等位接続詞です。

次の例では、 `AND`節は互いに依存しているので、一緒に適用される必要があります。 これに対し、 `OR` 節は論理的に分離されており、相互に依存していません。

```
match(<phoneNumberField>, "^([1-9]{2}) (?:[2-8]|9[1-9])[0-9]{3}-[0-9]{4}$")
AND match(<nameField>, "[A-Za-z]{1,50}")
AND match(<addressField>, "[A-Za-z]{1,50}")
OR <numericField> == 1
OR match(<lastNameField>, "[A-Za-z]{1,50}")
```

## バリデーション例

以下のバリデーションは一般的な例です。

### Name Validation (with Text)

このバリデーションでは、値をアルファベット文字に限定し、許容される文字数が制限されます。

```
match(<nameField>, ("[A-Za-z]{1,50}")
```

このバリデーションでは、姓に数字を含めることができます。

```
match(<lastNameField>, "[A-Za-z][0-9]{1,50}")
```

### Password (with Text)

This validation checks if entries meet the following password criteria:

* 8文字以上
* 一意の5文字以上
* 1記号以上
* 1つ以上の数値
* スペースなし

```
match(<passwordField>, "^(?=.*[A-Za-z])(?=.*d)(?=.*[@$!%*#?&])[A-Za-zd@$!%*#?&]{8,}$")
```

### Cell Phone Number (with Numeric)

This validation checks if entries match a phone number pattern. バリデーションはエントリーを数字に限定し、文字数も制限し、標準的な電話番号のパターンを設定します。

```
match(<phoneNumberField>, "^([1-9]{2}) (?:[2-8]|9[1-9])[0-9]{3}-[0-9]{4}$")
```

### Postal Code (with Numeric)

This validation checks if entries match a postal code pattern. バリデーションはエントリーを数字に限定し、文字数も制限し、標準的な郵便番号のパターンを設定します。

```
match(<postalField>, "^([1-9]{2}) (?:[2-8]|9[1-9])[0-9]{3}-[0-9]{4}$")
```

### 年齢幅の指定（日付）

This validation checks if entries are between 18-65.

```
pastDates(<dateField>, startsFrom, responseDate, years, -120, endsOn, responseDate, years, -18)
AND
futureDates(<dateField>, startsFrom, responseDate, years, 0, endsOn, responseDate, years, 65)
```

## 追加情報

* [オブジェクトの作成](./creating-objects.md)
* [オブジェクトへのフィールドの追加](./adding-fields-to-objects.md)
* [カスタムバリデーションの追加](./adding-custom-validations.md)
