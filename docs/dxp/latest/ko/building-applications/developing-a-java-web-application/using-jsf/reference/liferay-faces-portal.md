# Liferay 얼굴 포털

*Liferay Faces Portal*은 `.jar` 파일로 배포됩니다. Liferay Faces Portal을 포틀릿 프로젝트에 대한 종속성으로 추가하여 Liferay 관련 유틸리티 및 UI 구성 요소를 사용할 수 있습니다. Liferay Faces Portal이 JSF 포틀릿 프로젝트에 포함된 경우 `com.liferay.faces.portal.[version].jar` 파일은 포틀릿의 라이브러리에 있습니다.

![구성한 JSF UI 구성 요소 제품군을 기반으로 JSF 포틀릿에 필요한 `.jar` 파일이 다운로드됩니다.](./liferay-faces-portal/images/01.png)

Liferay Faces Portal에 포함된 일부 기능은 다음과 같습니다.

* 유틸리티: 다양한 Portlet-API 및 Liferay 관련 편의 메서드를 포함하는 `LiferayPortletHelperUtil` 을 제공합니다.

* JSF 구성 요소: 널리 사용되는 Liferay DXP JSP 태그에 해당하는 일련의 JSF를 제공합니다(완벽하지 않음).
    * `liferay-ui:captcha` &rarr; `portal:captcha`
    * `liferay-ui:input-editor` &rarr; `portal:inputRichText`
    * `liferay-ui:search` &rarr; `portal:inputSearch`
    * `liferay-ui:header` &rarr; `portal:header`
    * `aui:nav` &rarr; `portal:nav`
    * `aui:nav-item` &rarr; `portal:navItem`
    * `aui:nav-bar` &rarr; `portal:navBar`
    * `liferay-security:permissionsURL` &rarr; `portal:permissionsURL`
    * `liferay-portlet:runtime` &rarr; `portal:runtime`

    자세한 내용은 [https://liferayfaces.org/web/guest/portal-showcase](https://liferayfaces.org/web/guest/portal-showcase)을 방문하십시오.

* 표현 언어: Liferay 관련 정보를 얻기 위한 `liferay` 및 즉시 사용 가능한 Liferay 국제화 메시지와의 통합을 위한 `i18n` 과 같은 일련의 EL 키워드를 추가합니다.

## 추가 정보

* [JSF 포틀릿 애플리케이션 개발 \(도움말 센터\)](https://help.liferay.com/hc/en-us/articles/360029069451-Developing-a-JSF-Portlet-Application)
* [라이프레이 페이스 브리지](./liferay-faces-bridge.md)
* [Liferay 얼굴 합금](./liferay-faces-alloy.md)