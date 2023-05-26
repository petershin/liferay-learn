# 템플릿에 위젯 포함

웹 콘텐츠 템플릿에 위젯을 포함할 수 있습니다. 위젯이 핵심 앱인지, 사용자 지정 앱인지, 인스턴스화 가능 또는 인스턴스화 불가능인지는 중요하지 않습니다. 다음은 FreeMarker에 웹 콘텐츠 위젯을 포함하는 예입니다.

```markup
<@liferay_portlet["runtime"] portletName="com_liferay_journal_content_web_portlet_JournalContentPortlet" />
```

웹 콘텐츠 템플릿에 위젯 포함을 시작하려면 다음 단계를 따르세요.

1. 사이트(이 예에서는 기본 DXP 사이트)**사이트 관리** 로 이동합니다.
1. **콘텐츠 & 데이터** &rarr; **웹 콘텐츠** 를 클릭합니다.
1. **템플릿** 탭을 클릭합니다.

    ![템플릿 탭에는 사이트의 템플릿이 표시됩니다.](./embedding-widgets-in-templates/images/01.png)

1. 추가(![Add Icon](../../../images/icon-add.png)) 아이콘을 클릭합니다.
1. 템플릿 이름을 입력합니다(예: **Template 1**).
1. **속성** 섹션에서 **선택** 을 클릭하여 구조를 선택합니다(예: **구조 1**).

    ![구조를 선택합니다.](./embedding-widgets-in-templates/images/02.png)

1. 템플릿 편집기에 매크로(예: `<@liferay_portlet["runtime"] portletName="com_liferay_journal_content_web_portlet_JournalContentPortlet" />`)를 붙여넣습니다. 포틀릿이 인스턴스화 가능한지 여부에 따라 포틀릿 ID를 입력해야 할 수도 있습니다.

    ![포틀릿 매크로를 입력하십시오.](./embedding-widgets-in-templates/images/03.png)

1. 완료되면 **저장** 을 클릭합니다.

```{important}
`theme` 변수는 더 이상 FreeMarker 컨텍스트에 주입되지 않습니다. DXP 7.0에서 테마 변수가 제거된 이유와 코드 업데이트 제안에 대한 자세한 내용은 [Taglib는 더 이상 FreeMarker의 테마 변수를 통해 액세스할 수 없음](https://help.liferay.com/hc/articles/) 을 참조하세요. 360017892092-Breaking-Changes 소개-#taglibs-are-no-longer-accessible-via-the-the-the-the-me-variable-in-freemarker) 주요 변경 항목.
```

## 다른 템플릿 포함

템플릿에 위젯을 포함하는 것 외에도 템플릿을 다른 템플릿에 포함할 수 있습니다. 이를 통해 재사용 가능한 코드, JavaScript 라이브러리 가져오기, 스크립트 또는 매크로를 사용할 수 있습니다.

다음은 FreeMarker에 템플릿을 포함하는 예입니다.

```markup
<#include "${templatesPath}/[template-key]" />
```

이전에 게시된 템플릿을 편집할 때 **템플릿 키** 을 찾을 수 있습니다.

![템플릿의 편집 페이지를 볼 때 템플릿 키를 찾을 수 있습니다.](./embedding-widgets-in-templates/images/04.png)

## 관련 주제

* [포틀릿 이름으로 포틀릿 포함](https://help.liferay.com/hc/articles/360028746512-Embedding-a-Portlet-by-Portlet-Name)
