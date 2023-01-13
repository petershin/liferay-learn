# 양식 구성 참조

다음은 필요한 구성을 빠르게 찾을 수 있도록 모든 Forms 구성에 대한 개요입니다.

## 양식 옵션

사이트 간에 양식을 내보내고 가져올 수 있습니다. _내보내기/가져오기_ 메뉴에 액세스하려면 _사이트 관리_ &rarr; _콘텐츠 및 데이터_  &rarr; _양식_로 이동합니다. 오른쪽 상단의 ![Options](../../../images/icon-options.png) 아이콘을 클릭한 다음 _내보내기/가져오기_를 클릭합니다.

![양식을 내보내거나 가져올 수 있습니다.](./forms-configuration-reference/images/01.png)

자세한 내용은 [양식 내보내기 및 가져오기](./exporting-and-importing-forms.md) 및 [사이트 페이지 및 콘텐츠 내보내기/가져오기](../../../site-building/sites/exporting-importing-site-pages-and-content.md) 을 참조하십시오.

## Form 설정

각 양식에는 고유한 설정 메뉴가 있습니다.

설정 메뉴에 액세스하려면 원하는 형식을 선택합니다(예: _게스트 설문 피드백_). 오른쪽 상단의 ![Settings](../../../images/icon-settings.png) 아이콘을 클릭합니다.

### 양식 옵션

![설정 메뉴에는 이러한 옵션이 포함되어 있습니다.](./forms-configuration-reference/images/02.png)

