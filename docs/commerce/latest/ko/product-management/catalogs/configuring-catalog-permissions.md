---
uuid: 7a25f911-e061-4a44-84e1-09bf79db288a
---

# 카탈로그 권한 구성

카탈로그 권한은 카탈로그 및 관련 제품을 보고 수정할 수 있는 사용자를 결정합니다. 관리 사용자는 기본적으로 이러한 권한을 가지며 시스템에 추가된 새 역할에 이러한 권한을 추가할 수 있습니다.

```{note}
개별 제품 보기 권한은 사용 가능한 채널을 수정하여 관리합니다. 자세한 내용은 [채널을 사용하여 제품 가시성 구성](../../store-management/channels/configuring-product-visibility-using-channels.md)을 참조하세요.
```

## 기존 역할에 카탈로그 관리 권한 추가

카탈로그 및 제품을 관리하기 위해 새 사용자 정의 역할을 생성하거나 기존 역할을 수정하여 시작하십시오. 이 역할은 시스템 전체 기능에 대한 최소한의 액세스 권한을 갖도록 구성할 수 있습니다. 사용자 권한 정의에 대한 자세한 내용은 [역할 권한 정의](https://learn.liferay.com/dxp/latest/en/users-and-permissions/roles-and-permissions/defining-role-permissions.html)참조하십시오.

기존 역할에 대한 카탈로그 관리 권한을 정의하려면:

1. _제어판_ &rarr; _사용자_ &rarr; _역할_로 이동합니다.
1. (![Add icon](../../images/icon-add.png))을 클릭하여 새 정규 역할을 추가합니다.
1. 다음을 입력:

     * **제목**: 카탈로그 관리자.
     * **설명** 이 역할은 카탈로그를 관리합니다.
     * **키**: (제목을 기반으로 생성)

1. _저장_클릭합니다.
1. _권한 정의_클릭합니다.
1. _제어판_ &rarr; _상거래_ 클릭하여 드롭다운 메뉴를 확장합니다.

    ![Commerce Catalogs 권한으로 이동합니다.](./configuring-catalog-permissions/images/03.png)

1. _카탈로그_을 클릭합니다.
1. 원하는 권한을 선택하십시오. 최소한 모든 _일반 권한_ 및 _리소스 권한_.

    ![카탈로그 권한을 선택합니다.](./configuring-catalog-permissions/images/04.png)

1. _저장_클릭합니다.
1. _제품_ 드롭다운 메뉴를 클릭합니다.
1. 원하는 권한을 선택하십시오. 최소한 모든 _일반 권한_ 및 _리소스 권한_.
1. 완료되면 _저장_ 클릭합니다.

새 카탈로그 관리자 역할은 카탈로그 및 제품 메뉴를 볼 수 있는 최소 권한을 받습니다. 이 역할을 가진 사용자는 이제 _제어판_ &rarr; _상거래_ &rarr; _카탈로그_ 및 _제품_ 메뉴에 액세스할 수 있습니다.

## 카탈로그의 권한 구성

아래 단계에 따라 카탈로그 권한을 구성하십시오.

1. _제어판_ &rarr; _상거래_ &rarr; _카탈로그_로 이동합니다.
1. (![3-dot icon](../../images/icon-actions.png)) 을 클릭한 다음 _Permissions_클릭 하십시오 .

    ![사용자는 권한을 편집할 수 있습니다.](./configuring-catalog-permissions/images/01.png)

1. 해당 역할에 대해 원하는 권한 옆의 확인란을 선택합니다.

    ![원하는 권한을 선택합니다.](./configuring-catalog-permissions/images/02.png)

1. 완료되면 _저장_ 클릭합니다.

이제 카탈로그의 권한이 구성되었습니다.

## 추가 정보

* [역할 및 권한 이해](https://learn.liferay.com/dxp/latest/en/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.html)
* [채널을 사용하여 제품 가시성 구성](../../store-management/channels/configuring-product-visibility-using-channels.md)
