# 웹 콘텐츠 템플릿 만들기

웹 콘텐츠 템플릿은 FreeMarker 템플릿 언어(FTL)를 사용하여 콘텐츠 필드가 페이지에서 렌더링되는 방식을 결정합니다. 각 템플릿은 웹 콘텐츠 [구조](../web-content-structures/creating-structures.md) 또는 [다른 템플릿에 포함](./embedding-widgets-in-templates.md# 포함-기타-템플릿) .

```{important}
신뢰할 수 있는 사용자에게만 FreeMarker에서 템플릿 생성 또는 편집 권한을 부여합니다. 자세한 내용은 [웹 콘텐츠 구조 및 템플릿에 대한 권한 할당](../web-content-structures/assigning-permissions-to-structures-and-templates.md#security-considerations-for-web-content-templates) 을 참조하십시오. 웹 콘텐츠 템플릿 보안.
```

## 웹 콘텐츠 템플릿을 만드는 방법

1. **사이트 메뉴**(![Site Menu](./../../../images/icon-menu.png))을 열고 **콘텐츠 & 데이터** &rarr; **웹 콘텐츠** 로 이동합니다.

1. **템플릿** 탭을 선택하고 **추가 버튼**(![Add Template](../../../images/icon-add.png))을 클릭하여 새 웹 콘텐츠 템플릿을 만듭니다.

1. 새 템플릿의 제목을 입력합니다.

1. 선택적으로 다음과 같이 구성 가능한 템플릿 속성 [을](#configurable-template-properties) 수 있습니다.
   
   ![필요에 따라 속성 패널에서 템플릿 설정을 결정합니다.](./creating-web-content-templates/images/01.png)

1. 스크립트 창을 통해 템플릿에 FreeMarker 코드를 추가하거나 **파일** 을 클릭하여 가져올 기존 `.ftl` 스크립트 파일을 선택합니다.
   
   스크립트 창에 수동으로 코드를 입력할 때 왼쪽 템플릿 패널에서 표준 변수에 빠르게 접근할 수 있습니다. 템플릿의 구조를 선택한 경우 **친숙한 URL** 변수뿐만 아니라 특정 필드에 대한 변수에도 액세스할 수 있습니다.
   
   그런 다음 템플릿의 스크립트에 HTML 또는 추가 FreeMarker 코드를 추가할 수 있습니다.
   
   ![선택한 구조에 특정한 변수뿐만 아니라 왼쪽 템플릿 패널에서 표준 변수에 액세스합니다.](./creating-web-content-templates/images/02.png)

1. 완료되면 **저장** 또는 **저장하고 계속하기** 을 클릭하여 진행 상황을 저장하고 편집을 계속합니다. 

   ```{important}
   템플릿이 구조와 연결되고 저장되면 더 이상 이 템플릿 속성을 변경할 수 없습니다.
   ```

저장되면 DXP는 속성 패널에서 볼 수 있는 템플릿에 대한 DDM 템플릿 키, URL 및 WebDAV URL을 자동으로 생성합니다.

![DXP는 템플릿에 대한 DDM 템플릿 키, URL 및 WebDAV URL을 자동으로 생성합니다.](./creating-web-content-templates/images/03.png)

템플릿을 생성하면 연결된 구조로 생성된 [웹 콘텐츠에 사용](../web-content-articles/adding-a-basic-web-content-article.md)하거나 [삽입할 수 있습니다. in other Templates](./embedding-widgets-in-templates.md#embedding-other-templates) , 구성에 따라 다릅니다. 언제든지 템플릿을 편집할 수도 있습니다.

```{note}
구조를 변경하려면 연결된 템플릿을 변경해야 할 수 있습니다. 예를 들어 템플릿에서 참조되는 구조 필드 이름이 변경되거나 제거된 경우 템플릿의 참조를 수동으로 업데이트해야 합니다.
```

## 구성 가능한 템플릿 속성

템플릿을 만드는 동안 속성 패널에서 다음 템플릿 설정을 선택적으로 결정할 수 있습니다.

* **구조** : 구조 필드를 사용하여 템플릿을 기존 웹 콘텐츠 구조와 연결하거나 이 필드를 비워 두어 다른 웹 콘텐츠 템플릿에 포함할 수 있는 일반 템플릿을 만듭니다.

* **설명** : 설명 필드를 사용하여 템플릿에 대한 현지화된 설명을 제공합니다.

* **캐시 가능** : 기본적으로 새 템플릿은 캐시 가능합니다. 동적 동작이 필요한 경우 이 속성을 선택 취소합니다(예: [taglibs](./using-taglibs-in-templates.md), 요청 처리, CMS 쿼리 API).

* **추천 이미지** : URL을 통해 또는 장치에서 템플릿의 추천 이미지를 선택합니다.

## 관련 주제

* [구조 만들기](../web-content-structures/creating-structures.md)
* [기본 웹 콘텐츠 기사 추가](../web-content-articles/adding-a-basic-web-content-article.md)
* [템플릿에 위젯 포함](./embedding-widgets-in-templates.md)
