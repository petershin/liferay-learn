# 번역 자동 생성

Liferay DXP는 기본적으로 50개 언어를 지원합니다. 각 로캘에는 해당 언어에 대한 키가 포함된 자체 [언어 속성 파일](https://github.com/liferay/liferay-portal/tree/master/modules/apps/portal-language/portal-language-lang/src/main/resources/content) 이 있습니다.

사용자 지정 언어 키를 사용하여 응용 프로그램을 만들 때 이러한 모든 다른 언어로 번역하는 것은 지루하고 어렵습니다. 다행히도 Liferay의 언어 빌더 도구를 사용하여 번역을 자동으로 생성할 수 있습니다. Language Builder는 Microsoft의 Translator API를 사용하여 번역을 생성합니다.

```{note}
기계 번역의 정확성과 정확성은 언어마다 다를 수 있습니다. 이렇게 생성된 번역을 사용하는 방법은 귀하에게 달려 있습니다.
```

## 샘플 프로젝트 보기

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. [번역 자동 생성](./liferay-m7d6.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/localization/liferay-m7d6.zip -O
   ```

   ```bash
   unzip liferay-m7d6.zip
   ```

1. 모듈 루트 폴더에서 `gradle.properties` 파일을 엽니다. Microsoft Translator 구독 키를 추가합니다.

   ```properties
   microsoft.translator.subscription.key={your unique key}
   ```

   Language Builder가 작동하려면 자신의 [Microsoft Translator 구독 키](https://www.microsoft.com/en-us/translator/business/translator-api/) 를 얻어야 합니다.

1. 모듈 루트에서 Language Builder를 실행합니다.

   ```bash
   ./gradlew buildLang
   ```

   터미널 창에서 Language Builder는 다양한 언어 속성 파일을 생성합니다. 자격 증명이 지정되지 않았기 때문에 `Translation is disabled 오류가 표시되면`구독 키가 올바른지 다시 확인하십시오.

1. 번역된 속성 파일을 보려면 모듈의 `src/main/resources/content` 폴더로 이동합니다.

  ![속성 파일은 src/main/resources/content 폴더에 있습니다.](./automatically-generating-translations/images/01.png)

## 언어 키 추가

샘플 프로젝트에는 `Language.properties` 파일에 하나의 언어 키가 있습니다. 애플리케이션에 필요한 만큼 언어 키를 추가한 다음 Language Builder를 실행합니다.

Liferay에 언어 키를 배포하려면 [글로벌 언어 키 재정의](../../../liferay-internals/extending-liferay/overriding-global-language-translations.md)참조하십시오. 지침은 기존 키를 재정의하든 새 키를 추가하든 동일합니다.

일부 언어가 자동으로 번역되지 않도록 제외하려면 프로젝트의 `build.gradle` 파일에서 `excludeLanguageIds` 속성을 사용하세요. 예를 들어 프랑스어를 포함하려면

```properties
buildLang {
    excludedLanguageIds = ["fa"]
}
```

Language Builder 도구 및 추가 구성에 대한 자세한 내용은 [Lang Builder Gradle Plugin](https://github.com/liferay/liferay-portal/tree/master/modules/sdk/gradle-plugins-lang-builder) 을 참조하십시오.
