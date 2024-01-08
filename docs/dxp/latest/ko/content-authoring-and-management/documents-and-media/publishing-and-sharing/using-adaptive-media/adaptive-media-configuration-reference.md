# 적응형 미디어 구성 참조

{bdg-secondary}`liferay 7.3 U28+/GA28+ 및 7.4 U78+/GA78+`

적응형 미디어를 사용하면 지원되는 미디어 유형을 구성하고 문서 라이브러리의 미리 보기 및 축소판에 사용되는 해상도를 결정할 수 있습니다. 이러한 설정에 액세스하려면

1. **전역 메뉴**( ![전역 메뉴](../../../../images/icon-applications-menu.png) )를 열고 **제어판** 탭으로 이동한 후 **시스템을 클릭합니다. 설정** .

1. 콘텐츠 및 데이터 아래에서 **적응형 미디어** 를 클릭합니다.

   ![Access the System Settings](./adaptive-media-configuration-reference/images/01.png)

구성 옵션은 다음 네 개의 탭에 나타납니다.

* 시스템 이미지 해상도: 문서 라이브러리 축소판 및 미리 보기에 사용되는 해상도를 구성합니다.
* 이미지: Adaptive Media에서 지원하는 미디어 유형을 구성합니다.
* ImageMagick: ImageMagick을 사용하여 생성되는 미디어 유형을 구성합니다.
* 프로세스: 비동기 처리를 구성합니다.

## 시스템 이미지 해상도

여기에서 문서 라이브러리 미리 보기 및 축소판에 대한 Adaptive Media의 기본 동작을 재정의할 수 있습니다. 기본적으로 Adaptive Media는 사용자의 화면 유형 및 해상도에 가장 가까운 크기를 기반으로 미리 보기 및 축소판에 가장 적합한 이미지 해상도를 선택합니다. 하지만 해상도 ID를 입력하여 이 프로세스를 재정의할 수 있습니다(예: `Preview-1000x0`).

![Access the System Settings](./adaptive-media-configuration-reference/images/02.png)

| 분야              | 묘사                                                             |
| :-------------- | :------------------------------------------------------------- |
| 미리보기 구성         | 문서 라이브러리 미리 보기에 대한 기본 적응형 미디어 동작을 재정의하려면 해상도 ID를 입력하세요.        |
| 썸네일 구성          | 문서 라이브러리 축소판의 기본 적응형 미디어 동작을 재정의하려면 해상도 ID를 입력하세요.             |
| 사용자 정의 썸네일 구성 1 | 문서 라이브러리 사용자 정의 축소판 1에 대한 기본 적응형 미디어 동작을 재정의하려면 해상도 ID를 입력하세요. |
| 사용자 정의 썸네일 구성 2 | 문서 라이브러리 사용자 정의 축소판 2에 대한 기본 적응형 미디어 동작을 재정의하려면 해상도 ID를 입력하세요. |

## 이미지

여기에서 Adaptive Media가 처리하는 미디어 유형을 결정하고 Gifsicle [기프시클](https://www.lcdf.org/gifsicle/) 활성화 또는 비활성화할 수 있습니다.

![Determine supported media types.](./adaptive-media-configuration-reference/images/03.png)

| 분야         | 묘사                                                                                                                                                                                                                                |
| :--------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 지원 MIME 유형 | Adaptive Media에서 처리되는 미디어 유형을 결정합니다. 이미지가 업로드되었지만 해당 미디어 유형이 나열되지 않은 경우 Adaptive Media는 이미지를 무시합니다. 기본적으로 이 목록에는 `bmp`, `gif`, `jpeg`, `pjpeg`, `png`, `svg+xml`, `x-citrix-jpeg`, `x-citrix-png`, `x가 포함됩니다. -ms-bmp` 및 `x-png`. |

![Enable or disable Gifsicle.](./adaptive-media-configuration-reference/images/04.png)

| 분야       | 묘사                                                                                                                                        |
| :------- | :---------------------------------------------------------------------------------------------------------------------------------------- |
| Gifsicle | Gifsicle을 활성화하여 gif 파일을 조정할 수 있습니다. 자세한 내용은 [애니메이션 GIF 최적화 활성화](../../devops/enabling-optimization-of-animated-gifs.md) 참조하세요. |

## 이미지매직

여기에서는 [ImageMagick](http://www.imagemagick.org) 사용하여 처리되는 미디어 유형을 결정할 수 있습니다. ImageMagick을 사용하려면 먼저 Liferay 서버에 설치해야 합니다. 자세한 내용은 [ImageMagick 및 Ghostscript](../../../../system-administration/using-the-server-administration-panel/configuring-external-services.md#enabling-imagemagick-and-ghostscript) 활성화를 참조하십시오.

![Determine which media types are processed using ImageMagick.](./adaptive-media-configuration-reference/images/05.png)

| 분야         | 묘사                                                                                                                                                                                                                                                                                                                            |
| :--------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 지원 MIME 유형 | Adaptive Media에서 ImageMagick이 처리하는 미디어 유형을 결정합니다. 이미지가 업로드되었지만 해당 미디어 유형이 이 목록에 없는 경우 Adaptive Media는 미리 보기 생성에 ImageMagick을 사용하지 않습니다. 기본적으로 이 목록에는 `avif`, `gif`, `heic`, `tiff` 및 `webp`가 포함되어 있지만 다른 미디어 유형을 추가할 수 있습니다. 지원되는 미디어 유형 목록은 [ImageMagick 설명서](https://imagemagick.org/script/formats.php) 참조하세요. |

## 프로세스

여기서 Adaptive Media의 비동기 처리를 구성할 수 있습니다. 성능을 향상시키려면 이러한 값을 수정하십시오.

![Configure Adaptive Media's image processing.](./adaptive-media-configuration-reference/images/06.png)

| 분야      | 묘사                                                                              |
| :------ | :------------------------------------------------------------------------------ |
| 최대 프로세스 | 적응형 미디어 생성을 위한 최대 프로세스 수를 설정합니다. 기본값은 '5'입니다.                                   |
| 핵심 프로세스 | 적응형 미디어 생성에 항상 사용할 수 있는 프로세스 수를 설정합니다. 기본값은 '2'입니다. 이 값은 최대 프로세스 수를 초과할 수 없습니다. |

```{warning}
최대 프로세스 및 핵심 프로세스의 값이 클수록 많은 양의 메모리를 소비하여 메모리 부족 오류가 발생할 수 있습니다. 소스 이미지가 큰 경우에도 메모리 부족 오류가 발생할 수 있습니다. 시스템에서 사용 가능한 메모리 양에 맞게 이러한 설정을 최적화하려면 성능 테스트를 실행해야 합니다.
```

## 관련 주제

* [이미지 해상도 추가](./adding-image-resolutions.md)
* [이미지 해상도 관리](./managing-image-resolutions.md)
