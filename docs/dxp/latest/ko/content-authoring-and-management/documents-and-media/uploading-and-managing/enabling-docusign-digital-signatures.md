# DocuSign 디지털 서명 활성화

> 사용 가능: Liferay Portal 7.4 GA3+

이제 [DocuSign](https://www.docusign.com/) 디지털 서명을 Liferay 문서에 통합할 수 있습니다. DocuSign은 전자 서명할 문서를 관리하는 서비스입니다. 이 통합을 통해 문서의 서명을 관리하고 수집할 수 있습니다.

Liferay에서 디지털 서명을 활성화하기 전에 사용자 ID 키, API 계정 키, 계정 기반 URI, 통합 키 및 RSA 개인 키를 생성하고 검색했는지 확인하십시오. 이에 대한 지침은 [DocuSign 웹사이트](https://support.docusign.com/en/guides/ndse-admin-guide-api-and-keys) 에서 찾을 수 있습니다.

## 디지털 서명 활성화

1. 오른쪽 상단 모서리에서 전역 메뉴를 엽니다. ![글로벌 메뉴](../../../images/icon-applications-menu.png)

1. 클릭 **제어판** &rarr; **인스턴스 설정** &rarr; **디지털 서명** .

    ![디지털 서명 링크는 인스턴스 설정 또는 사이트 설정에 나타납니다.](./enabling-docusign-digital-signatures/images/01.png)

1. 토글을 **Enabled** 로 전환하십시오.

    ![토글을 전환합니다.](./enabling-docusign-digital-signatures/images/02.png)

1. **사이트 설정 전략** 을 선택합니다(아래 참조).

    ![사이트 설정 전략은 디지털 서명의 범위를 정의합니다.](./enabling-docusign-digital-signatures/images/03.png)

1. **저장** 을 클릭합니다.

사이트 설정 전략에는 세 가지 옵션이 있습니다.

**항상 상속:** 모든 사이트가 이 설정에 연결됩니다.

**항상 재정의:** 모든 사이트는 자체 구성을 제공해야 합니다.

**상속 또는 재정의:** 인스턴스 설정 및 사이트 설정 모두에서 정의할 수 있습니다. 둘 다에 정의된 경우 사이트 설정이 인스턴스 설정보다 우선합니다.

이제 Liferay의 적절한 범위에서 DocuSign의 디지털 키를 추가해야 합니다.

## 디지털 키 추가

사이트 설정 전략에 대해 선택한 항목에 따라 [적절한 범위](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)에 디지털 키를 추가합니다.

- 항상 상속을 선택한 경우 인스턴스 설정에서 키를 추가합니다.
- 항상 재정의를 선택한 경우 사이트 설정에서 키를 추가합니다.
- 상속 또는 재정의를 선택한 경우 두 사이트 중 하나에 키를 추가합니다.

1. **제어판** &rarr; **인스턴스 설정** &rarr; **디지털 서명** 또는 사이트 설정의 경우 **사이트 메뉴** &rarr; **구성** &rarr; **사이트 설정** &rarr; **디지털 서명** 로 이동합니다.

1. 아직 전환되지 않은 경우 토글을 **Enabled** 로 전환합니다.

1. DocuSign 웹사이트에서 이전에 검색한 사용자 ID, API 계정 ID, 계정의 기본 URI, 통합 키 및 RSA 개인 키를 입력합니다.

1. **저장** 을 클릭하여 디지털 서명을 활성화합니다.

## 문서 및 미디어에서 문서 서명 수집

1. 디지털 서명을 수집할 문서를 찾은 후 **작업** &rarr; **디지털 서명 수집** 을 클릭합니다.

    ![작업 및 디지털 서명 수집 버튼을 볼 수 있습니다.](./enabling-docusign-digital-signatures/images/04.png)

1. 여러 문서의 경우 서명을 수집할 문서를 선택하고 **디지털 서명 수집**(![Collect Digital Signature](../../../images/icon-digital-signature.png))을 클릭합니다.

   ![선택한 여러 파일과 디지털 서명 수집 버튼을 볼 수 있습니다.](./enabling-docusign-digital-signatures/images/05.png)

1. **봉투** 의 정보를 입력하고 **보내기** 를 클릭합니다.

    ![봉투의 정보를 입력합니다.](./enabling-docusign-digital-signatures/images/06.png)

1. 봉투가 발송되면 수신자는 [DocuSign의](https://www.docusign.com/products/electronic-signature/how-docusign-works) 과정을 거쳐 문서에 서명해야 합니다.

## 봉투 상태 추적

DocuSign은 **봉투** 이라는 용어를 사용하여 서명할 문서 또는 문서 모음을 나타냅니다. 전송되면 Liferay 내에서 봉투 상태를 추적할 수 있습니다.

```{tip}
[DocuSign 웹사이트](https://support.docusign.com/en/guides/ndse-user-guide-document-status) 에서 다양한 상태 레이블을 확인할 수 있습니다. 
```

1. **사이트 메뉴**(![Site Menu](../../../images/icon-menu.png)) &rarr; **콘텐츠 & 데이터** &rarr; **디지털 서명** 를 열어 생성된 봉투 목록을 확인합니다.

1. ![Add Button](../../../images/icon-add.png)을 사용하여 이 화면에서 직접 봉투를 만들 수도 있습니다. 정보를 입력하는 봉투 화면이 표시됩니다.

1. **Filter 및 Order** 을 사용하거나 검색 표시줄에 키워드를 입력하여 사용 가능한 봉투 목록을 필터링하고 정렬합니다.

    ![필터 및 순서 또는 검색 표시줄을 통해 문서를 구성합니다.](./enabling-docusign-digital-signatures/images/07.png)

## 문서 다운로드

1. 세부 정보를 보려면 봉투 이름을 클릭합니다. **다운로드** 버튼을 클릭하거나 **작업 버튼** 을 클릭하여 문서를 다운로드할 수 있습니다. ![작업 버튼](../../../images/icon-actions.png) 디지털 서명 화면에서

   ```{important}
   _다운로드_를 클릭하면 Liferay가 아닌 DocuSign에서 문서를 가져옵니다. Liferay는 서명된 문서를 저장하지 않기 때문입니다. 문서가 부분적으로 서명되었거나 완전히 서명되었는지 여부에 관계없이 다운로드 버튼은 최신 상태를 검색합니다.
   ```

   ![Liferay 내부에서 봉투의 세부 정보를 볼 수 있습니다.](./enabling-docusign-digital-signatures/images/08.png)

```{warning}
디지털 서명 구성을 비활성화하면 제어판의 디지털 서명 모듈을 포함하여 DocuSign에 대한 모든 참조가 제거됩니다. Liferay에서 이 기능을 비활성화해도 DocuSign에서 모든 봉투를 계속 볼 수 있습니다. 디지털 서명을 다시 활성화하면 목록이 다시 나타납니다.
```

## 추가 정보

- [구성 범위 이해](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)
