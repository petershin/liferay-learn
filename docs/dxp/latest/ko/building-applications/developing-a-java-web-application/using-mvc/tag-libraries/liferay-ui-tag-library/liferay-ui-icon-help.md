# Liferay UI 아이콘 도움말

아이콘 도움말 태그를 사용하면 눈에 잘 띄지 않는 방식으로 사용자에게 추가 정보를 전달할 수 있습니다. 마우스 오버 시 팝업 도구 설명을 통해 자세한 정보를 제공하는 상징적인 물음표로 렌더링됩니다. 제어판에서 이에 대한 예를 볼 수 있습니다.

![다음은 아이콘 도움말 태그의 예입니다.](./liferay-ui-icon-help/images/01.png)

```{note}
사용자 지정 테마를 설치한 경우 ``liferay-ui:icon-help`` 태그가 작동하도록 다음 가져오기를 ``view.jsp``에 추가해야 할 수도 있습니다.

<%@ taglib uri="http: //liferay.com/tld/theme" 접두사="liferay-theme"%> <liferay-theme:defineObjects />
```

툴팁 정보가 필요한 UI 옆에 `<liferay-ui:icon-help/>` 태그를 추가합니다. 필수 `메시지`  속성으로 정보 텍스트를 정의하십시오. 다음은 서버 관리의 정리 작업 중 하나에 대한 예제 스니펫입니다.

```jsp
<h5>
    <liferay-ui:message key="clean-up-permissions" />
    <liferay-ui:icon-help message="clean-up-permissions-help" />
</h5>
```

![도움말 아이콘은 제어판 전체에서 사용됩니다.](./liferay-ui-icon-help/images/02.png)

메시지는 [언어 키](https://help.liferay.com/hc/en-us/articles/360028746692-Localizing-Your-Application)을 통해 제공됩니다. 테스트 목적으로 도구 설명의 메시지에 문자열을 사용할 수 있지만 언어 키는 모범 사례로 간주되며 프로덕션에서 사용해야 합니다.

## 관련 항목

* [점토 배지](../clay-tag-library/clay-badges.md)
* [점토 스티커](../clay-tag-library/clay-stickers.md)
* [Liferay UI 아이콘 메뉴](./liferay-ui-icon-menus.md)