# 이미지 해상도 추가

기본적으로 Adaptive Media에는 미리보기와 썸네일이라는 두 가지 이미지 해상도가 포함되어 있습니다. 일반 장치(예: 데스크탑, 노트북, 태블릿, 휴대폰)에 대한 사이트 성능을 최적화하는 데 도움이 되도록 추가 이미지 해상도를 정의할 수 있습니다. 이미지를 업로드하면 Adaptive Media는 기존 해상도를 사용하여 이미지의 각 버전을 자동으로 생성합니다. 생성된 모든 이미지는 원본 화면비를 유지합니다. 사용자 정의 해상도를 추가하기 전에 이미지를 업로드한 경우 해당 이미지의 해상도 버전 [수동으로 생성](./managing-image-resolutions.md#manually-generating-adapted-images) 으로 생성해야 합니다.

```{important}
추가 해상도를 생성하려면 더 많은 계산 리소스와 저장 공간이 필요합니다. 성능을 최적화하기 위해 최대 비동기 프로세스 수와 사용 가능한 핵심 프로세스를 구성할 수 있습니다. 자세한 내용은 [적응형 미디어 구성 참조](./adaptive-media-configuration-reference.md#processes) 를 참조하세요.
```

![Add and manage images resolutions in the Adaptive Media application.](./adding-image-resolutions/images/01.png)

## 새 이미지 해상도 추가

1. **글로벌 메뉴**(![글로벌 메뉴](../../../../images/icon-applications-menu.png))를 열고 *제어판* 탭으로 이동한 다음 *적응형 미디어*를 클릭합니다.

1. **추가**( ![추가 버튼](../../../../images/icon-add.png) )를 클릭합니다.

1. 고유한 이름과 설명을 입력합니다.

1. **최대 너비** 및/또는 **최대 높이** 를 픽셀 단위로 입력하세요.

   측정값을 비워두면 해당 값은 '자동'으로 설정됩니다.

1. HiDPI(고화소 밀도 디스플레이)에 대한 해상도를 추가할지 여부를 결정합니다.

   이 옵션을 선택하면 설정된 크기를 두 배로 늘리는 추가 해상도가 생성됩니다. 이 해상도는 현재 해상도와 동일한 이름을 사용하고 접미사 '-2x'를 추가합니다.

1. 해상도의 식별자를 확인합니다.

   **자동**(기본값): 이름 필드를 기반으로 케밥 케이스 값을 사용합니다.

   **맞춤** : 맞춤 값을 입력합니다.

   타사 응용 프로그램은 이 ID를 사용하여 Adaptive Media의 API를 통해 해상도에 대한 이미지를 얻을 수 있습니다.

   ![Enter a name, description, size, and identifier for the resolution.](./adding-image-resolutions/images/02.png)

1. **저장** 을 클릭하세요.

해상도가 활성화되어 있는 동안 Adaptive Media는 이를 사용하여 모든 새 업로드에 대한 이미지를 생성합니다. 이전에 업로드한 이미지에 대해 [수동으로 생성](./managing-image-resolutions.md#manually-generating-adapted-images) 조정된 이미지를 수동으로 생성할 수도 있습니다.

```{important}
이미지를 조정하는 데 해상도가 사용된 경우 이미지 해상도와 해당 식별자를 업데이트할 수 없습니다. 이렇게 하면 생성된 이미지의 불일치가 방지됩니다.
```

## 관련 주제

* [이미지 해상도 관리](./managing-image-resolutions.md)
* [적응형 미디어 구성 참조](./adaptive-media-configuration-reference.md)
