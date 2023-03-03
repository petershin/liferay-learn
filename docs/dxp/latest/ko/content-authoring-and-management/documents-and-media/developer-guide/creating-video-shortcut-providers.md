# 비디오 바로 가기 공급자 생성

> Liferay DXP 7.4+에서 사용 가능

기본적으로 Liferay의 외부 비디오 바로가기는 [YouTube](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-video/src/main/java/com/liferay/document/library/video/internal/video/external/shortcut/provider/YouTubeDLVideoExternalShortcutProvider.java) , [Vimeo](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-video/src/main/java/com/liferay/document/library/video/internal/video/external/shortcut/provider/VimeoDLVideoExternalShortcutProvider.java) , [Facebook](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-video/src/main/java/com/liferay/document/library/video/internal/video/external/shortcut/provider/FacebookDLVideoExternalShortcutProvider.java) , [Twitch](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-video/src/main/java/com/liferay/document/library/video/internal/video/external/shortcut/provider/TwitchDLVideoExternalShortcutProvider.java) 을 지원합니다. 그러나 이 기능을 확장하여 다른 비디오 소스를 지원할 수 있습니다.

자신의 비디오 바로 가기 공급자를 만들려면 다음 단계를 따르십시오.

1. **OSGI 구성 요소 주석**: 공급자를 OSGi 프레임워크 내에서 `DLVideoExternalShortcutProvider.class` 서비스로 선언하려면 `@Component` 주석을 사용합니다.

1. [**`DLVideoExternalShortcutProvider`**](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/video/external/shortcut/provider/DLVideoExternalShortcutProvider.java) : `DLVideoExternalShortcutProvider` 인터페이스를 구현합니다.

1. **인터페이스의 메서드 재정의**: 인터페이스의 `getDLVideoExternalShortcut()` 메서드를 재정의합니다. 이 메서드는 [`DLVideoExternalShortcut`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/video/external/shortcut/DLVideoExternalShortcut.java) 인터페이스의 인스턴스를 만들고 URL 문자열을 받습니다. 구현이 다음을 수행하는지 확인하십시오.

   * 수신된 URL이 정의된 URL 패턴과 일치하는지 확인합니다.
   * URL이 패턴과 일치하지 않으면 프로그램은 `null`을 반환해야 합니다. Liferay는 일치하는 항목을 찾기 위해 사용 가능한 다른 공급자를 확인합니다.
   * URL이 패턴과 일치하면 URL을 구문 분석하고 외부 소스에서 추가 정보를 가져오고 수집된 정보와 함께 `DLVideoExternalShortcut` 인스턴스를 반환합니다.

1. **`DLVideoExternalShortcut` 메서드 재정의**: `getDLVideoExternalShortcut()` 메서드에서 반환된 `DLVideoExternalShortcut` 인스턴스에 필요한 메서드를 재정의합니다.

   * `getURL()`: 원본 비디오 URL을 검색합니다.
   * `renderHTML()`: 사용자 인터페이스에 비디오를 삽입합니다. 이것은 일반적으로 `iframe` 을 렌더링하지만 사용자를 위해 비디오를 렌더링하는 HTML 비디오 태그일 수도 있습니다.

1. 다음 선택적 메서드를 재정의합니다.

   * `getDescription()`: 이 메서드를 사용하여 원본 비디오의 설명을 검색합니다. 기본값은 `null`입니다.
   * `getThumbnailURL()`: 이 메소드를 사용하여 비디오의 썸네일을 검색합니다. 기본값은 `null`입니다.
   * `getTitle()`: 이 메서드를 사용하여 원본 비디오의 제목을 검색합니다. 기본값은 `null`입니다.

