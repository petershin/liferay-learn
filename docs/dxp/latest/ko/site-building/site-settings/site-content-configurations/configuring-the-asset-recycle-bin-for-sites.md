# 사이트용 자산 휴지통 구성

휴지통은 시스템에서 영구적으로 제거되기 전에 삭제 플래그가 지정된 콘텐츠 및 자산을 저장합니다. 이 기능은 기본적으로 전역적으로 활성화할 수 있으며 사이트별로 구성할 수 있습니다. 휴지통에 대한 자세한 내용은 [휴지통](../../../content-authoring-and-management/recycle-bin/recycle-bin-overview.md) 섹션을 참조하십시오.

```{warning}
사이트의 휴지통을 비활성화하면 사이트에서 삭제된 콘텐츠 및 자산이 영구적으로 삭제됩니다.
```

## 사이트의 휴지통 구성

특정 사이트에 대해 휴지통을 활성화하거나 비활성화하려면 다음 단계를 따르십시오.

1. 휴지통 옵션에 액세스:

    - 라이프레이 DXP 7.4+에서

      1. 사이트 메뉴에서 **구성** &rarr; **사이트 설정** 로 이동합니다.
      1. 콘텐츠 및 데이터 섹션에서 **휴지통** 을 클릭합니다.

         ![Liferay DXP 7.4+에서는 사이트 설정 섹션에서 휴지통 옵션을 변경합니다.](./configuring-the-asset-recycle-bin-for-sites/images/02.png)

    - 이전 Liferay DXP 버전에서

      1. 사이트 메뉴에서 **구성** &rarr; **설정** 로 이동합니다.
      1. 고급 영역에서 **휴지통** 섹션을 확장합니다.

         ![이전 Liferay DXP 버전에서는 설정 섹션에서 휴지통 옵션을 변경합니다.](./configuring-the-asset-recycle-bin-for-sites/images/01.png)

1. **휴지통 활성화** 을 전환하여 사이트의 휴지통을 활성화 또는 비활성화합니다.
1. 선택적으로 **Trash Entries Max Age** 입력에 값(분)을 제공하여 재활용된 자산이 영구 삭제되기 전에 휴지통에 남아 있어야 하는 기간을 지정합니다.

1. **저장** 을 클릭합니다.

## 관련 정보

* [휴지통 개요](../../../content-authoring-and-management/recycle-bin/recycle-bin-overview.md)
* [휴지통 구성](../../../content-authoring-and-management/recycle-bin/configuring-the-recycle-bin.md)
* [사이트 설정 UI 참조](../../site-settings/site-settings-ui-reference.md)
