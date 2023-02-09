# 환경 설정 및 테마 만들기

테마 만들기는 테마 개발의 첫 단계입니다. 고유한 테마가 있으면 이를 Liferay DXP 인스턴스에 배포하고 [다양한 사이트 사용자 지정](../../introduction-to-themes.md#develapping-themes)에 사용할 수 있습니다.

## Liferay 테마 생성기 사용

테마는 Liferay 테마 생성기를 사용하여 생성됩니다. Liferay DXP 7.3은 테마 생성기 버전 10.xx를 사용합니다.

```{note}
이전 버전의 Liferay 테마 생성기를 사용하여 이전 버전의 Liferay DXP에 대한 테마를 생성할 수 있습니다. DXP 7.0 또는 7.1용 테마를 생성하려면 테마 생성기 버전 8.xx를 설치하십시오.
```

### 설치

```{note}
Liferay 테마 생성기로 테마를 개발하려면 노드와 NPM이 모두 필요합니다. [노드 호환성 매트릭스](../../../../../building-applications/tooling/reference/node-version-information.md)를 확인하여 올바른 버전이 설치되어 있는지 확인하십시오. Liferay 버전.
```

아직 수행하지 않은 경우 다음 명령을 사용하여 Liferay 테마 생성기를 설치합니다.

```bash
npm install -g generator-liferay-theme@10.x.x
```

다음 명령을 사용하여 Yeoman 및 Gulp 종속성을 설치합니다.

```bash
npm install -g yo gulp
```

### Liferay 테마 생성기 실행

다음 단계에 따라 Liferay 테마 생성기를 실행하십시오.

1. Yeoman을 사용하여 Liferay 테마 생성기를 실행합니다. 

    ```bash
    yo liferay-theme
    ```

    ```{important}
    이 명령에 기본 테마의 이름을 추가하여 새 테마를 기반으로 할 수 있습니다. 예를 들어 `yo liferay-theme:classic`을 실행하면 DXP의 클래식 테마에서 새 테마를 기반으로 합니다.
    ```
    <!-- Add link to an explanation of choosing (and changing) the base theme when available.-->

1. 프롬프트에 테마 이름을 입력합니다. 기본값인 "My Liferay 테마"를 사용하려면 Enter 키를 누르십시오. 

    ```
    ? What would you like to call your theme? (My Liferay Theme)
    ```

1. 프롬프트에 테마의 ID를 입력합니다. 테마가 생성되면 ID는 테마가 내장된 폴더의 이름을 결정합니다. Enter 키를 눌러 이름을 기반으로 하는 기본 ID를 사용할 수도 있습니다. 

    ```
    ? What id would you like to give to your theme? (my-liferay-theme)
    ```

1. 프롬프트에서 화살표 키를 사용하여 테마를 빌드할 Liferay DXP 버전을 선택합니다. Liferay 테마 생성기 버전 10.xx를 사용하여 7.2 또는 7.3용 테마를 생성할 수 있습니다. 

    ```
    ? Which version of Liferay is this theme for? (Use arrow keys)
    ❯ 7.3 
      7.2
    ```

1. 프롬프트에서 테마에 사용할 수 있는 글꼴로 Font Awesome을 추가할지 여부를 대답합니다.

1. 테마가 생성되면 화살표 키를 사용하여 테마에 적합한 배포 유형을 선택하여 프로세스를 완료합니다. 로컬 앱 서버, Docker 컨테이너 또는 기타 URL을 사용하여 배포하도록 선택할 수 있습니다. 

    ```
    ? Select your deployment strategy (Use arrow keys)
    ❯ Local App Server 
      Docker Container 
      Other
    ```

1. 사용 중인 배포 유형에 따라 프롬프트에서 앱 서버의 사이트를 제공합니다.
   
   앱 서버 디렉터리, Docker 컨테이너 이름 또는 호스트 URL을 제공하여 앱 서버를 찾을 수 있습니다.

그런 다음 테마가 생성되어 선택한 ID의 이름을 딴 폴더 안에 배치됩니다. 이제 테마의 기본 폴더에서 `gulp deploy` 을 실행하여 빌드하고 DXP 인스턴스에 배포할 수 있습니다.

## 블레이드를 사용하여 테마 만들기

곧!
<!-- Link to Theme Templates documentation when available-->

## 추가 정보

* [사이트 모양 변경](../../../../../getting-started/changing-your-sites-appearance.md)
