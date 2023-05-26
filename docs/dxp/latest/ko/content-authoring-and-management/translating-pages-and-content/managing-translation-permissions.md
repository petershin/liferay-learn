# 번역 권한 관리

콘텐츠 페이지 및 웹 콘텐츠 번역에 필요한 권한은 번역 방법에 따라 다릅니다.

* 수동 번역에는 리소스 유형에 대한 **업데이트** 권한 또는 하나 이상의 언어에 대한 **번역** 권한이 필요합니다.

* 번역을 내보내고 가져오려면 리소스 유형에 대한 업데이트 **권한이 필요** 않습니다.

## 업데이트 권한 할당

페이지 및 웹 콘텐츠에 대한 **업데이트** 권한이 있는 사용자는 수동으로 사용 가능한 언어로 번역할 수 있습니다. 번역을 위해 XLIFF 파일로 내보낸 다음 완료되면 번역을 가져올 수도 있습니다. 애플리케이션 수준에서 이러한 권한을 할당하는 방법은 [역할 권한 정의](../../users-and-permissions/roles-and-permissions/defining-role-permissions.md)를 참조하세요.

## 번역 권한 할당

번역 권한은 언어별로 다르며 콘텐츠 페이지 및 웹 콘텐츠에 대한 **번역** 작업에 대한 액세스 권한을 부여합니다. 번역 권한이 있는 사용자는 할당된 언어만 사용할 수 있습니다. 일단 부여되면 이러한 권한은 개별 자산에 의해 제한될 수 없습니다.

```{note}
번역에 사용할 수 있는 언어는 인스턴스의 현지화 설정에 따라 결정됩니다. [초기 인스턴스 현지화](../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md) 및 [가상 인스턴스 현지화](../../system-administration/ 참조 configure-liferay/virtual-instances/localization.md)를 참조하십시오.
```

특정 언어에 대한 번역 권한을 할당하려면 다음 단계를 따르세요.

1. **글로벌 메뉴**( ![Global Menu](../../images/icon-applications-menu.png) )을 열고 **제어판** 탭으로 이동한 다음 **역할** 을 클릭합니다.

1. 원하는 역할에 대해 **작업** 버튼( ![Actions Button](../../images/icon-actions.png) )을 클릭하고 **편집을 선택** .

   또는 **추가** 버튼( ![Add Button](../../images/icon-add.png) )을 클릭하여 번역을 위한 새 역할을 만들 수 있습니다.

1. **권한 정의** 탭을 클릭하고 권한 사이드바 메뉴에서 **사이트 및 자산 라이브러리 관리** &rarr; **구성** &rarr; **번역** 로 이동합니다.

1. 확인란을 사용하여 선택한 역할에 원하는 언어 권한을 할당합니다.

   ![선택한 역할에 원하는 언어 권한을 할당합니다.](./managing-translation-permissions/images/01.png)

1. 페이지 하단의 **저장** 을 클릭합니다.

구성된 역할을 가진 사용자는 이제 웹 콘텐츠 및 콘텐츠 페이지 경험을 지정된 언어로 수동으로 번역할 수 있습니다.

## 관련 주제

* [콘텐츠 페이지 번역](./translating-content-pages.md)
* [웹 콘텐츠 번역](./translating-web-content.md)
