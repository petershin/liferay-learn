# 응용 프로그램 평가 개체 설정

신청서를 검토할 때, Delectable Bonsai는 받은 각 배포자 신청서에 대한 평가 노트를 저장해야 합니다. 이를 달성하기 위해 Delectable Bonsai 개발 팀은 애플리케이션 평가 개체를 생성하고 필요한 필드를 추가했습니다.

![Import the Application Evaluation object](./setting-up-the-application-evaluation-object/images/01.png)

이 개체 정의는 별도의 환경에서 생성되었지만 배포자 응용 프로그램 개체를 사용하여 환경으로 가져올 수 있도록 JSON으로 내보냈습니다.

여기서는 이 JSON 파일을 사용하여 애플리케이션 평가 개체를 Liferay 인스턴스로 가져옵니다. 하지만 먼저 `headless-admin-list-type` REST API를 사용하여 개체의 선택 목록을 만듭니다. <!--TASK: Use the batch client extension instead. 이 방법으로 목록과 개체를 추가할 수 있습니다.-->

## 선택 목록 만들기

응용 프로그램 평가 개체에는 평가 점수, 권장 사항 및 결정과 같은 선택 목록이 필요합니다.

1. 이 연습 [에 대한 리소스를 다운로드하고 압축](./liferay-w1m9.zip) 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/liferay-w1m9.zip -O
   ```

   ```bash
   unzip liferay-w1m9.zip
   ```

1. `liferay-w1m9` 폴더의 `curl` 폴더로 이동합니다.

   ```bash
   cd liferay-w1m9/curl
   ```

1. 애플리케이션 평가 개체에 대한 세 가지 선택 목록을 생성하려면 다음 명령을 실행합니다.

   ```bash
   ./ListTypeDefinition_POST_ToInstance.sh
   ```

1. 선택 목록이 나타나는지 확인합니다.

   ![Verify the picklists appear.](./setting-up-the-application-evaluation-object/images/02.png)

선택 목록이 준비되면 응용 프로그램 평가 개체를 가져올 수 있습니다.

## 애플리케이션 평가 개체 가져오기

1. **전역 메뉴**( ![전역 메뉴](../../images/icon-applications-menu.png) )를 열고 **제어판** 탭으로 이동한 다음 **개체** 를 클릭합니다.

1. 응용 프로그램 표시줄에서 **작업**( ![작업 버튼](../../images/icon-actions.png) )을 클릭하고 **가져오기** 를 선택합니다.

1. 세부정보를 입력하고 **가져오기** 를 클릭하세요.

   | 분야      | 가치                                  |
   | :------ | :---------------------------------- |
   | 이름      | `ApplicationEvaluation`             |
   | JSON 파일 | `Object_ApplicationEvaluation.json` |

   애플리케이션 평가 JSON 파일은 `liferay-w1m9` 폴더에 있습니다. 이 파일에는 일반 구성 및 사용자 정의 필드를 포함하여 개체의 기본 스키마가 포함되어 있습니다.

   ![Import the Object\_ApplicationEvaluation.json file.](./setting-up-the-application-evaluation-object/images/03.png)

1. 객체 정의 편집을 시작합니다.

   ![Begin editing the object definition.](./setting-up-the-application-evaluation-object/images/04.png)

1. 객체에 다음과 같은 사용자 정의 필드가 포함되어 있는지 확인하세요.

   - 비즈니스 이름
   - 평가 점수
   - 부착
   - 결정
   - 인터뷰 노트
   - 추천댓글
   - 권장 사항

   ![Verify the object includes these custom fields.](./setting-up-the-application-evaluation-object/images/05.png)

1. **세부정보** 탭으로 이동하세요.

1. **게시** 를 클릭하세요.

엄청난! 맛있는 분재는 이 개체를 사용하여 잠재 배포자에 대한 메모를 저장할 수 있습니다.

이제 배포자 응용 프로그램과 응용 프로그램 평가 개체 간의 관계를 정의하여 해당 항목을 연결할 수 있습니다.

다음: [개체 정의 간의 관계 추가](./adding-a-relationship-between-the-object-definitions.md)
