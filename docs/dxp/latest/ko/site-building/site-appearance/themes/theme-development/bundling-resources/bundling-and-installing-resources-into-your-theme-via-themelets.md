# 테마렛을 통해 리소스를 테마에 번들링 및 설치

Themelet은 여러 테마에서 재사용할 수 있는 작은 모듈식 코드 조각입니다. 테마 자체와 달리 테마릿은 변경 사항이 있는 파일만 포함할 수 있습니다. 테마릿을 사용하여 일반적으로 테마의 일부로 정의하는 모든 종류의 스타일이나 기능을 변경할 수 있습니다.

## 전제 조건

Themelet은 Liferay 테마 생성기를 사용하여 생성됩니다(예: [테마 생성](../getting-started/setting-up-an-environment-and-creating-a-theme.md)). 아직 설치하지 않았다면 다음 명령으로 설치하십시오.

```bash
npm install -g generator-liferay-theme@10.x.x
```

다음 명령을 사용하여 Yeoman 및 Gulp 종속성을 설치합니다.

```bash
npm install -g yo gulp
```

## 테마렛 만들기

Liferay 테마 생성기를 사용하여 themelet을 생성합니다.

1. themelet을 만들려는 파일 사이트에서 다음 명령을 실행합니다.

    ```bash
    yo liferay-theme:themelet
    ```

1. 프롬프트에 themelet의 이름을 입력합니다. 기본값인 "My Liferay Themelet"을 사용하려면 Enter 키를 누르십시오.

    ```
    ? What would you like to call your themelet? Example
    ```

1. 프롬프트에 themelet의 ID를 입력합니다. themelet이 생성되면 ID는 themelet이 내장된 폴더의 이름을 결정합니다. Enter 키를 눌러 이름을 기반으로 하는 기본 ID를 사용할 수도 있습니다.

1. 프롬프트에서 화살표 키를 사용하여 Liferay DXP 버전을 선택하고 Enter 키를 누릅니다.

    ```
    ? Which version of Liferay is this themelet for? (Use arrow keys)
    ❯ 7.3 
      7.2 
      Any 
    ```

themelet이 생성되어 선택한 ID를 기반으로 폴더 안에 배치됩니다. 이제 배포할 테마에 추가할 수 있습니다.

테마 내에서 themelet을 사용할 수 있도록 하려면 themelet의 폴더로 이동하여 다음 명령을 실행해야 합니다.

```bash
npm link
```

이 명령은 테마를 확장할 때 선택할 수 있도록 테마를 전체적으로 설치합니다.

## 테마에 Themelet 추가

테마렛을 전체적으로 설치한 후에는 모든 테마에 추가할 수 있습니다.

```{note}
themelet을 추가할 테마가 없는 경우 [테마 만들기](../getting-started/setting-up-an-environment-and-creating-a-theme.md)에서 만드는 단계를 참조하세요. 하나.
```

`gulp extend` 명령을 사용하여 원하는 테마에 themelet을 추가합니다.

1. 테마의 루트 폴더로 이동합니다.

    ```bash
    cd my-theme/
    ```

1. 이 폴더에서 다음 명령을 실행합니다.

    ```bash
    gulp extend
    ```

1. 프롬프트에서 화살표 키를 사용하여 `Themelet`을 사용하여 확장하도록 선택하고 Enter 키를 누릅니다.

    ```
    ? What kind of theme asset would you like to extend? 
      Base theme 
    ❯ Themelet 
    ```

1. 프롬프트에서 화살표 키를 사용하여 "전역적으로 설치된 npm 모듈 검색"을 선택합니다.

    ```
    ? Where would you like to search for themelets? (Use arrow keys)
    ❯ Search globally installed npm modules (development purposes only)
      Search npm registry (published modules)
      Specify a package URL
    ```

1. 화살표 키를 사용하여 전역적으로 설치된 모듈 목록에서 themelet을 선택합니다. 테마릿이 목록에 표시되려면 테마릿 내에서 `npm 링크` 을 실행해야 합니다.

themelet이 테마에 설치되고 다음에 `gulp deploy` 명령을 사용하여 이 테마를 빌드하고 배포할 때 변경 사항이 나타납니다.

## 추가 정보

* [테마 만들기](../getting-started/setting-up-an-environment-and-creating-a-theme.md)
