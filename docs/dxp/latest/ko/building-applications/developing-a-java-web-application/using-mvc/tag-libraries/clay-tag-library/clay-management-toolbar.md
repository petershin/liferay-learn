# 점토 관리 도구 모음

관리 도구 모음을 통해 관리자는 앱에서 검색 컨테이너 결과를 제어할 수 있습니다. 검색 결과에 대한 보기 유형을 필터링, 정렬 및 선택할 수 있으므로 문서, 웹 콘텐츠, 자산 항목 또는 찾고 있는 항목을 빠르게 식별할 수 있습니다. 관리 도구 모음은 완전히 사용자 정의할 수 있으므로 모든 컨트롤을 구현하거나 앱에 필요한 컨트롤만 구현할 수 있습니다.

![관리 도구 모음을 사용하면 앱이 콘텐츠를 표시하는 방법을 사용자 지정할 수 있습니다.](./clay-management-toolbar/images/01.png)

관리 도구 모음을 만들려면 `clay:management-toolbar` taglib를 사용합니다. 도구 모음에는 몇 가지 주요 섹션이 포함되어 있습니다. 각 섹션은 서로 다른 속성을 사용하여 그룹화되고 구성됩니다. 이러한 속성은 아래에서 자세히 설명합니다.

## 디스플레이 컨텍스트를 사용하여 관리 도구 모음 구성

표시 컨텍스트(관리 도구 모음에 대한 표시 옵션을 구성하는 별도의 클래스)를 사용하여 도구 모음에 대한 구성 옵션의 전부 또는 일부를 정의하는 경우 `displayContext` 로 표시 컨텍스트를 지정할 수 있습니다. 기인하다. 아래에 예가 나와 있습니다.

```jsp
<clay:management-toolbar 
    displayContext="<%= viewUADEntitiesManagementToolbarDisplayContext %>" 
/>
```

