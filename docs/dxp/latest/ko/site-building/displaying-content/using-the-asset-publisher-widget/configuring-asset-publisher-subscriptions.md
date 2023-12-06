# 자산 게시자 구독 구성

Asset Publisher는 이메일 구독과 RSS 피드 구독이라는 두 가지 종류의 구독을 지원합니다.

## 이메일 구독

사용자는 자산 게시자를 구독하여 새 자산이 게시될 때 이메일 알림을 받을 수 있습니다. 먼저 이 알림을 활성화해야 합니다. 다음과 같이하세요:

1. Asset Publisher 위에 마우스를 놓고 위젯 메뉴에서 옵션 아이콘(![Options](../../../images/icon-app-options.png))을 클릭한 후 **구성** 선택합니다.
1. **이메일 구독 활성화** 선택기를 예로 전환합니다.
1. 양식을 작성하고 **저장** 클릭하여 변경 사항을 적용합니다.

    ![이메일 구독을 통해 새 자산이 게시되면 사용자에게 알립니다.](./configuring-asset-publisher-subscriptions/images/01.png)

1. 활성화되어 있지 않은 경우 디스플레이 설정 탭에서 **구독** 기능을 활성화하십시오. 사용자는 **구독** 버튼을 클릭하여 새로 게시된 자산에 대한 이메일 알림을 받을 수 있습니다.

![이메일 구독을 활성화하면 자산 게시자에 대한 구독 링크가 추가됩니다.](./configuring-asset-publisher-subscriptions/images/02.png)

### 자산 확인 간격 구성

Liferay Portal은 정기적으로 새 자산을 확인하고 구독 사용자에게 새 자산에 대해 알리는 이메일을 보냅니다. 기본적으로 자산은 24시간마다 확인됩니다. 시스템 설정을 통해 확인 간격을 변경할 수 있습니다. 다음과 같이하세요:

1. 제품 메뉴를 열고 **제어판** &rarr; **구성** &rarr; **시스템 설정** 로 이동합니다.
1. **콘텐츠 및 데이터** 제목 아래에서 **자산** 선택합니다.
1. **시스템 범위** &rarr; **자산 게시자** 로 이동합니다.
1. **확인 간격** 설정을 새 자산을 확인하고 구독자에게 알리려는 간격(시간)으로 변경하고 **저장** 클릭하여 변경 사항을 적용합니다.

![확인 간격 설정은 업데이트를 위해 자산을 확인하는 빈도를 지정합니다.](./configuring-asset-publisher-subscriptions/images/03.png)

```{warning}
이 기능을 비활성화해야 하는 경우 구성 요소를 [blacklist](../../../system-administration/installing-and-managing-apps/managing-apps/blacklisting-osgi-comComponents.md)합니다. 간격에 0이나 음수를 입력하지 마십시오.
```

## RSS 피드 구독

```{note}
RSS 피드는 Liferay Portal 7.2 이상에서는 더 이상 사용되지 않으며 기본적으로 비활성화되어 있습니다. RSS 피드를 활용하려면 이 기능을 활성화해야 합니다.
```

자산 게시자에 대한 RSS 피드 구독을 활성화하려면 다음 단계를 따르세요.

1. 제품 메뉴를 열고 **제어판** &rarr; **구성** &rarr; **시스템 설정** 로 이동합니다.
1. **콘텐츠 및 데이터** 제목 아래에서 **웹 콘텐츠** 선택합니다.
1. **시스템 범위** &rarr; **관리** 탭에서 **피드** 표시 상자를 선택합니다. 더 이상 사용되지 않는 앱에 대한 자세한 내용은 [이 문서](../../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md)를 참조하세요.

    ![시스템 설정을 통해 RSS 피드를 활성화합니다.](./configuring-asset-publisher-subscriptions/images/04.png)

1. Asset Publisher 위젯으로 다시 이동하여 위젯 위로 마우스를 가져간 후 위젯 메뉴에서 옵션 아이콘(![Options](../../../images/icon-app-options.png))을 클릭하고 **구성** 선택합니다.
1. **RSS 구독 활성화** 선택기를 예로 전환합니다.
1. 양식을 작성하고 **저장** 클릭하여 변경 사항을 적용합니다.

    ![RSS 구독은 RSS 피드를 구독자의 RSS 리더에게 보냅니다.](./configuring-asset-publisher-subscriptions/images/05.png)

1. 활성화되어 있지 않은 경우 디스플레이 설정 탭에서 **구독** 기능을 활성화하십시오. 사용자는 **RSS** 링크를 클릭하여 RSS 피드를 구독할 수 있습니다.

![RSS 구독을 활성화하면 RSS 링크가 자산 게시자에 추가됩니다.](./configuring-asset-publisher-subscriptions/images/06.png)

## 관련 정보

* [메일 구성](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
* [자산 게시자 위젯을 사용하여 자산 표시](./displaying-assets-using-the-asset-publisher-widget.md)
* [자산 게시자 표시 설정 구성](./configuring-asset-publisher-display-settings.md)
