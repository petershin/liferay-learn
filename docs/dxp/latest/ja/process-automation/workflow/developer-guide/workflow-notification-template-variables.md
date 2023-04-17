# ワークフロー通知テンプレート変数

{bdg-secondary}`Liferay 7.3+`

一部の変数は、ワークフローの通知コンテキストに自動挿入されます。 これらは、ワークフローの通知テンプレートで使用すると便利です。

通常、Freemarkerでは、変数を明示的に宣言する必要があります。

```markup
<#assign variableName = "Variable Name" />
```

インジェクトされた変数はすでに宣言されており、テンプレート内で直接使用することができます。

```markup
${variableName}
```

これらの変数を使用するには、ワークフローの通知コンテキストで利用可能な変数を知っておく必要があります。 利用できる変数は、ワークフロー定義の詳細やワークフロー内のアセットに応じて変化します。 ここで紹介する方法は、特定のコンテキストに合わせて変数のリストを取得する方法を示していますので、推測で行う必要はありません。

## ワークフロー通知テンプレート変数の確認

DEBUGレベルの [ロギング](../../../system-administration/using-the-server-administration-panel/configuring-logging.md) を `TemplentNotificationMessageGenerator` クラスで有効にして、ワークフローの通知コンテキストで利用可能な変数を表示します。

1. ［コントロールパネル］ &rarr; ［設定］ &rarr; ［サーバ管理］へ移動します。

1. ［ログレベル］タブをクリックします。

1. この設定でログレベルを追加します。

   - *ロガー名*： `com.liferay.portal.workflow.kaleo.runtime.internal.notification.TemplateNotificationMessageGenerator`
   - *ログレベル*：`DEBUG`