[관리 도구 모음으로 항목 필터링 및 정렬](https://help.liferay.com/hc/en-us/articles/360029526932-Filtering-and-Sorting-Items-with-the-Management-Toolbar)에서 표시 컨텍스트의 사용 사례 예를 볼 수 있습니다. 관리 도구 모음의 구성에는 디스플레이 컨텍스트가 필요하지 않습니다. 표시 컨텍스트를 통해 관리 도구 모음에 대한 구성 옵션을 원하는 만큼 제공할 수 있습니다.

## 확인란 및 작업

`actionItems`, `searchContainerId`, `선택 가능한`및 `totalItems` 속성을 사용하면 도구 모음에 확인란을 포함하여 모든 검색 컨테이너 결과를 선택하고 그에 대해 대량 작업을 실행할 수 있습니다. 작업 및 총 항목은 개별 결과를 선택하거나 도구 모음에서 마스터 확인란을 선택하면 표시됩니다.

`actionItems`: 결과를 체크하거나 관리 도구 모음의 마스터 체크박스를 체크했을 때 표시되는 드롭다운 항목 목록입니다. 페이지 간에 여러 결과를 선택할 수 있습니다. 관리 도구 모음은 선택한 결과의 수를 추적합니다.

`searchContainerId`: Management Toolbar에 연결된 검색 컨테이너의 ID

`선택 가능`: 관리 툴바에 체크박스 포함 여부

`totalItems`: 페이지 매김 전체 항목의 총 수입니다. 이 숫자는 하나 이상의 항목을 선택한 경우에 표시됩니다.

구성 예는 다음과 같습니다.

```jsp
actionItems="<%=
    new JSPDropdownItemList(pageContext) {
        {
          add(
            dropdownItem -> {
              dropdownItem.setHref("#edit");
              dropdownItem.setLabel("Edit");
            });

          add(
            dropdownItem -> {
              dropdownItem.setHref("#download");
              dropdownItem.setIcon("download");
              dropdownItem.setLabel("Download");
              dropdownItem.setQuickAction(true);
            });

          add(
            dropdownItem -> {
              dropdownItem.setHref("#delete");
              dropdownItem.setLabel("Delete");
              dropdownItem.setIcon("trash");
              dropdownItem.setQuickAction(true);
            });
        }
    }
%>"
```

작업 항목은 페이지 매김에서 선택한 항목 수와 함께 작업 메뉴에 나열됩니다.

![항목, 여러 항목 또는 마스터 확인란을 선택한 경우 관리 도구 모음의 드롭다운 메뉴에도 작업이 나열됩니다.](./clay-management-toolbar/images/02.png)

위의 예에서 삭제 및 다운로드 작업과 같이 작업에 지정된 아이콘이 있는 경우 작업 메뉴 옆에도 아이콘이 표시됩니다.

![관리 도구 모음은 선택한 결과를 추적하고 그에 대해 실행할 작업을 표시합니다.](./clay-management-toolbar/images/03.png)

## 검색 결과 필터링 및 정렬

`filterItems`, `sortingOrder`및 `sortingURL` 속성을 사용하면 검색 컨테이너 결과를 필터링하고 정렬할 수 있습니다. 필터링 및 정렬은 하나의 편리한 드롭다운 메뉴에 그룹화되어 있습니다.

`filterItems`: 검색 컨테이너의 필터링 옵션을 설정합니다. 이 필터는 모든 제어판 응용 프로그램에 포함되어야 합니다. 필터링 옵션에는 정렬 기준, 정렬 순서 등이 포함될 수 있습니다.

`filterLabelItems`: 표시할 검색 컨테이너의 필터 레이블을 설정합니다. 이를 통해 사용자는 현재 어떤 필터가 적용되어 있는지 알 수 있습니다.

`sortingOrder`: 현재 정렬 순서: 오름차순 또는 내림차순.

`sortingURL`: 정렬 순서를 변경할 URL

아래 예에서는 두 개의 필터 옵션과 두 개의 정렬 옵션을 추가합니다.

```jsp
filterItems="<%=
    new DropdownItemList(_request) {
        {
            addGroup(
                dropdownGroupItem -> {
                    dropdownGroupItem.setDropdownItemList(
                        new DropdownItemList(_request) {
                            {
                                add(
                                    dropdownItem -> {
                                        dropdownItem.setHref("#1");
                                        dropdownItem.setLabel("Filter 1");
                                    });

                                add(
                                    dropdownItem -> {
                                        dropdownItem.setHref("#2");
                                        dropdownItem.setLabel("Filter 2");
                                    });
                            }
                        }
                    );
                    dropdownGroupItem.setLabel("Filter By");
                });

            addGroup(
                dropdownGroupItem -> {
                    dropdownGroupItem.setDropdownItemList(
                        new DropdownItemList(_request) {
                            {
                                add(
                                    dropdownItem -> {
                                        dropdownItem.setHref("#3");
                                        dropdownItem.setLabel("Order 1");
                                    });

                                add(
                                    dropdownItem -> {
                                        dropdownItem.setHref("#4");
                                        dropdownItem.setLabel("Order 2");
                                    });
                            }
                        }
                    );
                    dropdownGroupItem.setLabel("Order By");
                });
        }
    }
%>"
```

```jsp
filterLabelItems="<%=
  new LabelItemList() {
    {
      add(
        labelItem -> {
          labelItem.setLabel("Filter 1");
        });

      add(
        labelItem -> {
          labelItem.setLabel("Filter 2");
        });
    }
  };
%>"
```

![검색 컨테이너 결과를 정렬하고 필터링할 수도 있습니다.](./clay-management-toolbar/images/04.png)

![검색 컨테이너 결과를 정렬하고 필터링할 수도 있습니다.](./clay-management-toolbar/images/05.png)

## 검색 양식

`clearResultsURL`, `searchActionURL`, `searchFormName`, `searchInputName`및 `searchValue` 속성을 사용하여 검색 양식을 구성할 수 있습니다. 관리 도구 모음의 주요 부분은 검색 양식을 위해 예약되어 있습니다.

`clearResultsURL`: 검색 초기화 URL

`searchActionURL`: 검색 양식을 보낼 액션 URL

`searchFormName`: 검색 폼의 이름

`searchInputName`: 검색 입력의 이름

`searchValue`: 검색 입력 값

구성 예는 다음과 같습니다.

```jsp
<clay:management-toolbar
    clearResultsURL="<%= searchURL %>"
    disabled="<%= isDisabled %>"
    namespace="<%= renderResponse.getNamespace() %>"
    searchActionURL="<%= searchURL %>"
    searchFormName="fm"
    searchInputName="<%= DisplayTerms.KEYWORDS %>"
    searchValue="<%= ParamUtil.getString(request, searchInputName) %>"
    selectable="<%= false %>"
    totalItems="<%= totalItems %>"
/>
```

![검색 양식은 대부분의 관리 도구 모음으로 구성되며 사용자는 검색 컨테이너 결과를 통해 검색할 수 있습니다.](./clay-management-toolbar/images/06.png)

## 정보 패널

`infoPanelId` 및 `showInfoButton` 속성을 사용하면 검색 컨테이너 결과와 관련된 추가 정보를 표시하는 접을 수 있는 사이드바 패널을 추가할 수 있습니다.

`infoPanelId`: 토글할 정보 패널의 ID

`showInfoButton`: 정보 버튼 표시 여부

아래 예제 구성에서 `showInfoButton` 속성은 디스플레이 컨텍스트에 제공되고( `displayContext` 속성으로 지정됨) `infoPanelId` 는 JSP에서 명시적으로 설정됩니다.

```jsp
<clay:management-toolbar
    displayContext="<%= journalDisplayContext %>"
    infoPanelId="infoPanelId"
    namespace="<%= renderResponse.getNamespace() %>"
    searchContainerId="<=% searchContainerId %>"
/>
```

![정보 패널은 UI를 깔끔하게 유지합니다.](./clay-management-toolbar/images/07.png)

## 보기 유형

`viewTypes` 속성은 검색 컨테이너 결과에 대한 표시 옵션을 지정합니다. 선택할 수 있는 세 가지 표시 옵션이 있습니다.

**카드:** 가로 또는 세로 카드에 검색 결과 열을 표시합니다.

![관리 도구 모음의 아이콘 표시 보기는 콘텐츠 설명 및 상태에 대한 빠른 요약을 제공합니다.](./clay-management-toolbar/images/08.png)

**목록:** 검색 결과 열에 대한 요약 세부 정보와 함께 자세한 설명을 표시합니다.

![관리 도구 모음의 목록 보기 유형은 콘텐츠의 전체 설명을 제공합니다.](./clay-management-toolbar/images/09.png)

**테이블:** 기본 보기. 왼쪽에서 오른쪽으로 검색 결과 열을 나열합니다.

![관리 도구 모음의 테이블 보기 유형은 개별 열에 콘텐츠 정보를 나열합니다.](./clay-management-toolbar/images/10.png)

구성 예는 다음과 같습니다.

```jsp
viewTypes="<%=
    new JSPViewTypeItemList(pageContext, baseURL, selectedType) {
        {
            addCardViewTypeItem(
                viewTypeItem -> {
                    viewTypeItem.setActive(true);
                    viewTypeItem.setLabel("Card");
                });

            addListViewTypeItem(
                viewTypeItem -> {
                    viewTypeItem.setLabel("List");
                });

            addTableViewTypeItem(
                viewTypeItem -> {
                    viewTypeItem.setLabel("Table");
                });
        }
    }
%>"
```

위의 예는 JSP에서 보기 유형을 구성하는 방법을 보여 [각 보기 유형을 사용할 시기도 지정해야](https://help.liferay.com/hc/en-us/articles/360029848351-Implementing-the-View-Types).

![관리 도구 모음은 세 가지 보기 유형 옵션을 제공합니다.](./clay-management-toolbar/images/11.png)

## 생성 메뉴

`creationMenu` 속성은 하나 이상의 항목에 대한 추가 메뉴 버튼을 만듭니다. 새 엔터티(예: 새 블로그 항목)를 만드는 데 사용됩니다.

`addPrimaryDropdownItem()` 메서드를 사용하여 드롭다운 메뉴에 최상위 항목을 추가하거나 `addFavoriteDropdownItem()` 메서드를 사용하여 드롭다운 메뉴에 보조 항목을 추가합니다.

아래 구성 예는 두 개의 기본 생성 메뉴 항목과 두 개의 보조 생성 메뉴 항목을 추가합니다.

```jsp
creationMenu="<%= 
    new JSPCreationMenu(pageContext) {
            {
                addPrimaryDropdownItem(
                    dropdownItem -> {
                        dropdownItem.setHref("#1");
                        dropdownItem.setLabel("Sample 1");
                    });

                addPrimaryDropdownItem(
                    dropdownItem -> {
                        dropdownItem.setHref("#2");
                        dropdownItem.setLabel("Sample 2");
                    });

                addFavoriteDropdownItem(
                    dropdownItem -> {
                        dropdownItem.setHref("#3");
                        dropdownItem.setLabel("Favorite 1");
                    });

                addFavoriteDropdownItem(
                    dropdownItem -> {
                        dropdownItem.setHref("#4");
                        dropdownItem.setLabel("Other item");
                    });
            }
    };
%>"
```

![관리 도구 모음을 사용하면 새 엔터티를 만들기 위한 만들기 메뉴를 선택적으로 추가할 수 있습니다.](./clay-management-toolbar/images/12.png)

## 관련 항목

* [Clay 드롭다운 메뉴 및 작업 메뉴](./clay-dropdown-and-action-menus.md)
* [클레이 아이콘](./clay-icons.md)
* [클레이 내비게이션 바](./clay-navigation-bars.md)