| 섹션                   | 분야                                                                | <div style="width:290px">묘사                                                                                                                                                              |
|:-------------------- |:----------------------------------------------------------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 일반                   | 사용자 인증 필요                                                         | 응답자는 양식을 제출하기 전에 로그인해야 합니다.                                                                                                                                                               |
| 일반                   | CAPTCHA                                                           | 양식을 제출할 때 CAPTCHA 질문에 답해야 합니다.                                                                                                                                                            |
| 일반                   | 자동으로 답변 저장                                                        | 응답자가 양식을 작성할 때 양식을 주기적으로 자동 저장하십시오.                                                                                                                                                       |
| 일반                   | 스토리지 유형 선택                                                        | 제출된 레코드를 관리하기 위해 [스토리지 어댑터](../developer-guide/understanding-form-storage-adapters.md) 을 설정합니다. 양식이 저장된 후에는 편집할 수 없습니다.                                                                   |
| 일반                   | 선택 [워크플로우](./advanced-forms-usage/using-forms-with-a-workflow.md) | 양식 제출을 검토할 워크플로 정의를 선택합니다. 워크플로는 기본적으로 비활성화되어 있습니다.                                                                                                                                       |
| 개인화                  | 성공에URL을 방향을 고치십시요                                                 | 양식이 성공적으로 제출되면 리디렉션 URL을 지정하십시오.                                                                                                                                                          |
| 개인화                  | 제출 버튼 레이블                                                         | 제출 버튼의 레이블을 특정 사용 사례에 더 적합한 것으로 변경하십시오(예: _Vote_ 또는 _Register_).                                                                                                                          |
| 알림                   | 각 항목에 대한 이메일 알림 보내기.                                              | 양식 레코드가 제출될 때마다 양식 작성자에게 보내는 [이메일 알림](../sharing-forms-and-managing-submissions/configuring-form-notifications.md) 여부를 지정하십시오.                                                            |
| [Liferay 7.4 전용] 제출물 | 사용자당 하나의 제출로 제한                                                   | 로그인한 사용자에게 여러 양식 제출을 허용하지 마십시오. 또한 사용자가 양식을 작성하려면 인증을 받아야 합니다.                                                                                                                            |
| [Liferay 7.4 전용] 제출물 | 응답자에게 부분 결과 표시                                                    | 응답자가 양식에 대한 현재 [양식 보고서](../sharing-forms-and-managing-submissions/form-reports.md#show-partial-results-to-form-respondents) 데이터를 볼 수 있도록 허용합니다. 이 기능을 활성화하면 민감한 정보를 제출하지 않도록 사용자에게 경고합니다. |
| [Liferay 7.4 전용] 제출물 | 만료일/영원히 만료되지 않음                                                   | 양식이 만료되는 날짜를 설정하십시오. 이 날짜 이후에는 제출이 허용되지 않습니다. 양식 사용자는 양식에 액세스할 때 만료 알림을 보게 됩니다. 만료 날짜를 선택하려면 _만료 안 함_ 설정을 비활성화해야 합니다.                                                                     |

### 전자 우편 통보

여기에서 양식 항목이 제출될 때마다 알림 이메일을 보내도록 Forms 앱을 구성할 수 있습니다. 먼저 메일 서버를 설정해야 합니다. 자세한 내용은 [메일](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) 구성을 참조하십시오.

![양식에 알림을 추가할 수 있습니다.](./forms-configuration-reference/images/03.png)

| 분야     | 묘사                                                                |
|:------ |:----------------------------------------------------------------- |
| 확고한 이름 | 발신자 이름 이는 사이트 이름, 양식 이름 또는 수신자에게 유용한 정보가 될 수 있습니다.                |
| 가정 주소  | 발신자의 이메일 주소 `noreply@example.com` 을 사용하여 수신자가 회신하지 못하도록 할 수 있습니다. |
| 주소로    | 수신자의 이메일 주소(예: `test@example.com`)                                |
| 주제     | 유익한 제목 줄은 수신자에게 무슨 일이 일어났는지 알려줍니다.                                |

자세한 내용은 [양식 알림 구성](../sharing-forms-and-managing-submissions/configuring-form-notifications.md)을 참조하십시오.

## 양식 위젯 구성

사이트 페이지에 배포된 _Form_ 위젯을 구성할 수 있습니다. _구성_ 메뉴에 액세스하려면 위젯 제목 &rarr; _구성_옆에 있는 ![Options](../../../images/icon-app-options.png) 아이콘을 클릭합니다.

### 체제

여기에서 이 위젯에서 사용할 원하는 양식을 선택할 수 있습니다.

![이 위젯에서 사용할 원하는 양식을 선택하십시오.](./forms-configuration-reference/images/04.png)

### 나누는

여기에서 이 애플리케이션을 DXP 이외의 다른 플랫폼에 임베드할 수 있습니다.

![Forms 앱을 내장할 수 있는 원하는 플랫폼을 선택합니다.](./forms-configuration-reference/images/05.png)

### 범위

여기에서 전역, 사이트 또는 페이지에서 위젯의 범위를 변경할 수 있습니다.

![양식 위젯에 대해 원하는 범위를 선택합니다.](./forms-configuration-reference/images/06.png)

## 인스턴스 설정

인스턴스 설정의 양식 구성 항목은 시스템 설정(아래)의 양식 항목과 동일합니다. 인스턴스 설정은 시스템 설정을 재정의하며 시스템 전체에 기본값을 설정합니다. 자세한 내용은 [구성 범위 이해](../../../system-administration/configuring-liferay/understanding-configuration-scope.md) 을 참조하십시오.

각 구성 속성에 대한 설명은 [시스템 설정](#system-settings)을 참조하십시오.

## 시스템 설정

현재 하나의 시스템 수준 Forms 구성 항목만 있습니다. Liferay UI에서 속성을 구성하려면

1. _글로벌 메뉴로 이동_ (![global icon](../../../images/icon-applications-menu.png)) &rarr; _제어판_.
1. _시스템 설정_을 클릭하십시오.
1. _콘텐츠 및 데이터_ 섹션에서 _양식_ 을 클릭합니다.

![시스템 설정 메뉴에서 양식을 구성합니다.](./forms-configuration-reference/images/07.png)

또는 백업 `DDMFormWebConfiguration` 서비스를 이름이 지정된 `.config` 파일로 구성합니다.

```
com.liferay.dynamic.data.mapping.form.web.internal.configuration.DDMFormWebConfiguration.config
```

파일을 `Liferay Home/osgi/configs`에 넣습니다. 자세한 내용은 [구성 파일 사용](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) 을 참조하십시오.

| 분야                                                             | 묘사                                                                                                                                                                       |
|:-------------------------------------------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 자동 저장 간격(`autosaveInterval`)                                   | 양식을 자동 저장하도록 값을 분 단위로 설정합니다. 0으로 설정하면 자동 저장이 비활성화됩니다.                                                                                                                    |
| CSV 내보내기(`csvExport`)                                          | 관리자가 양식 항목을 CSV로 다운로드할 수 있는지 여부를 결정합니다.                                                                                                                                  |
| 기본 디스플레이 보기(`defaultDisplayView`)                              | 양식이 검색 컨테이너에 표시되는 방식을 설정합니다.                                                                                                                                             |
| 게스트 업로드 파일 확장자(`guestUploadFileExtensions`)                    | 허용되는 파일 확장자의 쉼표로 구분된 목록을 입력하십시오. 기본적으로 다음 목록이 지원됩니다: `doc`, `docx`, `jpeg`, `jpg`, `pdf`, `png`, `ppt`, `pptx`, `tiff`, `txt`, `xls`, `xlsx`.                            |
| 게스트 업로드 최대 파일 크기(`guestUploadMaximumFileSize`)                 | 게스트 사용자가 업로드 필드를 통해 업로드할 수 있는 최대 파일 크기를 설정합니다. 이는 문서 및 미디어 애플리케이션 구성에서 인증된 사용자에 대해 구성되며 전체 최대 업로드 요청 크기라는 필드의 업로드 서블릿 요청 시스템 설정 항목에 시스템 전체 제한이 정의됩니다. 기본적으로 제한은 25MB입니다. |
| 업로드 필드의 최대 반복(`maximumRepetitionsForUploadFields`)             | 필드가 반복 가능하도록 구성된 경우 사용자가 필드를 양식에 추가할 수 있는 최대 횟수를 설정합니다(게스트 사용자 및 로그인한 사용자에게 동일하게 적용됨). 기본적으로 제한은 5입니다.                                                                   |
| 게스트 업로드 필드에 대한 최대 제출(`maximumSubmissionsForGuestUploadFields`) | 게스트 사용자가 게스트 지원 업로드 필드가 포함된 양식을 제출할 수 있는 최대 횟수를 설정합니다. 게스트 사용자의 IP 주소는 제출을 추적하는 데 사용됩니다. 기본적으로 제한은 5입니다.                                                                 |

## 추가 정보

* [양식 권한 참조](./forms-permissions-reference.md)
