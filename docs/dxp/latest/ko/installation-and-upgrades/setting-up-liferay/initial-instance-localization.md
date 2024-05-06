# 초기 인스턴스 현지화

Liferay DXP는 언어, 시간대 등을 기준으로 로컬라이제이션을 지원합니다. 영어(미국) 언어 번역과 GMT 시간대가 기본값이지만, DXP는 40개 이상의 번역을 지원하며 원하는 시간대로 설정할 수 있습니다. 현지화는 가상 인스턴스, 각 인스턴스의 위젯 및 개별 사용자에 대한 범위가 지정됩니다. DXP를 설정할 때 이러한 인터페이스를 사용하여 가상 인스턴스의 기본 언어 및 표준 시간대를 구성할 수 있습니다:

* [포털 속성](#portal-properties) : 애플리케이션 서버를 시작하기 전에 속성 파일에서 기본값을 지정합니다.
* [설정 마법사](#setup-wizard) : DXP를 시작할 때 UI를 통해 기본값을 설정합니다.
* [제어판](#control-panel) : DXP 인스턴스를 시작한 후 UI를 통해 기본값을 수정합니다.

## 문맥 재산

DXP를 시작하기 전에 기본 가상 인스턴스의 지역화를 구성하려면 [`portal-ext.properties` 파일](../reference/portal-properties.md)을 사용합니다.

| **포털 속성** | **묘사** |
|:--------------------------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `company.default.locale`    | [`locales`](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 포털 속성에 정의된 사용 가능한 로캘로 설정합니다.      |
| `company.default.time.zone` | [`time.zones`](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 포털 속성에 정의된 표준 시간대 중 하나로 설정합니다. |

예를 들어

```properties
company.default.locale=pt_PT
company.default.time.zone=Europe/Lisbon
```

위의 속성은 포르투갈 리스본에 있는 사용자를 위해 가상 인스턴스를 현지화합니다.

## 설정 마법사

[설정 마법사](../installing-liferay/running-liferay-for-the-first-time.md) 는 DXP 인스턴스의 기본 언어 및 표준 시간대를 설정합니다. **기본 언어** 및 **표준 시간대** 선택기에서 선택할 수 있습니다.

![설정 마법사를 사용하여 DXP 인스턴스의 기본 언어 및 표준 시간대를 설정합니다.](./initial-instance-localization/images/01.png)

설치 마법사는 [Liferay-Tomcat 번들](../installing-liferay/installing-a-liferay-tomcat-bundle.md) 및 [애플리케이션 서버 설치](../installing-liferay/installing-liferay-on-an-application-server.md)에 대해 기본적으로 활성화되어 있습니다.

이미 DXP를 시작한 경우 제어판에서 인스턴스의 기본 언어 및 표준 시간대를 변경하세요.

## 제어판

가상 인스턴스의 기본 언어 및 표준 시간대는 인스턴스의 **현지화** 페이지를 사용하여 수정할 수 있습니다. 자세한 지침은 [가상 인스턴스 현지화 구성](../../system-administration/configuring-liferay/virtual-instances/localization.md) 을 참조하세요.

## 결론

DXP 인스턴스의 기본 언어 및 표준 시간대를 구성했습니다. 로캘을 쉽게 선택하는 방법을 비롯하여 DXP 로컬라이제이션에 대한 자세한 내용은 [사이트 로컬라이제이션](../../site-building/site-settings/site-localization.md)을 참조하세요.

## 관련 주제

* [가상 인스턴스 현지화 구성](../../system-administration/configuring-liferay/virtual-instances/localization.md)
* [글로벌 언어 번역 재정의](../../liferay-internals/extending-liferay/overriding-global-language-translations-with-language-properties.md)
* [애플리케이션 현지화](https://help.liferay.com/hc/ko/articles/360028746692-Localizing-Your-Application)
