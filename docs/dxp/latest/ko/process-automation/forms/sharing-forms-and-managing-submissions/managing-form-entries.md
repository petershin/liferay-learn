# 양식 항목 관리

사용자가 양식 항목 제출을 시작하면 UI를 통해 양식 항목 데이터에 액세스하거나 추가 분석 및 검토를 위해 데이터를 다른 파일 형식으로 내보낼 수 있습니다.

## 양식 항목 보기

1. _제품 메뉴_ (![Product Menu](../../../images/icon-product-menu.png))을 연 다음 _사이트 관리_ 메뉴에서 나침반 아이콘(![Compass](../../../images/icon-compass.png))을 클릭합니다. 양식이 생성된 사이트를 선택합니다.
1. _콘텐츠 & 데이터_ &rarr; _양식_로 이동합니다.
1. 양식에 대한 _작업_ (![Actions](../../../images/icon-actions.png)) 버튼을 클릭하고 _항목 보기_를 선택합니다.

    ![Forms 애플리케이션에서 바로 항목을 볼 수 있습니다. ](./managing-form-entries/images/01.png)

1. 양식에 창에 맞지 않는 여러 필드가 있는 경우 항목 옆에 있는 *작업* (![Actions](../../../images/icon-actions.png)) 버튼을 클릭하고 *보기*를 선택합니다.

    ![Forms 애플리케이션에서 바로 단일 항목을 볼 수 있습니다.](./managing-form-entries/images/02.png)

1. _View Form_ 페이지는 각 양식 페이지의 응답을 보여줍니다. *다음* 을 클릭하여 진행합니다.

    ![Forms 애플리케이션에서 개별 응답 보기.](./managing-form-entries/images/03.png)

1. _양식 항목_ 을 다시 보기 위해 돌아가려면 _뒤로_ 을 클릭하십시오.

## 양식 항목 편집

> 유효한: Liferay CE/DXP 7.3

양식 항목을 편집하려면:

1. _제품 메뉴_ (![Product Menu](../../../images/icon-product-menu.png))을 연 다음 _사이트 관리_ 메뉴에서 나침반 아이콘(![Compass](../../../images/icon-compass.png))을 클릭합니다. 양식이 생성된 사이트를 선택합니다.
1. _콘텐츠 & 데이터_ &rarr; _양식_로 이동합니다.
1. 양식에 대한 _작업_ (![Actions](../../../images/icon-actions.png)) 버튼을 클릭하고 _편집_을 선택합니다.
1. 편집이 완료되면 _제출_을 클릭하십시오.

![업데이트된 양식 항목은 점진적으로 더 높은 버전을 갖습니다.](./managing-form-entries/images/10.png)

양식 항목을 편집하려면 사용자에게 다음 권한이 필요합니다.

- 양식 인스턴스에 대한 업데이트 권한
- 사이트 및 자산 라이브러리 메뉴에 대한 보기 권한
- 사이트 및 자산 라이브러리 관리의 Forms 애플리케이션에 대한 액세스 권한

![권한이 있는 사용자는 양식 항목을 편집할 수 있습니다.](./managing-form-entries/images/09.png)

```{note}
양식 인스턴스에 대한 업데이트 권한은 양식 자체를 편집하는 데 필요한 것과 동일한 권한입니다.
```

양식 인스턴스 업데이트 권한은 Forms 애플리케이션으로 이동한 다음 단일 양식에 대한 작업 메뉴(![Actions](../../../images/icon-actions.png))를 열어 단일 양식에 부여할 수도 있습니다. _권한_을 선택합니다. 양식에 대한 권한 편집기에서 역할에 _업데이트_ 권한을 부여하십시오. 이러한 사용자는 여전히 _사이트 및 자산 라이브러리 보기 메뉴_ 및 _양식: 사이트 및 자산 라이브러리 관리에서 액세스_을 가지고 있어야 합니다.

## 양식 항목 내보내기

양식 항목을 내보내려면:

1. 사이트의 _Content & Data_ 섹션에서 Forms 애플리케이션으로 이동합니다.
1. 양식 옆에 있는 *작업* (![Actions](../../../images/icon-actions.png)) 버튼을 클릭하고 *내보내기*를 선택합니다.

    ![양식 항목 내보내기](./managing-form-entries/images/04.png)

1. 파일 확장자를 선택하십시오. 항목을 `CSV`, `JSON`, `XLS`또는 `XML`로 내보낼 수 있습니다.

    ![파일 유형을 선택하십시오](./managing-form-entries/images/05.png)

1. *확인* 을 클릭한 다음 파일을 열거나 로컬로 저장합니다.

### CSV 내보내기 비활성화

관리자가 항목을 CSV 형식으로 내보낼 수 있는지 여부를 결정하는 시스템 수준 설정이 있습니다.

1. _제어판_ &rarr; _구성_ &rarr; _시스템 설정_으로 이동합니다.
1. _Content & Data_에서 _Forms_ 카테고리를 클릭합니다.
1. _SITE SCOPE_ 메뉴에서 _Forms_ 항목을 클릭합니다.
1. CSV 내보내기 속성에는 세 가지 옵션이 있습니다.

    * **경고 없이 CSV 내보내기를 활성화하려면** 을 활성화합니다.
    * **활성화됨(경고 표시) 관리자에게 다음 경고와 함께 CSV 내보내기를 활성화하려면** 입니다.

        `This CSV file contains user supplied inputs. Opening a CSV file in a spreadsheet program may be dangerous.`

    * **CSV 내보내기를 끄려면** 을 비활성화합니다.

   ![내보내기 기능 구성](./managing-form-entries/images/06.png)

1. 항목 내보내기 기능을 활성화하거나 비활성화하는 옵션을 선택합니다.
1. 완료되면 _저장_ 을 클릭합니다.

## 양식 항목 삭제

1. _사이트 관리_ &rarr; _콘텐츠 & 데이터_ &rarr; _양식_로 이동합니다.
1. 선택한 양식 옆에 있는 _작업_ (![Actions](../../../images/icon-actions.png)) 버튼을 클릭하고 _항목 보기_를 선택합니다.
1. **Filter and Order**옆의 상자를 선택하여 모든 항목을 선택하십시오. Form Entries 화면의 오른쪽 상단 모서리에 _X_ 이 나타납니다.

    ![한 번에 모든 양식 항목을 삭제하십시오.](./managing-form-entries/images/07.png)

1. 모든 항목을 삭제하려면 _X_ 버튼을 클릭합니다.

또는 사용자는 하나의 항목만 삭제할 수 있습니다. 선택한 항목 옆의 상자를 선택한 다음 오른쪽 상단 모서리에 있는 _X_ 을 클릭합니다. _확인_ 을 클릭하여 명령을 확인합니다.

## 관련 항목

* [양식 보고서](./form-reports.md)
