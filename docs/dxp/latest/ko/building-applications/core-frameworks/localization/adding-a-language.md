# 언어 추가

Liferay는 현재 기본적으로 약 50개 언어를 지원합니다. [번역](https://translate.liferay.com/) 은 이러한 많은 언어에 대해 완료되었으며 일부는 아직 번역 과정에 있습니다. 각 언어에는 해당 언어에 대한 키가 포함된 자체 [언어 속성 파일](https://github.com/liferay/liferay-portal/tree/master/modules/apps/portal-language/portal-language-lang/src/main/resources/content) 이 있습니다. 그러나 세계에는 [6000](https://www.linguisticsociety.org/content/how-many-languages-are-there-world) 이상의 언어가 있습니다. 추가 언어를 추가해야 하는 경우 방법은 다음과 같습니다.

## 새 언어 추가

기본적으로 [`portal.properties`](https://github.com/liferay/liferay-portal/blob/41ac354cd0aa3f9d851a37a6a62d8167f81a2bce/portal-impl/src/portal.properties#L2930) 파일은 Liferay에서 사용 가능한 모든 언어를 지정합니다. 지정되지 않은 새 언어를 추가하려면

1. 귀하의 언어에 대한 [ISO 639-1 표준 코드](http://www.loc.gov/standards/iso639-2/php/code_list.php) 기록해 두십시오(예: 암하라어에 대한 ISO 코드는 `am`임).

1. 귀하의 언어에 대한 [ISO 3166-1 alpha-2 두 글자 국가 코드](https://www.iso.org/iso-3166-country-codes.html) 기록해 두십시오. (예: 에티오피아의 ISO 코드는 `ET`입니다).

1. Liferay 설치: `[LIFERAY_HOME]/tomcat<version>/webapps/ROOT/WEB-INF/`에 있는 `web.xml` 파일을 수정하고 교체합니다. `<web-resource-name`> 섹션 아래에 새 언어를 추가합니다. 예를 들어,

    ```xml
    <url-pattern>/am/c/portal/protected</url-pattern>
    <url-pattern>/am-ET/c/portal/protected</url-pattern>
    <url-pattern>/am_ET/c/portal/protected</url-pattern>
    ```

1. Liferay 설치에 있는 `shielded-container-web.xml` 파일을 수정하고 교체합니다: `[LIFERAY_HOME]/tomcat<version>/webapps/ROOT/WEB-INF/`. `<servlet-mapping`> 섹션 아래에 새 언어를 추가하십시오. 예를 들어,

    ```xml
    <servlet-mapping>
        <servlet-name>I18n Servlet</servlet-name>
        <url-pattern>/am/*</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>I18n Servlet</servlet-name>
        <url-pattern>/am-ET/*</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>I18n Servlet</servlet-name>
        <url-pattern>/am_ET/*</url-pattern>
    </servlet-mapping>
    ```

1. 귀하의 언어에 대한 `language.properties` 파일을 만들고 파일 이름에 ISO 코드를 사용하십시오. 예를 들어 암하라어의 경우 `Language_am.properties`:

    ```properties
    create-account=መለያ መፍጠር
    email-address=የ ኢሜል አድራሻ
    forgot-password=መክፈቻ ቁልፉን ረሳኽው
    home=መነሻ ገጽ
    password=ፕስወርድ
    powered-by-x=በ {0} የተጎላበተ
    remember-me=አስታወስከኝ
    search=የፍለጋ አሞሌ
    sign-in=ስግን እን
    ```

1. 생성한 `language.properties` 파일로 언어 모듈을 생성하고 모듈을 Liferay 설치에 배포합니다. 이 모듈 생성에 대한 샘플 프로젝트 및 특정 지침을 보려면 [전역 언어 번역 재정의](../../../liferay-internals/extending-liferay/overriding-global-language-translations.md) 참조하십시오.

1. 설치의 [Liferay Home](../../../installation-and-upgrades/reference/liferay-home.md) 폴더에 `Portal-ext.properties` 파일을 생성하거나 수정합니다. 이 파일은 `portal.properties` 파일에 정의된 활성화된 기본 로캘을 재정의합니다. 따라서 `portal-ext.properties` 파일에서 사용하려는 모든 언어를 나열하십시오. `locales` 및 `locales.enabled`모두 정의합니다. 예를 들어:

    ```properties
    locales=am_ET,ar_SA,fa_IR,en_US,zh_CN,ja_JP
    locales.enabled=am_ET,ar_SA,fa_IR,en_US,zh_CN,ja_JP
    ```

1. 모듈이 배포되면 **Control Panel** &rarr; **Instance Settings** &rarr; **Localization** 로 이동합니다. 새 언어를 확인하고 현재 언어로 이동합니다. **저장** 클릭합니다.

   ![새 언어를 현재 언어 목록에 저장합니다.](./adding-a-language/images/01.png)

3. 기본 언어를 새 언어로 변경하고 **저장** 클릭합니다. 새 언어는 이제 Liferay 인스턴스에서 사용됩니다.

   ![Liferay 인스턴스에 대한 새 언어를 선택하고 사용하십시오.](./adding-a-language/images/02.png)
