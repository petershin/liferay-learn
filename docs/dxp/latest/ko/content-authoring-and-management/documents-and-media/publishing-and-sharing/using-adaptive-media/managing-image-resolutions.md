# 이미지 해상도 관리

Adaptive Media 애플리케이션을 통해 조정된 이미지 해상도를 관리할 수 있습니다. 여기에는 조정된 이미지를 수동으로 생성하고, 해상도를 비활성화/활성화하고, 이미지와 함께 해상도를 삭제하는 작업이 포함됩니다.

## 이미지 해상도 편집

Adaptive Media가 적응형 이미지를 생성하는 데 해상도를 사용한 경우 해상도의 크기와 식별자를 편집할 수 없습니다. 이렇게 하면 생성된 이미지의 불일치가 방지됩니다. 조정된 이미지로 해상도 값을 변경해야 하는 경우 해상도를 [삭제](#deleting-image-solutions)하고 새 해상도를 [생성](./adding-image-solutions.md)해야 합니다.

## 적응된 이미지를 수동으로 생성

해상도를 추가하거나 활성화하기 전에 이미지를 업로드한 경우 각 이미지에 맞게 조정된 이미지를 수동으로 생성해야 합니다. 적용된 이미지의 비율이 애플리케이션 테이블에 나타납니다.

![The percentage of adapted images appears in the application table.](./managing-image-resolutions/images/01.png)

해상도에 맞는 이미지를 수동으로 생성하려면,

1. *전역 메뉴*( ![전역 메뉴](../../../../images/icon-applications-menu.png) )를 열고 *제어판* 탭으로 이동한 다음 *적응형 미디어*를 클릭합니다.

1. 원하는 해상도에 대해 _작업_ 버튼( ![작업 버튼](../../../../images/icon-actions.png) )을 클릭하고 _나머지 조정_을 선택합니다.

   ![Select Adapt Remaining.](./managing-image-resolutions/images/02.png)

   또는 응용 프로그램 표시줄에서 _작업_ 버튼( ![작업 버튼](../../../../images/icon-actions.png) )을 클릭하고 _모든 이미지 적용_을 선택하여 활성화된 모든 해상도에 대한 이미지 생성을 시작합니다.

   ![Select Adapt All Images.](./managing-image-resolutions/images/03.png)

Adaptive Media는 처리 구성 [에 따라](./adaptive-media-configuration-reference.md#processes) 적으로 각 해상도에 대한 이미지 생성을 시작합니다.

## 이미지 해상도 비활성화 및 활성화

이미지 해상도는 기본적으로 활성화되어 있지만 언제든지 비활성화할 수 있습니다. 해상도를 비활성화하면 Adaptive Media가 이를 사용하여 이미지를 생성할 수 없지만 이전에 해당 해상도에 대해 생성된 이미지는 계속 사용할 수 있습니다.

해결 방법을 비활성화/재활성화하려면,

1. 원하는 해상도에 대해 _작업_ 버튼( ![작업 버튼](../../../../images/icon-actions.png) )을 클릭합니다.

1. _비활성화_/_활성화_를 선택합니다.

   ![Select Disable/Enable.](./managing-image-resolutions/images/04.png)

비활성화된 동안 Adaptive Media는 해상도를 사용하여 적응된 이미지를 생성하지 않습니다.

이미지를 업로드하고 나중에 해상도를 다시 활성화하는 경우 해당 이미지에 맞게 조정된 이미지 [수동으로 생성](#manually-generating-adapted-images) 를 수동으로 생성해야 합니다.

## 이미지 해상도 삭제

이미지 해상도를 삭제해야 하는 경우 먼저 비활성화해야 합니다. 활성화된 해상도는 삭제할 수 _없습니다_. 이렇게 하면 이미지 해상도가 실수로 삭제되는 것을 방지할 수 있습니다.

```{warning}
이미지 해상도를 삭제할 때는 주의하세요. 삭제되면 해당 해상도에 적용된 이미지는 복구할 수 없게 손실되며 생성한 새 이미지 해상도로 자동 교체되지 않습니다.
```

이미지 해상도를 삭제하려면,

1. 비활성화된 해상도에 대해 _작업_ 버튼( ![작업 버튼](../../../../images/icon-actions.png) )을 클릭합니다.

1. _삭제_를 선택하세요.

   ![Select Delete.](./managing-image-resolutions/images/05.png)

해상도는 수정된 이미지와 함께 영구적으로 제거되었습니다.

## 휴지통과 적응된 이미지

조정된 이미지를 [휴지통](../../../recycle-bin/recycle-bin-overview.md) 로 직접 이동할 수 없습니다. 그러나 원본 이미지가 휴지통에 있는 경우 해당 수정 이미지는 휴지통에 있는 것처럼 작동하며 사용자는 해당 이미지를 볼 수 없습니다. 이러한 개조된 이미지를 가리키는 URL은 '404' 오류 코드를 반환합니다.

원본 이미지를 휴지통에서 복원하면 수정된 이미지에 다시 액세스할 수 있습니다.

## 관련 주제

* [이미지 해상도 추가](./adding-image-resolutions.md)
* [적응형 미디어 구성 참조](./adaptive-media-configuration-reference.md)
* [문서 및 미디어 축소판 마이그레이션](./migrating-documents-and-media-thumbnails.md)
