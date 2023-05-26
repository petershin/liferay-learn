# Liferay 7.4에서 부트스트랩 3 호환성 계층 사용

Liferay DXP 7.4 GA1부터 [Bootstrap 3](https://getbootstrap.com/) 호환성 계층이 Liferay 프런트 엔드 애플리케이션의 내장 패키지에서 제거되었습니다. 이전 버전에서 업그레이드하는 경우 CSS 코드에 대해 Bootstrap 3에 의존하는 프로젝트의 외부 패키지로 호환성 레이어를 포함해야 합니다.

```{note}
`gulp upgrade` 명령을 사용하여 [테마 업그레이드](../../../site-building/site-appearance/themes/upgrading-a-theme.md)를 Liferay 7.4로 업그레이드하면 자동으로 업그레이드에 Bootstrap 3 호환성 레이어를 포함합니다. 이 경우 해당 테마에 호환성 레이어를 수동으로 추가할 필요가 없습니다.
```

```{warning}
Liferay 7.4 GA1로의 업그레이드가 보다 원활하게 진행될 수 있도록 부트스트랩 3 호환성 계층을 외부 패키지로만 제공합니다. 최신 버전에서는 작동하지 않으므로 가능한 한 빨리 교체해야 합니다.
```

## 호환성 계층 설치

프로젝트에서 사용할 수 있도록 이 명령을 실행하여 호환성 레이어를 외부 패키지로 설치합니다.

```bash
npm install @liferay/bs3-bs4-compat
```

이 명령을 실행하여 Yarn을 사용하여 설치할 수도 있습니다.

```bash
yarn add @liferay/bs3-bs4-compat
```

호환성 계층을 설치한 후에는 여전히 부트스트랩 3과 호환되어야 하는 모든 프로젝트에서 사용할 수 있습니다.

## 프로젝트에서 호환성 계층 사용

호환성 레이어를 사용하려면 프로젝트의 `clay.scss` 파일로 가져와야 합니다(이미 [7.4로 업그레이드](../../../site-building/site-appearance/themes/upgrading-a-theme.md)).

아틀라스 테마 변수가 필요한 경우 프로젝트의 `src/css/clay.scss` 파일에 다음을 추가합니다.

```css
@import 'clay/atlas';

@import '@liferay/bs3-bs4-compat/scss/variables';

@import '@liferay/bs3-bs4-compat/scss/atlas_variables';

@import '@liferay/bs3-bs4-compat/scss/components';
```

아틀라스 테마 변수가 **필요하지** 않은 경우 대신 프로젝트의 `src/css/clay.scss` 파일에 다음을 추가하십시오.

```css
@import 'clay/base';

@import '@liferay/bs3-bs4-compat/scss/variables';

@import '@liferay/bs3-bs4-compat/scss/components';
```

이제 부트스트랩 3 호환성 레이어가 테마에 포함되어 있으므로 Liferay DXP 7.4 GA1에서 작동합니다. 다음 작업은 부트스트랩 3에 대한 종속성을 제거할 수 있도록 프로젝트의 코드를 변경하는 것입니다. 

## 관련 주제

* [테마 업그레이드](../../../site-building/site-appearance/themes/upgrading-a-theme.md)
* [7.4에서 더 이상 사용되지 않는 기능](../../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md#features-deprecated-in-7-4)
