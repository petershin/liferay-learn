---
uuid: 4c738c97-2353-451e-bef7-f3c9361e1b4a
---

# 마켓플레이스 사용

Liferay Marketplace는 앱 공유, 탐색 및 다운로드를 위한 허브입니다. Marketplace는 전체 Liferay 생태계를 활용하여 사용자 친화적인 원스톱 상점에서 앱을 출시하고 공유합니다.

![Liferay Marketplace 홈 페이지는 새 앱을 강조 표시하고 범주별로 앱을 나열하며 검색 기능을 제공합니다.](./using-marketplace/images/01.png)

Marketplace 플러그인을 사용하면 제어판에서 Marketplace를 사용할 수 있습니다. 플러그인은 DXP Tomcat Bundle에 내장되어 있지만 애플리케이션 서버의 DXP 설치에도 설치할 수 있습니다. 여전히 설치 시 Marketplace를 설치해야 하는 경우 [부록: Marketplace 플러그인 설치](#appendix-installing-the-marketplace-plugin)을 참조하십시오.

## 마켓플레이스 방문

DXP 내에서 Marketplace에 들어가는 방법은 다음과 같습니다.

1. 제어판에서 *앱* &rarr; *스토어*로 이동합니다.

1. liferay.com 계정으로 로그인합니다.

```{important}
앱을 구매하려면 [liferay.com](https://www.liferay.com) 계정이 있어야 하며 Marketplace 사용 약관에 동의해야 합니다.
```

마켓플레이스가 나타납니다. 일부 앱을 확인할 시간입니다.

## 브라우징 앱

Marketplace는 친숙한 앱 스토어 경험을 제공합니다. 앱은 페이지 중앙의 다음 섹션에 있습니다.

* *주요 앱:* Liferay는 매달 다른 앱 세트를 제공합니다.

* *새롭고 흥미로운:* Marketplace에 추가된 최신 앱.

* *지난 달 가장 많이 본 앱:* 지난 달 가장 많이 본 앱 상위 5개.

* *Liferay 구독 앱:* 기업 구독자만 사용할 수 있는 앱입니다.

* *템플릿 및 테마:* 사이트 콘텐츠를 구성하고 사이트의 모양과 느낌을 변경하기 위한 앱.

* 그리고 앱 카테고리: *통신*, *생산성*, *보안*등.

각 섹션의 *모두 보기* 링크는 해당 섹션의 모든 앱을 나열합니다.

![커뮤니케이션 앱 페이지와 같은 각 앱 카테고리 페이지에는 해당 카테고리에 게시된 앱이 나열됩니다.](./using-marketplace/images/02.png)

페이지 상단에서 다음과 같은 방법으로 Marketplace를 검색할 수 있습니다.

* 키워드
* 종류
* 라이프레이(DXP) 버전
* 가격(무료 또는 유료)

페이지 하단의 *Weekly Stats* 최신 앱과 최신 업데이트 앱을 나열하고 앱 다운로드 및 보기에 대한 추세 차트를 보여줍니다.

![주간 통계는 새로운 앱, 앱 업데이트 및 Marketplace 활동 추세를 나열합니다.](./using-marketplace/images/03.png)

세부 정보를 보려면 앱을 클릭하십시오.

![스크린샷과 앱 세부정보를 보려면 앱을 클릭하세요.](./using-marketplace/images/04.png)

## 앱 구매

```{warning}
프로덕션 등급 환경에서는 [Marketplace 웹사이트](https://web.liferay.com/marketplace)를 통해서만 앱을 구매하세요. 제어판에서 구매한 앱은 자동 배포를 사용하여 자동으로 다운로드 및 설치됩니다. 자동 배포용으로 설계되지 않은 앱은 클래스 로딩 문제 및 메모리 누수를 일으킬 수 있습니다.
```

앱 구매 단계는 다음과 같습니다.

1. *구매* (무료 또는 유료) 버튼을 클릭합니다. 구매 유형을 선택하라는 메시지가 표시됩니다.

1. 구매 유형을 선택하세요. 개인 계정 또는 회사와 관련된 Liferay 프로젝트용 앱을 구입할 수 있습니다.

    A *Liferay 프로젝트* 팀원들이 구매하거나 개발한 앱을 공유하는 공간입니다. 필요한 권한이 있는 경우 회사를 위한 새 프로젝트를 만들 수도 있습니다.

1. EULA 및 서비스 약관에 동의합니다.

1. *구매* 클릭하면 거래가 완료됩니다.

앱이 Liferay DXP에 자동으로 다운로드 및 설치됩니다. 축하해요! Liferay Marketplace 앱을 찾고 구매하고 설치하는 방법을 알고 있습니다.

## 부록: Marketplace 플러그인 설치

애플리케이션 서버에 DXP를 설치한 경우 제어판을 통해 Marketplace에 액세스하려면 Marketplace 플러그인을 설치해야 합니다.

```{note}
DXP Tomcat 번들을 사용하는 경우 Marketplace 플러그인이 번들에 사전 설치되어 있습니다.
```

Marketplace 플러그인을 설치하려면 다음 단계를 따르세요.

1. [Marketplace 플러그인을 다운로드합니다](https://www.liferay.com/marketplace/download).

2. 플러그인(`.lpkg` 파일)을 [Liferay Home](../../installation-and-upgrades/reference/liferay-home.md) 의 `배포` 폴더에 복사하거나 [App Manager](./managing-apps/using-the-app-manager.md)를 사용하여 설치하여 배포합니다.

이제 제어판에서 Marketplace를 사용할 수 있습니다.

## 추가 정보

* [앱 설치](./installing-apps.md)
* [앱 갱신](./managing-apps/renewing-apps.md)
* [Liferay 마켓플레이스 개발자 포털](https://marketplace.liferay.dev/)
