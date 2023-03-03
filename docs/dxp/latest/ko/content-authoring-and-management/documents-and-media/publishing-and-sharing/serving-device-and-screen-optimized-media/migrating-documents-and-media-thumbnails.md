# 문서 및 미디어 축소판을 적응형 미디어로 마이그레이션

DXP는 Adaptive Media를 사용하여 문서 및 미디어의 이미지에 대한 축소판을 자동으로 생성합니다. 이 기능은 DXP 7.1+부터 기본적으로 설치됩니다. 그러나 Adaptive Media를 지원하지 않는 레거시 버전을 사용 중이고 최신 DXP 버전으로 업그레이드했으며 Adaptive Media를 사용하여 문서 및 미디어 썸네일을 관리하려는 경우 계속 읽어보고 마이그레이션 프로세스를 알아보세요.

```{note}
여기에 설명된 작업을 수행하려면 포털 관리자여야 합니다.
```

## 대체 이미지 해상도 추가

기존 문서 및 미디어 축소판을 마이그레이션하려면 다음 포털 속성에 지정된 값과 일치하는 최대 높이 및 최대 너비 값을 갖는 적응형 미디어에 새 이미지 해상도를 추가해야 합니다.

* `dl.file.entry.thumbnail.max.height`
* `dl.file.entry.thumbnail.max.width`
* `dl.file.entry.thumbnail.custom1.max.height`
* `dl.file.entry.thumbnail.custom1.max.width`
* `dl.file.entry.thumbnail.custom2.max.height`
* `dl.file.entry.thumbnail.custom2.max.width`

이러한 속성 중 일부는 활성화되지 않을 수 있습니다. 활성화된 속성에 대해 Adaptive Media에서 이미지 해상도만 생성하면 됩니다.

새 이미지 해상도를 생성하려면 [이미지 해상도 추가](./adding-image-resolutions.md)를 참조하십시오.

## 적응형 미디어 이미지 만들기

필요한 이미지 해상도가 있으면 문서 및 미디어 축소판을 적응형 미디어 이미지로 변환할 수 있습니다.

문서 및 미디어 축소판을 Adaptive Media로 마이그레이션하는 방법에는 두 가지가 있습니다.

* 썸네일 이미지 해상도에 맞게 이미지 조정: 기존 썸네일을 적응형 미디어 이미지 해상도의 값으로 조정하며 이미지 수에 따라 시간이 걸릴 수 있습니다. 적은 수의 이미지에 대해서만 또는 처음부터 이미지를 생성하려는 경우에만 권장됩니다. 이 접근 방식은 [누락된 적응 이미지 생성](./managing-image-resolutions.md#generating-missing-adapted-images) 에서 자세히 다룹니다.

* 기존 썸네일을 재사용하는 마이그레이션 프로세스 실행: 기존 썸네일을 Adaptive Media에 복사합니다. 그러면 계산 비용이 많이 드는 크기 조정 작업을 피할 수 있으므로 성능이 향상됩니다.

### 마이그레이션 프로세스 실행

마이그레이션 프로세스는 [Gogo 콘솔 명령](../../../../liferay-internals/fundamentals/using-the-gogo-shell/gogo-shell-commands.md)의 집합입니다.

1. _전역 메뉴_ &rarr; _제어판_ &rarr; _Gogo Shell_로 이동합니다.

   ![Gogo Shell로 이동합니다.](./migrating-documents-and-media-thumbnails/images/01.png)

1. `thumbnails:check` 명령을 실행합니다. 각 인스턴스에 대해 마이그레이션을 보류 중인 썸네일 수를 나열합니다.
1. `thumbnails:migrate` 명령을 실행합니다. 이렇게 하면 마이그레이션 프로세스가 실행되며 이미지 수에 따라 완료하는 데 시간이 걸릴 수 있습니다.
1. `thumbnails:cleanUp` 명령을 실행합니다. 이렇게 하면 원본 문서 및 미디어 축소판이 모두 삭제되고 `thumbnails:check`에서 반환된 개수가 업데이트됩니다. 따라서 마이그레이션 명령을 실행하고 마이그레이션이 성공적으로 실행되었고 마이그레이션을 보류 중인 이미지가 없는지 확인한 후 **만** 실행 `thumbnails:cleanUp` 해야 합니다.

## 문제 해결

마이그레이션 프로세스를 실행한 후 어느 시점에서 Adaptive Media를 배포 취소하는 경우 문서 및 미디어 썸네일을 재생성해야 합니다.

1. _전역 메뉴로 이동합니다._ &rarr; _제어판_ &rarr; _서버 관리_.

   ![서버 관리로 이동합니다.](./migrating-documents-and-media-thumbnails/images/03.png)

1. _문서 및 미디어의 미리 보기 및 썸네일 파일 재설정_옆에 있는 _실행_ 을 클릭합니다.

   ![Gogo Shell로 이동합니다.](./migrating-documents-and-media-thumbnails/images/02.png)

## 추가 정보

* [이미지 해상도 관리](./managing-image-resolutions.md)
* [적응형 미디어 구성 참조](./adaptive-media-configuration-reference.md)
