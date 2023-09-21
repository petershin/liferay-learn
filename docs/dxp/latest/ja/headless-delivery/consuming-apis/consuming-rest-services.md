# RESTサービスの使用

Liferay DXPには、ほとんどのアプリケーションでRESTサービスが含まれています。 これらのサービスは完全に [OpenAPI](https://app.swaggerhub.com/apis/liferayinc/headless-delivery) に準拠しています。 ここでは、それらを使用する方法を紹介します。 必要なステップはわずか3つです。

1. 使用するサービスを特定します。
1. 必要なデータを含むサイトを特定します。
1. データにアクセスできる資格情報を使用してサービス呼び出しを行います。

この例では、Liferay DXPの新規インストールでDockerイメージを使用しています。

## 使用するサービスを特定する

RESTサービスを呼び出すには、実行中のLiferay DXPが必要です。

```{include} /_snippets/run-liferay-portal.md
```

様々なAPIエンドポイントを見るには、ブラウザを使ってLiferayのAPI Explorerの`[server]:[port]/o/api`にアクセスします。例えば、あなたの Docker インスタンスでは、ここで見つけることができます：

```
http://localhost:8080/o/api
```

APIはいくつかのカテゴリに分かれている。この例ではBlogsウィジェットからブログ記事を取得するために`BlogPosting`サービスを使用していますが、公開されているどのサービスでもこの手順を使用することができます。

1. **Headless Delivery** カテゴリを選択します。このカテゴリには`BlogPosting`サービスが含まれています。フィルタを使用してサービスを検索できます。

2. **Show Schemas** ボタンをクリックすると、画面の右側にこのカテゴリーに含まれるすべてのスキーマのリストが表示されます。

3. `BlogPosting`をPUTしたいときには、そのスキーマが必要になります。

スキーマ・ブラウザを使えば、欲しいサービスを見つけて呼び出すのに便利です。](./consuming-rest-services/images/01.png)

## データを含むサイトを特定する

次に、デフォルトのサイトIDを見つけなければなりません：

1. サイトメニュー(![サイトメニュー](../../images/icon-menu.png))を開き、 **設定** &rarr; **サイト設定** に進む。
1. Platform セクションで **Site Configuration** をクリックします。Liferay DXP バージョン 7.3 以前の場合は、 **General** タブをクリックします。
1. Site ID] でサイト ID を確認します。

   ![サイト設定とサイト構成オプションでサイト ID を特定する](./consuming-rest-services/images/03.png)

## データにアクセスできる証明書を使用してサービスを呼び出す

これで呼び出しに必要なものはすべて揃いました。すべてのウェブサービスは、リクエストするデータにアクセスできるクレデンシャルを使ってアクセスしなければなりません。最も単純な方法は、URLでクレデンシャルデータを渡すBasic Authを使うことです。これは安全ではないので、この方法を使うのは開発中のみにしてください。本番環境では、[OAuth2](../using-oauth2.md)を使ってユーザーを認証してください。

