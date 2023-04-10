# GraphQL API 사용

Liferay DXP에는 대부분의 애플리케이션을 위한 [GraphQL](https://graphql.org) API가 포함되어 있습니다. 여기에서 섭취 방법을 배웁니다. 세 단계만 거치면 됩니다.

1. 사용하려는 API를 식별합니다.
1. 필요한 데이터가 포함된 사이트를 식별합니다.
1. 데이터에 액세스할 수 있는 자격 증명을 사용하여 API를 호출합니다.

GraphQL API를 호출하려면 실행 중인 Liferay DXP가 필요합니다.

```{include} /_snippets/run-liferay-portal.md
```

## 사용할 서비스 식별

다음과 같이하세요:

1. `http://localhost:8080/o/api`로 이동합니다.

1. 표시되는 화면 왼쪽 상단의 선택기에서 **headless-delivery** 를 선택합니다. 블로그 게시 API가 포함된 카테고리입니다.

1. 화면 오른쪽 상단의 **Show GraphQL** 버튼을 클릭하여 Liferay의 [GraphiQL](https://github.com/graphql/graphiql) 브라우저를 엽니다.

1. 방금 클릭한 버튼 아래의 **문서** 링크를 클릭합니다. 이제 API를 탐색할 수 있습니다.

1. GraphQL은 첫 번째를 **쿼리** 로, 두 번째를 **돌연변이** 로 호출하여 읽기 작업과 쓰기 작업을 분리합니다. 가장 먼저 할 일은 블로그 항목을 게시하는 것이므로 **변형** 을 클릭합니다.

1. 전체 API의 목록이 나타나면 상단의 검색을 사용하거나 아래로 스크롤하여 `createSiteBlogPosting`에 대한 호출을 찾으십시오.

    ```graphql
    createSiteBlogPosting(
      blogPosting: InputBlogPosting
      siteKey: String!
      ): BlogPosting
    ```

```{note}
스키마를 직접 요청하여 로컬 설치의 API를 검색할 수도 있습니다.

`curl 'http://localhost:8080/o/graphql' -H 'Content-Type: application/json' --data '{"query": "query{ __schema{ queryType{ name fields{ name args{ name } description } } } }","variables":{}}'`


이 URL은 인증이 필요하지 않지만 반환된 스키마를 관리하기가 상당히 번거롭습니다. 이러한 이유로 포함된 GraphQL 클라이언트를 사용하는 것이 좋습니다.
```

![포함된 GraphQL 클라이언트에는 스키마 문서 브라우저가 있습니다.](./consuming-graphql-apis/images/01.png)

API를 사용하려면 항목이 게시되어야 하는 블로그가 포함된 사이트를 알아야 하므로 먼저 사이트 ID를 찾아야 합니다.

## 데이터가 포함된 사이트 식별

이제 사이트 ID를 찾아야 합니다.

1. `http://localhost:8080`로 이동합니다.

1. **전역 메뉴** ![Global Menu](../../images/icon-applications-menu.png)열고 **제어판** 탭을 클릭한 다음 **사이트** &rarr; 사이트로 이동합니다.

1. Liferay 사이트 옆에 있는 **작업** 버튼 ![Actions Button](../../images/icon-actions.png) 클릭하고 **사이트 설정으로 이동** 선택합니다.

1. **사이트 구성** 로 이동합니다.

세부 정보 섹션 상단에 사이트 ID가 나타납니다. `20122`과 같은 정수입니다.

## 데이터에 대한 액세스 권한이 있는 자격 증명을 사용하여 서비스 호출하기

이제 전화를 거는 데 필요한 모든 것이 있습니다. 요청하는 데이터에 액세스할 수 있는 자격 증명을 사용하여 모든 웹 서비스에 액세스해야 합니다. 포함된 GraphQL 클라이언트는 브라우저를 사용하여 인증합니다. 독립 실행형 클라이언트를 작성할 계획이라면 [OAuth2](../using-oauth2.md)을 통해 사용자를 인증해야 합니다.

개발 중에는 자격 증명 데이터를 URL로 전달하는 기본 인증을 사용하는 것이 훨씬 쉽습니다. 이것은 안전하지 않기 때문에 **프로덕션에 이 방법을 사용하지 않습니다.**

### 기본 인증을 사용하여 GraphQL API 호출(개발 중에만 해당)

기본 인증을 사용하여 서비스를 호출하려면 URL에 자격 증명을 제공합니다.

```bash
curl --request POST --url http://localhost:8080/o/graphql \ -u test@liferay.com:learn  --header 'content-type: application/json' --data '{"query":"query {blogPostings(filter: \"\", page: 1, pageSize: 10, search: \"\", siteKey: \"20122\", sort: \"\"){ page  items{ id articleBody headline  creator{ name }}}}"}'
```

### OAuth2를 사용하여 서비스 호출

프로덕션의 경우 [OAuth2 애플리케이션](../using-oauth2/creating-oauth2-applications.md) 만들고 OAuth2 프로세스를 사용하여 인증 토큰을 가져옵니다. 토큰이 있으면 HTTP 헤더에 제공하십시오.

```bash
curl --request POST --url http://localhost:8080/o/graphql -H "Authorization: Bearer d5571ff781dc555415c478872f0755c773fa159" --header 'content-type: application/json' --data '{"query":"query {blogPostings(filter: \"\", page: 1, pageSize: 10, search: \"\", siteKey: \"20122\", sort: \"\"){ page  items{ id articleBody headline  creator{ name }}}}"}'
```

## 데이터 가져오기 및 게시

GraphQL 클라이언트의 왼쪽 상단 창에서 모든 블로그 항목을 검색하는 이 코드를 배치합니다.

```graphql
query {blogPostings(filter:"",page:1,pageSize:10,search:"",siteKey:"20122",sort:"")
    {page
     items {
        id
        articleBody
        headline
        creator
            {name
            }
  }
  }
}
```

재생 버튼을 클릭하여 실행하면 블로그 항목이 없는 것을 볼 수 있습니다.

```json
{"data":{"blogPostings":{"page":1,"items":[]}}}
```

이제 블로그 항목을 게시합니다.

### 블로그 항목 게시

GraphQL 스키마는 블로그 항목을 게시하기 위해 수행해야 하는 호출을 나타냅니다.

1. 게시하려는 항목이 포함된 JSON 문서를 구성합니다.

   ```json
   {
     "blog": {
         "articleBody": "This Blog entry was created by calling the GraphQL service!",
         "headline": "GraphQL Blog Entry"
     }
   }
    ```

1. 스키마 문서를 기반으로 GraphQL 쿼리를 구성합니다.

   ```
   mutation CreateBlog($blog: InputBlogPosting){
     createSiteBlogPosting(blogPosting: $blog, siteKey: "20122" ) {
       headline
       articleBody
       id
       friendlyUrlPath
     }

    }
    ```

1. `http://localhost:8080/o/api` 다시 방문하여 요청하십시오. **GraphQL** 표시 버튼을 클릭합니다.

1. JSON 문서를 왼쪽 하단의 쿼리 변수 상자에 붙여넣습니다.

1. 오른쪽 상단의 레이블이 지정되지 않은 상자에 돌연변이를 붙여넣습니다.

1. 상단의 재생 버튼을 클릭하여 쿼리를 실행합니다.

이제 추가한 블로그 항목이 GraphQL 클라이언트의 오른쪽 창에 나타납니다.

![GraphQL 클라이언트를 사용하면 브라우저에서 직접 GraphQL 서비스를 쉽게 호출할 수 있습니다.](./consuming-graphql-apis/images/02.png)

Liferay DXP는 변형에서 요청한 필드가 포함된 블로그 항목의 JSON 표현을 반환합니다.

```json
{
  "data": {
    "createSiteBlogPosting": {
      "headline": "GraphQL Blog Entry",
      "articleBody": "This Blog entry was created by calling the GraphQL service!",
      "id": 35541,
      "friendlyUrlPath": "graphql-blog-entry"
    }
  }
}
```

```{note}
cURL과 같은 모든 웹 클라이언트에서 이러한 요청을 할 수 있습니다.

`curl --request POST --url http://localhost:8080/o/graphql -u test@liferay.com:learn --header 'content- 유형: 애플리케이션/json' --data '{"query":"mutation CreateBlog($blog: InputBlogPosting){ createSiteBlogPosting(blogPosting: $blog, siteKey: \"20122\" ) {    headline    articleBody    id    friendlyUrlPath  }    } ","variables":{"blog" :{"articleBody":"이 블로그 항목은 cURL을 사용하여 GraphQL 서비스를 호출하여 생성되었습니다!","headline":"cURL GraphQL 블로그 항목"}},"operationName":"CreateBlog"}'`
```

### 모든 블로그 항목 가져오기

이제 수행한 첫 번째 쿼리를 반복할 수 있습니다.

```graphql
query {blogPostings(filter:"",page:1,pageSize:10,search:"",siteKey:"20122",sort:"")
    {page
     items {
        id
        articleBody
        headline
        creator
            {name
            }
  }
  }
}
```

Liferay DXP는 게시한 블로그 항목이 포함된 JSON을 반환합니다.

```json
{
  "data": {
    "blogPostings": {
      "page": 1,
      "items": [
        {
          "id": 35541,
          "articleBody": "This Blog entry was created by calling the GraphQL service!",
          "headline": "GraphQL Blog Entry",
          "creator": {
            "name": "Test Test"
          }
        }
      ]
    }
  }
}
```

### 단일 블로그 항목 얻기

단일 블로그 항목을 가져오기 위한 GraphQL 스키마의 API 호출에는 하나의 매개변수만 있습니다.

```
blogPosting(
   blogPostingId: Long
): BlogPosting
```

위의 쿼리는 블로그 게시물의 ID를 나타내므로 원하는 게시물만 검색할 수 있습니다.

```graphql
query {blogPosting(blogPostingId: 35541)
  { id
    headline
    articleBody}
}
```

이것을 클라이언트의 왼쪽 상단 창에 붙여넣고 **재생** 버튼을 클릭합니다. 동일한 블로그 항목을 반환합니다.

```json
{
  "data": {
    "blogPosting": {
      "id": 35541,
      "headline": "GraphQL Blog Entry",
      "articleBody": "This Blog entry was created by calling the GraphQL service!"
    }
  }
}
```

### 블로그 항목 삭제

블로그 항목을 만드는 것과 같이 삭제하는 것은 변형입니다. 호출은 단일 블로그 항목을 가져오는 것과 거의 동일합니다.

```
deleteBlogPosting(
  blogPostingId: Long
): Boolean
```

클라이언트를 사용하여 다음과 같이 호출할 수 있습니다.

```graphql
mutation {
  deleteBlogPosting(blogPostingId: 35541)
}
```

이 호출은 JSON 문서에서 성공 또는 실패를 나타내는 부울을 반환합니다.

```json
{
  "data": {
    "deleteBlogPosting": true
  }
}
```

축하해요! 이제 Liferay DXP의 GraphQL 서비스를 호출하는 방법을 배웠습니다. 위의 예에서는 기본 인증을 사용한다는 점을 기억하세요. 프로덕션의 경우 OAuth2를 사용하여 안전한 방식으로 서비스를 호출합니다.
