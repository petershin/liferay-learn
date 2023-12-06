# 검색 사이트 필드 사용

검색 사이트 필드를 사용하면 사용자가 Google의 Maps JavaScript API 및 Google Places API와 상호 작용하여 사이트를 선택하고 양식에서 자동으로 입력되는 필드를 가져올 수 있습니다.

- 주소(예: 1400 Montefino Ave.)
- 도시(예: 다이아몬드 바)
- 주(예: 캘리포니아)
- 우편 번호(예: 91765)
- 국가(예: 미국)

양식의 모든 필드를 표시할 필요는 없습니다.

## 검색 사이트 필드 추가 및 구성

검색 사이트 필드를 양식에 추가하려면

1. JavaScript Google Maps API 및 Google Places API를 활성화합니다.

   - 검색 사이트 필드를 양식에 추가하십시오. Google Places API 키가 사이트에 구성되어 있지 않으면 필드에 경고 메시지가 표시됩니다.

       ![검색 사이트 필드는 API 키가 구성되지 않은 시기를 감지합니다.](./using-the-search-location-field/images/01.png)

   - Google Places API와 Maps JavaScript API를 모두 사용하기 위한 단일 API 키를 얻습니다.
   - 필드 경고 메시지의 링크를 클릭하거나 사이트 설정(플랫폼) &rarr; Google 지역 정보로 이동합니다. 또는 동일한 인스턴스 설정 구성 항목을 사용하십시오.

       ![API 키는 Google Places API 및 Maps JavaScript API를 활성화해야 합니다.](./using-the-search-location-field/images/02.png)

   - Google Places API 키를 입력하고 **저장** 을 클릭합니다.

1. 이제 양식에서 필드를 구성하십시오. 필드 설정 필드 레이블, 보이는 필드 및 레이아웃에 특히 주의하십시오.

    - **필드 레이블** 은 양식에서 필드의 레이블을 변경하기 위한 것입니다. 예를 들어 사이트 검색 대신 사이트 조회를 선택할 수 있습니다.
    - **Visible Fields** 은 양식에서 표시하고 자동으로 채워야 하는 하위 필드를 구성합니다. **검색 사이트** 텍스트 필드는 항상 표시됩니다(레이블을 사용자 정의할 수 있음). 주소, 도시, 주, 우편 번호 및/또는 국가 하위 필드를 포함하도록 선택합니다.
    - **레이아웃** 은 검색 사이트 및 해당 하위 필드가 단일 열 또는 두 열에 표시되는지 여부를 결정합니다.

## 검색 사이트 필드에 데이터 입력

[양식이 게시되면](./creating-forms.md#publishing-a-form) 사용자는 사이트에 대한 내용을 입력하여 검색 사이트 필드와 상호 작용합니다. 필드 설정에서 볼 수 있도록 구성된 모든 필드는 제시된 옵션에서 사이트를 선택하면 자동으로 채워집니다.

![사이트 입력을 시작하면 Google API가 선택할 수 있는 유효한 사이트를 자동 완성합니다.](./using-the-search-location-field/images/03.png)

## 관련 내용

* [사이트 설정 UI 참조](../../../site-building/site-settings/site-settings-ui-reference.md)
* [양식 만들기](creating-forms.md)
* [REST 데이터 공급자를 사용하여 양식 옵션 채우기](../data-providers/using-the-rest-data-provider-to-populate-form-options.md)
