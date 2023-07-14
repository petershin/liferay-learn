# Expandos를 사용하여 사용자 정의 필드에 액세스

애플리케이션에 추가 필드가 필요한 경우 [서비스 모델 정의](../service-builder/service-builder-basics/generating-model-persistence-and-service-code.html#examine -the-service-model-definition) 서비스 빌더를 다시 실행합니다. 이렇게 하면 데이터베이스 테이블에 새 열이 추가됩니다. 이것은 작동하지만 고통스러울 수 있습니다. 이제 사용자를 새 스키마로 마이그레이션하는 업그레이드 프로세스를 작성해야 합니다. 그러나 Liferay의 Expando 기능을 사용하면 데이터베이스를 수정하지 않고도 추가 필드를 추가할 수 있습니다. Expandos는 Java의 개체에 추가 속성을 추가하여 작동합니다. 예제 프로젝트는 사용자에게 사용자 정의 필드에 액세스하는 방법을 보여줍니다.

## 예제 프로젝트 보기

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. **제어판** 으로 이동합니다. **사용자 및 조직** . 관리자의 옵션 아이콘(![옵션 아이콘](../../../images/icon-actions.png))을 클릭하고 **편집** 을 클릭합니다. 일반 탭에서 사용자 정의 필드까지 아래로 스크롤합니다. **추가** 버튼을 클릭합니다.

1. 필드 유형으로 **입력 필드** 를 선택합니다. 필드 이름으로 `f5a3Text`를 입력합니다. `test`와 같은 시작 값을 입력합니다. **저장** 을 클릭합니다.

    ![사용자를 위한 f5a3Text라는 사용자 정의 필드를 생성합니다.](./accessing-custom-fields-with-expando/images/01.png)

1. [Accessing Expando](./liferay-f5a3.zip) 를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/expando-framework/liferay-f5a3.zip -O
   ```

   ```bash
   unzip liferay-f5a3.zip
   ```

1. 모듈 루트에서 빌드 및 배포합니다.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{note}
   이 명령은 배포된 jar를 Docker 컨테이너의 /opt/liferay/osgi/modules에 복사하는 것과 동일합니다.
   ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

   ```bash
   STARTED com.acme.f5a3.web_1.0.0 [1034]
   ```

1. 예제 모듈이 작동하는지 확인하십시오. 브라우저에서 `https://localhost:8080`로 엽니다.

1. 사이트 페이지로 이동하고 편집 아이콘(![Edit icon](../../../images/icon-edit.png))을 클릭합니다. F5A3 포틀릿을 페이지에 추가하십시오. 위젯은 샘플 위젯에서 찾을 수 있습니다.

   ![F5A3 포틀릿을 사이트 페이지에 추가하십시오.](./accessing-custom-fields-with-expando/images/02.png)

   포틀릿은 방금 생성한 사용자 정의 필드를 표시합니다.

## 포틀릿 검사

예제 프로젝트는 간단한 MVC 포틀릿을 사용하여 사용자 정의 필드를 표시하는 JSP 파일을 렌더링합니다. 기본 JSP 파일만 표시하므로 포틀릿에는 코드가 없습니다.

자세한 내용은 [MVC](../../developing-a-java-web-application/using-mvc.md)사용을 참조하십시오.

## JSP 파일 검사

`<liferay-theme:defineObjects>` 태그는 JSP에 포함되어 Liferay `User` 개체에 액세스합니다. 많은 Liferay 개체와 마찬가지로 'User' 개체에는 생성(예: `addAttribute()`), 설정(예: `setAttribute()`) 및 가져오기(예: `getAttribute()) 방법을 포함하는 상속된 `ExpandoBridge` 서비스가 있습니다. `) 사용자 정의 필드 값. 모든 인터페이스의 행동 양식.

```{literalinclude} ./accessing-custom-fields-with-expando/resources/liferay-f5a3.zip/f5a3-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
```

샘플 프로젝트는 사용자의 `f5a3Text` 사용자 정의 필드와 연관된 값을 가져오는 간단한 예를 보여줍니다. 애플리케이션에서 사용자 지정 필드를 생성, 설정 및 가져오기 위한 고유한 코드를 작성합니다.
