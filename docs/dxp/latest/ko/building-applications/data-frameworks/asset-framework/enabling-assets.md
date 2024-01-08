# 자산 활성화

Liferay의 다양한 애플리케이션(예: 블로그, 문서 및 미디어, 게시판 등) 즉시 자산을 사용할 수 있습니다. [게시자 위젯](../../../site-building/displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md) 을 사용하여 자산을 게시하거나 자산 라이브러리 [을](../../../content-authoring-and-management/asset-libraries/asset-libraries-overview.md) 생성할 수도 있습니다. [서비스 빌더](../service-builder.md) 의 도움으로 맞춤형 애플리케이션을 자산 활성화할 수 있습니다. 방법을 알아보려면 아래 샘플 프로젝트를 참조하세요.

## 샘플 코드 받기

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. 다운로드 및 압축 풀기 [자산 활성화](./liferay-s5e6.zip) .

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/asset-framework/liferay-s5e6.zip -O
   ```

   ```bash
   unzip liferay-s5e6.zip
   ```

1. 모듈 루트에서 빌드하고 배포합니다.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{note}
   이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
   ```
1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

   ```bash
   STARTED com.acme.s5e6.api_1.0.0 [1433]
   STARTED com.acme.s5e6.service_1.0.0 [1434]
   STARTED com.acme.s5e6.web_1.0.0 [1435]
   ```

1. 브라우저에서 `https://localhost:8080`을 엽니다.

1. 페이지에 S5E6 포틀릿을 추가합니다. 샘플 위젯 아래에서 예제 포틀릿을 찾을 수 있습니다.

1. 또한 동일한 페이지에 Asset Publisher 위젯을 추가합니다. 콘텐츠 관리에서 위젯을 찾을 수 있습니다.

1. S5E6 포틀릿(예: `s5e6_name1` 및 `s5e6_description1`)을 사용하여 항목을 추가하고 `제출`을 클릭합니다.

1. S5E6 포틀릿은 자산이 활성화되어 있으므로 추가된 항목이 자산 게시자 위젯에 자동으로 나타납니다.

   ![The added entry appears automatically in the Asset Publisher widget](./enabling-assets/images/01.png)

## 검색 활성화 전제 조건

이 튜토리얼에서는 이미 검색이 활성화된 Service Builder 애플리케이션이 있다고 가정합니다. 최소한 애플리케이션에는 다음이 필요합니다.

`*ModelSearchConfigurator.java` - 애플리케이션 엔터티(예: `com.acme.s5e6.search.S5E6EntryModelSearchConfigurator.java` 클래스)에 대한 검색 프레임워크에 검색 서비스를 등록합니다.

```{note}
'ModelSearchConfigurator' 패턴은 Liferay 2023.Q4+ 및 GA/Update 100+에 적용됩니다. 이전 버전에서는 'SearchRegistrar'를 사용했습니다. 'SearchRegistrar'를 구현하려면  [Liferay 7.2 문서](https://help.liferay.com/hc/ko/articles/360032611231-Search-Service-Registration) 참조하세요.
```

`*ModelIndexerWriterContributor.java` - 항목의 재인덱싱 및 일괄 재인덱싱 동작을 구성합니다(예: `com.acme.s5e6.search.S5E6EntryModelIndexerWriterContributor.java` 클래스).

`*ModelSummaryContributor.java` - 항목(예: `com.acme.s5e6.search.S5E6EntryModelSummaryContributor.java` 클래스)에 대한 결과 요약을 구성합니다.

검색 활성화에 대한 자세한 내용은 검색 사용의 [개발자 가이드](../../../using-search/developer-guide.md)를 참조하세요.

## 서비스 모델 정의 수정

자산을 활성화하려면 엔터티를 다음과 같이 변경하세요.

1. 아직 정의하지 않은 경우 다음 데이터 필드를 추가합니다.

   ```xml
   <!-- Group instance -->

   <column name="groupId" type="long" />

   <!-- Audit fields -->

   <column name="companyId" type="long" />
   <column name="userId" type="long" />
   <column name="userName" type="String" />
   <column name="createDate" type="Date" />
   <column name="modifiedDate" type="Date" />
   ```

   자산 프레임워크에서는 애플리케이션의 데이터를 추적하기 위해 이러한 필드가 필요합니다.

1. 닫는 `</entity>` 태그 바로 앞에 자산 항목 엔터티 참조를 추가합니다. 나중에 새 애플리케이션 항목이 추가되면 해당 항목이 Liferay의 `AssetEntry` 테이블에 추가되도록 변경하게 됩니다.

   ```xml
   <reference entity="AssetEntry" package-path="com.liferay.portlet.asset" />
   ```

1. 서비스 작성기를 다시 실행하십시오.

   ```bash
   ./gradlew s5e6-service:buildService
   ```

## 서비스 계층 업데이트

사용자 정의 엔터티를 Liferay 자산으로 추가하려면 프로젝트의 `-LocalServiceImpl` Java 클래스에서 `assetEntryLocalService`의 `updateEntry()` 메서드를 호출해야 합니다. `assetEntryLocalService.updateEntry()`를 호출하면 `AssetEntry` 테이블에 새 행(애플리케이션 항목에 해당)이 추가됩니다. `updateEntry()` 메서드는 자산 항목이 존재하는지 확인한 다음 적절한 조치를 취하기 때문에 자산 항목을 추가하고 업데이트합니다.

