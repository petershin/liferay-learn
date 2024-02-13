---
toc:
- ./liferay-frontend-tag-library/liferay-frontend-add-menu.md
- ./liferay-frontend-tag-library/liferay-frontend-cards.md
- ./liferay-frontend-tag-library/liferay-frontend-info-bar.md
- ./liferay-frontend-tag-library/liferay-frontend-management-bar.md
- ./liferay-frontend-tag-library/including-actions-in-the-management-bar.md
- ./liferay-frontend-tag-library/disabling-the-management-bar.md
---
# Liferay 프런트엔드 태그 라이브러리

Liferay 프런트 엔드 태그 라이브러리는 앱에서 공통 프런트 엔드 UI 구성 요소를 만들기 위한 태그 세트를 제공합니다.

앱에서 프런트 엔드 taglib를 사용하려면 JSP에 다음 선언을 추가합니다.

```jsp
<%@ taglib prefix="liferay-frontend" uri="http://liferay.com/tld/frontend" %>
```

Liferay Front-end taglib는 FreeMarker 테마 템플릿 및 웹 콘텐츠 템플릿용 매크로를 통해서도 사용할 수 있습니다. 다음 구문을 따르십시오.

```
<@liferay_frontend["tag-name"] attribute="string value" attribute=10 />
```

이 섹션에서는 다음 프런트 엔드 UI 구성요소를 다룹니다.

* [메뉴 추가](./liferay-frontend-tag-library/liferay-frontend-add-menu.md)
* [카드](./liferay-frontend-tag-library/liferay-frontend-cards.md)
* [정보 표시줄](./liferay-frontend-tag-library/liferay-frontend-info-bar.md)
* [관리 표시줄](./liferay-frontend-tag-library/liferay-frontend-management-bar.md)

각 문서에는 결과 UI의 스크린샷과 함께 일련의 예제가 포함되어 있습니다. 