# GraphQL API 사용

Liferay DXP에는 대부분의 애플리케이션에 대해 [GraphQL](https://graphql.org) API가 포함되어 있습니다. 여기서는 섭취 방법을 알아봅니다. 이 작업에는 세 단계만 거치면 됩니다.

1. 사용하려는 API를 식별합니다.
1. 필요한 데이터가 포함된 사이트를 확인하세요.
1. 데이터에 액세스할 수 있는 자격 증명을 사용하여 API 호출을 수행합니다.

GraphQL API를 호출하려면 실행 중인 Liferay DXP가 필요합니다.

```{include} /_snippets/run-liferay-portal.md
```

## 사용할 서비스 식별

다음과 같이하세요:

1. `http://localhost:8080/o/api`로 이동합니다.

1. 나타나는 화면 왼쪽 상단의 선택기에서 **headless-delivery** 를 선택합니다. 블로그 포스팅 API가 포함된 카테고리입니다.

1. 화면 오른쪽 상단의 **Show GraphQL** 버튼을 클릭하여 Liferay의 [GraphiQL](https://github.com/graphql/graphiql) 브라우저를 엽니다.

1. 방금 클릭한 버튼 아래에 있는 **문서** 링크를 클릭하세요. 이제 API를 탐색할 수 있습니다.

1. GraphQL은 첫 번째 작업을 **쿼리** 로 호출하고 두 번째 작업을 **변형** 으로 호출하여 읽기 및 쓰기 작업을 분리합니다. 가장 먼저 하고 싶은 일은 블로그 항목을 게시하는 것이므로 **변형** 을 클릭하세요.

1. 전체 API 목록이 나타나면 상단에서 검색을 사용하거나 아래로 스크롤하여 `createSiteBlogPosting` 호출을 찾습니다.

    ```graphql
    createSiteBlogPosting(
      blogPosting: InputBlogPosting
      siteKey: String!
      ): BlogPosting
    ```

```{note}
스키마를 직접 요청하여 로컬 설치의 API를 검색할 수도 있습니다:

`curl 'http://localhost:8080/o/graphql'  -H "Content-Type: application/json" --data '{"query":"query{ __schema{ queryType{ name fields{ name args{ name } description } } } }","variables":{}}'`



이 URL은 인증이 필요하지 않지만 반환된 스키마를 관리하는 것은 상당히 번거롭습니다. 이러한 이유로 포함된 GraphQL 클라이언트를 사용하는 것이 더 좋습니다.
```

![포함된 GraphQL 클라이언트에는 스키마 문서 브라우저가 있습니다.](./consuming-graphql-apis/images/01.png)

API를 사용하려면 항목이 게시되어야 하는 블로그가 포함된 사이트를 알아야 하므로 먼저 사이트 ID를 찾아야 합니다.

## 데이터가 포함된 사이트 식별

이제 사이트 ID를 찾아야 합니다:

1. `http://localhost:8080`로 이동합니다.

1. **전역 메뉴** ![Global Menu](../../images/icon-applications-menu.png)열고 **제어판** 탭을 클릭한 다음 **사이트** &rarr; 사이트로 이동합니다.

1. Liferay 사이트 옆에 있는 **작업** 버튼 ![Actions Button](../../images/icon-actions.png) 클릭하고 **사이트 설정으로 이동** 선택합니다.

1. **사이트 구성** 로 이동합니다.

사이트 ID는 세부정보 섹션 상단에 표시됩니다. `20122`과 같은 정수입니다.

## 데이터에 액세스할 수 있는 자격 증명을 사용하여 서비스 호출하기

이제 전화를 거는 데 필요한 모든 것이 준비되었습니다. 모든 웹 서비스는 요청하는 데이터에 액세스할 수 있는 자격 증명을 사용하여 액세스해야 합니다. 포함된 GraphQL 클라이언트는 브라우저를 사용하여 인증합니다. 독립형 클라이언트를 작성하려는 계획이라면 [OAuth2](../using-oauth2.md)을 통해 사용자에게 권한을 부여해야 합니다.

개발 중에는 자격 증명 데이터를 URL로 전달하는 기본 인증을 사용하는 것이 훨씬 쉽습니다. 이는 안전하지 않으므로 **이 방법을 프로덕션에 사용하지 마십시오.**

### 기본 인증을 사용하여 GraphQL API 호출(개발 중에만)

기본 인증을 사용하여 서비스를 호출하려면 URL에 자격 증명을 제공하세요.

```bash
curl --request POST --url http://localhost:8080/o/graphql \ -u test@liferay.com:learn  --header 'content-type: application/json' --data '{"query":"query {blogPostings(filter: \"\", page: 1, pageSize: 10, search: \"\", siteKey: \"20122\", sort: \"\"){ page  items{ id articleBody headline  creator{ name }}}}"}'
```

### OAuth2를 사용하여 서비스 호출

```{note}
OAuth2와 함께 GraphQL을 사용하는 것은 Liferay DXP 7.4 U77+/Liferay Portal 7.4 GA77+에서 지원됩니다.
```

프로덕션의 경우 [OAuth2 애플리케이션](../using-oauth2/creating-oauth2-applications.md) 생성하고 OAuth2 프로세스를 사용하여 인증 토큰을 얻습니다. 토큰이 있으면 HTTP 헤더에 제공하세요.

```bash
curl --request POST --url http://localhost:8080/o/graphql -H "Authorization: Bearer d5571ff781dc555415c478872f0755c773fa159" --header 'content-type: application/json' --data '{"query":"query {blogPostings(filter: \"\", page: 1, pageSize: 10, search: \"\", siteKey: \"20122\", sort: \"\"){ page  items{ id articleBody headline  creator{ name }}}}"}'
```

## 데이터 가져오기 및 게시

GraphQL 클라이언트의 왼쪽 상단 창에 모든 블로그 항목을 검색하는 다음 코드를 배치합니다.

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

이제 블로그 항목을 게시하겠습니다.

### 블로그 항목 게시

GraphQL 스키마는 블로그 항목을 게시하기 위해 이루어져야 하는 호출을 공개했습니다.

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

1. `http://localhost:8080/o/api` 다시 방문하여 요청하세요. **GraphQL** 표시 버튼을 클릭합니다.

1. JSON 문서를 왼쪽 하단의 쿼리 변수 상자에 붙여넣습니다.

1. 오른쪽 상단의 라벨이 없는 상자에 돌연변이를 붙여넣으세요.

1. 상단의 재생 버튼을 클릭하여 쿼리를 실행하세요.

이제 추가한 블로그 항목이 GraphQL 클라이언트의 오른쪽 창에 나타납니다.

![GraphQL 클라이언트를 사용하면 브라우저에서 직접 GraphQL 서비스를 쉽게 호출할 수 있습니다.](./consuming-graphql-apis/images/02.png)

Liferay DXP는 돌연변이에서 요청한 필드가 포함된 블로그 항목의 JSON 표현을 반환합니다.

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
cURL:

`curl --request POST --url http://localhost:8080/o/graphql -u test@liferay.com:learn --header 'content-와 같은 웹 클라이언트를 사용하여 이러한 요청을 할 수 있습니다. 유형: application/json' --data '{"query":"mutation CreateBlog($blog: InputBlogPosting){ createSiteBlogPosting(blogPosting: $blog, siteKey: \"20122\" ) {    headline    articleBody    id    friendlyUrlPath  }    } ","variables":{"blog" :{"articleBody":"이 블로그 항목은 cURL을 사용하여 GraphQL 서비스를 호출하여 생성되었습니다!","headline":"cURL GraphQL 블로그 항목"}},"erationName":"CreateBlog"}'`
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

Liferay DXP는 귀하가 게시한 블로그 항목이 포함된 JSON을 반환합니다.

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

### 단일 블로그 항목 가져오기

단일 Blog 항목을 가져오기 위한 GraphQL 스키마의 API 호출에는 매개변수가 하나만 있습니다.

```
blogPosting(
   blogPostingId: Long
): BlogPosting
```

위 쿼리를 통해 블로그 게시물의 ID가 공개되었으므로 원하는 게시물만 검색할 수 있습니다.

```graphql
query {blogPosting(blogPostingId: 35541)
  { id
    headline
    articleBody}
}
```

이것을 클라이언트의 왼쪽 상단 창에 붙여넣고 **Play** 버튼을 클릭하세요. 동일한 블로그 항목을 반환합니다.

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

블로그 항목을 삭제하는 것은 블로그 항목을 만드는 것과 마찬가지로 돌연변이입니다. 호출은 단일 블로그 항목을 얻는 것과 거의 동일합니다.

```
deleteBlogPosting(
  blogPostingId: Long
): Boolean
```

클라이언트를 사용하면 다음과 같이 호출할 수 있습니다.

```graphql
mutation {
  deleteBlogPosting(blogPostingId: 35541)
}
```

이 호출은 성공 또는 실패를 나타내는 JSON 문서의 부울을 반환합니다.

```json
{
  "data": {
    "deleteBlogPosting": true
  }
}
```

축하해요! 이제 Liferay DXP의 GraphQL 서비스를 호출하는 방법을 배웠습니다. 위의 예에서는 기본 인증을 사용한다는 점을 기억하세요. 프로덕션의 경우 OAuth2를 사용하여 안전한 방식으로 서비스를 호출하세요.
