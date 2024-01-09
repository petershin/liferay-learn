# 워크플로 알림 템플릿 변수

{bdg-secondary}`라이프레이 7.3+`

일부 변수는 워크플로 알림 컨텍스트에 자동 주입됩니다. 이는 워크플로 알림 템플릿에서 사용하기 편리합니다.

일반적으로 Freemarker에서는 변수를 명시적으로 선언해야 합니다.

```markup
<#assign variableName = "Variable Name" />
```

주입된 변수는 이미 선언되어 있으며 템플릿에서 직접 사용할 수 있습니다.

```markup
${variableName}
```

이러한 변수를 사용하려면 워크플로우 알림 컨텍스트에서 사용 가능한 변수를 알아야 합니다. 사용 가능한 변수는 워크플로 정의 세부 정보 및 워크플로의 자산에 따라 변경됩니다. 여기에 제시된 방법은 특정 컨텍스트에 대한 변수 목록을 가져오는 방법을 보여주므로 추측할 필요가 없습니다.

## 워크플로 알림 템플릿 변수 검색

워크플로 알림 컨텍스트에서 사용 가능한 변수를 표시하려면 `TemplateNotificationMessageGenerator` 클래스에 대해 DEBUG 수준 [로깅](../../../system-administration/using-the-server-administration-panel/configuring-logging.md) 을 활성화합니다.

1. 제어판 &rarr; 구성 &rarr; 서버 관리로 이동합니다.

1. 로그 수준 탭을 클릭합니다.

1. 다음 구성으로 로그 수준을 추가합니다.

   - **로거 이름** : `com.liferay.portal.workflow.kaleo.runtime.internal.notification.TemplateNotificationMessageGenerator`
   - **로그 레벨** : `디버그`

1. [자산(예: 블로그 항목)에서 워크플로 정의](../using-workflows/activating-workflow.md) (예: 단일 승인자 정의)을 활성화합니다.

1. 테스트 항목을 제출하면 워크플로 컨텍스트에서 사용 가능한 워크플로 알림 템플릿 변수를 나타내는 로그 메시지가 나타납니다.

예를 들어 단일 승인자 워크플로는 자산의 초기 제출 시 다음 변수를 표시합니다.

```bash
2020-03-30 14:21:42.089 DEBUG [liferay/kaleo_graph_walker-2][TemplateNotificationMessageGenerator:94] saxReaderUtil (class com.sun.proxy.$Proxy447)
2020-03-30 14:21:42.097 DEBUG [liferay/kaleo_graph_walker-2][TemplateNotificationMessageGenerator:94] getterUtil (class com.liferay.portal.kernel.util.GetterUtil_IW)
2020-03-30 14:21:42.098 DEBUG [liferay/kaleo_graph_walker-2][TemplateNotificationMessageGenerator:94] portalPermission (class com.liferay.portal.service.permission.PortalPermissionImpl)
2020-03-30 14:21:42.098 DEBUG [liferay/kaleo_graph_walker-2][TemplateNotificationMessageGenerator:94] entryClassPK (class java.lang.String)
2020-03-30 14:21:42.098 DEBUG [liferay/kaleo_graph_walker-2][TemplateNotificationMessageGenerator:94] layoutPermission (class com.liferay.portal.service.permission.LayoutPermissionImpl)
2020-03-30 14:21:42.098 DEBUG [liferay/kaleo_graph_walker-2][TemplateNotificationMessageGenerator:94] expandoTableLocalService (class com.sun.proxy.$Proxy43)
2020-03-30 14:21:42.098 DEBUG [liferay/kaleo_graph_walker-2][TemplateNotificationMessageGenerator:94] localeUtil (class com.liferay.portal.kernel.util.LocaleUtil)
2020-03-30 14:21:42.099 DEBUG [liferay/kaleo_graph_walker-2][TemplateNotificationMessageGenerator:94] groupId (class java.lang.String)
2020-03-30 14:21:42.099 DEBUG [liferay/kaleo_graph_walker-2][TemplateNotificationMessageGenerator:94] portalUtil (class com.liferay.portal.util.PortalImpl)
...
```

위의 출력 스니펫은 `saxReaderUtil`, `getterUtil`, `portalPermission`, `entryClassPK`, `layoutPermission`, `expandoTableLocalService`, `localeUtil`, `groupId`및 `PortalUtil` 이 발생한 컨텍스트에서 사용 가능함을 보여줍니다. 이러한 메시지는 로그에 인쇄됩니다.

### 워크플로 알림 템플릿 변수 사용

상황에 맞게 삽입된 알림 변수는 두 가지 주요 유형으로 분류할 수 있습니다.

