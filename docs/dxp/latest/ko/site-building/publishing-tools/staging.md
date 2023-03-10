---
toc:
- ./staging/understanding-the-publishing-process.md
- ./staging/configuring-local-live-staging.md
- ./staging/configuring-remote-live-staging.md
- ./staging/managing-data-and-content-types-in-staging.md
- ./staging/page-versioning.md
- ./staging/publishing-single-assets-and-widgets.md
- ./staging/configuring-automatic-publishing-of-displayed-content.md
- ./staging/configuring-page-publishing.md
- ./staging/managing-staging-permissions.md
- ./staging/using-staging-in-asset-libraries.md
- ./staging/site-staging-ui-reference.md
---
# 스테이징 개요

```{toctree}
:maxdepth: 3

staging/understanding-the-publishing-process.md
staging/configuring-local-live-staging.md
staging/configuring-remote-live-staging.md
staging/managing-data-and-content-types-in-staging.md
staging/page-versioning.md
staging/publishing-single-assets-and-widgets.md
staging/configuring-automatic-publishing-of-displayed-content.md
staging/configuring-page-publishing.md
staging/managing-staging-permissions.md
staging/using-staging-in-asset-libraries.md
staging/site-staging-ui-reference.md
```

Liferay의 Staging 애플리케이션은 라이브 환경에 변경 사항을 게시하기 전에 사이트 또는 자산 라이브러리를 변경할 수 있는 작업 환경을 제공합니다. 이를 통해 단계적 애플리케이션 데이터와 페이지를 뒤에서 수정한 다음 준비가 되면 변경 사항을 개별적으로 또는 모두 함께 게시할 수 있으며 라이브 환경은 들어오는 사용자 트래픽을 처리합니다.

스테이징을 설정할 때 사이트 또는 자산 라이브러리를 로컬로(즉, 동일한 서버에서) 또는 원격으로(즉, 네트워크로 연결된 별도의 서버에서) 호스팅할지 여부를 결정하십시오. 그런 다음 준비할 애플리케이션 데이터를 사용자 지정합니다. 사이트의 경우 위젯 페이지 및 콘텐츠 페이지에 대한 페이지 버전 관리를 활성화할 수도 있습니다.

```{important}
스테이징은 Liferay DXP 7.4 및 7.3.10 FP1 이후 자산 라이브러리에 대해 지원됩니다. 그러나 준비된 사이트와 준비된 ssset 라이브러리만 연결해야 하며 반대의 경우도 마찬가지입니다. 자세한 내용은 [자산 라이브러리에서 스테이징 사용](./staging/using-staging-in-asset-libraries.md)을 참조하세요.
```

## 구성 옵션

스테이징 구성에는 두 가지 옵션이 있습니다. **로컬 라이브 스테이징** 및 **원격 라이브 스테이징** .

**로컬 라이브 스테이징** : 동일한 Liferay 서버에서 스테이징 및 라이브 환경을 모두 호스팅할 수 있습니다. 활성화되면 Liferay DXP는 스테이징 환경 역할을 하는 사이트 또는 자산 라이브러리의 로컬 복제본을 생성하는 반면 원본 사이트 또는 자산 라이브러리는 라이브 환경이 됩니다.

**원격 라이브 스테이징** : 별도의 Liferay 서버에서 스테이징 및 라이브 환경을 호스팅할 수 있습니다. 활성화되면 스테이징 구성에 사용된 사이트 또는 자산 라이브러리가 스테이징 환경이 되고 구성된 원격 서버는 라이브 환경이 됩니다.

두 옵션 모두 준비된 페이지, 애플리케이션 및 콘텐츠를 관리하고 게시하는 데 동일한 인터페이스를 사용하지만 설정이 다릅니다. 필요에 가장 적합한 구성 옵션을 선택한 후 자세한 내용 및 설정 지침은 [로컬 라이브 스테이징 구성](./staging/configuring-local-live-staging.md) 또는 [원격 라이브 스테이징 구성](./staging/configuring-remote-live-staging.md) 을 참조하십시오.

### 준비된 데이터 및 콘텐츠 유형

스테이징 구성의 일부로 스테이징할 콘텐츠 그룹 및 애플리케이션 데이터를 선택할 수 있습니다. 스테이징된 경우 선택한 데이터 및 콘텐츠는 스테이징 환경에서 관리됩니다. 또한 애플리케이션 또는 콘텐츠 그룹을 선택하면 포함된 모든 엔터티(예: 애플리케이션 폴더)도 준비됩니다. 자세한 내용은 [준비](./staging/managing-data-and-content-types-in-staging.md) 의 데이터 및 콘텐츠 유형 관리를 참조하십시오.

### 페이지 버전 관리

사이트에 대한 스테이징을 구성할 때 **페이지 버전 관리** 기능을 활성화할 수 있습니다. 이 기능을 사용하여 귀하와 귀하의 팀은 사이트의 콘텐츠 페이지 및 위젯 페이지의 변형을 동시에 개발할 수 있습니다. 페이지 버전의 전체 기록을 확인하고 필요한 경우 페이지를 이전 버전으로 되돌릴 수 있습니다. 변형을 만들고 관리하는 방법은 [페이지 버전 관리](./staging/page-versioning.md) 을 참조하고 각 변형에 대한 권한 관리에 대해 알아보려면 [스테이징 권한 관리](./staging/managing-staging-permissions.md) 을 참조하세요.

```{note}
Liferay DXP 7.4, 7.3 수정팩 1 및 7.2 수정팩 11부터 위젯 페이지 및 콘텐츠 페이지에서 페이지 버전 관리를 사용할 수 있습니다. 이전 버전에서는 위젯 페이지에 대한 변형만 만들 수 있었습니다. 각 페이지 유형의 변형에 대해 자세히 알아보려면 [변형 유형](./staging/page-versioning.md#types-of-variations) 을 참조하세요.
```

## 게시 프로세스 이해

낮은 수준의 관점에서 스테이징은 엔터티가 다른 사이트로 미러링되는 등가 관계입니다. 높은 수준의 관점에서 스테이징 프로세스는 내보내기, 유효성 검사 및 가져오기의 세 가지 순차적 단계로 실행됩니다.

이 프로세스를 이해하면 효율성을 개선하고 원활한 게시 환경을 달성하기 위해 미리 계획하는 데 도움이 됩니다. 자세한 내용은 [게시 프로세스 이해](./staging/understanding-the-publishing-process.md) 을 참조하십시오.

```{important}
스테이징은 [커머스](https://learn.liferay.com/commerce/latest/ko/index.html) 또는 [사용자 정의 객체](../../building-applications/objects.md)를 지원하지 않습니다. 게시 프로세스 중에 상거래 및 개체의 엔터티는 준비되지 않습니다. 
```

```{raw} html
:file: ../../landingpage_template.html
```

```{raw} html
:file: staging/landing.html
```
