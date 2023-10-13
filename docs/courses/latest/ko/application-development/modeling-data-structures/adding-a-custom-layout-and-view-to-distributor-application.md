# 배포자 애플리케이션에 사용자 정의 레이아웃 및 보기 추가

50개가 넘는 필드가 있는 배포자 응용 프로그램의 현재 사용자 인터페이스는 더 이상 항목을 생성하고 표시하는 데 사용할 수 없습니다. 기본 [레이아웃](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/layouts) 과 [뷰](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/views) 에는 모든 개체 필드가 포함되어 알파벳순으로 표시되기 때문입니다. 레이아웃은 개체 항목을 생성하고 편집하기 위한 UI를 제공하고, 보기는 기존 항목을 보고 관리하기 위한 UI를 제공합니다.

데이터 구조 모델링을 진행하기 전에 cURL 스크립트를 사용하여 배포자 애플리케이션에 대한 사용자 정의 레이아웃과 보기를 만듭니다.

```{note}
후속 강의에서는 Liferay의 페이지 빌더 기능을 사용하여 매력적이고 반응이 빠른 사용자 인터페이스를 디자인하는 방법을 살펴봅니다. 여기에서 사용자 정의 레이아웃과 보기는 개발 중 데모 목적으로 사용됩니다.
```

## 레이아웃 및 보기 추가

1. [이 연습](./liferay-t7z2.zip) 에 대한 리소스를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/liferay-t7z2.zip -O
   ```

   ```bash
   unzip liferay-t7z2.zip
   ```

   이 .zip 파일에는 `object-admin` REST API를 사용하여 배포자 응용 프로그램 개체에 레이아웃과 보기를 추가하는 셸 스크립트가 포함되어 있습니다.

1. `liferay-t7z2/curl`로 이동합니다.

   ```bash
   cd liferay-t7z2/curl
   ```

1. 레이아웃을 추가하려면 다음 스크립트를 실행하세요.

   ```bash
   ./ObjectLayout_POST_BasicLayout_ByExternalReferenceCode.sh
   ```

1. 배포자 응용 프로그램 개체의 레이아웃 탭에 기본 레이아웃이 나타나는지 확인합니다.

   ![배포자 응용 프로그램 개체의 레이아웃 탭에 기본 레이아웃이 나타나는지 확인합니다.](./adding-a-custom-layout-and-view-to-distributor-application/images/01.png)

   레이아웃에는 두 개의 탭이 포함되어 있으며 필드를 축소 가능한 블록으로 구성합니다.

   * 첫 번째 탭은 항목 생성 중에 사용할 수 있으며 일반 세부 정보, 연락처 정보, 회사 세부 정보, 회사 주소, 추가 비즈니스 정보 및 첨부 파일의 6개 섹션을 포함합니다.

   * 두 번째 탭은 기존 신청서를 편집할 때만 사용할 수 있으며 은행 세부정보 및 신용 참조 세부정보라는 두 섹션이 포함되어 있습니다.

   ![레이아웃은 필드를 두 개의 탭으로 구성합니다.](./adding-a-custom-layout-and-view-to-distributor-application/images/02.png)

1. 뷰를 추가합니다:

   ```bash
   ./ObjectView_POST_BasicView_ByExternalReferenceCode.sh
   ```

1. 배포자 응용 프로그램 개체의 보기 탭에 기본 보기가 나타나는지 확인합니다.

   ![배포자 응용 프로그램 개체의 보기 탭에 기본 보기가 나타나는지 확인합니다.](./adding-a-custom-layout-and-view-to-distributor-application/images/03.png)

   보기에는 ID, 신청자 이름, 회사 이름, 생성 날짜, 상태 등 5개의 열이 포함되어 있습니다.

   ![보기에는 ID, 신청자 이름, 회사 이름, 생성 날짜, 상태 등 5개의 열이 포함되어 있습니다.](./adding-a-custom-layout-and-view-to-distributor-application/images/04.png)

사용자 정의 레이아웃과 보기는 Distributor 애플리케이션의 기본값으로 표시되므로 즉시 활성화됩니다.

## 사용자 정의 레이아웃 및 보기 사용

Distributor Application 개체에서 항목 만들기를 연습하여 개체가 새 레이아웃과 보기를 사용하고 있는지 확인하세요.

* 배치:

   ![레이아웃에는 두 개의 탭이 포함되어 있으며 필드를 축소 가능한 블록으로 구성합니다.](./adding-a-custom-layout-and-view-to-distributor-application/images/05.png)

* 보기:

   ![뷰는 5개의 열이 있는 테이블을 정의합니다.](./adding-a-custom-layout-and-view-to-distributor-application/images/06.png)

지금까지 Delectable Bonsai가 KYC 정책을 따르고, AML 법률을 준수하고, 각 응용 프로그램의 예상 가치를 평가하는 데 필요한 모든 필드와 선택 목록을 추가했습니다.

이제 Delectable Bonsai에는 평가 메모를 저장하고 이를 특정 응용 프로그램과 연결하는 방법이 필요합니다. 이를 위해 애플리케이션 평가 정의를 설정하고 개체 관계를 구현합니다.

다음: [애플리케이션 평가 개체 설정](./setting-up-the-application-evaluation-object.md)

## 관련 개념

* [배치](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/layouts)
* [전망](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/views)
