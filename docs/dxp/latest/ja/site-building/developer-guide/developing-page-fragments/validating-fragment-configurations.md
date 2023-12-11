# フラグメント設定の検証

フラグメント [の設定オプション](./adding-configuration-options-to-fragments.md) を定義するときに、有効なエントリーのルールを決定する `text` タイプのフィールドに `validation` プロパティを追加することができます。 ルールのタイプを指定することで、各フィールドが受け付けるデータのタイプを決定する：`t`ext`、`number`、`email`、`url`、`pattern`のいずれかである。 また、カスタムのエラーメッセージを追加して、無効なエントリーをユーザーに通知することもできます。

```{important}
この記事で扱うバリデーションはフラグメントの設定フィールドをバリデートするためのもので、ページエディタービューの設定パネルでのみ適用できます。 ユーザー入力のバリデーションを行うには、 [オブジェクトバリデーション](./../../../building-applications/objects/creating-and-managing-objects/validations.md) または JavaScript バリデーションのフォームフラグメントを使います。
```

## テキスト検証ルール

以下のJSONコードでは、`text`型のフィールドに対して、有効なエントリーに使用される最小文字数と最大文字数（すなわち、`minLength`と`maxLength`）を設定するための`text`検証ルールを追加している。

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "validate text length",
                    "name": "text1",
                    "type": "text",
                    "typeOptions": {
                      "validation": {
                        "errorMessage": "Enter a minimum of 10 characters. Entries cannot exceed 30 characters.",
                        "type": "text",
                        "minLength": 10,
                        "maxLength": 30
                      }
                    }
                }
            ]
        }
    ]
}
```

![Use text validation rules to set the minimum and maximum number of characters used in valid entries.](./adding-validation-rules/images/01.png)

## 数値検証ルール

以下のJSONコードは、`text`型フィールドの有効な数値範囲（すなわち、`min`と`max`）を定義するために、`number`検証ルールを追加する。

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "dataType": "int",
                    "label": "validate number",
                    "name": "text2",
                    "type": "text",
                    "typeOptions": {
                      "validation": {
                        "errorMessage": "Enter a number between 5 and 10.",
                        "type": "number",
                        "min": 5,
                        "max": 10
                      }
                    }
                }
            ]
        }
    ]
}
```

![Use number validation rules to define the numerical range of valid entries.](./adding-validation-rules/images/02.png)

## メール検証ルール

以下の JSON コードでは、`email` 検証ルールを追加して、電子メールの構文を要求し、`text` 型のフィールドで有効なエントリの文字数（すなわち、`minLength` と `maxLength`）を定義している。

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "validate email",
                    "name": "text3",
                    "type": "text",
                    "typeOptions": {
                      "validation": {
                        "errorMessage": "Enter a valid email address.",
                        "type": "email",
                        "minLength": 1,
                        "maxLength": 30
                      }
                    }
                }
            ]
        }
    ]
}
```

![Use email validation rules to require email syntax and define the character length of valid entries.](./adding-validation-rules/images/03.png)

## URL検証ルール

以下のJSONコードでは、`url`検証ルールを追加して、適切なURLプロトコルを要求し、`text`型フィールドに対して有効なURLの文字数（すなわち、`minLength`と`maxLength`）を定義している。

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "validate url",
                    "name": "text4",
                    "type": "text",
                    "typeOptions": {
                      "validation": {
                        "errorMessage": "Enter a valid URL.",
                        "type": "url",
                        "minLength": 1,
                        "maxLength": 100
                      }
                    }
                }
            ]
        }
    ]
}
```

![Use url validation rules to require proper URL protocol and define the character length of valid URLs.](./adding-validation-rules/images/04.png)

## パターン検証ルール

以下のJSONコードは、正規表現を使って `text` 型フィールドに `pattern` 検証ルールを追加し、有効なエントリを定義する。

```{note}
正規表現値の文字をエスケープするためにバックスラッシュを使用する場合（例：`\d`）、最初にバックスラッシュをエスケープするために`JSON`ファイル内で2つのバックスラッシュを使用する必要があります (例：`\\d``)。 JSON文法の詳細については、 [IETF](https://www.ietf.org/rfc/rfc4627.txt) ドキュメントを参照のこと。
```

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "validate pattern",
                    "name": "text5",
                    "type": "text",
                    "typeOptions": {
                      "validation": {
                        "errorMessage": "Enter a valid 10 digit phone number.",
                        "type": "pattern",
                        "regexp": "([0-9]{3})[.\\-]?([0-9]{3})[.\\-]?([0-9]{4})"
                      }
                    }
                }
            ]
        }
    ]
}
```

![Use pattern validation rules using regex to define valid entries.](./adding-validation-rules/images/05.png)

## 関連トピック

* [フラグメントの開発](./developing-fragments-intro.md) 
* [フラグメントエディターの使い方](./using-the-fragments-editor.md) 
* [フラグメントへの設定オプションの追加](./adding-configuration-options-to-fragments.md) 
