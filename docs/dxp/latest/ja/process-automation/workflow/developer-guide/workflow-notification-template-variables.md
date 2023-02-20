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

DEBUGレベルの [ロギング](./../../../system-administration/using-the-server-administration-panel/configuring-logging.md) を `TemplentNotificationMessageGenerator` クラスで有効にして、ワークフローの通知コンテキストで利用可能な変数を表示します。

1. コントロールパネル &rarr; 構成 &rarr; サーバーの管理 に移動します。

1. ［Log Levels］タブをクリックします。

1. この設定でLog Levelを追加します。

   - *ロガー名*： `com.liferay.portal.workflow.kaleo.runtime.internal.notification.TemplateNotificationMessageGenerator`
   - *ログレベル*：`DEBUG`

1. [アセット（Blogs Entryなど）に対して、ワークフロー定義](./../using-workflows/activating-workflow.md) （唯一の承認者定義など）をアクティブにすることができます。

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

上の出力のスニペットを見ると、 `saxReaderUtil`, `getterUtil`, `portalPermission`, `entryClassPK`, `layoutPermission`, `expandoTableLocalService`, `localeUtil`, `groupId`, `portalUtil` は、これらのメッセージがログに出力される原因となったコンテキストで利用可能です。

### ワークフロー通知テンプレート変数の使用

コンテクストに注入される通知変数は、主に2つのタイプに分類されます。

1. **値** 変数は、単一の値を提供します。 変数が単一の値を提供する場合、その値を通知に表示するために使用することができます。また、通知メッセージに表示される他の有用な情報を取得する操作のパラメータとして渡すこともできます。

   _例：_ 唯一の承認者の定義では、FreeMarkerのテンプレートでこの通知を提供しています。

   ```markup
   ${userName} sent you a ${entryType} for review in the workflow.
   ```

   `userName` と `entryType` が値を提供しているので、通知は次のように表示されます。

   _Joe Bloggsさんから、ワークフローで確認するためのブログのエントリが送られてきました。_


   また、値型変数の内容を確認することもできます。 唯一の承認者の定義には、この通知テンプレートも含まれています。

   ```markup
   Your submission was reviewed<#if taskComments?has_content> and the reviewer applied the following ${taskComments}</#if>.
   ```

   レビュアがタスクコメントを提供した場合は、そのコメントが表示されます。 そうでない場合は、通知の送付先は

   _あなたの提出物はレビューされました_

