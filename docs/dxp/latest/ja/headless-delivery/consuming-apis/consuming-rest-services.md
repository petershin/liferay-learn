# RESTサービスの使用

Liferay DXPには、ほとんどのアプリケーションでRESTサービスが含まれています。 これらのサービスは、 [OpenAPI](https://app.swaggerhub.com/apis/liferayinc/headless-delivery) に完全に準拠しています。 ここでは、それらを使用する方法を紹介します。 必要なステップはわずか3つです。

1. 消費したいサービスを特定する。
1. 必要なデータを含むサイトを特定します。
1. データにアクセスできるクレデンシャルを使用してサービスコールを行う。

この例では、Liferay DXPを新規インストールしたDockerイメージを使用しています。

## 使用するサービスを特定する

そのRESTサービスを呼び出すには、Liferay DXPが動作している必要があります。

```{include} /_snippets/run-liferay-portal.md
```

Liferay DXP の REST サービスは、この URL で公開されています：

```
http[s]://[hostname]:[port]/o/api
```

Dockerインスタンス上では、ここで見つけることができます：

```
http://localhost:8080/o/api
```

APIはいくつかのカテゴリに分類されています。この例では、`BlogPosting`サービスを使ってBlogsウィジェットからブログ記事を取得しますが、公開されているどのサービスでもこの手順を使うことができます。

1. *Headless Delivery*カテゴリを選択します。このカテゴリには `BlogPosting` サービスが含まれています。フィルタを使用して、サービスを検索することができます。

1. *Show Schemas*ボタンをクリックすると、画面の右側にこのカテゴリーに含まれるすべてのスキーマのリストが表示されます。

1. ブラウザのタブにスキーマブラウザを開いておくと、`BlogPosting`をPUTしたいときにそのスキーマが必要になります。

![スキーマブラウザを使えば、欲しいサービスを探して呼び出すことができるので便利です。](./consuming-rest-services/images/01.png)

## データが格納されているサイトを特定する

ここで、デフォルトのSite IDを見つける必要があります：

1. サイトメニュー(![サイトメニュー](../../images/icon-menu.png))を開き、*設定* &rarr; *サイト設定*に移動します。
1. Platform セクションの下にある *Site Configuration* をクリックします。Liferay DXP バージョン 7.3 以前の場合、*General* タブをクリックします。
1. Site ID]の下にある[Site identifier]を見つけます。

   ![サイト設定とサイト構成オプションでサイトIDを特定します](./consuming-rest-services/images/03.png)

## データにアクセスできる認証情報を使ってサービスを呼び出す

これで、電話をかけるのに必要なものはすべて揃いました。すべてのウェブサービスは、要求しているデータにアクセスできるクレデンシャルを使用してアクセスする必要があります。最も簡単な方法は、URLでクレデンシャルデータを渡すBasic Authを使用することです。これは安全ではないので、この方法は開発中にのみ使用する必要があります。本番環境では、[OAuth2](../using-oauth2.md)を使用してユーザーを認証する必要があります。

以下の例では、[cURL](https://curl.haxx.se)を使用しています。

### 基本的なAuthを使用したサービスの呼び出し（開発中のみ）

Basic Authを使用してサービスを呼び出すには、URLで認証情報を提供します：

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

まず、ブログの記事を投稿します。

### ブログエントリの投稿

スキーマブラウザを使って、ブログエントリーの投稿方法を学ぶことができます。

![任意のサービスのスキーマは、Liferay DXPインスタンス上で公開されます。](./consuming-rest-services/images/02.png)

1. スキーマブラウザを含むブラウザタブに戻る。 右側で、 `BlogPosting` のエントリーをクリックし、そのスキーマを表示します(上図参照）。 これは、 `BlogPosting`の全データ構造を示していますが、必須項目は2つだけです：

    * `articleBody`
    * `headline`

1. ブログエントリーを投稿するためのシンプルなJSONドキュメントを構築します。

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

### すべてのブログエントリを取得する

ここで、最初のクエリを繰り返して、投稿したブログエントリが表示されることを確認できます。

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" -u 'test@liferay.com:learn'
```

ブログエントリーの一覧を返します。 追加したエントリーは、リスト内の唯一のものです。

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

### 単一のブログエントリを取得する

リクエストをするたびに、Liferay DXPは他の可能なエンドポイントを返してきました。 そのひとつが、ひとつのブログエントリーをIDで取得することです。 エントリーのIDが分かれば、取り出すことができます。

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

これは、同じブログエントリーを返します。

### ブログエントリの削除

そのIDが分かれば、ブログのエントリーを削除することも可能です。

```bash
curl -X DELETE "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

この場合、何も返されませんが、上記のようにリクエストすることで、エントリーが消えていることを確認できます。

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

そして、Liferay DXPはこのJSONドキュメントをレスポンスで返します。

```json
{
  "status" : "NOT_FOUND",
  "title" : "No BlogsEntry exists with the primary key 35215"
}
```

　 これで、Liferay DXP の REST サービスを呼び出す方法を学びました。 上記の例では基本認証を使用していることに注意してください。本番環境では、OAuth2を使用して安全な方法でサービスを呼び出します。
