# 사용자 정의 레이아웃에 관계 추가

관계 필드는 개체의 기본 레이아웃에 자동으로 나타납니다. 관계 테이블은 그렇지 않습니다. 관계를 테스트하려면 관계 테이블을 포함하도록 배포자 애플리케이션의 사용자 정의 레이아웃을 업데이트합니다.

여기에서는 관계 테이블을 포함하도록 배포자 애플리케이션의 사용자 정의 레이아웃을 업데이트합니다. 그런 다음 관계 필드를 포함하는 애플리케이션 평가용 사용자 정의 레이아웃을 만듭니다.

## 배포자 애플리케이션의 레이아웃에 관계 테이블 추가

1. Distributor Application 개체를 편집하는 동안 *레이아웃* 탭으로 이동하여 레이아웃 편집을 시작합니다.

1. 정보 탭에서 레이아웃 이름을 *Layout with Relationship Table*로 바꿉니다.

   ![레이아웃 이름을 관계 테이블이 있는 레이아웃으로 바꿉니다.](./adding-the-relationship-to-custom-layouts/images/01.png)

1. *레이아웃* 탭으로 이동합니다.

1. *탭 추가*클릭하고 세부 정보를 입력한 후 *저장*클릭합니다.

   | 분야           | 가치           |
   |:------------ |:------------ |
   | 라벨           | 평가 노트        |
   | 유형           | Relationship |
   | Relationship | 평가에의 적용      |

   ![관계 탭을 추가합니다.](./adding-the-relationship-to-custom-layouts/images/02.png)

1. 레이아웃 하단에 관계 탭이 나타나는지 확인합니다.

   ![레이아웃에 관계 탭이 나타나는지 확인합니다.](./adding-the-relationship-to-custom-layouts/images/03.png)

## 응용 프로그램 평가의 레이아웃 및 보기에 관계 필드 추가

1. 이 연습 [에 대한 리소스를 다운로드하고 압축](./liferay-h2x9.zip)풉니다.

   ```bash
   curl https://learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/liferay-h2x9.zip -O
   ```

   ```bash
   unzip liferay-h2x9.zip
   ```

1. `liferay-h2x9` 폴더의 `컬` 폴더로 이동합니다.

   ```bash
   cd liferay-h2x9/curl
   ```

1. 애플리케이션 평가를 위한 새로운 기본 레이아웃을 생성하려면 다음 스크립트를 실행하세요.

   ```bash
   ./ObjectLayout_POST_LayoutWithRelationship_ByExternalReferenceCode.sh
   ```

1. 새 레이아웃이 나타나고 관계 필드가 포함되어 있는지 확인합니다.

   ![새 레이아웃에 관계 필드가 포함되어 있는지 확인합니다.](./adding-the-relationship-to-custom-layouts/images/04.png)

1. 조회수 *회* 탭으로 이동합니다.

1. 애플리케이션 평가를 위한 새로운 기본 보기를 생성하려면 다음 스크립트를 실행하세요.

   ```bash
   ./ObjectView_POST_ViewWithRelationship_ByExternalReferenceCode.sh
   ```

1. 새 보기가 나타나고 관계 필드가 포함되어 있는지 확인합니다.

   ![새 보기에 관계 필드가 포함되어 있는지 확인합니다.](./adding-the-relationship-to-custom-layouts/images/05.png)

이제 개체 항목 관련을 연습할 수 있습니다!

다음: [개체 항목 관련](./relating-object-entries.md)
