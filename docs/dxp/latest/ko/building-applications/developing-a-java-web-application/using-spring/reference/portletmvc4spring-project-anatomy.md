# PortletMVC4Spring 프로젝트 해부

PortletMVC4Spring 포틀릿은 WAR에 패키지되어 있습니다. Liferay는 JSP/JSPX 및 Thymeleaf 템플릿을 사용하도록 구성된 프로젝트를 만들기 위한 Maven 원형을 제공합니다. 해당 명령은 다음과 같습니다. PortletMVC4Spring 프로젝트 구조는 명령을 따릅니다.

## PortletMVC4Spring 프로젝트 생성을 위한 Maven 명령

다음은 JSPX 및 [Thymeleaf](https://www.thymeleaf.org) 보기 템플릿을 사용하는 PortletMVC4Spring 포틀릿 프로젝트를 생성하기 위한 Maven 명령입니다.

### SP/JSPX 양식 포틀릿

```bash
mvn archetype:generate \
* DarchetypeGroupId=com.liferay.portletmvc4spring.archetype \
* DarchetypeArtifactId=com.liferay.portletmvc4spring.archetype.form.jsp.portlet \
* DarchetypeVersion=5.1.0 \ 
* DgroupId=com.mycompany \ 
* DartifactId=com.mycompany.my.form.jsp.portlet
```

### Thymeleaf 양식 포틀릿

```bash
mvn archetype:generate \
* DarchetypeGroupId=com.liferay.portletmvc4spring.archetype \
* DarchetypeArtifactId=com.liferay.portletmvc4spring.archetype.form.thymeleaf.portlet \
* DarchetypeVersion=5.1.0 \
* DgroupId=com.mycompany \
* DartifactId=com.mycompany.my.form.thymeleaf.portlet
```

## 프로젝트 구조

Maven 명령은 모델 및 컨트롤러 클래스, 보기 템플릿, 리소스 번들, 스타일시트 등을 포함하는 프로젝트를 생성합니다. [Spring 컨텍스트 및 구성 파일](./portletmvc4spring-configuration-files.md) PortletMVC4Spring 개발 필수 요소를 설정합니다. 결과 프로젝트 구조는 다음과 같습니다.

* `[com.mycompany.my.form.jsp.portlet]`/ &rarr; 임의의 프로젝트 이름
    * `src/`
        * `main/`
            * `java/[my-package-path]/`
                * `컨트롤러/` &rarr; 컨트롤러 클래스용 하위 패키지(선택 사항)
                * `dto/` &rarr; 모델(데이터 전송 개체) 클래스용 하위 패키지(선택 사항)
                * `리소스/` &rarr; 클래스 경로에 포함할 리소스
                    * `콘텐츠/` &rarr; 리소스 번들
                    * `log4j.properties` &rarr; Log4J 로깅 구성
                * `webapp/`
                    * `resources/`
                        * `css/` &rarr; 스타일 시트
                        * `개 이미지/` &rarr; 이미지
                    * `WEB-INF/`
                        * `spring-context/` &rarr; 컨텍스트
                            * `포틀릿/` &rarr; 포틀릿 컨텍스트
                                * `portlet1-context.xml` &rarr; 포틀릿 컨텍스트
                            * `portlet-application-context.xml` &rarr;  애플리케이션 컨텍스트
                        * 조회수 `회/` &rarr; 템플릿 보기
                        * `liferay-display.xml` &rarr; 포틀릿 디스플레이 구성
                        * `liferay-plugin-package.properties` &rarr;  패키징 설명자
                        * `liferay-portlet.xml` &rarr; Liferay 특정 포틀릿 구성
                        * `portlet.xml` &rarr; 포틀릿 구성
                        * `web.xml` &rarr; 웹 애플리케이션 구성
        * `test/java/` &rarr; 테스트 소스 파일
    * `build.gradle` &rarr; Gradle 빌드 파일
    * `pom.xml` &rarr; 메이븐 POM