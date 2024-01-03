# 샘플 API 애플리케이션 구축

{bdg-secondary}Liferay DXP 2023.Q4+/Portal 7.4 GA96+
{bdg-link-primary}`[베타 기능](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

```{important}
API 빌더는 현재 Liferay 객체만 지원하는 베타 기능입니다.
```

모의 API 애플리케이션 예시를 보려면 아래 단계를 따르세요.

API 빌더를 활성화하려면,

1. _글로벌 메뉴_ (![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _인스턴스 설정_으로 이동합니다.

1. _Platform_ 아래의 _Feature Flags_를 클릭하세요.

1. 왼쪽 탐색 메뉴에서 _베타_를 선택하세요. _API Builder_를 켜세요. 이제 API 빌더가 활성화되었습니다.

## 샘플 개체 및 항목 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. 명령줄에서 다음 스크립트를 실행하여 'Student' 개체를 만듭니다.

   ```bash
   student=$(curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/object-admin/v1.0/object-definitions" \
   	-d "{\"label\": {\"en_US\": \"Student\"}, \"name\": \"Student\", \"panelCategoryKey\": \"control_panel.object\", \"pluralLabel\": {\"en_US\": \"Students\"}, \"scope\": \"company\"}" \
     -u "test@liferay.com:learn" | jq -r ".id")

   curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${student}/object-fields" \
   	-d "{\"businessType\": \"Text\", \"label\": {\"en_US\": \"First Name\"}, \"name\": \"firstName\", \"required\": false}" \
   	-u "test@liferay.com:learn"

   curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${student}/object-fields" \
   	-d "{\"businessType\": \"Text\", \"label\": {\"en_US\": \"Last Name\"}, \"name\": \"lastName\", \"required\": false}" \
   	-u "test@liferay.com:learn"

   curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${student}/publish" \
   	-u "test@liferay.com:learn"
   ```

1. _글로벌 메뉴_ (![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Objects_로 이동합니다. 새로운 `Student` 객체가 생성되었는지 확인하세요.

1. 명령줄에서 다음 스크립트를 실행하여 'Course' 개체를 만듭니다.

   ```bash
   course=$(curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/object-admin/v1.0/object-definitions" \
   	-d "{\"label\": {\"en_US\": \"Course\"}, \"name\": \"Course\", \"panelCategoryKey\": \"control_panel.object\", \"pluralLabel\": {\"en_US\": \"Courses\"}, \"scope\": \"company\"}" \
   	-u "test@liferay.com:learn" | jq -r ".id")

   curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${course}/object-fields" \
   	-d "{\"businessType\": \"Text\", \"label\": {\"en_US\": \"Course Name\"}, \"name\": \"courseName\", \"required\": false}" \
     -u "test@liferay.com:learn"
   ```

1. _글로벌 메뉴_ (![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Objects_로 이동합니다. 방금 생성된 'Course' 개체를 클릭합니다.

1. _관계_ 탭을 클릭하세요. _추가_(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.

1. 새 관계를 정의하려면 다음 값을 입력하십시오.

   | 분야     | 가치   |
   | :----- | :--- |
   | 라벨     | 등록   |
   | 이름     | 등록   |
   | 유형     | 원투멀리 |
   | 하나의 기록 | 과정   |
   | 많은 기록  | 학생   |

   _저장_을 클릭하세요.

1. _세부정보_ 탭을 클릭하세요. _게시_를 클릭하세요.

## 샘플 강좌 및 학생 추가

1. 명령줄에서 다음 스크립트를 실행하여 두 개의 강좌와 두 명의 학생을 만듭니다.

   ```bash
   math101=$(curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/c/courses" \
   	-d "{\"courseName\": \"Math 101\"}" \
   	-u "test@liferay.com:learn" | jq -r ".id")

   curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/c/students" \
   	-d "{\"r_enrollment_c_courseId\":${math101}, \"firstName\": \"Mary\", \"lastName\": \"Liferay\"}" \
   	-u "test@liferay.com:learn"

   history101=$(curl \
   	-H "Content-Type: application/json" \
   	-X POST \
     "http://localhost:8080/o/c/courses" \
   	-d "{\"courseName\": \"History 101\"}" \
   	-u "test@liferay.com:learn" | jq -r ".id")

   curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/c/students" \
   	-d "{\"r_enrollment_c_courseId\":${history101}, \"firstName\": \"John\", \"lastName\": \"Liferay\"}" \
   	-u "test@liferay.com:learn"
   ```

## API 애플리케이션 생성

1. _글로벌 메뉴_ (![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _API 빌더_로 이동합니다.

1. _추가_(![아이콘 추가](../../images/icon-add.png))를 클릭하세요. 새 API 애플리케이션의 제목, URL, 설명을 입력합니다.

   ![Create a new API application](./building-a-sample-api-application/images/01.png)

   | 분야  | 가치                  |
   | :-- | :------------------ |
   | 제목  | 등록                  |
   | URL | 등록                  |
   | 묘사  | 학생 등록을 가져오는 API입니다. |

   _만들기_를 클릭하세요.

1. _스키마_ 탭을 클릭하세요. _추가_(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.

1. 새 스키마의 이름, 설명 및 개체를 입력합니다.

   | 분야     | 가치                |
   | :----- | :---------------- |
   | 이름     | 수강신청              |
   | 묘사     | 강좌 목록과 수강생 목록입니다. |
   | Object | 과정                |

   _만들기_를 클릭하세요.

1. 새로 생성된 스키마의 _Properties_ 탭을 클릭합니다. 왼쪽 메뉴에서 _Course Name_을 클릭하여 'Course Name' 필드를 추가합니다.

   ![Add the course name field to the schema.](./building-a-sample-api-application/images/02.png)

1. 왼쪽 메뉴에서 _관련 객체 보기_를 클릭하세요. 속성을 확장하려면 _Student_를 클릭하세요. 왼쪽 메뉴에서 _이름_과 _성_을 클릭하여 `이름`과 `성` 필드를 추가하세요. 오른쪽 상단에 있는 _저장_을 클릭하세요.

1. 다음으로 _Endpoints_ 탭을 클릭하세요. _추가_(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.

1. 새 API 엔드포인트의 범위, 경로 및 설명을 입력합니다.

   | 분야 | 가치                            |
   | :- | :---------------------------- |
   | 범위 | 회사                            |
   | 경로 | 과정                            |
   | 묘사 | 강좌 및 해당 학생 목록을 가져오는 엔드포인트입니다. |

   _만들기_를 클릭하세요.

1. 새로 생성된 API 엔드포인트에서 _Configuration_ 탭을 클릭합니다. 응답 본문 스키마에서 이전 단계에서 생성한 _Course Registrations_ 스키마를 선택합니다. 페이지 오른쪽 상단에서 _게시_를 클릭하세요.

1. API 탐색기(예: http\://localhost:8080/o/api?endpoint=http\://localhost:8080/o/c/registration/openapi.json)로 이동하여 새 API 애플리케이션을 테스트해 보세요.

    _GETcourses_ 엔드포인트를 클릭하고 _Execute_를 클릭하세요.

    ![Execute the Get courses endpoint.](./building-a-sample-api-application/images/03.png)

    사용자 정의 API 애플리케이션은 강좌 목록과 강좌를 수강하는 학생을 반환합니다.
