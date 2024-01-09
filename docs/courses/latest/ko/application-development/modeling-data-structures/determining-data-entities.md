# 데이터 엔터티 결정

여기에서는 다음 네 단계로 Distributor Application 개체를 만듭니다.

1. [배포자 애플리케이션 개체 추가](#adding-the-distributor-application-object)
1. [객체 구성](#configuring-the-object)
1. [사용자 정의 필드 추가](#adding-a-custom-field)
1. [객체 게시](#publishing-the-distributor-application-object)

![Create the Distributor Application object.](./determining-data-entities/images/01.png)

개체 정의를 게시한 후 [배포자 응용 프로그램 개체 사용](#using-distributor-applications) 을 연습하여 항목을 만들 수 있습니다.

## 배포자 응용 프로그램 개체 추가

1. **전역 메뉴**( ![전역 메뉴](../../images/icon-applications-menu.png) )를 열고 **제어판** 탭으로 이동한 다음 **개체** 를 클릭합니다.

1. **추가**( ![추가 버튼](../../images/icon-add.png) )를 클릭합니다.

1. 다음 세부정보를 입력하세요.

   | 분야     | 가치                       |
   | :----- | :----------------------- |
   | 라벨     | 대리점 신청                   |
   | 복수 라벨  | 대리점 신청                   |
   | 객체 이름  | `DistributorApplication` |
   | 저장소 유형 | 기본                       |

   ![Enter a label, plural label, object name, and storage type.](./determining-data-entities/images/02.png)

1. **저장** 을 클릭하세요.

   그러면 다음 시스템 필드를 사용하여 초안 객체 정의가 생성됩니다.

   * `createDate`
   * `creator`
   * `externalReferenceCode`
   * `id`
   * `modifiedDate`
   * `status`

   ![Liferay creates an object draft.](./determining-data-entities/images/03.png)

## 객체 구성

개체 정의에는 일반 세부 정보, 동작 및 사용 가능한 기능을 수정하기 위한 구성 옵션이 포함되어 있습니다. 예를 들어, 각 개체의 데이터 범위를 지정하는 방법, 사용자가 UI에서 데이터에 액세스할 수 있는 사이트, 항목 이벤트 기록을 유지할지 여부를 결정할 수 있습니다.

배포자 애플리케이션을 다음과 같이 구성합니다.

1. 객체 정의 초안 편집을 시작합니다.

1. 정의의 ERC(외부 참조 코드)를 변경합니다. 일관되고 사람이 읽을 수 있는 ERC는 인스턴스 간에 객체 정의를 이동하고 API를 통해 참조하는 데 도움이 될 수 있습니다.

   * **편집**(![편집 버튼](../../images/icon-edit.png))을 클릭합니다.
   * UUID를 `C_DISTRIBUTOR_APPLICATION`으로 바꿉니다.
   * **저장** 을 클릭하세요.

   ![Update the definition's ERC to C **DISTRIBUTOR** APPLICATION.](./determining-data-entities/images/04.png)

1. 세부 정보 탭에서 다음 설정을 구성합니다.

   | 분야               | 가치       |
   | :--------------- | :------- |
   | 항목 표시 > 제목 필드    | ID       |
   | 범위 > 범위          | 회사       |
   | 범위 > 패널 카테고리 키   | 제어판 > 개체 |
   | 계정 제한 > 활성       | 틀린       |
   | 계정 제한 > 계정 제한 필드 | N/A      |
   | 구성 > 위젯 표시       | 여실한      |
   | 구성 > 분류 활성화      | 여실한      |
   | 구성 > 댓글 활성화      | 틀린       |
   | 구성 > 항목 기록 활성화   | 틀린       |

   이는 인스턴스별로 데이터를 저장하고 패널 범주 키(예: Control 패널 &rarr; 개체). 또한 사용자는 사이트 페이지에 개체를 위젯으로 추가하고 배포자 응용 프로그램 항목에 태그와 범주를 할당할 수 있습니다.

1. **저장** 을 클릭하세요.

## 사용자 정의 필드 추가

객체 정의를 게시하려면 먼저 하나 이상의 필드가 있어야 합니다.

1. **필드** 탭으로 이동합니다.

1. **추가**( ![추가 버튼](../../images/icon-add.png) )를 클릭합니다.

1. 다음 값을 입력하세요.

   | 분야        | 가치              |
   | :-------- | :-------------- |
   | 라벨        | 신청자 이름          |
   | 필드 이름     | `applicantName` |
   | 유형        | 원본              |
   | 필수적인      | 여실한             |
   | 고유한 값만 허용 | 틀린              |

   ![Add these values for the field.](./determining-data-entities/images/05.png)

1. **저장** 을 클릭하세요.

   새 필드가 '사용자 정의' 배지와 함께 필드 탭에 나타납니다.

   ![Confirm the custom field appears in the Fields tab.](./determining-data-entities/images/06.png)

## 배포자 애플리케이션 개체 게시

사용자 정의 개체를 게시하면 Liferay는 데이터 항목을 저장하기 위한 데이터베이스 테이블을 만듭니다. 게시는 또한 객체를 OSGi 프레임워크에 등록하고 이를 [객체 통합 이해](https://learn.liferay.com/w/dxp/building-applications/objects/understanding-object-integrations) 과 통합합니다(예: 권한, 워크플로, 헤드리스)이며 기본 사용자 인터페이스를 제공합니다.

1. 개체의 세부정보 탭으로 이동합니다.

1. **게시** 를 클릭하세요.

   ![In the Details tab, click Publish.](./determining-data-entities/images/07.png)

그러면 Distributor Application이 활성화되고 기본 시스템 필드와 함께 'applicantName' 필드가 포함된 데이터베이스 테이블이 생성됩니다. 자세한 내용은 [객체 생성](https://learn.liferay.com/ko/w/dxp/building-applications/objects/creating-and-managing-objects/creating-objects#publishing-object-drafts) 를 참조하세요. 출판 중에 무슨 일이 일어나는지.

## 배포자 응용 프로그램 사용

이제 배포자 애플리케이션이 게시되었으므로 사용을 시작할 수 있습니다.

1. **전역 메뉴**( ![전역 메뉴](../../images/icon-applications-menu.png) )를 열고 **제어판** 탭으로 이동한 다음 **배포자 응용 프로그램** 을 클릭합니다.

   ![Access the application in the Global Menu under Control Panel > Objects.](./determining-data-entities/images/08.png)

1. **추가**( ![추가 버튼](../../images/icon-add.png) )를 클릭합니다.

1. 신청자 이름을 입력하고 **저장** 을 클릭하세요.

1. 성공적인 항목 생성을 확인하려면 배포자 응용 프로그램 페이지로 돌아갑니다.

   여기서 항목은 `id`, `status` 및 `author` 시스템 필드와 함께 개체의 사용자 정의 필드를 포함하는 테이블에 나타납니다.

   ![The application page for Distributor Application uses a default table view.](./determining-data-entities/images/09.png)

1. 항목에 대해 **작업**(![작업 버튼](../../images/icon-actions.png))을 클릭하고 **삭제** 를 선택합니다.

1. 계속 진행하기 전에 항목 생성, 업데이트 및 제거를 연습하세요.

게시하는 동안 배포자 응용 프로그램에 대해 생성된 REST API를 사용하여 항목을 생성, 편집, 쿼리 및 제거할 수도 있습니다. 이러한 API는 `c/distributorapplications` 경로에서 사용할 수 있습니다. 사용 가능한 API의 전체 목록은 [사용자 정의 개체 API 사용](https://learn.liferay.com/ko/w/dxp/building-applications/objects/understanding-object-integrations/using-custom-object-apis) 을 참조하세요. 및 입문 튜토리얼인 [Custom Object API Basics](https://learn.liferay.com/en/w/dxp/building-applications/objects/objects-tutorials/using-apis/object-api-basics) 를 참조하세요.

![Liferay generates REST APIs for Distributor Application.](./determining-data-entities/images/10.png)

이제 개체가 정의되었으므로 더 많은 필드를 추가하여 필요한 신청자 정보를 수집할 수 있습니다.

다음: [배포자 응용 프로그램 개체에 필드 추가](./adding-fields-to-the-distributor-application-object.md)

## 관련 개념

* [개체](https://learn.liferay.com/ko/w/dxp/building-applications/objects)
* [객체 생성](https://learn.liferay.com/ko/w/dxp/building-applications/objects/creating-and-managing-objects/creating-objects)
* [객체 통합 이해](https://learn.liferay.com/w/dxp/building-applications/objects/understanding-object-integrations)