以下の例では、 [cURL](https://curl.haxx.se) を使用しています。

### 基本認証を使ってサービスを呼び出す (開発中のみ)

Basic Authを使ってサービスを呼び出すには、URLに認証情報を記述します：

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" -u 'test@liferay.com:learn'
```

### OAuth2を使用してサービスを呼び出す

本番環境では、[OAuth2アプリケーション](../using-oauth2/creating-oauth2-applications.md)を作成し、OAuth2プロセスを使用して認証トークンを取得します。 トークンを取得したら、それをHTTPヘッダーに指定します。

```bash
curl -H "Authorization: Bearer d5571ff781dc555415c478872f0755c773fa159" http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings
```

## データの取得と投稿

上記のクエリを実行してすべてのブログ投稿を取得すると、何もないことがわかります。

```json
{
  "actions" : {
    "subscribe" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/subscribe"
    },
    "unsubscribe" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/unsubscribe"
    },
    "create" : {
      "method" : "POST",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings"
    }
  },
  "items" : [ ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 0
}
```

まず、ブログエントリーを投稿します。

### ブログエントリーの投稿

スキーマブラウザーを使用して、ブログエントリを投稿する方法を学ぶことができます。

![サービスのスキーマは、Liferay DXPインスタンスで公開されます。](./consuming-rest-services/images/02.png)

1. スキーマブラウザを含むブラウザタブに戻ります。 右側にある `BlogPosting` エントリーをクリックして、そのスキーマを表示します（上記を参照）。 これは `BlogPosting`データ構造全体を示していますが、必須フィールドは2つだけです。

    * `articleBody`
    * `headline`

1. ブログエントリを投稿する単純なJSONドキュメントを作成します。

    ```json
    {
        "headline": "Test Blog Entry from REST Services",
        "articleBody": "This article was posted via REST services provided by Liferay DXP."
    }
    ```

1. リクエストを行います。

    ```bash
    curl --header "Content-Type: application/json" --request POST --data '{ "headline": "Test Blog Entry from REST Services", "articleBody": "This article was posted via REST services provided by Liferay DXP." }' http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings -u test@liferay.com:learn
    ```

Liferay DXPは、ブログエントリーの完全なJSON表現を返します。

```json
{
  "actions" : {
    "get" : {
      "method" : "GET",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
    },
    "replace" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
    },
    "update" : {
      "method" : "PATCH",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
    },
    "delete" : {
      "method" : "DELETE",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
    }
  },
  "alternativeHeadline" : "",
  "articleBody" : "This article was posted via REST services provided by Liferay DXP.",
  "creator" : {
    "additionalName" : "",
    "contentType" : "UserAccount",
    "familyName" : "Test",
    "givenName" : "Test",
    "id" : 20125,
    "name" : "Test Test",
    "profileURL" : "/web/test"
  },
  "customFields" : [ ],
  "dateCreated" : "2020-03-06T18:02:26Z",
  "dateModified" : "2020-03-06T18:02:27Z",
  "datePublished" : "2020-03-06T18:02:00Z",
  "description" : "",
  "encodingFormat" : "text/html",
  "friendlyUrlPath" : "test-blog-entry-from-rest-services",
  "headline" : "Test Blog Entry from REST Services",
  "id" : 35215,
  "keywords" : [ ],
  "numberOfComments" : 0,
  "relatedContents" : [ ],
  "siteId" : 20122,
  "taxonomyCategories" : [ ]
}
```

### すべてのブログエントリーを取得する

ここで、最初のクエリを繰り返して、投稿したブログエントリが表示されることを確認できます。

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" -u 'test@liferay.com:learn'
```

ブログエントリのリストが返されます。 追加したエントリは、リスト内の唯一のエントリです。

```json
{
  "actions" : {
    "subscribe" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/subscribe"
    },
    "unsubscribe" : {
      "method" : "PUT",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/unsubscribe"
    },
    "create" : {
      "method" : "POST",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings"
    }
  },
  "items" : [ {
    "actions" : {
      "get" : {
        "method" : "GET",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      },
      "replace" : {
        "method" : "PUT",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      },
      "update" : {
        "method" : "PATCH",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      },
      "delete" : {
        "method" : "DELETE",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      }
    },
    "alternativeHeadline" : "",
    "articleBody" : "This article was posted via REST services provided by Liferay DXP.",
    "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Test",
      "givenName" : "Test",
      "id" : 20125,
      "name" : "Test Test",
      "profileURL" : "/web/test"
    },
    "customFields" : [ ],
    "dateCreated" : "2020-03-06T18:02:26Z",
    "dateModified" : "2020-03-06T18:02:27Z",
    "datePublished" : "2020-03-06T18:02:00Z",
    "description" : "",
    "encodingFormat" : "text/html",
    "friendlyUrlPath" : "test-blog-entry-from-rest-services",
    "headline" : "Test Blog Entry from REST Services",
    "id" : 35215,
    "keywords" : [ ],
    "numberOfComments" : 0,
    "relatedContents" : [ ],
    "siteId" : 20122,
    "taxonomyCategories" : [ ]
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}
```

### 単一のブログエントリーを取得する

リクエストを行うたびに、Liferay DXPは他の考えられるエンドポイントを返します。 そのうちの1つは、IDによって単一のブログエントリを取得することです。 エントリーのIDがわかっている場合は、それを取得できます。

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

同じブログエントリーを返します。

### ブログエントリーを削除する

IDがわかっている場合は、ブログエントリーを削除することもできます。

```bash
curl -X DELETE "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

この場合、何も返されませんが、上記のようにリクエストすることで、エントリーが削除されたことを確認できます。

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

次に、Liferay DXPは、応答として次のJSONドキュメントを返します。

```json
{
  "status" : "NOT_FOUND",
  "title" : "No BlogsEntry exists with the primary key 35215"
}
```

　 Liferay DXPのRESTサービスを呼び出す方法を学びました。 上記の例では基本認証を使用していることに注意してください。本番環境では、OAuth2を使用して安全な方法でサービスを呼び出します。
