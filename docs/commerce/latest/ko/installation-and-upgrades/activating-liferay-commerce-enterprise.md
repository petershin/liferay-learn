# Liferay Commerce Enterprise 활성화

Liferay DXP/Portal 7.3부터 Commerce는 모든 Liferay 번들 및 Docker 컨테이너와 함께 제공되며 별도의 설치가 필요하지 않습니다. 그러나 Commerce의 엔터프라이즈 기능에 액세스하고 사용하는 프로세스는 실행 중인 DXP 버전에 따라 다릅니다. Liferay DXP 7.4 GA1+의 경우 모든 상거래 모듈이 기본적으로 활성화되어 있으며 사용할 준비가 되어 있습니다. DXP 7.3 FP3/SP2+의 경우 Commerce는 [문맥 재산](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/portal-properties.html) 사용하여 활성화되는 반면 이전 버전은 Commerce 라이선스 파일을 사용합니다. 이 속성은 엔터프라이즈 기능을 포함하지 않기 때문에 Liferay Portal 번들/이미지에 영향을 주지 않습니다.

```{important}
Liferay 7.4 U48+/GA48+에서 상거래 모듈 비활성화를 위한 포털 속성(`enterprise.product.commerce.enabled`)이 제거되었습니다. 이제 유효한 DXP 7.4 구독이 있는 모든 고객이 상거래 기능을 사용할 수 있고 지원합니다. 상거래를 비활성화하면 다른 Liferay DXP 모듈과 불일치가 발생할 수 있습니다.
```

## Liferay DXP 7.4 GA1+용 Liferay Commerce Enterprise 비활성화

{bdg-primary}`Liferay DXP 가입 필요`

Liferay DXP 7.4 GA1+의 경우 모든 상거래 모듈이 기본적으로 활성화됩니다. 사용자는 `enterprise.product.commerce.enabled` 포털 속성을 `false`으로 설정하여 비활성화할 수 있습니다.

### Liferay 번들에 대한 상거래 비활성화

Liferay 번들을 사용하는 경우 `portal-ext.properties` 파일을 사용하여 `enterprise.product.commerce.enabled` 속성을 구성할 수 있습니다. Liferay 서버의 `Portal-ext.properties` 파일에 다음 속성을 추가하기만 하면 됩니다.

```properties
enterprise.product.commerce.enabled=false
```

속성을 추가한 후 Liferay 서버를 다시 시작하여 변경 사항을 적용하십시오.

`portal-ext.properties` 파일이 아직 없는 경우 `[LIFERAY_HOME]` 또는 `[USER_HOME]` 폴더에 하나를 만듭니다.

```{note}
번들에 설치 마법사를 사용한 경우 포털 속성은 `[LIFERAY_HOME]` 폴더의 `portal-setup-wizard.properties` 파일을 사용하여 설정됩니다. 이 파일은 `portal-ext.properties` 파일보다 우선하므로 `enterprise.product.commerce.enabled` 속성에 대해 충돌하는 값이 없는지 확인하십시오. 자세한 내용은 [문맥 재산](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/portal-properties.html) 을 참조하세요.
```

### Docker 컨테이너에 대한 상거래 비활성화

Docker 컨테이너에서 `Portal-ext.properties` 파일 또는 Docker `env` 변수를 사용하여 `enterprise.product.commerce.enabled` 속성을 구성할 수 있습니다.

`portal-ext.properties` 파일에서 다음 특성을 추가하십시오.

```properties
enterprise.product.commerce.enabled=false
```

또는 이 Docker `env` 변수를 사용하십시오.

```properties
LIFERAY_ENTERPRISE_PERIOD_PRODUCT_PERIOD_COMMERCE_PERIOD_ENABLED=false
```

