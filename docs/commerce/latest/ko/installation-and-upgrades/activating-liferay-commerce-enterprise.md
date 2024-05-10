# Liferay Commerce Enterprise 활성화

Liferay DXP/Portal 7.3부터 Commerce는 모든 Liferay 번들 및 Docker 컨테이너와 함께 제공되며 별도의 설치가 필요하지 않습니다. 그러나 Commerce의 엔터프라이즈 기능에 액세스하는 프로세스는 실행 중인 DXP 버전에 따라 다릅니다. Liferay DXP 7.4 GA1+의 경우 모든 Commerce 모듈이 기본적으로 활성화되어 바로 사용할 수 있습니다. DXP 7.3 SP3+의 경우 Commerce는 [문맥 재산](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/portal-properties.html) 사용하여 활성화되는 반면 이전 버전은 Commerce 라이센스 파일을 사용합니다. 이 속성은 엔터프라이즈 기능을 포함하지 않으므로 Liferay Portal 번들/이미지에 영향을 주지 않습니다.

```{important}
Liferay 7.4 U48+/GA48+에서는 Commerce 모듈(`enterprise.product.commerce.enabled`)을 비활성화하기 위한 포털 속성이 제거되었습니다. 이제 유효한 DXP 7.4 구독을 보유한 모든 고객이 상거래 기능을 사용할 수 있고 지원됩니다. Commerce를 비활성화하면 다른 Liferay DXP 모듈과 불일치가 발생할 수 있습니다.
```

## Liferay DXP 7.4 GA1+에 대한 Liferay Commerce Enterprise 비활성화

{bdg-primary}`liferay DXP 구독 필요`

Liferay DXP 7.4 GA1+의 경우 모든 Commerce 모듈이 기본적으로 활성화되어 있습니다. 사용자는 'enterprise.product.commerce.enabled' 포털 속성을 'false'로 설정하여 이를 비활성화할 수 있습니다.

### Liferay 번들에 대한 상거래 비활성화

Liferay 번들을 사용하는 경우 `portal-ext.properties` 파일을 사용하여 `enterprise.product.commerce.enabled` 속성을 구성할 수 있습니다. Liferay 서버의 `portal-ext.properties` 파일에 다음 속성을 추가하기만 하면 됩니다.

```properties
enterprise.product.commerce.enabled=false
```

속성을 추가한 후 Liferay 서버를 다시 시작하여 변경 사항을 적용합니다.

`portal-ext.properties` 파일이 아직 존재하지 않는 경우 `[Liferay Home]` 또는 `[User Home]` 폴더에 파일을 만듭니다.

```{note}
번들에 대해 설정 마법사를 사용한 경우 포털 속성은 `[Liferay Home]` 폴더에 있는 `portal-setup-wizard.properties` 파일을 사용하여 설정됩니다. 이 파일은 'portal-ext.properties' 파일보다 우선순위가 높으므로 'enterprise.product.commerce.enabled' 속성에 대해 충돌하는 값이 없는지 확인하세요. 자세한 내용은 [문맥 재산](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/portal-properties.html) 을 참조하세요.
```

### Docker 컨테이너에 대한 상거래 비활성화

Docker 컨테이너에서는 `portal-ext.properties` 파일 또는 Docker `env` 변수를 사용하여 `enterprise.product.commerce.enabled` 속성을 구성할 수 있습니다.

`portal-ext.properties` 파일에 다음 속성을 추가합니다.

```properties
enterprise.product.commerce.enabled=false
```

또는 다음 Docker `env` 변수를 사용하세요.

```properties
LIFERAY_ENTERPRISE_PERIOD_PRODUCT_PERIOD_COMMERCE_PERIOD_ENABLED=false
```

