# サンプルAPIアプリケーションの構築

{bdg-secondary}Liferay DXP 2023.Q4+/Portal 7.4 GA102+
{bdg-link-primary}`[Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

```{important}
APIビルダーはベータ機能で、現在はLiferayオブジェクトのみをサポートしています。
```

以下の手順に従って、モックAPIアプリケーションの例をご覧ください。

APIビルダーを有効にする、

1. グローバル・メニューに移動する (![グローバル・メニュー](../../images/icon-applications-menu.png)) &rarr; **コントロールパネル** &rarr; **インスタンス設定** .

1. 「プラットフォーム」の下にある「機能フラグ」をクリックします。

1. 左のナビゲーションで **Beta** を選択。 APIビルダーをオンにする。 APIビルダーが有効になりました。

## サンプルオブジェクトとエントリーの追加

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. コマンドラインで以下のスクリプトを実行し、`Student`オブジェクトを作成する。

   ```bash
   student=$(curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/object-admin/v1.0/object-definitions" \
   	-d "{\"label\": {\"en_US\": \"Student\"}, \"name\": \"Student\", \"panelCategoryKey\": \"control_panel.object\", \"pluralLabel\": {\"en_US\": \"Students\"}, \"scope\": \"company\"}" \
     -u "test@liferay.com:learn" | jq -r ".id")

   curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${student}/object-fields" \
   	-d "{\"businessType\": \"Text\", \"label\": {\"en_US\": \"First Name\"}, \"name\": \"firstName\", \"required\": false}" \
   	-u "test@liferay.com:learn"

   curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${student}/object-fields" \
   	-d "{\"businessType\": \"Text\", \"label\": {\"en_US\": \"Last Name\"}, \"name\": \"lastName\", \"required\": false}" \
   	-u "test@liferay.com:learn"

   curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${student}/publish" \
   	-u "test@liferay.com:learn"
   ```

1. グローバルメニューに移動する (![グローバルメニュー](../../images/icon-applications-menu.png)) &rarr; **コントロールパネル** &rarr; **オブジェクト** . 新しい `Student` オブジェクトが作成されたことを確認する。

1. コマンドラインで以下のスクリプトを実行し、`Course`オブジェクトを作成する。

   ```bash
   course=$(curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/object-admin/v1.0/object-definitions" \
   	-d "{\"label\": {\"en_US\": \"Course\"}, \"name\": \"Course\", \"panelCategoryKey\": \"control_panel.object\", \"pluralLabel\": {\"en_US\": \"Courses\"}, \"scope\": \"company\"}" \
   	-u "test@liferay.com:learn" | jq -r ".id")

   curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${course}/object-fields" \
   	-d "{\"businessType\": \"Text\", \"label\": {\"en_US\": \"Course Name\"}, \"name\": \"courseName\", \"required\": false}" \
     -u "test@liferay.com:learn"
   ```

1. グローバルメニューに移動する (![グローバルメニュー](../../images/icon-applications-menu.png)) &rarr; **コントロールパネル** &rarr; **オブジェクト** . 先ほど作成した`Course`オブジェクトをクリックしてください。

1. 「関係」タブをクリックする。 追加]をクリックします(![アイコンの追加](../../images/icon-add.png))。

1. 以下の値を入力して、新しいリレーションシップを定義する。

   | 項目         | 値    |
   | :--------- | :--- |
   | ラベル        | 入学   |
   | 名前         | 在籍   |
   | 種類         | 1 対多 |
   | 次の 1 レコード: | コース  |
   | 多くの記録      | 学生   |

   「保存」をクリックする。

1. 「詳細」タブをクリックする。 **Publish** をクリックする。

## サンプルコースと学生の追加

1. コマンドラインで以下のスクリプトを実行し、2つのコースと2人の学生を作成します。

   ```bash
   math101=$(curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/c/courses" \
   	-d "{\"courseName\": \"Math 101\"}" \
   	-u "test@liferay.com:learn" | jq -r ".id")

   curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/c/students" \
   	-d "{\"r_enrollment_c_courseId\":${math101}, \"firstName\": \"Mary\", \"lastName\": \"Liferay\"}" \
   	-u "test@liferay.com:learn"

   history101=$(curl \
   	-H "Content-Type: application/json" \
   	-X POST \
     "http://localhost:8080/o/c/courses" \
   	-d "{\"courseName\": \"History 101\"}" \
   	-u "test@liferay.com:learn" | jq -r ".id")

   curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/c/students" \
   	-d "{\"r_enrollment_c_courseId\":${history101}, \"firstName\": \"John\", \"lastName\": \"Liferay\"}" \
   	-u "test@liferay.com:learn"
   ```

## APIアプリケーションの作成

1. グローバルメニューに移動する (![グローバルメニュー](../../images/icon-applications-menu.png)) &rarr; **コントロールパネル** &rarr; **APIビルダー** .

1. [追加]をクリックします(![アイコンの追加](../../images/icon-add.png))。 新しいAPIアプリケーションのタイトル、URL、説明を入力します。

   ![Create a new API application](./building-a-sample-api-application/images/01.png)

   | 項目   | 値             |
   | :--- | :------------ |
   | タイトル | 登録            |
   | URL  | 登録            |
   | 説明   | 学生登録を取得するAPI。 |

   「作成」をクリックする。

1. 「スキーマ」タブをクリックする。 追加]をクリックします(![アイコンの追加](../../images/icon-add.png))。

1. 新しいスキーマの名前、説明、オブジェクトを入力します。

   | 項目     | 値            |
   | :----- | :----------- |
   | 名前     | コース登録        |
   | 説明     | コースと受講生のリスト。 |
   | オブジェクト | コース          |

   「作成」をクリックする。

1. 新しく作成したスキーマの **Properties** タブをクリックします。 左メニューの「コース名」をクリックして、「コース名」フィールドを追加してください。

   ![Add the course name field to the schema.](./building-a-sample-api-application/images/02.png)

1. 左のメニューで **View Related Objects** をクリックする。 Student **をクリックして属性を展開します。 左メニューの** First Name **と** Last Name **をクリックして、`First Name`と`Last Name`フィールドを追加する。 右上の** Save_をクリックします。

1. 次に、 **Endpoints** タブをクリックする。 追加]をクリックします(![アイコンの追加](../../images/icon-add.png))。

1. 新しいAPIエンドポイントのスコープ、パス、説明を入力します。

   | 項目 | 値                         |
   | :- | :------------------------ |
   | 範囲 | 会社名                       |
   | パス | コース                       |
   | 説明 | コースとその学生のリストを取得するエンドポイント。 |

   「作成」をクリックする。

1. 新しく作成したAPIエンドポイントの **Configuration** タブをクリックします。 レスポンス本文スキーマで、前のステップで作成した **Course Registrations** スキーマを選択してください。 ページ右上の **Publish** をクリックする。

1. APIエクスプローラー（例： <http://localhost:8080/o/api?endpoint=http://localhost:8080/o/c/registration/openapi.json>に移動して、新しいAPIアプリケーションをテストする。

**GET courses** エンドポイントをクリックし、 **Execute** をクリックします。

   ![Execute the Get courses endpoint.](./building-a-sample-api-application/images/03.png)

   カスタムAPIアプリケーションは、コースとコースを受講している学生のリストを返します。
