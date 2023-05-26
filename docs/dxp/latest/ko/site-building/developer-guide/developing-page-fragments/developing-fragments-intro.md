# 조각 개발

페이지 조각은 [콘텐츠 페이지](../../creating-pages/understanding-pages/understanding-pages.md#content-pages) 의 빌딩 블록입니다. CSS, HTML 및 JavaScript의 세 가지 웹 페이지 구성 요소로 만들어집니다. 페이지를 만들려면 여러 조각을 결합하고 함께 페이지 디자인과 해당 기능을 만듭니다. 조각은 더 큰 페이지 요소(예: 카드 또는 단락 요소)를 구성하거나 자체적으로 독립할 수 있습니다(예: 배너).

![조각은 퍼즐 조각처럼 결합되어 콘텐츠 페이지를 구성합니다.](./developing-fragments-intro/images/01.png)

```{note}
Liferay DXP 7.4+의 경우 조각 컬렉션은 Liferay UI에서 조각 세트라고 합니다.
```

## 프래그먼트 세트

세트는 관련 조각 그룹을 관리하고 공유할 수 있도록 조각을 구성합니다. 사용자는 페이지에 추가할 조각을 선택할 때 집합을 탐색하므로 페이지에 쉽게 결합할 수 있도록 집합에 조각을 만들 수 있습니다. 모든 기본 조각(및 해당 코드)을 보여주는 관리 페이지에 예제가 나타납니다. 페이지 조각의 코드는 관리 인터페이스를 통해 업데이트할 수 있습니다. 대신 페이지 조각의 코드를 정적(잠금 상태이며 인터페이스를 통해 편집할 수 없음)으로 만들려면 [기여 조각 세트](./creating-a-contributed-fragment-set.md)을 생성할 수 있습니다.

## 압형

브라우저 기반 도구는 시스템에서 직접 Fragment를 생성하는 데 도움이 되며 CLI 기반 도구는 자체 도구 세트와 통합되어 생산성을 유지합니다.

* [내장 조각 편집기](./using-the-fragments-editor.md): 내장 편집기를 사용하여 Liferay Portal 내부에서 페이지 조각을 개발합니다.
* [Fragments Toolkit](./using-the-fragments-toolkit.md): Fragments CLI를 사용하여 데스크톱에서 페이지 조각 및 조각 세트를 생성, 가져오기 및 내보냅니다.

## 특징

프래그먼트는 아래 리소스를 사용하여 향상될 수 있으므로 일반 HTML, CSS 및 JavaScript보다 훨씬 강력합니다.

* [편집 가능한 요소](../reference/fragments/fragment-specific-tags-reference.md): 텍스트, 이미지, 링크 및 "서식 있는" 텍스트 요소를 편집 가능하게 만들어 사용자가 콘텐츠를 사용자 지정 텍스트 및 이미지로 바꿀 수 있습니다. 이것이 Fragment를 재사용할 수 있게 만드는 핵심 기능입니다. 위젯을 포함할 수도 있습니다.
* [드롭 영역](./defining-fragment-drop-zones) : `<lfr-drop-zone></lfr-drop-zone>` 레이블을 사용하여 조각에 드롭 영역을 추가합니다. 추가되면 조각과 위젯을 정의된 영역으로 끌어다 놓을 수 있습니다.
* [구성 옵션](./adding-configuration-options-to-fragments.md) <!-- TODO: Fix link --> : Fragment의 글꼴 색상 수정과 같은 구성 옵션을 응용 프로그램의 구성 메뉴에 추가합니다.
* [FreeMarker](https://freemarker.apache.org/) : FreeMarker는 변수, 조건문 등으로 HTML을 향상시키는 템플릿 언어입니다. HTML에서 FreeMarker에 대해 [대체(대괄호) 구문](https://freemarker.apache.org/docs/dgui_misc_alternativesyntax.html) 을 사용할 수 있습니다.

```{important}
신뢰할 수 있는 사용자에게만 FreeMarker에서 템플릿 생성 또는 편집 권한을 부여합니다. [웹 콘텐츠 구조 및 템플릿에 권한 할당](../../../content-authoring-and-management/web-content/web-content-structures/assigning-permissions-to-structures-and-templates 참조) .md#security-considerations-for-web-content-templates) 웹 콘텐츠 템플릿 보안에 대한 정보.
```

## 모범 사례

Fragment 코드를 작성할 때 다음 모범 사례를 권장합니다.

* 코드를 시맨틱하고 재사용 가능하게 만드십시오.
* 프래그먼트 외부 페이지의 다른 요소를 방해하지 않도록 프래그먼트의 네임스페이스를 적절하게 지정합니다.
* 자동 생성된 Fragment 클래스를 추가하는 모든 CSS 선택기의 기초로 사용하여 다른 Fragment에 영향을 주지 않도록 합니다.
* JavaScript는 쉽게 재사용할 수 없으므로 드물게 사용하십시오. 대신 외부 JavaScript 라이브러리를 참조하십시오.
* 조각 구성 텍스트 값을 이스케이프합니다.

## 관련 주제

* [조각에 구성 옵션 추가](./adding-configuration-options-to-fragments.md)
* [조각 편집기 사용](./using-the-fragments-editor.md)
* [조각 툴킷 사용](./using-the-fragments-toolkit.md)
