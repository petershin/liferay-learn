# 언어 키 재정의 업그레이드

Liferay DXP/Portal 7.4에서 Liferay 모듈 언어 키가 Liferay Portal 언어 모듈로 이동되었습니다. 많은 키의 이름이 변경되었습니다. 이름이 변경된 언어 키를 재정의하는 경우 모듈에서 키 이름을 업데이트해야 합니다.

```{note}
언어 키 후크 플러그인을 업그레이드하는 경우 [포틀릿 언어 키 후크 업그레이드](https://help.liferay.com/hc/ko/articles/360029005272-Upgrading-Portlet-Language-Key-Hooks) 를 따르십시오. 첫 번째.
```

언어 키 재정의를 업그레이드하는 방법은 다음과 같습니다.

1. 언어 키의 이름이 변경되었는지 확인하십시오. [이름이 변경된 언어 키](../reference/renamed-language-keys.md)을 참조하십시오.
1. 이름이 변경된 각 언어 키에 대해 언어 속성 파일에서 새 키 이름을 사용합니다.

모듈을 배포할 준비가 되었습니다.

## 관련 주제

* [전역 언어 번역 재정의](../../../liferay-internals/extending-liferay/overriding-global-language-translations.md)
* [이름이 변경된 언어 키](../reference/renamed-language-keys.md)
* [맞춤형 개발 업그레이드](../upgrading-custom-development.md)