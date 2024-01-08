# 문서 및 미디어 미리보기 구성

{bdg-secondary}`liferay 7.4 U84+/GA84+`

기본적으로 Liferay는 [PDFBox](https://pdfbox.apache.org) 을 사용하여 문서 라이브러리에 추가된 파일에 대한 미리 보기를 생성합니다. 이는 PDFBox가 DXP와 함께 배포될 수 있는 유일한 100% Java 기반 도구이기 때문입니다.

그러나 PDFBox는 제한된 수의 파일 형식만 지원하므로 Liferay는 추가 파일 형식을 지원하기 위해 타사 서비스와의 통합도 제공합니다. 이러한 서비스를 사용하면 더 많은 파일에 대해 고품질 파일 미리보기를 더 빠르게 생성할 수 있습니다.

```{important}
타사 서비스를 사용하여 미리 보기를 생성하려면 먼저 Liferay 인스턴스를 실행하는 서버에 해당 서비스를 설치해야 합니다. 
```

Liferay는 현재 다음 서비스와의 통합을 지원합니다.

* [LibreOffice](http://www.libreoffice.org) 또는 [OpenOffice](http://www.openoffice.org) : 이 프로그램은 서버 모드에서 지원되는 파일 형식(`.pdf`, `.docx`, `.odt`, `.ppt`, `.odp`에 대한 축소판 및 미리 보기를 생성하는 데 사용할 수 있습니다. , 등.). 또한 이를 사용하여 문서를 변환하고 브라우저에서 볼 수도 있습니다. 자세한 내용은 [OpenOffice/LibreOffice 통합 활성화](./enabling-openoffice-libreoffice-integration.md) 참조하십시오.

* [ImageMagick](http://www.imagemagick.org) ( [Ghostscript](http://www.ghostscript.com) 도 필요): 이 프로그램은 이미지 파일에 대한 빠른 고품질 미리 보기 및 변환을 제공합니다. 자세한 내용은 [ImageMagick 및 Ghostscript](../../../system-administration/using-the-server-administration-panel/configuring-external-services.md#enabling-imagemagick-and-ghostscript) 활성화를 참조하십시오.

* [FFmpeg](http://ffmpeg.org/) : 이 프로그램은 오디오 및 비디오 파일을 지원합니다. 파일 미리보기 생성 외에도 브라우저의 기본 HTML 5 플레이어에서 멀티미디어를 재생할 수 있습니다. 자세한 내용은 [오디오 및 비디오 미리 보기용 FFmpeg 활성화](./enabling-ffmpeg-for-audio-and-video-previews.md) 참조하세요.

   ```{note}
   Liferay 7.3.x 및 이전 버전은 오디오 및 비디오 미리 보기를 생성하기 위해 [Xuggler](http://www.xuggle.com/xuggler) 사용합니다. 자세한 내용은 [Xuggler](../../../system-administration/using-the-server-administration-panel/configuring-external-services.md#enabling-xuggler) 활성화를 참조하세요.
   ```

이러한 서비스를 설치하고 구성하면 문서 및 미디어는 대부분의 파일 형식에 대한 응용 프로그램 내 미리 보기를 제공할 수 있습니다.

## ImageMagick에 지원되는 미디어 유형 구성

ImageMagick을 설치한 경우 Adaptive Media는 이를 사용하여 문서 라이브러리에 저장된 이미지에 대한 대체 해상도를 생성할 수 있습니다. 기본적으로 ImageMagick은 `avif`, `gif`, `heic`, `tiff` 및 `webp` 파일을 지원하지만 필요한 경우 추가 미디어 유형을 추가할 수 있습니다. 자세한 내용은 [적응형 미디어 구성 참조](../publishing-and-sharing/using-adaptive-media/adaptive-media-configuration-reference.md#imagemagick) 참조하세요.

## 미리보기 및 썸네일 수동 생성

타사 서비스를 활성화하면 Liferay는 자동으로 이를 사용하여 지원되는 미디어 유형에 대한 미리 보기 및 썸네일을 생성합니다. 그러나 이러한 서비스를 활성화하기 전에 자산을 업로드한 경우 썸네일과 미리보기를 수동으로 생성해야 합니다.

이미지 파일용으로 생성하려면 Adaptive Media를 사용할 수 있습니다. 자세한 내용은 [이미지 해상도 관리](../publishing-and-sharing/using-adaptive-media/managing-image-resolutions.md) 참조하십시오.

오디오, 비디오, PDF 및 OpenOffice 파일의 경우 서버 관리 응용 프로그램을 통해 미리 보기 및 축소판을 다시 생성할 수 있습니다.

1. **전역 메뉴**( ![전역 메뉴](../../../images/icon-applications-menu.png) )를 열고 **제어판** 탭으로 이동한 다음 **시스템 관리** 를 클릭합니다.

1. **리소스** 탭으로 이동하세요.

1. 재생성 옵션에서 원하는 미디어 유형에 대해 **실행** 을 클릭합니다.

   ![Under Regeneration Options, execute the desired media type.](./configuring-documents-and-media-previews/images/01.png)

문서에 누락된 이미지가 생성되기 시작합니다. 이 프로세스를 실행해도 기존 미리보기 및 축소판에는 영향을 미치지 않습니다. 모든 미리 보기 및 썸네일을 다시 생성하려면 먼저 다음 정리 작업을 실행하십시오. **문서 및 미디어의 미리 보기 및 썸네일 파일 재설정** .

![Execute Reset preview and thumbnail files for documents and media.](./configuring-documents-and-media-previews/images/02.png)

이 프로세스는 이미지 파일의 Adaptive Media 미리 보기 및 축소판에 영향을 주지 않습니다. 이를 관리하려면 [Adaptive Media](../publishing-and-sharing/using-adaptive-media.md) 사용하십시오.

## 관련 주제

* [파일 관리](../uploading-and-managing/managing-files.md)
* [문서 및 미디어 UI 참조](../documents-and-media-ui-reference.md)
* [OpenOffice/LibreOffice 통합 활성화](./enabling-openoffice-libreoffice-integration.md)