자세한 내용은 [컨테이너 구성](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers#portal-properties) 참조하세요.

성공하면 상거래 모듈이 더 이상 글로벌 메뉴(![글로벌 메뉴](../images/icon-applications-menu.png))에 표시되지 않습니다.

## Liferay DXP 7.3 SP3+용 Liferay Commerce Enterprise 활성화

{bdg-primary}`Liferay DXP 및 Commerce 구독 필요`

DXP 7.3 SP3+의 경우 'enterprise.product.commerce.enabled' 포털 속성을 'true'로 설정하여 Commerce를 활성화하세요.

### Liferay 번들에 대한 상거래 활성화

`portal-ext.properties` 파일을 사용하여 `enterprise.product.commerce.enabled` 속성을 구성할 수 있습니다. Liferay 서버의 `portal-ext.properties` 파일에 이 속성을 추가합니다.

```properties
enterprise.product.commerce.enabled=true
```

속성을 추가한 후 Liferay 서버를 다시 시작하여 변경 사항을 적용하십시오.

`portal-ext.properties` 파일이 아직 존재하지 않는 경우 `[Liferay Home]` 또는 `[User Home]` 폴더에 파일을 만듭니다.

### Docker 컨테이너에 대한 상거래 활성화

Docker 컨테이너를 사용하는 경우 `enterprise.product.commerce.enabled` 속성은 `portal-ext.properties` 파일을 사용하여 구성하거나 Docker `env` 변수를 사용하여 재정의할 수 있습니다.

`portal-ext.properties` 파일을 사용하려면 새 줄에 다음 속성을 추가하면 됩니다.

```properties
enterprise.product.commerce.enabled=true
```

포털 속성을 재정의하려면 다음 Docker 'env' 변수를 사용하세요.

```properties
LIFERAY_ENTERPRISE_PERIOD_PRODUCT_PERIOD_COMMERCE_PERIOD_ENABLED=true
```

### 성공적인 활성화 확인

속성이 성공적으로 추가되었는지 확인하려면 Liferay DXP를 시작하고 **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 엽니다. 성공하면 Commerce 탭에서 Commerce 모듈을 보고 액세스할 수 있습니다. 또는 **전역 메뉴**(![전역 메뉴](../images/icon-applications-menu.png))를 열고 **제어판** &rarr; **서버 관리** &rarr; **속성** &rarr; **포털 속성** 으로 이동합니다. 새 속성이 다른 속성과 함께 나타납니다.

## Liferay DXP 7.1-7.3 FP2용 Liferay Commerce Enterprise 활성화

{bdg-primary}`Liferay DXP 및 Commerce 구독 필요`

Liferay DXP 7.1-7.3 FP2의 경우 Commerce를 사용하려면 유효한 라이센스가 필요합니다. 이 라이센스는 XML(`.xml`) 활성화 키로 제공되며 Commerce 모듈을 활성화하려면 Liferay 서버에 배포해야 합니다.

Commerce 라이센스는 '제품 버전', '라이센스 유형' 및 '만료 날짜'를 포함하여 DXP 라이센스와 동일한 매개변수를 많이 사용합니다. 그러나 시스템 리소스(예: 프로세서 코어) 또는 제품 버전에 따른 제한은 Commerce 라이선스에서 구현되지 않습니다.

```{important}
DXP와 Commerce 활성화 키는 모두 동일한 '라이선스 유형'(예: '프로덕션', '개발자' 또는 '기업')이어야 합니다. 라이센스 유형이 일치하지 않으면 서버 시작 로그에 경고가 표시됩니다.

프로덕션 라이센스에는 검증을 위해 일치하는 호스트 이름, IP 주소 또는 MAC 주소도 필요합니다.
```

* [상거래 활성화 키 얻기](#obtaining-commerce-activation-keys)
* [상거래 활성화 키 배포](#deploying-commerce-activation-keys)
* [만료된 Commerce Enterprise 라이센스 업데이트](#updating-an-expired-commerce-enterprise-license)

### 상거래 활성화 키 얻기

이미 Commerce 구독 [구매](https://www.liferay.com/contact-sales) 방법 중 하나로 다운로드하여 활성화 키를 얻을 수 있습니다.

* 활성화 키/프로젝트 관리 구성 요소가 포함된 [Help Center](https://liferay-support.zendesk.com/agent/) 티켓을 엽니다.

* 지역 프로비저닝 팀(예: Provisioning-[region]@liferay.com)에 이메일로 요청을 보냅니다.

* [여기](https://customer.liferay.com/en_US/activation-key) 에서 상거래 활성화 키를 다운로드하세요.

### 상거래 활성화 키 배포

XML 활성화 키를 획득한 후에는 이를 DXP 인스턴스의 `deploy` 폴더에 복사하여 Commerce Enterprise를 활성화할 수 있습니다. 이 프로세스는 Liferay DXP를 활성화하는 것과 동일합니다.

```{note}
Liferay 7.3 SP1부터 사용자는 Commerce를 활성화한 후 더 이상 인스턴스를 다시 색인화할 필요가 없습니다.
```

#### DXP 번들에 배포

XML 파일을 DXP 인스턴스의 [Liferay Home](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/liferay-home.html) 폴더에 복사합니다. 활성화 키를 처리하는 동안 Liferay는 이 파일을 `${liferay.home}/osgi/modules` 폴더에 재배치하고 `${liferay.home}/data/license` 폴더에 라이센스 파일(`.li`)을 생성합니다. 자세한 내용은 [Liferay DXP 활성화](https://learn.liferay.com/w/dxp/installation-and-upgrades/setting-up-liferay/activating-liferay-dxp) 활성화를 참조하십시오.

#### Docker 컨테이너에 배포

XML 파일을 컨테이너의 `/opt/liferay/deploy` 폴더에 복사합니다. 활성화 키를 처리하는 동안 Liferay는 이 파일을 `opt/liferay/osgi/modules` 폴더에 재배치하고 `opt/liferay/data/license` 폴더에 라이센스 파일(`.li`)을 생성합니다. Docker 컨테이너에 파일을 배포하는 방법에 대한 자세한 내용은 [컨테이너에 파일 제공](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/using-liferay-docker-images/providing-files-to-the-container?highlight=opt) 참조하세요.

#### Liferay Cloud에 배포

프로젝트의 중앙 Git 저장소에 있는 [Liferay 서비스에 배포](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service#deploying-licenses) 폴더에 키를 복사하고 변경 사항을 커밋합니다. 그런 다음 Liferay 서비스에 대한 Jenkins 빌드를 트리거하고 이를 원하는 프로젝트 환경에 배포합니다. 환경의 Liferay 서비스에 파일을 배포하는 방법에 대한 자세한 내용은 Liferay Cloud 배포 워크플로 개요 [Liferay 클라우드 배포 워크플로 개요](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow) 참조하세요.

```{important}
Liferay Cloud 계약을 통해 Commerce를 구매한 경우 Liferay Cloud 팀이 클라우드 인프라를 통해 활성화 키를 관리하므로 키를 직접 관리할 필요가 없습니다. 그러나 기존 Liferay Cloud 프로젝트에 Commerce를 추가하는 경우 라이센스를 수동으로 배포해야 합니다. 
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

Commerce Enterprise 라이센스는 사용자의 구독 조건에 따라 설정된 기간 동안만 유효합니다. 라이센스 만료가 가까워지면(즉, 대부분의 라이센스는 30일 미만, 30일 라이센스는 7일 미만) 관리자용 Commerce 애플리케이션에 경고 메시지가 나타납니다. 라이센스에는 지정된 만료 날짜 이후 만료되기 전 2일의 유예 기간이 있습니다.

라이선스가 만료되면 Commerce 모듈은 활성화된 상태로 유지되지만 라이선스가 업데이트될 때까지 UI에서 더 이상 사용할 수 없으며 API 호출도 허용되지 않습니다. 모든 사용자의 Commerce 애플리케이션에 Commerce 애플리케이션을 사용할 수 없다는 알림이 표시됩니다. 관리자에게는 라이선스를 업데이트하라는 메시지가 표시되고 다른 사용자에게는 관리자에게 문의하라는 메시지가 표시됩니다.

콘솔은 서버를 다시 시작하는 동안에도 오류 메시지를 표시합니다.

```bash
ERROR [main][LicenseManager:?] Liferay Commerce license is expired
```

Liferay Commerce Enterprise를 다시 활성화하려면 먼저 서버에서 만료된 파일을 제거한 다음 새 키를 [배포](#deploying-commerce-activation-keys) .

   ```{tip}
   서버가 실행되는 동안 활성화키를 제거하고 추가할 수 있습니다.
   ```

#### DXP 번들 업데이트

`${liferay.home}/osgi/modules` 폴더에서 만료된 XML 키를 제거하고 `${liferay.home}/data/license` 폴더에서 만료된 라이센스 파일을 제거하십시오. 그런 다음 새 활성화 키를 `${liferay.home}/deploy` 폴더에 추가하세요.

#### Docker 컨테이너 업데이트

`opt/liferay/osgi/modules` 폴더에서 만료된 XML 키를 제거하고 `opt/liferay/data/licenses` 폴더에서 만료된 라이센스 파일을 제거합니다. 그런 다음 컨테이너의 `/opt/liferay/deploy` 폴더에 새 활성화 키를 추가합니다.

#### Liferay Cloud 프로젝트에서 Liferay 서비스 업데이트

Liferay Cloud 팀은 DXP 및 Commerce 라이선스를 모두 관리하므로 사용자가 수동으로 업데이트할 필요가 없습니다.

## 관련 주제

* [설치 개요](./installation-overview.md)
* [liferay 커머스 업그레이드](./upgrading-liferay-commerce.md)
* [프록시 서버를 통해 Marketplace 앱 활성화](https://help.liferay.com/hc/ko/articles/360018427391)
