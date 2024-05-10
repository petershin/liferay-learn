# Liferay Commerce Tomcat 번들 사용

Liferay Commerce 번들은 [Liferay Commerce 커뮤니티 다운로드](https://commerce.liferay.dev/download) 페이지에서 다운로드할 수 있습니다. 번들에는 Apache Tomcat에 사전 배포된 최신 버전의 Liferay Commerce 및 Liferay Portal이 포함되어 있습니다.

번들을 받기 전에 [Liferay Commerce Compatibility Matrix](https://help.liferay.com/hc/ko/articles/360049238151) 에서 지원되는 기술 목록을 읽어보십시오.

Liferay Commerce 번들을 사용하려면 다음 단계를 따르십시오.

1. Liferay Commerce Tomcat 번들 받기

    * (구독자) [기업 다운로드](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118190997&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191001)
    * [커뮤니티 다운로드 페이지](https://www.liferay.com/downloads-community)

1. 대상 사이트에 번들의 압축을 풉니다.

1. Tomcat 번들 시작
    * `$CATALINA_HOME/bin`로 이동합니다.
    * `./catalina.sh run`을 실행합니다. **Windows** 사용자의 경우 다음을 실행합니다. `catalina run`

    ```{tip}
    `org.apache.catalina.startup.Catalina.start Server startup in [x] milliseconds`가 표시될 때까지 기다립니다.
    ```

1. 브라우저에서 `https://localhost:8080`로 엽니다.

![환영 이미지](./using-the-liferay-commerce-tomcat-bundle/images/01.png)

## 관련 주제

* [설치 개요](../installation-overview.md)
* [Liferay-Tomcat 번들 설치](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/installing-a-liferay-tomcat-bundle)
* [Liferay Commerce 3.0 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360049238151)