자세한 내용은 [컨테이너 구성](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.html#portal-properties) 참조하십시오.

성공하면 상거래 모듈이 더 이상 전역 메뉴(![Global Menu](../images/icon-applications-menu.png))에 나타나지 않습니다.

## Liferay DXP 7.3 FP3/SP3+용 Liferay Commerce Enterprise 활성화

{bdg-primary}`Liferay DXP 및 Commerce 구독 필요`

DXP 7.3 FP3/SP2+의 경우 `enterprise.product.commerce.enabled` 포털 속성을 `true`으로 설정하여 상거래를 활성화합니다.

### Liferay 번들에 대한 상거래 활성화

`portal-ext.properties` 파일을 사용하여 `enterprise.product.commerce.enabled` 특성을 구성할 수 있습니다. Liferay 서버의 `Portal-ext.properties` 파일에 이 속성을 추가합니다.

```properties
enterprise.product.commerce.enabled=true
```

속성을 추가한 후 Liferay 서버를 다시 시작하여 변경 사항을 적용하십시오.

`portal-ext.properties` 파일이 아직 없는 경우 `[LIFERAY_HOME]` 또는 `[USER_HOME]` 폴더에 하나를 만듭니다.

### Docker 컨테이너에 대한 상거래 활성화

Docker 컨테이너를 사용하는 경우 `enterprise.product.commerce.enabled` 속성은 `Portal-ext.properties` 파일을 사용하여 구성하거나 Docker `env` 변수를 사용하여 재정의할 수 있습니다.

`portal-ext.properties` 파일을 사용하려면 새 줄에 다음 속성을 추가하기만 하면 됩니다.

```properties
enterprise.product.commerce.enabled=true
```

포털 속성을 재정의하려면 다음 Docker `env` 변수를 사용합니다.

```properties
LIFERAY_ENTERPRISE_PERIOD_PRODUCT_PERIOD_COMMERCE_PERIOD_ENABLED=true
```

### 성공적인 활성화 확인

속성이 성공적으로 추가되었는지 확인하려면 Liferay DXP를 시작하고 전역 메뉴(![Global Menu](../images/icon-applications-menu.png))를 엽니다. 성공하면 상거래 탭에서 상거래 모듈을 보고 액세스할 수 있습니다. 또는 **전역 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **제어판** &rarr; **서버 관리** &rarr; **속성** &rarr; **포털 속성** 으로 이동합니다. 새 속성이 다른 속성과 함께 나타납니다.

## Liferay DXP 7.1-7.3 FP2용 Liferay Commerce Enterprise 활성화

{bdg-primary}`Liferay DXP 및 Commerce 구독 필요`

Liferay DXP 7.1-7.3 FP2의 경우 Commerce를 사용하려면 유효한 라이선스가 필요합니다. 이 라이선스는 XML(`.xml`) 활성화 키로 제공되며 Commerce 모듈을 활성화하려면 Liferay 서버에 배포해야 합니다.

상거래 라이센스는 `제품 버전`, `라이센스 유형`및 `만료 날짜`를 포함하여 DXP 라이센스와 동일한 많은 매개변수를 사용합니다. 그러나 시스템 리소스(예: 프로세서 코어) 또는 제품 버전에 따른 제한은 Commerce 라이선스에서 구현되지 않습니다.

```{important}
DXP 및 Commerce 활성화 키는 모두 '라이선스 유형'(예: '프로덕션', '개발자' 또는 '엔터프라이즈')이어야 합니다. 라이센스 유형이 일치하지 않으면 서버 시작 로그에 경고가 표시됩니다. 

*프로덕션* 라이선스에는 유효성 검사를 위해 일치하는 호스트 이름, IP 주소 또는 mac 주소도 필요합니다.
```

* [상거래 활성화 키 얻기](#obtaining-commerce-activation-keys)
* [상거래 활성화 키 배포](#deploying-commerce-activation-keys)
* [만료된 Commerce Enterprise 라이센스 업데이트](#updating-an-expired-commerce-enterprise-license)

### 상거래 활성화 키 얻기

이미 [Commerce 구독을 구입했다면 다음 방법 중 하나로 활성화 키를 다운로드](https://www.liferay.com/contact-sales) 수 있습니다.

* **활성화 키/프로젝트 관리** 구성 요소로 [헬프 센터](https://liferay-support.zendesk.com/agent/) 티켓을 엽니다.

* 지역 프로비저닝 팀(예: provisioning[region]@liferay.com)에 이메일로 요청을 보냅니다.

* [여기](https://customer.liferay.com/en_US/activation-key) 에서 상거래 활성화 키를 다운로드하십시오.

### 상거래 활성화 키 배포

XML 활성화 키를 얻으면 DXP 인스턴스의 `배포` 폴더에 복사하여 Commerce Enterprise를 활성화할 수 있습니다. 이 프로세스는 Liferay DXP를 활성화하는 것과 동일합니다.

```{note}
Liferay 7.3 SP1부터 사용자는 더 이상 상거래를 활성화한 후 인스턴스를 다시 인덱싱할 필요가 없습니다.
```

#### DXP 번들에 배포

XML 파일을 DXP 인스턴스의 [Liferay Home](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/liferay-home.html) 폴더에 복사합니다. 활성화 키를 처리하는 동안 Liferay는 이 파일을 `${liferay.home}/osgi/modules` 폴더로 재배치하고 `${liferay.home}/data/license` 폴더에 라이선스 파일(`.li`)을 생성합니다. 자세한 내용은 [Liferay DXP 활성화](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/setting-up-liferay/activating-liferay-dxp.html) 활성화를 참조하십시오.

#### Docker 컨테이너에 배포

XML 파일을 컨테이너의 `/opt/liferay/deploy` 폴더에 복사합니다. 활성화 키를 처리하는 동안 Liferay는 이 파일을 `opt/liferay/osgi/modules` 폴더로 재배치하고 `opt/liferay/data/license` 폴더에 라이센스 파일(`.li`)을 생성합니다. Docker 컨테이너에 파일을 배포하는 방법에 대한 자세한 내용은 [컨테이너에 파일 제공](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/installing-liferay/using-liferay-docker-images/providing-files-to-the-container.html?highlight=opt) 참조하십시오.

#### Liferay 클라우드에 배포

프로젝트의 중앙 Git 리포지토리에 있는 [Liferay 서비스에 배포](https://learn.liferay.com/liferay-cloud/latest/ko/using-the-liferay-dxp-service/deploying-to-the-liferay-service.html#deploying-licenses) 폴더에 키를 복사하고 변경 사항을 커밋합니다. 그런 다음 Liferay 서비스에 대한 Jenkins 빌드를 트리거하고 원하는 프로젝트 환경에 배포합니다. 환경의 Liferay 서비스에 파일을 배포하는 방법에 대한 자세한 내용은 [Liferay 클라우드 배포 워크플로 개요](https://learn.liferay.com/liferay-cloud/latest/ko/build-and-deploy/overview-of-the-liferay-cloud-deployment-workflow.html) 참조하십시오.

```{important}
Liferay Cloud 계약을 통해 Commerce를 구매한 경우 Liferay Cloud 팀이 클라우드 인프라를 통해 활성화 키를 관리하므로 키를 직접 관리할 필요가 없습니다. 그러나 기존 Liferay Cloud 프로젝트에 Commerce를 추가하는 경우 라이선스를 직접 수동으로 배포해야 합니다.
```

#### 배포 확인

콘솔을 통해 키가 성공적으로 배포되었는지 확인합니다.

   ```bash
   INFO  [com.liferay.portal.kernel.deploy.auto.AutoDeployScanner][AutoDeployDir:271] Processing activation-key-commercesubscriptiondevelopment-1-developeractivationkeys.xml
   ...
   INFO  [fileinstall-directory-watcher][LicenseManager:?] Commerce Subscription Development license validation passed
   INFO  [fileinstall-directory-watcher][LicenseManager:?] License registered for Commerce Subscription Development
   ```

### 만료된 Commerce Enterprise 라이센스 업데이트

Commerce Enterprise 라이선스는 사용자의 가입 조건에 따라 정해진 기간 동안만 유효합니다. 라이센스 만료가 가까워지면(예: 대부분의 라이센스의 경우 < 30일, 30일 라이센스의 경우 < 7일) 관리자용 Commerce 응용 프로그램에 경고 메시지가 나타납니다. 라이센스는 만료되기 전에 지정된 만료 날짜 이후 2일의 유예 기간이 있습니다.

라이선스가 만료되면 상거래 모듈은 활성화된 상태로 유지되지만 더 이상 UI에서 사용할 수 없으며 라이선스가 업데이트될 때까지 API 호출이 허용되지 않습니다. Commerce 응용 프로그램을 사용할 수 없음을 나타내는 알림이 모든 사용자의 Commerce 응용 프로그램에 나타납니다. 관리자에게는 라이선스를 업데이트하라는 메시지가 표시되고 다른 사용자에게는 해당 관리자에게 문의하라는 메시지가 표시됩니다.

콘솔은 또한 서버를 다시 시작하는 동안 오류 메시지를 표시합니다.

   ```bash
   ERROR [main][LicenseManager:?] Liferay Commerce license is expired
   ```

Liferay Commerce Enterprise를 재활성화하려면 먼저 서버에서 만료된 파일을 제거한 다음 새 키를 [배포](#deploying-commerce-activation-keys) 하십시오.

   ```{tip}
   서버가 실행되는 동안 활성화 키를 제거하고 추가할 수 있습니다.
   ```

#### DXP 번들 업데이트

`${liferay.home}/osgi/modules` 폴더에서 만료된 XML 키를 제거하고 `${liferay.home}/data/license` 폴더에서 만료된 라이선스 파일을 제거합니다. 그런 다음 새 활성화 키를 `${liferay.home}/deploy` 폴더에 추가하십시오.

#### Docker 컨테이너 업데이트

`opt/liferay/osgi/modules` 폴더에서 만료된 XML 키를 제거하고 `opt/liferay/data/licenses` 폴더에서 만료된 라이선스 파일을 제거합니다. 그런 다음 새 활성화 키를 컨테이너의 `/opt/liferay/deploy` 폴더에 추가합니다.

#### Liferay Cloud 프로젝트에서 Liferay 서비스 업데이트

Liferay Cloud 팀은 DXP 및 Commerce 라이센스를 모두 관리하므로 사용자가 직접 수동으로 업데이트할 필요가 없습니다.

## 추가 정보

* [설치 개요](./installation-overview.md)
* [Liferay Commerce 업그레이드](./upgrading-liferay-commerce.md)
* [프록시 서버를 통해 Marketplace 앱 활성화](https://help.liferay.com/hc/ko/articles/360018427391)
