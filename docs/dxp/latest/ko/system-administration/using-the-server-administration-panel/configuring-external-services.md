# 외부 서비스 구성

Liferay는 파일 변환 및 파일 미리 보기 생성을 위한 외부 서비스와의 통합을 제공합니다. 서버 관리 설정에서 [ImageMagick](https://www.imagemagick.org/script/index.php) , [Ghostscript](https://www.ghostscript.com/) 및 [Xuggler](http://www.xuggle.com/xuggler/) 서비스 중 세 가지 서비스를 활성화할 수 있습니다.

```{important}
Liferay 7.3.x부터 Xuggler 통합은 더 이상 사용되지 않습니다. 사용자는 Liferay의 FFmpeg 통합을 대안으로 사용하는 것이 좋습니다. 자세한 내용은 [오디오 및 비디오 미리 보기에 FFmpeg 활성화](../../content-authoring-and-management/documents-and-media/devops/configuring-documents-and-media-previews.md)를 참조하십시오.
```

![외부 서비스 탭에서 ImageMagick, Ghostscript 및 Xuggler를 활성화합니다.](./configuring-external-services/images/01.png)

각 외부 서비스는 Liferay 인스턴스에 대해 활성화되기 전에 서버에 설치되어야 합니다. 서비스를 설치할 때 운영 체제에 맞는 최신 안정 버전을 사용해야 합니다. 이전 버전은 Liferay DXP에서 제대로 실행되지 않을 수 있습니다.

이러한 서비스를 설치한 후 제어판의 서버 관리 페이지를 통해 이를 사용하도록 Liferay 인스턴스를 구성하십시오.

```{note}
Liferay 7.1부터 OpenOffice/LibreOffice는 서버 관리 또는 포털 속성 대신 OSGi 구성 관리에서 구성됩니다. 자세한 내용은 [OpenOffice/LibreOffice 통합 활성화](../../content-authoring-and-management/documents-and-media/devops/enabling-openoffice-libreoffice-integration.md)를 참조하십시오.
```

## ImageMagick 및 Ghostscript 활성화

기본적으로 문서 및 미디어는 [PDFBox](https://pdfbox.apache.org/) 을 사용하여 미리 보기를 생성합니다. [ImageMagick](https://www.imagemagick.org/script/index.php) 및 [Ghostscript](https://www.ghostscript.com/) 은 더 빠르고 고품질의 미리 보기 및 변환을 제공하고 더 많은 이미지 파일 형식을 지원합니다. 작동하려면 두 서비스를 함께 설치하고 활성화해야 합니다.

```{note}
OS에 따라 이러한 서비스가 이미 설치되어 있을 수 있습니다. Linux를 사용하는 경우 둘 다 이미 설치되어 있을 수 있습니다. 그러나 Windows에는 설치되지 않을 가능성이 높지만 macOS에는 있을 수 있습니다.
```

ImageMagick과 Ghostscript가 모두 서버에 설치되면 다음 단계에 따라 Liferay 인스턴스에 대해 이러한 서비스를 활성화하십시오.

1. *글로벌 메뉴* (![Global Menu](../../images/icon-applications-menu.png))을 열고 *제어판* &rarr; *구성* &rarr; *서버 관리*으로 이동합니다.

1. *외부 서비스* 탭을 클릭합니다.

1. ImageMagick 및 Ghostscript에 대해 *Enabled* 을 확인하십시오.

1. ImageMagick 및 Ghostscript 실행 파일의 경로가 올바른지 확인하십시오.

1. 리소스 제한을 구성합니다.

1. 완료되면 *저장* 을 클릭합니다.

## Xuggler 활성화

기본적으로 문서 및 미디어는 오디오 및 비디오 파일에 대한 미리 보기를 생성하지 않습니다. Liferay의 Xuggler 통합을 사용하여 이러한 파일에 대한 미리보기를 변환하고 생성할 수 있습니다. 서버에 아직 Xuggler를 설치하지 않은 경우 서버 서버 관리 아래의 외부 서비스 탭을 통해 설치할 수 있습니다.

```{tip}
Xuggler는 Linux에서 glibc 버전 2.6 이상이 필요합니다.
```

Liferay 인스턴스용 Xuggler를 설치하고 활성화하려면 다음 단계를 따르십시오.

1. *글로벌 메뉴* (![Global Menu](../../images/icon-applications-menu.png))을 열고 *제어판* &rarr; *구성* &rarr; *서버 관리*으로 이동합니다.

1. *외부 서비스* 탭을 클릭합니다.

1. Xuggler에 대해 *Enabled* 을 확인하십시오.

   Xuggler가 아직 설치되지 않은 경우 설치하라는 메시지가 표시됩니다. OS에 맞는 올바른 JAR을 선택하고 *설치*을 클릭합니다. 그런 다음 서버를 다시 시작하여 변경 사항을 적용하십시오. 설치가 완료되면 *외부 서비스* 탭으로 돌아가서 Xuggler를 활성화할 수 있습니다.

   ![Xuggler가 설치되어 있지 않으면 설치하라는 메시지가 표시됩니다.](./configuring-external-services/images/02.png)

1. *저장*을 클릭합니다.

## `portal-ext.properties` 파일을 사용하여 외부 서비스 활성화

제어판 외에도 `Portal-ext.properties` 파일을 사용하여 이러한 외부 서비스를 활성화할 수 있습니다.

### ImageMagick 및 Ghostscript 활성화

`portal-ext.properties`을 사용하여 ImageMagick 및 Ghostscript를 활성화하려면 `imagemagick.enabled` 및 `imagemagick.global.search.path` 속성을 파일에 추가합니다. 검색 경로가 ImageMagick 및 Ghostscript 실행 파일이 포함된 디렉토리를 가리키는지 확인하십시오. macOS 또는 Unix 환경에서 Ghostscript가 사용하는 글꼴의 경로를 구성해야 할 수도 있습니다.

```properties
imagemagick.enabled=true
imagemagick.global.search.path[apple]=/opt/local/bin:/opt/local/share/ghostscript/fonts:/opt/local/share/fonts/urw-fonts
imagemagick.global.search.path[unix]=/usr/local/bin:/usr/local/share/ghostscript/fonts:/usr/local/share/fonts/urw-fonts
imagemagick.global.search.path[windows]=C:\\Program Files\\ImageMagick
```

### Xuggler 활성화

`Portal-ext.properties` 파일을 사용하여 Xuggler를 활성화하려면 파일에 다음 코드를 추가합니다.

```properties
xuggler.enabled=true
```

응용 프로그램 서버를 다시 시작하여 Xuggler 활성화를 완료합니다.

## 추가 정보

- [문서 및 미디어 미리보기 구성](../../content-authoring-and-management/documents-and-media/devops/configuring-documents-and-media-previews.md)
- [오디오 및 비디오 미리보기에 FFmpeg 활성화](../../content-authoring-and-management/documents-and-media/devops/enabling-ffmpeg-for-audio-and-video-previews.md)