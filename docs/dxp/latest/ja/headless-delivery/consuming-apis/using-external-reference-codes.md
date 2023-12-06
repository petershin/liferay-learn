# 外部参照コードの使用

{bdg-secondary}Liferay DXP/Portal 7.4+

LiferayのヘッドレスAPIエンドポイントの多くは外部参照コード（ERC）をサポートしています。 ERCフィールドは、幅広いシナリオで役に立つ。 例えば、コンテンツをLiferayに移行する際、ERCフィールドに他のシステムからのユニークな参照IDを残すことができます。 また、ERCを使用して、サイト・コンテンツに人間が読めるキーを持たせることもできる。 例えば、Liferayは作成された各ブログ記事にユニークなIDを割り当てますが、より簡単に参照できるように人間が読めるキーを割り当てることもできます。

各ERCは一意でなければならず、同じERCを同じスコープ内の別のエンティ ティで使用することはできない。 例えば、同じサイトのブログ記事と文書が同じERCを持つことはできない。 試してみると、 `重複エントリ` エラーが表示されます。

## ブログ記事 ERCの例

ERCでブログ記事を作成し、アクセスする。

1. あなたの [サイトのID](./consuming-rest-services.md#identify-the-site-containing-the-data) をメモしてください。

1. 以下のcurlコマンドを実行して、新しいブログ記事を作成する。 `{siteId}` をあなたのサイトのIDに置き換えてください。

   ```bash
   curl \
    -H "Content-Type: application/json" \
    -X POST \
    "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings" \
    -d "{\"articleBody\": \"Foo\", \"externalReferenceCode\": \"blog_post_able\", \"headline\": \"Able\"}" \
    -u "test@liferay.com:learn"
   ```

   出力は新しいブログ記事が作成されたことを示している：

   ```bash
   ...
     "alternativeHeadline" : "",
     "articleBody" : "Foo",
     "creator" : {
       "additionalName" : "",
       "contentType" : "UserAccount",
       "familyName" : "Test",
       "givenName" : "Test",
       "id" : 20123,
       "name" : "Test Test"
     },
     "customFields" : [ ],
     "dateCreated" : "2023-09-21T21:21:48Z",
     "dateModified" : "2023-09-21T21:21:48Z",
     "datePublished" : "2023-09-21T21:21:00Z",
     "description" : "Foo",
     "encodingFormat" : "text/html",
     "externalReferenceCode" : "blog_post_able",
     "friendlyUrlPath" : "able",
     "headline" : "Able",
     "id" : 42617,
     "keywords" : [ ],
     "numberOfComments" : 0,
     "relatedContents" : [ ],
     "renderedContents" : [ ],
     "siteId" : 20119,
     "taxonomyCategoryBriefs" : [ ]
   ...
      ```

1. このブログ記事はIDまたはERCで参照できるようになった。 例えば、ブログ記事をIDで取得する：

   ```bash
   curl \
    "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/42617" \
    -u "test@liferay.com:learn"
   ```

   または、そのERCでブログ記事を取得する：

   ```bash
   curl \
    "http://localhost:8080/o/headless-delivery/v1.0/sites/20119/blog-postings/by-external-reference-code/blog_post_able" \
    -u "test@liferay.com:learn"
   ```

   なお、ERCによるブログ記事用のこのGETメソッドには、サイトID（例： `20119`）とERC（例： `blog_post_able`）が必要です。

[API Explorer](../using-liferay-as-a-headless-platform.md#ways-to-connect) で、外部参照コードをサポートするさまざまな API エンドポイントを確認してください。
