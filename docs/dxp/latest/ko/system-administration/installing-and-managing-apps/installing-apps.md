---
toc:
- ./installing-apps/downloading-apps.md
- ./installing-apps/accessing-ee-plugins-during-a-trial-period.md
---
# 앱 설치

[Marketplace 웹사이트](https://web.liferay.com/marketplace) 에서 LPKG 파일로 앱을 다운로드한 후 다음 단계는 로컬 DXP 인스턴스에 앱을 설치하는 것입니다.

다음 방법 중 하나를 사용하여 인스턴스에 새 앱을 설치할 수 있습니다.

* [파일 시스템을 통해 설치](#installing-apps-via-the-file-system)
* [UI를 통해 앱 설치](#installing-apps-via-the-ui)

```{important}
인스턴스에 앱을 설치하려면 서버를 다시 시작해야 합니다. 샌드박스 환경에서 새로운 앱을 테스트한 후 필요에 따라 다른 서버에 대한 설치를 미리 계획하십시오.
```

## 파일 시스템을 통해 앱 설치

서버를 다시 시작하여 파일 시스템을 통해 앱을 설치하려면 다음 단계를 따르십시오.

1. [DXP 서버를 중지하십시오](../../installation-and-upgrades/installing-liferay/running-liferay-for-the-first-time.md#shutdown) .

1. 앱 파일(LPKG, 모듈 JAR 또는 플러그인 WAR)을 `[Liferay Home]/deploy` 폴더에 복사합니다. [Liferay Home](../../installation-and-upgrades/reference/liferay-home.md) 폴더는 일반적으로 앱 서버의 상위 폴더입니다. DXP는 `[Liferay Home]/deploy` 폴더에서 앱을 배포합니다.

1. [DXP 서버를 시작합니다](../../installation-and-upgrades/installing-liferay/running-liferay-for-the-first-time.md#startup) .

앱 파일이 `[Liferay Home]/deploy` 폴더에서 `[Liferay Home]/osgi`아래의 적절한 하위 폴더로 복사됩니다.

* `마켓플레이스`: 마켓플레이스 LPKG 패키지
* `모듈`: OSGi 모듈 JAR 파일
* `war`: WAR 파일

DXP는 해당 하위 폴더에서 수신하고 파일을 처리하고(WAR이거나 WAR을 포함하는 경우 OSGi 번들로 변환) OSGi 번들을 OSGi 컨테이너에 설치합니다.

```{note}
소스 제어 리포지토리(예: Git 또는 BitBucket) 및 오케스트레이션 도구(예: [Jenkins](https://jenkins.io) )를 사용하여 [DevOps](https://en.wikipedia.org/wiki) 을 통해 DXP 환경을 홍보하는 것이 좋습니다. /DevOps) 파이프라인.

프로덕션 등급 환경을 위한 DevOps 파이프라인 내의 배포 폴더에 앱 파일을 커밋해야 합니다.
```

## UI를 통해 앱 설치

DXP의 앱 관리 UI를 사용하여 로컬 서버에 앱을 설치할 수 있습니다. 배후에서 DXP는 앱 파일을 `[Liferay Home]/osgi`의 적절한 하위 폴더에 복사하고 OSGi 번들로 변환하고(LPKG 및 WAR는 변환 필요) 번들을 OSGi 컨테이너에 배포합니다.

아래 섹션에서는 UI를 통해 앱을 설치하는 데 사용할 수 있는 인터페이스에 대해 설명합니다.

### 제어판을 통한 마켓플레이스

DXP 제어판은 마켓플레이스에 액세스합니다. Marketplace 웹 사이트에서와 같은 방식으로 Marketplace를 탐색합니다. 제어판에서 앱을 구매하면 앱이 다운로드되어 DXP 인스턴스에 자동으로 설치됩니다. 자세한 내용은 [Liferay Marpletace에서 앱 구매](./using-marketplace.md)를 참조하세요.

```{note}
Marketplace 화면을 사용하여 앱을 설치하는 경우 가장 쉬운 제거 방법은 제어판의 구입한 앱 화면을 이용하는 것입니다.
```

### 구매한 앱 화면

제어판의 구입 페이지(**앱** &rarr; **구입**)에는 이전에 구입한 앱이 나열됩니다. 설치되지 않은 앱에는 DXP 인스턴스에 앱을 설치하기 위한 **설치** 버튼이 있습니다.

![제어판에 표시되는 구입한 앱 화면.](./installing-apps/images/01.png)


### 응용 프로그램 관리자

DXP의 App Manager에서 Marketplace 앱을 업로드하고 설치할 수 있습니다. 자세한 내용은 [앱 관리자 사용하기](./managing-apps/using-the-app-manager.md) 을 참조하십시오.
