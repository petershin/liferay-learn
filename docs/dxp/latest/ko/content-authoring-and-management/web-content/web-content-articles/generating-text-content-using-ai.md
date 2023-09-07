# AI를 활용한 텍스트 콘텐츠 생성

{bdg-secondary}`7.4 U86+ 및 GA86+`

웹 콘텐츠는 AI Creator 도구를 사용하여 OpenAI의 ChatGPT 엔진과의 통합을 제공합니다. 인스턴스 또는 사이트에 대해 구성된 OpenAI API 키를 사용하면 웹 콘텐츠 편집기에서 AI Creator 기능을 사용할 수 있습니다. 구성한 후에는 몇 번의 클릭만으로 작업할 콘텐츠 생성을 시작할 수 있습니다.

## AI Creator 활성화

```{important}
웹 콘텐츠용 ChatGPT 통합은 현재 릴리스 기능 플래그 뒤에 있습니다. 자세한 내용은 [기능 플래그](../../../system-administration/configuring-liferay/feature-flags.md)를 참조하세요.
```

시작하려면 ChatGPT에 대한 액세스를 인증하기 위해 API 키를 추가해야 합니다. *인스턴스 설정*을 통해 [Liferay 인스턴스에 추가](#adding-an-api-key-to-a-liferay-instance)하거나 [특정 사이트에](#adding-an-api- 추가할 수 있습니다. 특정 사이트에 대한 키).

### Liferay 인스턴스에 API 키 추가

1. *전역 메뉴*( ![Global Menu](../../../images/icon-applications-menu.png) )을 열고 *제어판* 탭 &rarr; *인스턴스 설정* (구성 아래)로 이동합니다.

1. *콘텐츠 및 데이터*아래의 *AI Creator* 클릭하세요.

1. OpenAI API 키를 *API Key* 필드에 붙여넣습니다.

1. *저장*클릭하세요.

### 특정 사이트에 API 키 추가

특정 사이트 범위에 API 키를 추가하면 사이트마다 다른 키를 사용하거나 특정 사이트에서 키를 비활성화할 수 있습니다.

1. *제품 메뉴* ( ![Product Menu icon](../../../images/icon-product-menu.png) ) 을 열고 *구성* &rarr; *사이트 설정*선택합니다.

1. *콘텐츠 및 데이터*아래의 *AI Creator* 클릭하세요.

1. OpenAI API 키를 *API Key* 필드에 붙여넣습니다.

1. *저장*클릭하세요.

```{note}
OpenAI를 활성화하여 콘텐츠 생성 확인란을 전환하여 AI Creator 버튼을 활성화하거나 비활성화할 수 있습니다. 기능을 비활성화하도록 선택하면 웹 콘텐츠 편집기에 버튼이 표시되지 않습니다.
```

## AI Creator 사용

[기능 플래그를 활성화하고 API 키를 구성](#enabling-ai-creator)하면 웹 콘텐츠 편집기에서 AI Creator를 사용할 수 있게 됩니다. 콘텐츠 생성을 시작하려면 다음 단계를 따르세요.

1. *글로벌 메뉴*( ![Global Menu icon](../../../images/icon-applications-menu.png) )을 열고 오른쪽에서 사이트를 선택하세요.

1. *제품 메뉴* ( ![Product Menu Icon](../../../images/icon-product-menu.png) )을 열고 콘텐츠 & 데이터 아래에서 *웹 콘텐츠* 앱을 선택합니다.

1. 기본 웹 콘텐츠 기사를 생성하려면 *추가* ( ![Add icon](../../../images/icon-add.png) )을 클릭하세요.

1. *AI Creator*클릭하세요.
   
   ![기능 플래그를 활성화하면 웹 콘텐츠 편집기에서 AI Creator 버튼을 볼 수 있습니다.](./generating-text-content-using-ai/images/01.png)

1. AI Creator 모달 창에서 다음 세 가지 필드를 입력합니다.

    * **설명**: 원하는 콘텐츠(예: "고양이의 수면 습관에 관한 블로그 게시물").
    * **톤**: 텍스트의 톤입니다. Neutral, Casual, Friendly, Formal, Academic의 5가지 옵션을 사용할 수 있습니다.
    * **단어 수**: 텍스트의 대략적인 단어 수입니다.

1. *만들기*클릭합니다.

1. (선택 사항) AI 생성 콘텐츠가 마음에 들지 않으면 *다시 시도* 클릭하여 콘텐츠를 다시 생성할 수 있습니다.
   
   ![콘텐츠의 내용, 어조, 대략적인 단어 수를 선택할 수 있습니다. 콘텐츠가 마음에 들지 않으면 AI 창작자에게 콘텐츠 재생성을 요청할 수도 있습니다.](./generating-text-content-using-ai/images/02.png) 

    ```{important}
    콘텐츠 생성을 위한 각 요청은 [OpenAI API 토큰](https://help.openai.com/en/articles/4936856-what-are-tokens-and-how-to-count-them)을 소비합니다. 한도에 도달하면 일반적인 오류 메시지가 나타납니다.
    ```

1. *추가* 클릭하여 웹 콘텐츠 기사에 콘텐츠를 삽입하세요.

이제 생성된 콘텐츠로 작업을 시작할 수 있습니다.
