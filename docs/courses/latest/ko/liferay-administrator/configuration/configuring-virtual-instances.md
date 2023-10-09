# 가상 인스턴스 구성

{bdg-secondary}`LXC-SM 또는 자체 호스팅`

자체 사이트, 사용자 및 조직 세트를 갖춘 또 다른 Liferay 환경이 필요한 비즈니스 사용 사례가 있을 수 있습니다. 새로운 서버를 가동하는 대신 가상 인스턴스를 생성할 수 있습니다.

예를 들어, Delectable Bonsai에는 비즈니스를 위한 외부 공개 웹사이트와 아침 식사라고 불리는 직원용 내부 인트라넷이 모두 있습니다. 이는 가상 인스턴스를 사용하여 구축됩니다.

## LXC의 가상 인스턴스

가상 인스턴스 설정에 대해서는 Liferay Cloud 지원 담당자에게 문의하세요.

## LXC-SM 및 자체 호스팅의 가상 인스턴스

1. _글로벌 메뉴로 이동_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _가상 인스턴스_.

1. _Add_ (![Add icon](../../images/icon-add.png))을 클릭하고 다음 정보를 입력하세요.

   * 웹 ID: `lunch.delectablebonsai.com`
   * 가상 호스트: `lunch.delectablebonsai.com`
   * 메일 도메인: `delectablebonsai.com`
   * 최대 사용자: `0` (참고, 이는 무제한 사용자를 의미함)
   * 활성: 켜짐
   * 가상 인스턴스 초기화 프로그램: _빈 사이트_을 선택합니다.

   ![가상 인스턴스 정보를 입력하세요.](./configuring-virtual-instances/images/01.png)

   _저장_클릭하세요. 새로운 가상 인스턴스가 준비되었습니다.

1. 이것은 실제 외부 호스팅 사이트가 아니므로 로컬 시스템의 `/etc/hosts` 파일에 도메인을 추가하세요.

   `127.0.0.1 breakfast.delectablebonsai.com`

   ```{note}
   도커 컨테이너를 사용하는 경우 `--add-host Breakfast.delectablebonsai.com:127.0.0.1` 항목이 실행 명령에 포함되어야 합니다.
   ```

1. 가상 인스턴스가 성공적으로 추가되면 `http://breakfast.delectablebonsai.com:8080/`로 이동합니다.

   ![새 가상 인스턴스를 사용할 준비가 되었습니다.](./configuring-virtual-instances/images/02.png)

## 새 인스턴스에 대한 관리자 생성

가상 인스턴스는 별도의 Liferay 인스턴스입니다. 방금 생성한 새 인스턴스에는 사용자 계정이 없습니다. Kyle Klein이 이 인스턴스도 관리할 수 있도록 인스턴스를 생성하세요.

그 방법에 대한 알림이 필요한 경우 [뒤로 돌아가서](../users-accounts-organizations/managing-users.md#create-an-administrator) 지침에 따라 해당 사용자를 등록하고 해당 인스턴스의 관리자로 지정하세요.

다음 단계는 [인스턴스 설정을 구성하는 것입니다](./configuring-instance-settings.md).

## 관련 개념

- [가상 인스턴스 이해](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances)
- [가상 인스턴스 추가](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/virtual-instances/adding-a-virtual-instance)