1. **값** 변수는 단일 값을 제공합니다. 변수가 단일 값을 제공하는 경우 이를 사용하여 알림에 해당 값을 표시하거나 알림 메시지에 표시할 기타 유용한 정보를 검색하는 작업에 매개변수로 전달할 수 있습니다.

**예:** 단일 승인자 정의는 FreeMarker 템플릿에서 다음 알림을 제공합니다.

   ```markup
   ${userName} sent you a ${entryType} for review in the workflow.
   ```

   `userName` 및 `entryType` 은 값을 제공하므로 알림은 다음과 같이 렌더링될 수 있습니다.

**Joe Bloggs는 워크플로에서 검토할 블로그 항목을 보냈습니다.**


   값 유형 변수의 내용도 확인할 수 있습니다. 단일 승인자 정의에는 다음 알림 템플릿도 포함됩니다.

   ```markup
   Your submission was reviewed<#if taskComments?has_content> and the reviewer applied the following ${taskComments}</#if>.
   ```

   검토자가 작업 설명을 제공한 경우 표시됩니다. 그렇지 않으면 알림 수신자는

**제출하신 내용을 검토했습니다.**

1. **작업** 변수는 Liferay DXP Java 클래스를 노출하므로 알림 템플릿에서 해당 작업에 액세스할 수 있습니다. 이러한 변수에 대해서는 클래스의 [Javadoc](https://learn.liferay.com/web/guest/w/reference/dxp/javadocs) 에 익숙해지거나 [소스 코드](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]) 살펴보고 해당 작업을 이해해야 합니다.

**예:** 이 FreeMarker는 기본 로케일을 사용하여 특정 패턴(**월/일/년, 시:분**)으로 현재 날짜를 가져옵니다.

   ```markup
   ${dateUtil.getCurrentDate("MM/dd/yyyy, HH:mm",  localeUtil.getDefault())}`
   ```

## 워크플로 알림 템플릿 변수 이해

다음은 블로그 항목에 대해 단일 승인자 정의 활성화한 다음 게시를 위해 새 항목을 제출할 때 기록되는 변수입니다.

| 변수 이름                             | 가치       | 운영       | 설명 또는 링크                                                                                                                                                                                                                                                          |
|:--------------------------------- |:-------- |:-------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `${saxReaderUtil}`                |          | &#10004; | [SaxReader유틸](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/xml/SAXReaderUtil.html)                                                                                                                          |
| `${getterUtil}`                   |          | &#10004; | [GetterUtil](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/GetterUtil.html)                                                                                                                             |
| `${portalPermission}`             |          | &#10004; | [PortalPermission](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/PortalPermission.html)                                                                                                   |
| `${entryClassPK}`                 | &#10004; |          | 엔트리 클래스의 기본 키                                                                                                                                                                                                                                                     |
| `${layoutPermission}`             |          | &#10004; | [레이아웃 권한](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/LayoutPermission.html)                                                                                                            |
| 1${expandoTableLocalService}1     |          | &#10004; | [ExpandoTableLocalService](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/service/ExpandoTableLocalService.html)                                                                                             |
| `${localeUtil}`                   |          | &#10004; | [로케일유틸](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/LocaleUtil.html)                                                                                                                                  |
| `${groupId}`                      | &#10004; |          | 그룹의 ID                                                                                                                                                                                                                                                            |
| `${portalUtil}`                   |          | &#10004; | [PortalUtil](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/PortalUtil.html)                                                                                                                             |
| `${validator}`                    |          | &#10004; | [Validator](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/Validator.html)                                                                                                                               |
| `${dateUtil}`                     |          | &#10004; | [날짜유틸](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/DateUtil.html)                                                                                                                                     |
| `${serviceLocator}`               |          | &#10004; | [ServiceLocator](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portal/template/ServiceLocator.html)                                                                                                                          |
| `${serviceContext}`               |          | &#10004; | [서비스 컨텍스트](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/ServiceContext.html)                                                                                                                        |
| `${jsonFactoryUtil}`              |          | &#10004; | [JSONFactoryUtil](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/json/JSONFactoryUtil.html)                                                                                                                   |
| `${stringUtil}`                   |          | &#10004; | [StringUtil](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/StringUtil.html)                                                                                                                             |
| `${freeMarkerPortletPreferences}` |          | &#10004; | [템플릿PortletPreferences](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portal/template/TemplatePortletPreferences.html)                                                                                                       |
| `${dateFormats}`                  |          | &#10004; | [FastDateFormatFactory](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/FastDateFormatFactory.html)                                                                                                       |
| `${dateFormatFactory}`            |          | &#10004; | [날짜 형식 공장](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/DateFormatFactory.html)                                                                                                                        |
| `${userPortraitURL}`              | &#10004; |          | 블로그 항목에만 적용됩니다. URL을 사용자 초상화로 반환합니다.                                                                                                                                                                                                                              |
| `${portal}`                       |          | &#10004; | [포탈](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/Portal.html)                                                                                                                                         |
| `${commonPermission}`             |          | &#10004; | [CommonPermission](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/CommonPermission.html)                                                                                                   |
| `${userURL}`                      | &#10004; |          | 블로그 항목에만 적용됩니다. 로그인한 사용자의 프로필 페이지에 대한 URL을 반환합니다. [UserImpl#getDisplayURL](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portal/model/impl/UserImpl.html) 참조하십시오. |
| `${expandoValueLocalService}`     |          | &#10004; | [ExpandoValueLocalService](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/service/ExpandoValueLocalService.html)                                                                                             |
| `${entryType}`                    | &#10004; |          | 워크플로의 항목 유형(예: 블로그 항목)                                                                                                                                                                                                                                            |
| `${organizationPermission}`       |          | &#10004; | [조직권한](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/OrganizationPermission.html)                                                                                                         |
| `${passwordPolicyPermission}`     |          | &#10004; | [PasswordPolicy권한](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/PasswordPolicyPermission.html)                                                                                           |
| `${expandoColumnLocalService}`    |          | &#10004; | [ExpandoColumnLocalService](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/service/ExpandoColumnLocalService.html)                                                                                           |
| `${taskComments}`                 | &#10004; |          | 리뷰어가 남긴 코멘트(있는 경우)                                                                                                                                                                                                                                                |
| `${staticFieldGetter}`            |          | &#10004; | [StaticFieldGetter](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/StaticFieldGetter.html)                                                                                                               |
| `${htmlUtil}`                     |          | &#10004; | [HtmlUtil](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/HtmlUtil.html)                                                                                                                                 |
| `${languageUtil}`                 |          | &#10004; | [언어유틸](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/language/LanguageUtil.html)                                                                                                                             |
| `${enumUtil}`                     |          | &#10004; | `의 결과를 반환합니다. beansWrapper.getEnumModels()`; [열거형 액세스](https://freemarker.apache.org/docs/pgui_misc_beanwrapper.html#jdk_15_enums)                                                                                                                                |
| `${windowStateFactory}`           |          | &#10004; | [WindowStateFactory](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/WindowStateFactory.html)                                                                                                          |
| `${companyId}`                    | &#10004; |          | 포털의 회사/가상 인스턴스 ID                                                                                                                                                                                                                                                 |
| `${unicodeFormatter}`             |          | &#10004; | [유니코드포맷터](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/UnicodeFormatter.html)                                                                                                                          |
| `${propsUtil}`                    |          | &#10004; | [소품유틸](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/PropsUtil.html)                                                                                                                                    |
| `${browserSniffer}`               |          | &#10004; | [브라우저스니퍼](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/servlet/BrowserSniffer.html)                                                                                                                         |
| `${portletProviderAction}`        | &#10004; |          | [PortletProvider#Action](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/PortletProvider.Action.html) 호출의 결과를 반환합니다.                                                                                   |
| `${taskName}`                     | &#10004; |          | 알림이 있는 작업의 이름                                                                                                                                                                                                                                                     |
| `${httpUtil}`                     |          | &#10004; | [HttpUtil](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/HttpUtil.html)                                                                                                                                 |
| `${portletURLFactory}`            |          | &#10004; | [포틀릿 URL팩토리](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/PortletURLFactory.html)                                                                                                                   |
| `${imageToken}`                   | &#10004; |          | [의 이미지 토큰 WebServerServletToken.getToken(long imageId)](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/webserver/WebServerServletToken.html) ; 더 이상 사용되지 않으며 제거됩니다.                                            |
| `${groupPermission}`              |          | &#10004; | [그룹권한](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/GroupPermission.html)                                                                                                                |
| `${timeZoneUtil}`                 |          | &#10004; | [TimeZoneUtil](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/TimeZoneUtil.html)                                                                                                                         |
| `${unicodeLanguageUtil}`          |          | &#10004; | [유니코드언어유틸](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/language/UnicodeLanguageUtil.html)                                                                                                                  |
| `${expandoRowLocalService}`       |          | &#10004; | [ExpandoRowLocalService](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/service/ExpandoRowLocalService.html)                                                                                                 |
| `${auditRouterUtil}`              |          | &#10004; | [감사라우터유틸](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/audit/AuditRouterUtil.html)                                                                                                                          |
| `${kaleoTaskInstanceToken}`       |          | &#10004; | [워크플로 스크립팅에 대한 설명서를 참조하십시오.](./../developer-guide/using-the-script-engine-in-workflow.md#predefined-variables)                                                                                                                                                    |
| `${accountPermission}`            |          | &#10004; | [계정 권한](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/AccountPermission.html)                                                                                                             |
| `${httpUtilUnsafe}`               |          | &#10004; | `${httpUtil}`와 마찬가지로 [Http](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/Http.html) 인스턴스이지만 로컬 네트워크에 액세스하는 데 사용할 수 있습니다.                                                                                |
| `${workflowTaskAssignees}`        | &#10004; |          | [워크플로 스크립팅에 대한 설명서를 참조하십시오.](./../developer-guide/using-the-script-engine-in-workflow.md#predefined-variables)                                                                                                                                                    |
| `${random}`                       |          | &#10004; | [무작위](https://docs.oracle.com/javase/8/docs/api/java/util/Random.html) 숫자를 생성하는 Java 유틸리티입니다. 더 이상 사용되지 않으며 향후 제거됩니다.                                                                                                                                             |
| `${rolePermission}`               |          | &#10004; | [역할 권한](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/RolePermission.html)                                                                                                                |
| `${portletPermission}`            |          | &#10004; | [Portlet권한](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/PortletPermission.html)                                                                                                         |
| `${paramUtil}`                    |          | &#10004; | [ParamUtil](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/ParamUtil.html)                                                                                                                               |
| `${locationPermission}`           | &#10004; |          | `의 결과를 반환합니다. OrganizationPermissionUtil.getOrganizationPermission()`                                                                                                                                                                                             |
| `${calendarFactory}`              |          | &#10004; | [캘린더팩토리](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/CalendarFactory.html)                                                                                                                            |
| `${webServerToken}`               | &#10004; |          | [WebServerServletToken.getToken(long imageId)](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/webserver/WebServerServletToken.html) 의 이미지 토큰                                                                   |
| `${sessionClicks}`                |          | &#10004; | [세션 클릭수](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/SessionClicks.html)                                                                                                                              |
| `${userPermission}`               |          | &#10004; | [사용자 권한](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/UserPermission.html)                                                                                                               |
| `${entryClassName}`               | &#10004; |          |                                                                                                                                                                                                                                                                   |
| `${userGroupPermission}`          |          | &#10004; | [사용자 그룹 권한](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/UserGroupPermission.html)                                                                                                       |
| `${arrayUtil}`                    |          | &#10004; | [어레이유틸](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/ArrayUtil.html)                                                                                                                                   |
| `${userName}`                     | &#10004; |          | 워크플로에 개입할 마지막 사용자의 사용자 이름                                                                                                                                                                                                                                         |
| `${userId}`                       | &#10004; |          | 워크플로에 개입할 마지막 사용자의 사용자 ID입니다. [로직을 이해하려면 Workflow Scripting 문서를 참조하십시오.](./../developer-guide/using-the-script-engine-in-workflow.md#predefined-variables)                                                                                                        |
| `${prefsPropsUtil}`               |          | &#10004; | [PrefsPropsUtil](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/PrefsPropsUtil.html)                                                                                                                     |
| `${url}`                          | &#10004; |          | 페이지에 표시되는 특정 콘텐츠 유형에 대한 URL(예: 블로그 항목, 게시판 메시지 및 Wiki 페이지)                                                                                                                                                                                                        |
| `${kaleoInstanceToken}`           | &#10004; |          | [워크플로우 스크립팅 문서를 참조하십시오.](./../developer-guide/using-the-script-engine-in-workflow.md#predefined-variables)                                                                                                                                                        |
| `${utilLocator}`                  |          | &#10004; | [UtilLocator](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portal/template/UtilLocator.html)                                                                                                                                |
| `${objectUtil}`                   |          | &#10004; | `을 반환합니다. new LiferayObjectConstructor()`                                                                                                                                                                                                                         |
| `${urlCodec}`                     |          | &#10004; | [URL코덱](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/URLCodec.html)                                                                                                                                    |
| `${portletModeFactory}`           |          | &#10004; | [PortletModeFactory](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/PortletModeFactory.html)                                                                                                          |
| `${imageToolUtil}`                |          | &#10004; | [이미지 도구 유틸리티](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/image/ImageToolUtil.html)                                                                                                                        |
| `${auditMessageFactoryUtil}`      |          | &#10004; | [감사메시지팩토리유틸](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/audit/AuditMessageFactoryUtil.html)                                                                                                               |
| `${staticUtil}`                   |          | &#10004; | `의 결과를 반환합니다. beansWrapper.getStaticModels()`; for [정적 메서드 액세스](https://freemarker.apache.org/docs/pgui_misc_beanwrapper.html#autoid_60)                                                                                                                          |
