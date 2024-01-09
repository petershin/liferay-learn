# 가상 인스턴스 구성

{bdg-secondary}`LXC-SM 또는 자체 호스팅`

자체 사이트, 사용자 및 조직 세트를 갖춘 또 다른 Liferay 환경이 필요한 비즈니스 사용 사례가 있을 수 있습니다. 새로운 서버를 가동하는 대신 가상 인스턴스를 생성할 수 있습니다.

예를 들어, Clarity Vision Solutions에는 비즈니스를 위한 외부 공개 웹사이트와 Glance라고 하는 직원용 내부 인트라넷이 모두 있습니다. 이는 가상 인스턴스를 사용하여 구축됩니다.

## LXC의 가상 인스턴스

가상 인스턴스 설정에 대해서는 Liferay Cloud 지원 담당자에게 문의하세요.

## LXC-SM 및 자체 호스팅의 가상 인스턴스

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; 가상 인스턴스_로 이동합니다.

1. **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하고 다음 정보를 입력합니다.

   * 웹 ID: `glance.clarityvisionsolutions.com`
   * 가상 호스트: `glance.clarityvisionsolutions.com`
   * 메일 도메인: `clarityvisionsolutions.com`
   * 최대 사용자: `0`(참고, 이는 무제한 사용자를 의미함)
   * 활성: 켜짐
   * 가상 인스턴스 초기화 프로그램: **Blank Site** 를 선택합니다.

   ![Enter the virtual instance information.](./configuring-virtual-instances/images/01.png)

**저장** 을 클릭하세요. 새로운 가상 인스턴스가 준비되었습니다.

1. 이것은 실제 외부 호스팅 사이트가 아니므로 로컬 시스템의 `/etc/hosts` 파일에 도메인을 추가하세요.

   `127.0.0.1 glance.clarityvisionsolutions.com`

   ```{note}
   Docker 컨테이너를 사용하는 경우 `--add-hostglance.clarityvisionsolutions.com:127.0.0.1` 항목이 실행 명령에 포함되어야 합니다.
   ```

1. 가상 인스턴스가 성공적으로 추가되면 `http://glance.clarityvisionsolutions.com:8080/`으로 이동합니다.

   ![The new virtual instance is ready to use.](./configuring-virtual-instances/images/02.png)

## 새 인스턴스에 대한 관리자 생성

가상 인스턴스는 별도의 Liferay 인스턴스입니다. 방금 생성한 새 인스턴스에는 사용자 계정이 없습니다. Kyle Klein이 이 인스턴스도 관리할 수 있도록 인스턴스를 생성하세요.

방법에 대한 알림이 필요한 경우 [돌아가서](../users-accounts-organizations/managing-users.md#create-an-administrator) 지침에 따라 해당 사용자를 등록하고 관리자로 만들 수 있습니다. 이 인스턴스의 관리자입니다.

다음 단계는 [인스턴스 설정 구성](./configuring-instance-settings.md)입니다.

## 관련 개념

* [가상 인스턴스 이해](https://learn.liferay.com/ko/w/dxp/system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances)
* [가상 인스턴스 추가](https://learn.liferay.com/ko/w/dxp/system-administration/configuring-liferay/virtual-instances/adding-a-virtual-instance)