1. アセット(ブログのエントリなど）に対して、[ワークフロー定義(唯一の承認者定義など）を有効にします](../using-workflows/activating-workflow.md)。

1. テストエントリを送信すると、ログメッセージが表示され、ワークフローで使用可能な通知テンプレートの変数が表示されます。

例えば、唯一の承認者のワークフローでは、アセットの初回提出時にこれらの変数が表示されます。

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

上の出力のスニペットを見ると、 `saxReaderUtil`、`getterUtil`, `portalPermission`、`entryClassPK`、`layoutPermission`、`expandoTableLocalService`、`localeUtil`、`groupId`、`portalUtil`は、これらのメッセージがログに出力される原因となったコンテキストで利用可能です。

### ワークフロー通知テンプレート変数の使用

コンテクストに注入される通知変数は、主に2つのタイプに分類されます。

1. **値** 変数は、単一の値を提供します。 変数が単一の値を提供する場合、その値を通知に表示するために使用することができます。また、通知メッセージに表示される他の有用な情報を取得する操作のパラメータとして渡すこともできます。

   _例：_ 唯一の承認者の定義では、FreeMarkerのテンプレートでこの通知を提供しています。

   ```markup
   ${userName} sent you a ${entryType} for review in the workflow.
   ```

   `userName`と`entryType`が値を提供しているので、通知は次のように表示されます。

   _Joe Bloggsさんから、ワークフローで確認するためのブログのエントリが送られてきました。_


   また、値型変数の内容を確認することもできます。 唯一の承認者の定義には、この通知テンプレートも含まれています。

   ```markup
   Your submission was reviewed<#if taskComments?has_content> and the reviewer applied the following ${taskComments}</#if>.
   ```

   レビュアがタスクコメントを提供した場合は、そのコメントが表示されます。 そうでない場合は、通知の送付先には以下が表示されます。

   _あなたの提出物はレビューされました_

1. **オペレーション** 変数はLiferay DXPのJavaクラスを公開しているので、通知テンプレートでその操作にアクセスすることができます。 これらの変数については、クラスの [Javadoc](https://learn.liferay.com/web/guest/w/reference/dxp/javadocs) を熟知するか、 [ソースコード](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]) を見て、その動作を理解する必要があります。

   _例：_ このFreeMarkerは、デフォルトのロケールを使用して、特定のパターン(_月/日/年、時間：分_）で現在の日付を取得します。

   ```markup
   ${dateUtil.getCurrentDate("MM/dd/yyyy, HH:mm",  localeUtil.getDefault())}`
   ```

## ワークフロー通知テンプレートの変数について

これらは、ブログエントリの唯一の承認者の定義を有効にして、新しいエントリーを公開用に送信したときに記録される変数です。

| 変数名                | 値    | 操作 | 説明またはリンク                       |
| :--- | :--- | :--- | :--- |
| `${saxReaderUtil}`             |          | &#10004;  | [SaxReaderUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/xml/SAXReaderUtil.html) |
| `${getterUtil}`                |          | &#10004;  | [GetterUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/GetterUtil.html) |
| `${portalPermission}`          |          | &#10004;  | [PortalPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/PortalPermission.html) |
| `${entryClassPK}`              | &#10004; |           | エントリークラスのプライマリーキー           |
| `${layoutPermission}`          |          | &#10004;  | [LayoutPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/LayoutPermission.html) |
| 1${expandoTableLocalService}1  |          | &#10004;  | [ExpandoTableLocalService](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/service/ExpandoTableLocalService.html) |
| `${localeUtil}`                |          | &#10004;  | [LocaleUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/LocaleUtil.html) |
| `${groupId}`                   | &#10004; |           | グループのID                          |
| `${portalUtil}`                |          | &#10004;  | [PortalUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/PortalUtil.html) |
| `${validator}`                 |          | &#10004;  | [Validator](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/Validator.html) |
| `${dateUtil}`                  |          | &#10004;  | [DateUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/DateUtil.html) |
| `${serviceLocator}`            |          | &#10004;  | [ServiceLocator](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portal/template/ServiceLocator.html) |
| `${serviceContext}`            |          | &#10004;  | [ServiceContext](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/ServiceContext.html) |
| `${jsonFactoryUtil}`           |          | &#10004;  | [JSONFactoryUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/json/JSONFactoryUtil.html) |
| `${stringUtil}`                |          | &#10004;  | [StringUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/StringUtil.html) |
| `${freeMarkerPortletPreferences}` |       | &#10004;  | [TemplatePortletPreferences](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portal/template/TemplatePortletPreferences.html) |
| `${dateFormats}`              |           | &#10004;  | [FastDateFormatFactory](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/FastDateFormatFactory.html) |
| `${dateFormatFactory}`         |          | &#10004;  | [DateFormatFactory](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/DateFormatFactory.html) |
| `${userPortraitURL}`           | &#10004; |           |  ブログのエントリーにのみ適用され、ユーザーのポートレートのURLを返します。|
| `${portal}`                    |          | &#10004;  | [Portal](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/Portal.html) |
| `${commonPermission}`          |          | &#10004;  | [CommonPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/CommonPermission.html) |
| `${userURL}`                   | &#10004; |           | ブログエントリーにのみ適用され、ログインしたユーザーのプロフィールページのURLを返します。参照： [UserImpl#getDisplayURL](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portal/model/impl/UserImpl.html#getDisplayURL-com.liferay.portal.kernel.theme.ThemeDisplay-). |
| `${expandoValueLocalService}`  |          | &#10004;  | [ExpandoValueLocalService](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/service/ExpandoValueLocalService.html) |
| `${entryType}`                 | &#10004; |           | ワークフローのエントリのタイプ（例：Blogs Entry） |
| `${organizationPermission}`    |          | &#10004;  | [OrganizationPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/OrganizationPermission.html) |
| `${passwordPolicyPermission}`  |          | &#10004;  | [PasswordPolicyPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/PasswordPolicyPermission.html) |
| `${expandoColumnLocalService}` |          | &#10004;  | [ExpandoColumnLocalService](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/service/ExpandoColumnLocalService.html) |
| `${taskComments}`              | &#10004; |           | レビュアが残したコメント（ある場合） |
| `${staticFieldGetter}`         |          | &#10004;  | [StaticFieldGetter](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/StaticFieldGetter.html) |
| `${htmlUtil}`                  |          | &#10004;  | [HtmlUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/HtmlUtil.html) |
| `${languageUtil}`              |          | &#10004;  | [LanguageUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/language/LanguageUtil.html) |
| `${enumUtil}`                  |          | &#10004;  | [アクセス列挙型]の `beansWrapper.getEnumModels()`;の結果を返します(https://freemarker.apache.org/docs/pgui_misc_beanwrapper.html#jdk_15_enums) |
| `${windowStateFactory}`        |          | &#10004;  | [WindowStateFactory](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/WindowStateFactory.html) |
| `${companyId}`                 | &#10004; |           | ポータルのCompany/Virtual InstanceのIDです |
| `${unicodeFormatter}`          |          | &#10004;  | [UnicodeFormatter](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/UnicodeFormatter.html) |
| `${propsUtil}`                 |          | &#10004;  | [PropsUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/PropsUtil.html) |
| `${browserSniffer}`            |          | &#10004;  | [BrowserSniffer](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/servlet/BrowserSniffer.html) |
| `${portletProviderAction}`     | &#10004; |           | [PortletProvider#Action](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/PortletProvider.Action.html) 呼び出しの結果を返します |
| `${taskName}`                  | &#10004; |           | 通知が入っているタスクの名前 |
| `${httpUtil}`                  |          | &#10004;  | [HttpUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/HttpUtil.html) |
| `${portletURLFactory}`         |          | &#10004;  | [PortletURLFactory](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/PortletURLFactory.html) |
| `${imageToken}`                | &#10004; |           | [WebServerServletToken.getToken(long imageId)](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/webserver/WebServerServletToken.html); からの画像トークンは、非推奨になり、削除されます |
| `${groupPermission}`           |          | &#10004;  | [GroupPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/GroupPermission.html) |
| `${timeZoneUtil}`              |          | &#10004;  | [TimeZoneUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/TimeZoneUtil.html) |
| `${unicodeLanguageUtil}`       |          | &#10004;  | [UnicodeLanguageUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/language/UnicodeLanguageUtil.html) |
| `${expandoRowLocalService}`    |          | &#10004;  | [ExpandoRowLocalService](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/service/ExpandoRowLocalService.html) |
| `${auditRouterUtil}`           |          | &#10004;  | [AuditRouterUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/audit/AuditRouterUtil.html) |
| `${kaleoTaskInstanceToken}`    |          | &#10004;  | [ワークフロースクリプトに関してはドキュメントを参照してください](./../developer-guide/using-the-script-engine-in-workflow.md#predefined-variables) |
| `${accountPermission}`         |          | &#10004;  | [AccountPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/AccountPermission.html) |
| `${httpUtilUnsafe}`            |          | &#10004;  | `${httpUtil}`のような、[Http](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/Http.html)のインスタンスは、ローカルネットワークにアクセスするために使用することができます |
| `${workflowTaskAssignees}`     | &#10004; |          | [ワークフロースクリプトに関してはドキュメントを参照してください](./../developer-guide/using-the-script-engine-in-workflow.md#predefined-variables) |
| `${random}`                   |           | &#10004;  | A Java utility for generating [Random](https://docs.oracle.com/javase/8/docs/api/java/util/Random.html) numbers;を生成するためのJavaユーティリティは、非推奨で将来削除予定です |
| `${rolePermission}`           |           | &#10004;  | [RolePermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/RolePermission.html) |
| `${portletPermission}`        |           | &#10004;  | [PortletPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/PortletPermission.html) |
| `${paramUtil}`                |           | &#10004;  | [ParamUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/ParamUtil.html) |
| `${locationPermission}`       | &#10004;  |           | `OrganizationPermissionUtil.getOrganizationPermission()`の結果を返します |
| `${calendarFactory}`          |           | &#10004;  | [CalendarFactory](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/CalendarFactory.html) |
| `${webServerToken}`           | &#10004; |           | [WebServerServletToken.getToken(long imageId)](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/webserver/WebServerServletToken.html)からの画像トークン |
| `${sessionClicks}`            |           | &#10004;  | [SessionClicks](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/SessionClicks.html) |
| `${userPermission}`           |           | &#10004;  | [UserPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/UserPermission.html) |
| `${entryClassName}`           | &#10004;  |
| `${userGroupPermission}`      |           | &#10004;  | [UserGroupPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/UserGroupPermission.html) |
| `${arrayUtil}`                |           | &#10004;  | [ArrayUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/ArrayUtil.html) |
| `${userName}`                 | &#10004;  |           |ワークフローに最後に介入したユーザーのユーザー名 |
| `${userId}`                   | &#10004;  |           | ワークフローに最後に介入したユーザーのユーザーID。 [ロジックを理解するには、Workflow Scripting の記事を参照してください。](./../developer-guide/using-the-script-engine-in-workflow.md#predefined-variables) |
| `${prefsPropsUtil}`           |           | &#10004;  | [PrefsPropsUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/PrefsPropsUtil.html) |
| `${url}`                      | &#10004;  |           | ページに表示される特定のコンテンツタイプのURL（例：ブログのエントリー、掲示板のメッセージ、およびWikiページ |
| `${kaleoInstanceToken}`       | &#10004;  |           | [ワークフロースクリプティングの記事をご覧ください。](./../developer-guide/using-the-script-engine-in-workflow.md#predefined-variables) |
| `${utilLocator}`              |           | &#10004;  | [UtilLocator](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portal/template/UtilLocator.html) |
| `${objectUtil}`               |           | &#10004;  | `new LiferayObjectConstructor()`を返します |
| `${urlCodec}`                 |           | &#10004;  | [URLCodec](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/URLCodec.html) |
| `${portletModeFactory}`       |           | &#10004;  | [PortletModeFactory](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/PortletModeFactory.html) |
| `${imageToolUtil}`            |           | &#10004;  | [ImageToolUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/image/ImageToolUtil.html) |
| `${auditMessageFactoryUtil}`  |           | &#10004;  | [AuditMessageFactoryUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/audit/AuditMessageFactoryUtil.html) |
| `${staticUtil}`               |           | &#10004;  | [Accessing static methods]の`beansWrapper.getStaticModels()`;の結果を返します (https://freemarker.apache.org/docs/pgui_misc_beanwrapper.html#autoid_60) |