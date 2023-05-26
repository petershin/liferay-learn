# Google 드라이브로 문서 생성 및 편집 활성화

Liferay DXP는 Google 드라이브와의 통합을 제공하므로 문서 및 미디어 애플리케이션을 통해 Google 문서, 시트 및 슬라이드를 만들고 편집할 수 있습니다. 이러한 문서 유형 중 하나를 추가하거나 편집하면 파일을 작성할 수 있는 Google의 외부 편집기로 리디렉션됩니다.

![문서를 통해 문서, 시트 및 슬라이드를 만듭니다.](./enabling-document-creation-and-editing-with-google-drive/images/01.png)

```{note}
이 통합은 전체적으로(즉, DXP 설치의 모든 포털 인스턴스에 대해) 또는 개별 인스턴스에 대해 활성화할 수 있습니다. 인스턴스 수준의 구성은 전역 구성을 재정의합니다.
```

## 전제 조건

Liferay의 Google Drive 통합을 활성화하려면 Google Drive API가 활성화되고 OAuth 2가 적절하게 구성된 활성 Google 프로젝트가 필요합니다. OAuth 2를 설정하려면 OAuth 동의 화면을 구성하고 OAuth 2 자격 증명을 생성하고 Liferay 요청 URI를 OAuth 클라이언트에 대한 승인된 URI 목록에 추가합니다.

OAuth 2 자격 증명을 생성할 때 애플리케이션 유형으로 **웹 애플리케이션** 을 선택했는지 확인하십시오. 생성된 후에는 문서 및 미디어를 구성하기 위해 자격 증명의 클라이언트 ID와 클라이언트 암호가 필요합니다.

필요한 경우 Google Cloud 문서를 참조하세요.

* [Google 프로젝트 만들기](https://support.google.com/googleapi/answer/6251787?hl=en&ref_topic=7014522)
* [프로젝트에 대한 API 활성화](https://support.google.com/googleapi/answer/6158841)
* [OAuth 동의 화면 설정](https://support.google.com/cloud/answer/10311615?hl=en)
* [OAuth 2 설정](https://support.google.com/cloud/answer/6158849)

Google 프로젝트가 준비되면 Liferay의 문서 및 미디어 애플리케이션을 구성할 수 있습니다.

## 문서 및 미디어 구성

Liferay와 Google 드라이브의 통합을 활성화하려면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../../../images/icon-applications-menu.png))을 열고 **제어판** 탭을 클릭한 다음 **시스템 설정** &rarr; **문서 및 미디어** 로 이동합니다.

1. 가상 인스턴스 범위에서 **Google 드라이브** 을 클릭합니다.

    ![가상 인스턴스 범위에서 Google 드라이브를 클릭합니다.](./enabling-document-creation-and-editing-with-google-drive/images/02.png)

1. Google 프로젝트의 OAuth 2 **클라이언트 ID** 및 **클라이언트 암호** 을 입력합니다.

   ```{note}
   [Google Picker API](https://developers.google.com/picker/docs) 를 사용하면 사용자가 Liferay에서 Google에 저장된 사진, 비디오, 지도 및 문서를 선택할 수 있습니다. Liferay의 Google 드라이브용 플러그인을 사용할 때만 필요합니다. 자세한 내용은 [Google 드라이브 문서에 대한 링크 활성화](./enabling-links-to-google-drive-documents.md)를 참조하세요.
   ```

1. **저장** 을 클릭합니다.

활성화되면 승인된 사용자는 문서 및 미디어를 통해 Google 문서, 슬라이드 및 시트를 만들 수 있습니다.

```{note}
이 기능을 비활성화하려면 Google 드라이브의 *작업* 버튼을 클릭하고 *기본값 재설정*을 선택하세요.
```

## 관련 주제

* [Google 드라이브 문서에 대한 링크 활성화](./enabling-links-to-google-drive-documents.md)
* [Google 드라이브로 문서 생성 및 편집](../../uploading-and-managing/creating-documents/creating-and-editing-documents-with-google-drive.md)
