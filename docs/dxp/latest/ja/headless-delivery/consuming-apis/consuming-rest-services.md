# RESTサービスの使用

Liferay DXP は、そのアプリケーションのほとんどに REST サービスを含んでいます。 これらのサービスは、 [OpenAPI](https://app.swaggerhub.com/apis/liferayinc/headless-delivery) に完全に準拠しています。 ここでは、それらを使用する方法を紹介します。 必要なステップはわずか3つです。

1. 利用したいサービスを特定する。
1. 必要なデータを含むサイトを特定します。
1. データにアクセスできるクレデンシャルを使用して、サービスコールを行う。

この例では、Liferay DXP を新規にインストールした Docker イメージを使用しています。

## 使用するサービスを特定する

そのRESTサービスを呼び出すには、Liferay DXPが動作している必要があります。
```{include} /_snippets/run-liferay-portal.md
```

Liferay DXP's REST services are published at this URL:

```
http［s］://［hostname］:［port］/o/api
```

On your Docker instance, you can find them here:

```
http://localhost:8080/o/api
```

APIs are divided into several categories. This example uses the `BlogPosting` service to retrieve blog posts from the Blogs widget, but you can use this procedure with any of the published services. 

1. Select the **Headless Delivery** category. This category contains the `BlogPosting` service. You can use the filter to search for services. 

1. Click the **Show Schemas** button, and on the right side of the screen a list of all the schemas in this category appears. 

1. Keep a browser tab open to the schema browser; when you want to PUT a `BlogPosting`, you'll need its schema. 

![The schema browser makes it convenient to find and call the service you want. ](./consuming-rest-services/images/01.png)

## Identify the Site Containing the Data

Now you must find the default Site ID:

1. Open the Site menu (![Site menu](../../images/icon-menu.png)) and go to **Configuration** &rarr; **Site Settings** .
1. Under the Platform section, click **Site Configuration** . For Liferay DXP versions 7.3 and earlier, click the **General** tab.
1. サイトIDの下でサイト識別子を見つけます。

   ![Identify the Site Id under the Site Settings and Site Configuration option.](./consuming-rest-services/images/03.png)

## Make the Service Call Using Credentials with Access to the Data

Now you have everything you need to make the call. すべてのWebサービスには、要求しているデータにアクセスできる資格情報を使用してアクセスする必要があります。 最も簡単な方法は、URLで資格情報データを渡す基本認証を使用することです。 これは安全ではないため、この方法は開発時にのみ使用すべきです。 For production, your application should authorize users via [OAuth2](../using-oauth2/using-oauth2.md).

The examples below use [cURL](https://curl.haxx.se) .

### Calling a Service Using Basic Auth (During Development Only)

To call a service using Basic Auth, provide the credentials in the URL:

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
  "items" : ［ ］,
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 0
}
```

まず、ブログの記事を投稿します。

### ブログエントリの投稿

スキーマブラウザを使って、ブログエントリーの投稿方法を学ぶことができます。

![任意のサービスのスキーマは、Liferay DXP インスタンスで公開されます。](./consuming-rest-services/images/02.png)

1. スキーマブラウザを含むブラウザタブに戻ります。 右側で、 `BlogPosting` のエントリーをクリックして、そのスキーマを表示します（上図参照）。 これは、 `BlogPosting`のデータ構造全体を示しているが、必須フィールドは2つだけである。

    * `articleBody`
    * `headline`

2. ブログのエントリーを投稿するための簡単なJSONドキュメントを構築します。

    ```json
    {
        "headline": "Test Blog Entry from REST Services",
        "articleBody": "This article was posted via REST services provided by Liferay DXP."
    }
    ```

3. リクエストを行います。

    ```bash
    curl --header "Content-Type: application/json" --request POST --data '{ "headline": "Test Blog Entry from REST Services", "articleBody": "This article was posted via REST services provided by Liferay DXP." }' http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings -u test@liferay.com:learn
    ```

Liferay DXP は、ブログエントリーの完全な JSON 表現を返します。

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
  "customFields" : ［ ］,
  "dateCreated" : "2020-03-06T18:02:26Z",
  "dateModified" : "2020-03-06T18:02:27Z",
  "datePublished" : "2020-03-06T18:02:00Z",
  "description" : "",
  "encodingFormat" : "text/html",
  "friendlyUrlPath" : "test-blog-entry-from-rest-services",
  "headline" : "Test Blog Entry from REST Services",
  "id" : 35215,
  "keywords" : ［ ］,
  "numberOfComments" : 0,
  "relatedContents" : ［ ］,
  "siteId" : 20122,
  "taxonomyCategories" : ［ ］
}
```

### すべてのブログエントリを取得する

ここで、最初のクエリを繰り返して、投稿したブログエントリが表示されることを確認できます。

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" -u 'test@liferay.com:learn'
```

ブログのエントリーの一覧を返します。 追加されたエントリーは、リストの中の唯一のものです。

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
  "items" : ［ {
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
    "customFields" : ［ ］,
    "dateCreated" : "2020-03-06T18:02:26Z",
    "dateModified" : "2020-03-06T18:02:27Z",
    "datePublished" : "2020-03-06T18:02:00Z",
    "description" : "",
    "encodingFormat" : "text/html",
    "friendlyUrlPath" : "test-blog-entry-from-rest-services",
    "headline" : "Test Blog Entry from REST Services",
    "id" : 35215,
    "keywords" : ［ ］,
    "numberOfComments" : 0,
    "relatedContents" : ［ ］,
    "siteId" : 20122,
    "taxonomyCategories" : ［ ］
  } ］,
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}
```

### 単一のブログエントリを取得する

あなたがリクエストをするたびに、Liferay DXP は他の可能なエンドポイントを返してきました。 そのひとつが、ひとつのブログのエントリーをIDで取得することです。 エントリーのIDがわかっていれば、取得することができます。

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

これは、同じブログエントリーを返します。

### ブログエントリの削除

そのIDが分かれば、ブログのエントリーを削除することも可能です。

```bash
curl -X DELETE "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

この場合、何も返されませんが、上記のようにリクエストすることで、エントリーが消えていることを確認することができます。

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

そして、Liferay DXP はこの JSON ドキュメントをレスポンスとして返します。

```json
{
  "status" : "NOT_FOUND",
  "title" : "No BlogsEntry exists with the primary key 35215"
}
```

　 これで、Liferay DXP の REST サービスを呼び出す方法を学びました。 上記の例では基本認証を使用していることに注意してください。本番環境では、OAuth2を使用して安全な方法でサービスを呼び出します。