다음은 자체 구현을 위한 최소 요구 사항을 보여주는 [샘플 외부 비디오 바로 가기 공급자](liferay-g9b6.zip) 입니다. [기존 공급자](https://github.com/liferay/liferay-portal/tree/master/modules/apps/document-library/document-library-video/src/main/java/com/liferay/document/ 참조) library/video/internal/video/external/shortcut/provider)을 참조하십시오.

## 샘플 비디오 공급자 배포

```{include} /_snippets/run-liferay-portal.md


```

그런 다음 다음 단계를 따르세요.

1. 예제 모듈을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/docs/dxp/latest/en/content-authoring-and-management/documents-and-media/developer-guide/liferay-g9b6.zip -O
   ```

   ```bash
   unzip liferay-g9b6.zip
   ```

1. `gradlew deploy` 명령을 실행하여 JAR 파일을 빌드하고 새 Docker 컨테이너에 배포합니다. 

   ```bash
   cd liferay-g9b6
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

JAR은 `build/libs` 폴더(즉, `g9b6-impl/build/libs/com.acme.G9B6.impl-1.0.0`)에 생성됩니다.

1. 공급자가 성공적으로 배포되고 컨테이너 콘솔을 통해 시작되었는지 확인합니다. 

   ```log
   Processing com.acme.G9B6.impl-1.0.0.jar
   STARTED com.acme.G9B6.impl-1.0.0 [1356]
   ```

1. 새 외부 비디오 바로 가기를 만들어 모듈이 작동하는지 확인합니다.<!--TASK: add link once article is merged--> 짧은 Dailymotion URL(예: https://dai.ly/x7szh28).
   
   성공하면 Liferay는 Dailymotion을 지원되는 플랫폼으로 인식해야 합니다.
   
   ![Liferay는 Dailymotion을 지원되는 플랫폼으로 인식해야 합니다.](./creating-custom-video-shortcut-providers/images/01.png)

## 샘플 비디오 제공자용 코드

```{literalinclude} ./creating-custom-video-shortcut-providers/resources/liferay-g9b6.zip/g9b6-impl/src/main/java/com/acme/g9b6/internal/document/library/video/external/shortcut/provider/G9B6DLVideoExternalShortcutProvider.java
   :dedent: 1
   :language: java
   :lines: 14-51
```

### OSGi 구성 요소 주석

공급자는 OSGi 프레임워크 내에서 구성 요소로 선언되고 `DLVideoExternalShortcutProvider.class` 서비스로 식별됩니다.

### `DLVideoExternalShortcutProvider` 구현

공급자는 `DLVideoExternalShortcutProvider` 인터페이스를 구현합니다. 이 인터페이스에는 유효한 URL이 수신되면 `DLVideoExternalShortcut` 을 반환하는 단일 메서드인 `getDLVideoExternalShortcut`이 포함되어 있습니다.

### 재정의 `getDLVideoExternalShortcut`

공급자는 공급자의 필수 논리를 모두 포함하는 인터페이스의 `getDLVideoExternalShortcut` 메서드를 재정의합니다. URL이 정의된 정규식 패턴과 일치하는지 확인합니다. 일치하는 항목이 없으면 `null`을 반환하고 Liferay는 일치하는 항목을 찾기 위해 사용 가능한 다른 공급자에게 계속 전화를 겁니다. 일치하는 경우 비디오를 Liferay 페이지 또는 자산에 포함하기 위한 새로운 `DLVideoExternalShortcut` 개체를 반환합니다.

### `DLVideoExternalShortcut`의 메서드 재정의

공급자가 `DLVideoExternalShortcut` 객체를 반환하면 객체의 `getURL()` 및 `renderHTML()` 메서드를 재정의합니다. `getURL()` 은 사용자가 입력한 URL을 반환합니다. `renderHTML()` 은 `HttpServletRequest` 매개변수를 수신하고 Liferay 페이지 또는 자산에 포함할 `iframe` 문자열을 반환합니다. 다음 예를 고려하십시오.

`getDescription()`, `getThumbnailURL()`및 `getTitle()` 는 재정의되지 않았으므로 `null` 이 반환됩니다. 

## 추가 정보

* [외부 비디오 바로 가기 만들기](../videos/creating-external-video-shortcuts.md)
