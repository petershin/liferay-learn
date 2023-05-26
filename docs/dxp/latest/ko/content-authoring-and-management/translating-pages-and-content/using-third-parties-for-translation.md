# 제3자를 번역에 사용

{bdg-secondary}`사용 가능한 Liferay 7.4 U15+ 및 GA15+`

Liferay는 다음 서비스 API와 통합하여 콘텐츠 페이지 및 웹 콘텐츠의 자동 번역을 생성할 수 있습니다.

* [구글 클라우드 번역](#enabling-google-cloud-translation)
* [아마존 번역](#enabling-amazon-translate)
* [마이크로소프트 번역기](#enabling-microsoft-translator)

이 기능을 사용하려면 먼저 사용 중인 번역 서비스를 설정한 다음 Liferay의 시스템 설정에서 활성화해야 합니다. 활성화되면 이 서비스를 사용하여 콘텐츠 페이지 및 웹 콘텐츠에 대한 [번역 생성](#using-automatic-translation) 을 할 수 있습니다.

```{important}
한 번에 하나의 서비스만 활성화할 수 있습니다. 여러 서비스를 활성화하면 시스템은 사용 가능한 첫 번째 서비스를 사용합니다.
```

## Google 클라우드 번역 활성화

Google Cloud Translation을 사용하려면 활성 계정과 Cloud Translation API가 사용 설정된 Google Cloud 프로젝트가 필요합니다. 이 프로젝트에는 JSON 계정 키가 있는 서비스 계정도 있어야 합니다. 자세한 내용은 공식 [Google Cloud Translation](https://cloud.google.com/translate/docs/setup) 문서를 참조하세요.

준비가 되면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../images/icon-applications-menu.png))을 열고 **제어판** 탭을 클릭한 다음 **시스템 설정** &rarr; **번역** &rarr; **Google Cloud를 사용하는 번역기** 로 이동합니다.

   ![Google Cloud를 사용하는 번역기로 이동합니다.](./using-third-parties-for-translation/images/01.png)

1. **활성화됨** 확인하십시오.

1. 유효한 Google Cloud 서비스 계정 키를 JSON 형식으로 입력하세요.

1. **저장** 클릭합니다.

## Amazon Translate 활성화

{bdg-secondary}`사용 가능 7.4 U9+ 및 GA13+`

Amazon Translate를 활성화하려면 활성 Amazon AWS 계정이 필요합니다. 자세한 내용은 공식 [Amazon Translate](https://docs.aws.amazon.com/translate/latest/dg/what-is.html) 설명서를 참조하십시오.

준비가 되면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../images/icon-applications-menu.png))을 열고 **제어판** 탭을 클릭한 다음 **시스템 설정** &rarr; **번역** &rarr; **AWS를 사용하는 번역기** 로 이동합니다.

   ![AWS를 사용하는 번역기로 이동합니다.](./using-third-parties-for-translation/images/02.png)

1. 확인 **사용** .

1. 유효한 **액세스 키** 및 **비밀 키** 입력하십시오.

1. 지역을 입력하세요. 기본값은 `us-west-1`입니다.

1. **저장** 클릭합니다.

## 마이크로소프트 번역기 활성화

{bdg-secondary}`사용 가능 7.4 U6+ 및 GA10+`

Microsoft Translator를 활성화하려면 활성 Microsoft Azure 계정이 필요합니다. 자세한 내용은 공식 [Microsoft Translator](https://docs.microsoft.com/en-us/azure/cognitive-services/translator/) 설명서를 참조하십시오.

준비가 되면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../images/icon-applications-menu.png))을 열고 **제어판** 탭을 클릭한 다음 **시스템 설정** &rarr; **번역** &rarr; **Azure를 사용하는 번역기** 로 이동합니다.

   ![Azure를 사용하는 번역기로 이동합니다.](./using-third-parties-for-translation/images/03.png)

1. 확인 **사용** .

1. 유효한 **구독 키** 및 **리소스 사이트**(지역)을 입력합니다.

1. **저장** 클릭합니다.

## 자동 번역 사용

번역 서비스가 활성화되면 콘텐츠 페이지 및 웹 콘텐츠의 번역 인터페이스에 자동 번역 버튼이 추가됩니다.

필드를 자동으로 번역하려면 다음 단계를 따르세요.

1. **페이지** 또는 **웹 콘텐츠** 애플리케이션을 엽니다.

1. **작업** 버튼(![Actions Button](../../images/icon-actions.png))을 번역하려는 콘텐츠 또는 페이지를 클릭하고 **번역을 선택합니다.** .

   ![웹 콘텐츠 번역 인터페이스를 엽니다.](./using-third-parties-for-translation/images/04.png)

1. 언어 플래그를 사용하여 번역할 **언어** 를 선택하십시오.

   ```{note}
   번역에 사용할 수 있는 언어는 인스턴스의 현지화 설정에 따라 결정됩니다. [초기 인스턴스 현지화](../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md) 및 [가상 인스턴스 현지화](../../system-administration/ 참조 configure-liferay/virtual-instances/localization.md)를 참조하십시오.
   ```

1. **자동 번역** 버튼을 클릭하여 모든 웹 콘텐츠 필드를 선택한 언어로 번역합니다.

   ![왼쪽 상단 자동 번역 버튼을 클릭하여 모든 웹 콘텐츠 필드를 번역합니다.](./using-third-parties-for-translation/images/05.png)

   또는 필드의 개별 **자동 번역** 버튼(![Auto Translate Button](../../images/icon-translate.png))을 클릭하여 해당 텍스트만 번역합니다.

   ![텍스트만 번역하려면 필드의 개별 자동 번역 버튼을 클릭합니다.](./using-third-parties-for-translation/images/06.png)

1. 완료되면 **초안으로 저장** 또는 **게시** 클릭합니다.

## 관련 주제

* [웹 콘텐츠 번역](./translating-web-content.md)
* [콘텐츠 페이지 번역](./translating-content-pages.md)
