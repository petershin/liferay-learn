# 오디오 및 비디오 미리보기에 FFmpeg 활성화

Documents and Media는 오디오 및 비디오 파일 미리 보기를 생성하기 위해 [FFmpeg](http://ffmpeg.org/) 멀티미디어 프레임워크와의 통합을 제공합니다. 이 통합을 사용하려면 먼저 서버에 FFmpeg를 설치해야 합니다. 클러스터 환경에서 작업하는 경우 각 노드에 FFmpeg를 설치해야 합니다.

```{note}
이전에 Liferay는 Xuggler를 사용하여 비디오 및 오디오 미리 보기를 생성했습니다. 그러나 Xuggler 라이브러리는 현재 유지 관리되지 않습니다. Liferay 7.4부터 사용자는 미리 보기를 생성하기 위해 FFmpeg를 사용하는 것이 좋습니다.
```

설치가 완료되면 다음 단계에 따라 FFmpeg를 사용하도록 문서 및 미디어를 구성합니다.

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **제어판** &rarr; **시스템 설정** &rarr; **문서 및 미디어** 으로 이동합니다.

1. **FFMPEG 오디오 변환기** 로 이동하여 **활성화** 을 선택하고 **업데이트** 를 클릭합니다.

1. **FFMPEG Video Converter** 로 이동하여 **Enable** 을 확인하고 **Update** 를 클릭합니다.

   ![FFMPEG 오디오 변환기와 FFMPEG 비디오 변환기를 모두 활성화합니다.](./enabling-ffmpeg-for-audio-and-video-previews/images/01.png)

   FFmpeg가 시스템에 올바르게 설치된 경우 Liferay는 업데이트를 클릭한 후 성공 메시지를 표시합니다. 그렇지 않으면 Liferay에 오류 메시지가 표시됩니다.

   ![FFmpeg가 설치되지 않은 경우 Liferay는 오류 메시지를 표시합니다.](./enabling-ffmpeg-for-audio-and-video-previews/images/02.png)

일단 구성되면 업로드 또는 업데이트 시 오디오 및 비디오 파일에 대한 오디오 및 비디오 미리 보기가 자동으로 생성됩니다.

## 관련 주제

* [파일 관리](../uploading-and-managing/managing-files.md)
* [문서 및 미디어 미리보기 구성](./configuring-documents-and-media-previews.md)
