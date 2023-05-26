# Liferay 얼굴 합금

Liferay Faces Alloy는 `.jar` 파일로 배포됩니다. Liferay Faces Alloy를 포틀릿 프로젝트에 대한 종속성으로 추가하여 JSF 개발과 일관된 방식으로 AlloyUI를 사용할 수 있습니다.

```{note}
AlloyUI는 Liferay DXP 7.2에서 더 이상 사용되지 않습니다.
```

Liferay IDE/Developer Studio에서 JSF 포틀릿을 생성하는 동안 포틀릿의 JSF 구성 요소 제품군을 선택할 수 있습니다. 옵션에는 **JSF 표준** , [**ICEfaces**](http://www.icesoft.org/java/projects/ICEfaces/overview.jsf) , [**PrimeFaces**](http://primefaces.org/) , [**RichFaces**](http://richfaces.jboss.org/) 및 **Liferay Faces Alloy** 가 포함됩니다.

포틀릿 설정 중에 Liferay Faces Alloy JSF Component Suite를 선택한 경우 `.jar` 파일이 포틀릿 프로젝트에 포함됩니다.

Liferay Faces Alloy 프로젝트는 AlloyUI를 활용하는 일련의 UI 구성 요소를 제공합니다. 예를 들어 지원되는 일부 `aui:` 태그의 간략한 목록은 다음과 같습니다.

* 입력: `alloy:inputText`, `alloy:inputDate`, `alloy:inputFile`
* 패널: `합금:아코디언`, `합금:열`, `합금:필드세트`, `합금:행`
* 선택: `합금:selectOneMenu`, `합금:selectOneRadio`, `합금:selectStarRating`

YUI3을 기반으로 하는 Liferay의 AlloyUI 기술을 활용하려면 JSF 포틀릿 프로젝트에 Liferay Faces Alloy `.jar` 파일을 포함해야 합니다. JSF 포틀릿 설정 중에 **Liferay Faces Alloy** 을 선택한 경우 프로젝트에 Liferay Faces Alloy가 미리 구성되어 있으므로 자동으로 `합금:` 태그를 사용할 수 있습니다.

보시다시피 Liferay의 AlloyUI 태그를 사용하도록 JSF 애플리케이션을 구성하는 것은 매우 쉽습니다.

## 관련 주제

* [JSF 포틀릿 애플리케이션 개발 \(도움말 센터\)](https://help.liferay.com/hc/ko/articles/360029069451-Developing-a-JSF-Portlet-Application)
* [라이프레이 페이스 브리지](./liferay-faces-bridge.md)
* [Liferay 얼굴 포털](./liferay-faces-portal.md)