예제 프로젝트의 모습은 다음과 같습니다.

```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-service/src/main/java/com/acme/s5e6/service/impl/S5E6EntryLocalServiceImpl.java
:dedent: 1
:language: java
:lines: 64-73
```

[`AssetEntryLocalServiceImpl` 클래스](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portlet/asset/service/impl/AssetEntryLocalServiceImpl.html#updateEntry-long-long-java.util.Date-java.util.Date-java.lang.String-long-java.lang.String-long-long:A-java.lang.String:A-boolean-boolean-java.util.Date-java.util.Date-java.util.Date-java.util.Date-java.lang.String-java.lang.String-java.lang.String-java.lang.String-java.lang.String-java.lang.String-int-int-java.lang.Double-) 에 대한 Javadoc을 확인하면 메소드가 오버로드된 것을 볼 수 있습니다. 자산 항목의 제목을 설정할 수 있도록 `title` 매개변수를 사용하는 `updateEntry()` 버전을 사용합니다.

변경 후 Service Builder를 다시 실행하십시오.

## 자산 렌더러 만들기

자산은 항목의 표시 버전이므로 '제목', '설명', '요약'과 같은 필드를 포함합니다. Liferay는 이러한 필드를 사용하여 자산을 표시합니다. 자산 렌더러는 이러한 필드를 통해 엔터티를 자산으로 변환합니다.

1. 애플리케이션에서 Liferay의 `BaseJSPAssetRenderer` 클래스를 확장하는 `-AssetRender` 클래스를 만듭니다. 예를 들어,

   ```java
   public class S5E6EntryAssetRenderer extends BaseJSPAssetRenderer<S5E6Entry> {

   }
   ```

1. 자산 렌더러 클래스의 생성자를 정의합니다.

   ```java
   	public S5E6EntryAssetRenderer(S5E6Entry s5e6Entry) {
    	_s5e6Entry = s5e6Entry;
    }
   ```

1. 다양한 getter 메서드를 사용하여 자산 렌더러를 자산에 연결합니다.

   ```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/asset/model/S5E6EntryAssetRenderer.java
   :dedent: 1
   :language: java
   :lines: 20-72
   ```

   이 예에서 `getTitle()` 메소드는 `name` 속성으로 설정되고 `getSummary()` 메소드는 애플리케이션의 `description` 속성으로 설정됩니다.

## 자산 렌더러 팩토리 생성

자산 렌더러를 생성한 후 각 자산 인스턴스에 대한 자산 렌더러를 생성하려면 팩토리 클래스를 생성해야 합니다.

1. 위와 동일한 폴더에 Liferay의 `BaseAssetRendererFactory` 클래스를 확장하는 `-AssetRendererFactory` 클래스를 만듭니다. 예를 들어,

   ```java
   public class S5E6EntryAssetRendererFactory extends BaseAssetRendererFactory<S5E6Entry> {

   }
   ```

1. 클래스 선언 위에 `@Component` 주석을 만듭니다. 이 주석은 자산의 팩토리 인스턴스를 등록합니다. `service` 요소는 `AssetRenderFactory.class` 인터페이스를 가리켜야 합니다.

   ```java
   @Component(service = AssetRendererFactory.class)
   ```

1. 팩토리의 속성을 미리 설정하는 팩토리 클래스의 생성자를 만듭니다.

   ```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/asset/model/S5E6EntryAssetRendererFactory.java
   :dedent: 1
   :language: java
   :lines: 24-29
   ```

   다른 자산이 귀하의 자산을 관련 자산으로 선택할 수 있도록 'setLinkable'을 'true'로 설정하세요. 검색 시 자산을 찾을 수 있도록 `setSearchable`을 `true`로 설정하세요.

1. 새로운 `S5E6AssetRenderer` 인스턴스를 생성하는 `getAssetRenderer` 메서드를 구현합니다.

   ```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/asset/model/S5E6EntryAssetRendererFactory.java
   :dedent: 1
   :language: java
   :lines: 31-43
   ```

1. 모듈의 기호 이름을 정의하려면 `@Reference` 주석을 사용하세요.

   ```java
   @Reference(
   	target = "(osgi.web.symbolicname=com.acme.s5e6.web)"
   )
   ```

## 포틀릿 수정

`S5E6Portlet`의 `addS5E6Entry` 메소드는 `S5E6Entry` 인스턴스 추가 요청을 처리합니다.

```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/portlet/S5E6Portlet.java
:dedent: 1
:language: java
:lines: 32-46
```

`addS5E6Entry`는 포틀릿 작업 메서드이므로 `ActionRequest` 및 `ActionResponse` 매개변수를 사용합니다. 새 항목을 추가하기 위해 서비스를 호출하려면 요청에서 `제목`과 `설명`을 검색해야 합니다. 'serviceContext'도 요청에서 검색하여 서비스 호출의 인수로 전달해야 합니다.

포틀릿의 `view.jsp`에는 포틀릿의 `addS5E6Entry` 메소드를 호출하는 `actionURL`이 있는 양식이 포함되어 있습니다.

```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
:lines: 18-28
```

포틀릿에서 자산이 활성화되었습니다. 이제 애플리케이션 항목을 찾아 자산으로 표시할 수 있습니다.
