# Google 드라이브 문서에 대한 링크 활성화

Liferay는 문서 및 미디어를 Google 드라이브와 통합하기 위한 Marketplace 플러그인을 제공합니다. 사용하도록 설정하면 문서 및 미디어를 통해 파일을 보고 관리할 수 있는 Google 드라이브 파일에 대한 바로 가기를 만들 수 있습니다. 이 플러그인은 [Liferay Portal CE](https://web.liferay.com/marketplace/-/mp/application/105847499) 및 [Liferay DXP](https://web.liferay.com/marketplace/-/mp/application/98011653) 시스템 모두에서 사용할 수 있습니다. Google 드라이브용 Liferay 플러그인 설치 방법은 [앱 설치하기](../../../../system-administration/installing-and-managing-apps/installing-apps.md) 을 참조하세요.

플러그인을 설치한 후 Google 프로젝트를 설정하고 Liferay의 문서 및 미디어 애플리케이션을 구성해야 합니다.

```{important}
Google Drive용 Liferay 플러그인은 Liferay CE Portal 및 Liferay DXP에서 사용할 수 있는 랩 애플리케이션입니다. 실험실 앱은 실험적이며 Liferay에서 지원하지 않습니다. 유용하고 최첨단 기능의 가용성을 가속화하기 위해 출시되었습니다. 이 상태는 예고 없이 변경될 수 있습니다. 자신의 재량에 따라 Labs 앱을 사용하십시오.
```

## Google 프로젝트 설정

Liferay 플러그인을 활성화하려면 Google 드라이브 API와 Google Picker API가 모두 활성화된 활성 Google 프로젝트가 필요합니다. Google 드라이브 API를 사용하면 사용자가 기본 편집기에서 Google 파일(즉, 문서, 시트 및 슬라이드)을 보고 수정할 수 있습니다. Picker API를 사용하면 문서 및 미디어에 파일을 업로드할 때 사용자가 Google 드라이브에 저장된 디지털 자산(예: 사진, 비디오, 문서)을 보고 선택할 수 있습니다. 아직 프로젝트를 만들지 않았다면 [Google 프로젝트 만들기](https://support.google.com/googleapi/answer/6251787?hl=en&ref_topic=7014522) 을 참조하세요. 그렇지 않으면 [API 활성화](https://support.google.com/googleapi/answer/6158841) 을 참조하여 프로젝트에 대해 Picker API를 활성화하는 방법을 알아보세요.

```{note}
원하는 경우 Google 드라이브용 Liferay 플러그인과는 별도로 문서 및 미디어를 통해 Google 문서를 만들고 편집할 수 있습니다. 자세한 내용은 [Google 드라이브로 문서 생성 및 편집 활성화](./enabling-document-creation-and-editing-with-google-drive.md)를 참조하세요.
```

프로젝트에 대해 Google Picker API를 활성화한 후 [는 Picker API용 API 키를 생성하고](https://support.google.com/googleapi/answer/6158862) 은 OAuth를 설정합니다 [](https://support.google.com/cloud/answer/6158849) . OAuth 2 설정에는 OAuth 동의 화면 구성, OAuth 2 자격 증명 생성, 승인된 JavaScript 출처 목록에 Liferay 요청 URI 추가가 포함됩니다. OAuth 2 자격 증명을 생성할 때 애플리케이션 유형으로 **웹 애플리케이션** 을 선택했는지 확인하십시오.

Google 프로젝트가 준비되면 Liferay 제어판을 통해 문서 및 미디어 애플리케이션을 구성해야 합니다. 여기에는 Picker API 키와 OAuth2 클라이언트 ID 및 클라이언트 암호가 필요합니다.

## 문서 및 미디어 구성

문서 및 미디어 애플리케이션을 구성하려면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../../../images/icon-applications-menu.png))을 열고 **제어판** 탭을 클릭한 다음 **시스템 설정** &rarr; **문서 및 미디어** 로 이동합니다.

1. 가상 인스턴스 범위에서 **Google 드라이브** 을 클릭합니다.

    ![가상 인스턴스 범위에서 Google 드라이브를 클릭합니다.](./enabling-links-to-google-drive-documents/images/01.png)

1. 프로젝트의 OAuth 2.0 **클라이언트 ID** 및 **클라이언트 비밀번호** 을 입력합니다.

1. **선택기 API 키** 을 입력하십시오.

1. **저장** 을 클릭합니다.

활성화되면 사용자는 Google 자산에 대한 문서 및 미디어 바로가기를 만들 수 있습니다.

```{note}
이 기능을 비활성화하려면 Google 드라이브의 *작업* 버튼을 클릭하고 *기본값 재설정*을 선택하세요.
```

## 구글 드라이브 바로가기 만들기

Google 드라이브 파일에 대한 문서 및 미디어 바로가기를 만들려면 다음 단계를 따르세요.

1. 사이트 자산 라이브러리에서 문서 및 미디어 응용 프로그램을 엽니다.

1. 0 문서 및 미디어 탭에서 **추가** 버튼(![Add Button](../../../../images/icon-add.png))을 클릭하고 **Google 드라이브 바로가기** 를 선택합니다.

   ![추가 버튼을 클릭하고 Google 드라이브 바로가기를 선택합니다.](./enabling-links-to-google-drive-documents/images/02.png)

1. **파일 선택** 을 클릭합니다.

   ![파일 선택을 클릭합니다.](./enabling-links-to-google-drive-documents/images/03.png)

1. 원하는 Google 계정을 선택합니다.

1. 원하는 Google 드라이브 파일을 선택합니다.

   ![원하는 Google 드라이브 파일을 선택합니다.](./enabling-links-to-google-drive-documents/images/04.png)

1. 바로 가기에 대해 **이름** 및 **설명** 을 입력합니다.

1. 완료되면 **게시** 을 클릭합니다.

일단 게시되면 문서 및 미디어 애플리케이션을 통해 Liferay에서 Google 드라이브 파일에 액세스하고 사용할 수 있습니다. 자세한 내용은 [Google 드라이브의 파일에 연결](../../uploading-and-managing/linking-to-files-on-google-drive.md) 을 참조하십시오.

## 관련 주제

* [Google 드라이브로 문서 생성 및 편집 활성화](./enabling-document-creation-and-editing-with-google-drive.md)
* [Google 드라이브의 파일에 연결](../../uploading-and-managing/linking-to-files-on-google-drive.md)
