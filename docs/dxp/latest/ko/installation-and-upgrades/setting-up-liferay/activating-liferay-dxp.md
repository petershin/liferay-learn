# Liferay DXP 활성화

> 요구되는 기부금

Liferay DXP는 XML(`.xml`) 활성화 키를 사용하여 활성화됩니다.  DXP 구독 조건 또는 평가판 계약을 지정합니다. [Liferay DXP를 처음 실행하면](../installing-liferay/running-liferay-for-the-first-time.md)라이센스 페이지가 나타나고 활성화 키를 요청합니다.

![DXP를 처음 실행하면 라이선스 페이지가 표시됩니다.](./activating-liferay-dxp/images/01.png)

## 키를 사용하여 DXP 활성화

활성화 키가 있는 경우 [Liferay Home](../reference/liferay-home.md)의 `배포` 폴더에 복사합니다.

```
[LIFERAY_HOME]
    ├── data
    ├── deploy
    │   └── my-license.xml
    ├── license
    ├── logs
    ├── osgi
    ├── patching-tool
    ├── tools
    └── work
```

DXP 콘솔의 메시지가 등록을 확인합니다.

```bash
License registered ...
```

DXP를 사용할 준비가 되었습니다.

## 열쇠가 필요하세요?

기업 가입이 있는 경우 [활성화 키](https://customer.liferay.com/activation-key) 페이지를 방문하여 활성화 키를 다운로드하거나 요청하십시오.

DXP를 사용해 보시겠습니까? [30일 평가판 활성화 키를 받으세요](https://www.liferay.com/products/dxp/30-day-trial).

```{note}
Liferay DXP 7.2 이하 버전에서 LCS(Liferay Connected Services)를 사용하는 경우 [LCS 문서](https://help.liferay.com/hc/en-us/articles/360017897492-Introduction-to-Managing)를 참조하십시오. -Liferay-DXP-with-Liferay-Connected-Services-)에서 LCS로 DXP 인스턴스를 활성화하는 방법에 대한 지침을 참조하십시오.
```

## 라이센스 관리자

라이센스 관리자 페이지에는 서버 및 라이센스 정보가 표시됩니다. 페이지를 보려면 활성화 페이지에서 _라이센스 관리자_ 클릭하십시오. 또는 이전에 Liferay 인스턴스를 활성화한 경우 관리자로 로그인하고 _제어판_ &rarr; _라이선스 관리자_로 이동합니다.

![라이센스 관리자 페이지에는 서버 및 라이센스 정보가 표시됩니다.](./activating-liferay-dxp/images/02.png)

라이센스 상태(예: 활성 또는 만료됨)와 라이센스 유형 및 만료 날짜와 같은 기타 정보가 표시됩니다.

## Liferay DXP 재활성화

새 DXP 활성화 키가 있고 DXP 인스턴스가 현재 키 또는 LCS(Liferay Connected Services)에 의해 활성화된 경우 새 활성화 키를 배포하기 전에 이전 활성화 방법의 나머지를 제거하는 것이 가장 좋습니다. 이렇게 하면 사용 중인 활성화 키에 대한 모호성이 제거됩니다.

새 키로 DXP를 재활성화하는 단계는 다음과 같습니다.

1. 애플리케이션 서버를 중지하십시오.

1. LCS를 사용하여 DXP를 활성화한 경우 [Liferay Home](../reference/liferay-home.md)의 `osgi/marketplace` 폴더에서 Liferay Connected Services Client LPKG 파일(`.lpkg`)을 제거합니다.

1. `[Liferay Home]/data/license` 폴더의 _내용_ 삭제하고 폴더는 보존하십시오.

1. `[Liferay Home]/osgi/modules` 폴더에서 `activation-key-[...]` 파일을 모두 제거합니다.

1. 애플리케이션 서버를 시작하십시오.

1. 새 활성화 키 파일을 `[Liferay Home]/deploy` 폴더에 복사합니다.

DXP 콘솔 메시지가 등록을 확인합니다.

```bash
License registered ...
```

DXP를 계속 사용할 수 있습니다.

엔터프라이즈 구독이 있고 추가 지원이 필요한 경우 [계정 지원](https://help.liferay.com/hc/en-us/articles/360018414031) 에 문의하거나 [지원 티켓](https://help.liferay.com/hc/requests/new)을 만드십시오.
