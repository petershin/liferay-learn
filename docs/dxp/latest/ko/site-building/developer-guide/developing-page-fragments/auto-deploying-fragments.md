---
uuid: f3bb512e-5954-47b2-bf3d-bccaee642919
---

# 조각 자동 배포

{bdg-secondary}`사용 가능한 Liferay Portal 7.3 GA1+ 또는 Liferay DXP 7.3+`

[도구로 페이지 조각을 개발하는 경우](./using-the-fragments-toolkit.md#fragment-set-structure)Liferay UI를 통해 가져오기 위해 ZIP 파일로 패키징하여 배포할 수 있습니다. 그러나 UI 사용에만 국한되지는 않습니다. 명령줄에서도 조각 ZIP 파일을 배포할 수 있습니다. 여기서는 조각 프로젝트로 작업하고 Liferay의 자동 배포 메커니즘을 사용하여 명령줄에서 원하는 사이트로 조각을 가져오는 방법을 배웁니다.

```{note}
Liferay DXP 7.4+의 경우 조각 컬렉션을 Liferay UI에서 조각 세트라고 합니다.
```

## 자동 배포 가능한 단편 세트 배포

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 예제 프래그먼트 세트를 자동 배포합니다.

1. [예제 자동 배포 가능 프래그먼트 세트](https://learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-a2f8.zip)를 다운로드하고 압축을 풉니다. ):

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-a2f8.zip -O
    ```

    ```bash
    unzip liferay-a2f8.zip
    ```

1. 프래그먼트 프로젝트의 세트와 배포 설명자를 ZIP 파일로 압축합니다.

    ```bash
    cd liferay-a2f8
    ```

    ```bash
    zip -r  a2f8-fragments.zip a2f8-set/ liferay-deploy-fragments.json
    ```

1. 새 `.zip` 파일을 Liferay의 Docker 컨테이너에 있는 자동 배포 폴더에 복사하여 설명자 지정 사이트로 조각 집합을 가져옵니다.

    ```bash
    docker cp a2f8-fragments.zip $(docker ps -lq):/opt/liferay/deploy
    ```

1. 이 로그 메시지에 대한 Docker 콘솔을 확인하십시오.

    ```bash
    INFO  [com.liferay.portal.kernel.deploy.auto.AutoDeployScanner][AutoDeployDir:263] Processing a2f8-fragments.zip
    ```

1. 조각 세트를 사용할 수 있는지 확인합니다. *사이트 메뉴* (![Site Menu](../../../images/icon-product-menu.png))을 열고 *디자인* &rarr; *조각*로 이동합니다. 세트가 목록에 나타나야 합니다.

```{note}
가져온 조각에 잘못된 규칙이 있으면 자동으로 초안으로 저장됩니다.
```

![세트를 이용하실 수 있습니다.](./auto-deploying-fragments/images/01.png)

## 조각 프로젝트 구조

자동 배포 가능 프래그먼트 프로젝트의 구조는 다음과 같습니다.

```bash
[project ZIP]
├── [fragment-set]
│   ├── collection.json
│   └── [fragment]
│       └── fragment files ...
└── liferay-deploy-fragments.json
```

`liferay-deploy-fragments.json` 파일은 프래그먼트를 배포하려는 범위를 지정합니다.

* 시스템 전체(모든 인스턴스)
* 가상 인스턴스(회사)
* 사이트(그룹).

아래 예의 구성은 가상 인스턴스(liferay.com) 내에서 "Guest"라는 사이트(그룹)에 배포하도록 지정합니다.

```json
{
    "companyWebId": "liferay.com",
    "groupKey": "Guest"
}
```

이 JSON 파일의 두 키는 모두 선택 사항입니다. `liferay-deploy-fragments.json` 파일에서 빈 JSON 요소를 지정하거나 다음 구성을 추가하여 프래그먼트를 시스템 전체(모든 인스턴스)에서 사용할 수 있도록 만들 수 있습니다.

```json
{
    "companyWebId": "*"
}
```

```{warning}
[리소스 포함](./include-default-resources-with-fragments.md) 프래그먼트 가져오기는 시스템 수준에서 프래그먼트를 사용할 수 있도록 하는 경우 지원되지 않습니다.
```

```{note}
프래그먼트 툴킷의 [`npm run compress` 명령](./using-the-fragments-toolkit.md)을 사용하면 프래그먼트 ZIP 파일 및 배포 설명자를 쉽게 생성할 수 있습니다.
```

## 단편 세트 수정 및 재배포

프래그먼트 세트를 수정하고 재배포하려면 다음 단계를 따르세요.

1. 프로젝트의 `a2f8-jumbotron` 조각 폴더를 `a2f8-set/` 폴더로 이동하여 예제 세트에 새 조각을 추가합니다.

1. 위에서 수행한 것처럼 조각 집합을 ZIP 파일로 압축합니다.

    ```bash
    zip -r  a2f8-fragments.zip a2f8-set/ liferay-deploy-fragments.json
    ```

1. 이전에 수행한 것처럼 ZIP 파일을 Docker 컨테이너에 복사하여 수정된 프래그먼트 세트를 가져옵니다.

   ```bash
   docker cp a2f8-fragments.zip $(docker ps -lq):/opt/liferay/deploy
   ```

1. 새 조각을 확인하십시오. *Site Menu* (![Site Menu](../../../images/icon-product-menu.png))을 열고 *Design* &rarr; *Fragments*로 이동한 다음 *A2F8 Set*클릭합니다. A2F8 Jumbotron 조각을 포함해야 합니다.

    ![새 프래그먼트는 자동 배포된 세트에 포함됩니다.](./auto-deploying-fragments/images/02.png)

엄청난! 이제 로컬에서 조각 세트로 작업하고 사이트를 지정하고 자동 배포를 사용하여 가져오는 방법을 알았습니다.

## 추가 정보

* [프래그먼트에 기본 리소스 포함](./including-default-resources-with-fragments.md)
* [조각에 구성 옵션 추가](./adding-configuration-options-to-fragments.md)