1. **オペレーション** 変数はLiferay DXPのJavaクラスを公開しているので、通知テンプレートでその操作にアクセスすることができます。 これらの変数については、クラスの [Javadoc](https://learn.liferay.com/reference/latest/en/dxp/javadocs/) を熟知するか、 [ソースコード](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]) を見て、その動作を理解する必要があります。

   _例：_ このFreeMarkerは、デフォルトのロケールを使用して、特定のパターン（_月/日/年、時間：分_）で現在の日付を取得します。

   ```markup
   ${dateUtil.getCurrentDate("MM/dd/yyyy, HH:mm",  localeUtil.getDefault())}`
   ```

## ワークフロー通知テンプレートの変数について

これらは、Blogsエントリーの唯一の承認者の定義 を有効にして、新しいエントリーを公開用に送信したときに記録される変数です。

| 変数名｜値｜操作｜説明またはリンク｜｜｜｜｜｜｜｜および
| :--- | :--- | :--- | :--- |
| ${saxReaderUtil} を使用します。            | &#10004; | [SaxReaderUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/xml/SAXReaderUtil.html) |
| ${getterUtil}                | | &#10004; | [GetterUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/GetterUtil.html)。|
| ${portalPermission}          | | &#10004; | [PortalPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/PortalPermission.html)。|
| ${entryClassPK}              | &#10004; | エントリークラスのプライマリキーです。
| ${layoutPermission}          | | &#10004; | [LayoutPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/LayoutPermission.html) |
| ${expandoTableLocalService} (エクスパンドテーブルローカルサービス)  | &#10004; | [ExpandoTableLocalService](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/service/ExpandoTableLocalService.html)。|
| ${localeUtil}                | | &#10004; | [LocaleUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/LocaleUtil.html)。|
| ${groupId}                   | &#10004; | グループのIDを指定します。
| ${portalUtil}                | | &#10004; | [PortalUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/PortalUtil.html)。|
| ${validator} | &#10004; | [Validator](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/Validator.html)です。|
| ${dateUtil}                  | &#10004; | [DateUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/DateUtil.html)。|
| ${serviceLocator} | &#10004; | [ServiceLocator](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portal/template/ServiceLocator.html)。|
| ${serviceContext}            | &#10004; | [ServiceContext](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/ServiceContext.html)。|
| ${jsonFactoryUtil} です。          | | &#10004; | [JSONFactoryUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/json/JSONFactoryUtil.html)。|
| ${stringUtil}                | | &#10004; | [StringUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/StringUtil.html)。|
| ${freeMarkerPortletPreferences}を使用します。| | &#10004; | [TemplatePortletPreferences](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portal/template/TemplatePortletPreferences.html)。|
| ${dateFormats}              | | &#10004; | [FastDateFormatFactory](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/FastDateFormatFactory.html) |
| ${dateFormatFactory} のようにします。        | | &#10004; | [DateFormatFactory](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/DateFormatFactory.html) |
| ${userPortraitURL}を指定します。          | &#10004; | | Blogs Entriesにのみ適用され、ユーザーのポートレートへのURLを返します。
| ${portal}                    | | &#10004; | [ポータル](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/Portal.html) |
| ${commonPermission}          | &#10004; | [CommonPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/CommonPermission.html)です。|
| ${userURL}                   | &#10004; | | Blogs Entriesにのみ適用され、ログインしているユーザーのプロファイルページのURLを返します。[](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portal/model/impl/UserImpl.html#getDisplayURL)を参照してください。|
| ${expandoValueLocalService}を参照してください。 | | &#10004; | [ExpandoValueLocalService](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/service/ExpandoValueLocalService.html)を参照してください。|
| ${entryType}                 | &#10004; | ワークフローのエントリーのタイプ(例:Blogs Entry)
| ${organizationPermission}    | | &#10004; | [OrganizationPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/OrganizationPermission.html)です。|
| ${passwordPolicyPermission} (パスワードポリシーパーミッション)  | | &#10004; | [PasswordPolicyPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/PasswordPolicyPermission.html)。|
| ${expandoColumnLocalService} (エクスパンドカラムローカルサービス) | | &#10004; | [ExpandoColumnLocalService](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/service/ExpandoColumnLocalService.html) |
| ${taskComments}              | &#10004; | レビュアーが残したコメントがある場合、そのコメントです。
| ${staticFieldGetter} (静的フィールドゲッター)         | | &#10004; | [StaticFieldGetter](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/StaticFieldGetter.html) |
| ${htmlUtil}                  | | &#10004; | [HtmlUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/HtmlUtil.html) |
| ${languageUtil}              | | &#10004; | [LanguageUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/language/LanguageUtil.html)。|
| ${enumUtil}                  | | &#10004; | [列挙子へのアクセス](https://freemarker.apache.org/docs/pgui_misc_beanwrapper.html#jdk_15_enums)のために `beansWrapper.getEnumModels()`; の結果を返します。
| ${windowStateFactory}の結果を返します。       | | &#10004; | [WindowStateFactory](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/WindowStateFactory.html) |
| ${companyId}                 | &#10004; | ポータルの会社/仮想インスタンスの ID。
| ${unicodeFormatter}          | | &#10004; | [UnicodeFormatter](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/UnicodeFormatter.html) |
| ${propsUtil}                 | | &#10004; | [PropsUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/PropsUtil.html)。|
| ${browserSniffer} (ブラウザスニッファー)            | | &#10004; | [BrowserSniffer](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/servlet/BrowserSniffer.html)。|
| ${portletProviderAction} (ポートレットプロバイダアクション)     | &#10004; | [PortletProvider#Action](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/PortletProvider.Action.html)呼び出しの結果を返します｜[PortletProvider#Action](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/PortletProvider.Action.html)呼び出しの結果を返します。
| ${taskName}                  | &#10004; | | 通知があるタスクの名前 | ${httpUtil} (英語)
| ${httpUtil}                  | | &#10004; | [HttpUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/HttpUtil.html)を呼び出します。|
| ${portletURLFactory}         | | &#10004; | [PortletURLFactory](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/PortletURLFactory.html)。|
| ${imageToken}                | &#10004; | [WebServerServletToken.getToken(long imageId)](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/webserver/WebServerServletToken.html) からのイメージトークン; は非推奨で削除されます |。
| ${groupPermission}           | | &#10004; | [GroupPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/GroupPermission.html)です。|
| ${timeZoneUtil}              | | &#10004; | [TimeZoneUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/TimeZoneUtil.html)。|
| ${unicodeLanguageUtil}を使用します。      | | &#10004; | [UnicodeLanguageUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/language/UnicodeLanguageUtil.html) |
| ${unicodeLanguageUtil}を使用します。      | | &#10004; | [UnicodeLanguageUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/language/UnicodeLanguageUtil.html) |
| ${expandoRowLocalService} (エキスパンドローローカルサービス)    | | &#10004; | [ExpandoRowLocalService](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/service/ExpandoRowLocalService.html) |
| ${auditRouterUtil} (監査ルーターユーティル)           | | &#10004; | [AuditRouterUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/audit/AuditRouterUtil.html)です。|
| ${kaleoTaskInstanceToken} (カレオタスクインスタンストークン)    | | &#10004; | [ワークフローのスクリプトに関するドキュメントを参照](./../developer-guide/using-the-script-engine-in-workflow.md#predefined-variables) |。
| ${accountPermission}         | | &#10004; | [AccountPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/AccountPermission.html) |
| ${httpUtilUnsafe} [httpUtilUnsafe]を指定します。           | | &#10004; | `${httpUtil}` と同じく [Http](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/Http.html) のインスタンスですが、ローカルネットワークにアクセスするために使用することができます |。
| ${workflowTaskAssignees} | &#10004; | [ワークフローのスクリプトに関するドキュメントを参照](./../developer-guide/using-the-script-engine-in-workflow.md#predefined-variables) |｜ ワークフローのスクリプトに関するドキュメントを参照](./../developer-guide/using-the-script-engine-in-workflow.md#predefined-variables)
| ${random}                   | &#10004; | [乱数](https://docs.oracle.com/javase/8/docs/api/java/util/Random.html) 数字を生成するためのJavaユーティリティです; 非推奨で将来的に削除されるでしょう
| ${rolePermission}           | | &#10004; | [RolePermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/RolePermission.html)です。|
| ${portletPermission} (ポートレットパーミッション)        | | &#10004; | [PortletPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/PortletPermission.html)。|
| ${paramUtil}                | | &#10004; | [ParamUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/ParamUtil.html) |
| ${locationPermission}       | &#10004; | | 「OrganizationPermissionUtil.getOrganizationPermission()`」の結果を返します |。
| ${calendarFactory}          | | &#10004; | [CalendarFactory](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/CalendarFactory.html)の結果を返します。|
| ${webServerToken} (ウェブサーバートークン)           | &#10004; | [WebServerServletToken.getToken(long imageId)](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/webserver/WebServerServletToken.html) からの画像トークンです。|
| ${sessionClicks}            | | &#10004; | [SessionClicks](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/SessionClicks.html)のイメージトークンです。|
| ${userPermission}           | | &#10004; | [UserPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/UserPermission.html)。|
| ${entryClassName}           | &#10004; |
| ${userGroupPermission} (ユーザグループパーミッション)      | | &#10004; | [UserGroupPermission](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/permission/UserGroupPermission.html) |
| ${arrayUtil}                | | &#10004; | [ArrayUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/ArrayUtil.html)。|
| ${userName}                 | &#10004; | ワークフローに最後に介入したユーザのユーザ名 | ${userId} (ユーザID)
| ${userId}                   | &#10004; | ワークフローに最後に介入したユーザのユーザID。[ロジックを理解するためにワークフローのスクリプトの記事を参照してください。](./../developer-guide/using-the-script-engine-in-workflow.md#predefined-variables)
| ${prefsPropsUtil} です。          | &#10004; | [PrefsPropsUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/PrefsPropsUtil.html) |
| ${url}                      | &#10004; | ページに表示される特定のコンテンツタイプのURL (例: ブログエントリー、メッセージボードメッセージ、Wikiページ)
| ${kaleoInstanceToken}を指定します。      | &#10004; | [ワークフロー・スクリプトの記事を参照](./../developer-guide/using-the-script-engine-in-workflow.md#predefined-variables)。
| ${utilLocator} | &#10004; | [UtilLocator](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portal/template/UtilLocator.html)。|
| ${objectUtil}               | | &#10004; | `new LiferayObjectConstructor()` を返します。
| ${urlCodec}                 | | &#10004; | [URLCodec](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/URLCodec.html) |
| ${portletModeFactory} (ポートレットモードファクトリー)       | | &#10004; | [PortletModeFactory](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/PortletModeFactory.html) |
| ${imageToolUtil}            | | &#10004; | [ImageToolUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/image/ImageToolUtil.html)。|
| ${auditMessageFactoryUtil} [オーディットメッセージファクトリー](AuditMessageFactoryUtil)  | | &#10004; | [AuditMessageFactoryUtil](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/audit/AuditMessageFactoryUtil.html)。|
| ${staticUtil}               | | &#10004; | [静的メソッドへのアクセス](https://freemarker.apache.org/docs/pgui_misc_beanwrapper.html#autoid_60)のために `beansWrapper.getStaticModels()`; の結果を返します。
