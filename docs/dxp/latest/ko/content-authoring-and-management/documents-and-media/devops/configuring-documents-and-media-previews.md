# 문서 및 미디어 미리보기 구성

기본적으로 Liferay DXP는 [PDFBox](https://pdfbox.apache.org) 을 사용하여 문서 라이브러리에 추가된 파일에 대한 미리 보기를 생성합니다. 이는 PDFBox가 DXP와 함께 배포할 수 있는 유일한 100% Java 기반 도구이기 때문입니다.

그러나 PDFBox는 제한된 수의 파일 형식만 지원하므로 Liferay는 추가 파일 형식을 지원하기 위해 외부 서비스와의 통합도 제공합니다. 이러한 서비스를 사용하여 더 많은 파일에 대한 고품질 파일 미리 보기를 더 빠르게 생성할 수 있습니다.

```{important}
미리 보기 생성에 사용하려면 먼저 Liferay DXP 인스턴스를 실행하는 서버에 서비스를 설치해야 합니다. 
```

Liferay DXP는 현재 다음 프로그램과의 통합을 지원합니다.

* [OpenOffice](http://www.openoffice.org) 또는 [LibreOffice](http://www.libreoffice.org): 이 프로그램은 서버 모드에서 지원되는 파일 형식(`.pdf`, `.docx`, `.odt`, `.ppt`, `.odp`, 등.). 또한 이를 사용하여 문서를 변환하고 브라우저에서 볼 수 있습니다. 자세한 내용은 [OpenOffice/LibreOffice 통합 활성화](./enabling-openoffice-libreoffice-integration.md) 을 참조하십시오.

* [ImageMagick](http://www.imagemagick.org) (또한 [Ghostscript](http://www.ghostscript.com)필요): 이 프로그램은 이미지 파일에 대한 빠른 고품질 미리 보기 및 변환을 제공합니다. 자세한 내용은 [ImageMagick 및 Ghostscript 활성화](../../../system-administration/using-the-server-administration-panel/configuring-external-services.md#enabling-imagemagick-and-ghostscript) 을 참조하십시오.

* [FFmpeg](http://ffmpeg.org/): 이 프로그램은 오디오 및 비디오 파일을 지원합니다. 파일 미리 보기 생성 외에도 브라우저의 기본 HTML 5 플레이어에서 멀티미디어를 재생하고 재생할 수 있습니다. 자세한 내용은 [오디오 및 비디오 미리보기를 위한 FFmpeg 활성화](./enabling-ffmpeg-for-audio-and-video-previews.md) 을 참조하십시오.

   ```{note}
   Liferay 7.3.x 및 이전 버전은 오디오 및 비디오 미리 보기를 생성하기 위해 [Xuggler](http://www.xuggle.com/xuggler)을 사용합니다. 자세한 내용은 [Xuggler 활성화](../../../system-administration/using-the-server-administration-panel/configuring-external-services.md#enabling-xuggler)를 참조하세요.
   ```

이러한 도구를 설치하고 구성하면 Documents and Media는 대부분의 파일 형식에 대한 응용 프로그램 미리 보기를 제공할 수 있습니다.

## 추가 정보

* [파일 관리](../uploading-and-managing/managing-files.md)
* [문서 및 미디어 UI 참조](../documents-and-media-ui-reference.md)
* [OpenOffice/LibreOffice 통합 활성화](./enabling-openoffice-libreoffice-integration.md)
