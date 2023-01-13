# API 헤더 참조

이 문서에서는 Headless API 요청을 할 때 사용할 수 있는 헤더를 설명합니다.

* [`Accept`](#accept)
* [`Accept-Language`](#accept-language)
* [`Authorization`](#authorization)
* [`Content-Type`](#content-type)
* [`Cookie`](#cookie)

## `Accept`

응답 콘텐츠가 취해야 하는 형식을 나타냅니다. 기본값은 `json`입니다.

### 유효한 옵션

* `json`
* `xml`

### 예

```bash
curl --header 'Accept: application/xml' 'example.com/o/headless-admin-user/v1.0/user-accounts'
```

## `Accept-Language`

여러 언어로 번역된 콘텐츠가 포함된 리소스의 경우 반환된 응답 콘텐츠의 언어를 나타냅니다.

### 유효한 옵션

모든 유효한 언어 태그(ISO-639 언어 식별자와 ISO-3166-1 alpha-2 국가 식별자) 예: `en-US`, `es-ES`. 요청한 콘텐츠가 있는 사이트의 기본 언어로 기본 설정됩니다.

### 예

```
curl --header 'Accept-Language: pt-BR' 'example.com/o/headless-delivery/v1.0/sites/20124/blog-postings'
```

## `Authorization`

DXP의 인증 프레임워크를 사용하여 요청하는 사용자를 식별합니다. ( [`쿠키`](#cookie)도 참조하십시오.) 이것과 `쿠키` 이 모두 제공되지 않으면 게스트(인증되지 않은) 사용자로 요청이 시도됩니다.

### 유효한 옵션

* `기본` + Base64 인코딩 자격 증명
* `베어러` + OAuth 토큰

### 예

```
curl --header 'Authorization: Basic dXNlcm5hbWU6cGFzc3dvcmQK' 'example.com/o/headless-admin-user/v1.0/user-accounts'
```

## `Content-Type`

바이너리 데이터 업로드를 허용합니다.

### 유효한 옵션

* `multipart/form-data`

### 예

```
curl --form 'file=@myfile.txt' --header 'Content-Type: multipart/form-data; boundary=ARBITRARY' 'example.com'
```

## `Cookie`

DXP의 인증 프레임워크를 사용하여 요청하는 사용자를 식별합니다. (또한 참조 [`인증`](#authorization).) 이것과 `Authorization` 이 모두 제공되지 않으면 게스트(인증되지 않은) 사용자로 요청이 시도됩니다.

### 유효한 옵션

* `JSESSIONID`

### 예

```
curl --header 'Cookie: JSESSIONID=6349351B37C3EE1F6BA4E128107E9A34' 'example.com/o/headless-admin-user/v1.0/user-accounts'
```

## `X-Accept-All-Languages`

서버가 사용 가능한 모든 언어로 요청된 콘텐츠를 반환해야 함을 나타냅니다. ( [`Accept-Language`](#accept-language)도 참조하십시오.)

### 유효한 옵션

* `true`
* `false`

### 예

```
curl --header 'X-Accept-All-Languages: true' 'example.com/o/headless-admin-user/v1.0/user-accounts'
```
