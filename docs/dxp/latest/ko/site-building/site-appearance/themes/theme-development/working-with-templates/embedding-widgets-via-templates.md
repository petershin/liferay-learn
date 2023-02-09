# 템플릿을 통해 위젯 포함

선택한 템플릿 파일을 사용하여 모든 페이지에서 사용할 수 있도록 테마에 위젯을 포함할 수 있습니다. 위젯을 포함할 때 위젯의 포틀릿 정의를 참조해야 합니다. <!-- Add link to portlet definitions article when available --> 일부 구성 요소 값을 제공합니다.

준비가 되면 위젯을 포함할 테마( `src/templates/` 디렉토리)에서 FreeMarker 템플릿(`.ftl`) 파일을 선택하십시오. 예를 들어 추가하는 대부분의 페이지에 위젯을 포함하려면 `portal_normal.ftl` 을 선택합니다.

선택한 위젯의 포틀릿 이름과 인스턴스 ID(위젯이 인스턴스화된 경우)를 사용하여 위젯을 포함하려는 템플릿 파일에 `liferay_portlet["runtime"]` 매크로를 추가합니다.

```
<@liferay_portlet["runtime"]
    instanceID="INSTANCE_ID"
    portletName="PORTLET_NAME"
/>
```

포틀릿 정의에서 위젯의 `javax.portlet.name` 값을 사용하여 포틀릿 이름을 제공하십시오. `com.liferay.portlet.instanceable` 속성이 `false`로 설정되지 않은 경우 인스턴스 ID도 제공해야 합니다.

예를 들어 이 매크로는 템플릿 파일에서 선택한 사이트에 탐색 메뉴를 포함합니다.

```
<@liferay_portlet["runtime"]
    portletName="com_liferay_product_navigation_applications_menu_web_internal_portlet_ProductNavigationApplicationsMenuPortlet"
/>
```

포함된 위젯을 템플릿에 추가했으면 `gulp deploy` 을 실행하여 변경 사항으로 테마를 빌드합니다. 배포된 테마는 이제 선택한 사이트에 포함된 위젯을 포함합니다.

<!-- When available, add more information referencing article as to embedding widgets by function (developer tutorial) -->
