# 양식을 사용하여 사용자 설문 조사

이전 버전의 Liferay에서 사이트 관리자는 사이트 관리 &rarr; 콘텐츠 및 데이터 메뉴. 이 애플리케이션은 [Liferay 7.3에서 사용되지 않음](../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-3.md#features-deprecated-in- 7-3) 및 [Liferay 7.4에서 제거됨](../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-3.md#features-deprecated- 에서-7-4).

Liferay Forms는 이전 Liferay 버전에서 Polls 애플리케이션이 처리한 사용 사례를 충족하도록 개선되었습니다. 새 투표를 만들려면 여기에 설명된 기능과 함께 Liferay Forms를 사용하십시오.

Liferay 7.2 &rarr; 7.3 &rarr; 7.4의 경로를 따라 업그레이드하는 경우 설문 조사가 Forms를 사용하도록 자동으로 업그레이드됩니다.

```{note}
양식 설정의 전체 목록은 [양식 구성 참조](creating-and-managing-forms/forms-configuration-reference.md)에 포함되어 있습니다.
```

## 투표 만들기

제출 섹션의 양식 설정 모달에 세 가지 설정이 추가되어 Liferay Forms에서 투표와 유사한 기능을 사용할 수 있습니다. 사용자당 하나의 제출로 제한, 만료 날짜 및 응답자에게 부분 결과 표시.

![제출물 설정은 투표와 유사한 동작을 구성하기 위한 것입니다.](./using-forms-to-poll-users/images/01.png)

### 사용자당 하나의 제출로 제한

제출은 사용자당 하나로 제한합니다. 로그인한 사용자에게 여러 양식 제출을 허용하지 마십시오.

```{warning}
사용자당 하나의 제출로 제한을 활성화하려면 사용자가 양식을 작성하기 위해 인증을 받아야 합니다. 이 요구 사항은 양식에 설정된 권한과 _사용자 인증 필요: False_ 양식 설정을 재정의합니다.
```

![사용자는 더 이상 양식을 제출할 수 없지만 현재 제출된 데이터에 대한 양식 보고서를 볼 수 있습니다.](./using-forms-to-poll-users/images/03.png)

### 만료 날짜 추가

기본적으로 양식은 만료되지 않습니다. 만료되지 않음 설정을 비활성화하면 양식이 만료되는 날짜를 설정할 수 있습니다. 이 날짜 이후에는 제출이 허용되지 않습니다. 양식 사용자는 양식에 액세스할 때 만료 알림을 보게 됩니다.

![양식이 만료되면 사용자는 활성화된 경우 부분 결과만 볼 수 있습니다.](./using-forms-to-poll-users/images/04.png)

### 응답자에게 부분 결과 표시

응답자가 현재 제출된 양식 레코드에서 집계된 데이터를 볼 수 있습니다. 응답자는 양식에 대한 현재 [양식 보고서](../sharing-forms-and-managing-submissions/form-reports.md#show-partial-results-to-form-respondents) 데이터를 볼 수 있습니다. 이 기능을 활성화하면 민감한 정보를 제출하지 않도록 사용자에게 경고합니다.

![민감한 정보를 공유하지 않도록 사용자에게 경고합니다.](./using-forms-to-poll-users/images/02.png)

### Liferay 양식으로 설문 조사 만들기

양식 기반 투표를 사용하여 사이트 방문자가 사이트 콘텐츠에 계속 참여하도록 하십시오.

두 개의 애플리케이션이 투표를 만들고 표시합니다. 사이트 메뉴의 *Forms* 애플리케이션과 페이지에 추가하는 *Form* 위젯입니다.

1. 사이트 메뉴에서 *Content* &rarr; *Polls*로 이동합니다. 

1. ![Add](../../images/icon-add.png) 버튼을 클릭하고 제목과 설명을 입력합니다.

1. 투표처럼 작동하도록 양식을 구성합니다. 양식 설정 창을 열고 제출 섹션으로 이동한 다음 

   - **응답자에게 부분 결과 표시**: 사용
   - **사용자당 하나의 제출로 제한**: 사용함
   - **만료되지 않음**: 원하는 경우 선택하지 않음(만료일 설정)

1. 이제 설문 조사 질문을 구성하십시오. 필요한 여러 줄 텍스트 필드를 양식에 추가합니다.

   -  **레이블:** 방문은 어땠습니까?
   -  **필드 유형:** 여러 줄
   -  **필수 필드:** 활성화됨

1. *게시* 을 클릭하여 사용자가 양식을 사용할 수 있도록 합니다.
   
   양식은 직접 링크를 통해 액세스하거나 Liferay 페이지에 양식을 표시하여 액세스할 수 있습니다. 자세한 내용은 [양식](creating-and-managing-forms/creating-forms.md#publishing-a-form) 게시를 참조하십시오. 


## 투표를 양식으로 업그레이드

Liferay 7.2 &rarr; 7.3 &rarr; 7.4의 경로를 따라 Liferay를 업그레이드하는 경우 설문 조사가 Forms를 사용하도록 자동으로 업그레이드됩니다. 7.4 수명 주기 동안 이 작업을 수행하기 위한 업그레이드 프로세스가 향상되었습니다. Liferay 7.4 GA/업데이트 27부터는 이제

- 설문 조사가 Form 엔터티가 되고 Forms 애플리케이션 및 API로 관리할 수 있도록 백엔드에서 엔터티를 변환합니다.
- 투표와 유사한 동작을 제공하는 양식 설정을 활성화합니다.
- 설문 조사가 설문 조사 표시 위젯의 페이지에 표시된 경우 업그레이드 후 양식 위젯의 페이지에 표시됩니다.

```{warning}
DXP 업데이트 27/CE GA 27 이전의 Liferay 7.4 버전 설치 [upgraded](../../installation-and-upgrades/upgrading-liferay.md)의 경우 업그레이드 프로세스가 완료되지 않았습니다. 설문 조사를 완전히 업그레이드하려면

- _사용자당 하나의 제출로 제한_ 설정이 양식에 구성되어 있는지 확인하십시오.
- 페이지에 있던 투표 표시 위젯을 양식 위젯으로 수동으로 교체합니다.
```

## 추가 정보

- [양식 생성 및 관리](./creating-and-managing-forms.md)
- [7.4의 유지 관리 모드 및 지원 중단](../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md)
