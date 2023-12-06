# 클레이 관리 도구 모음

관리 도구 모음을 사용하면 관리자는 앱의 검색 컨테이너 결과를 제어할 수 있습니다. 검색 결과에 대한 보기 유형을 필터링, 정렬 및 선택할 수 있으므로 문서, 웹 콘텐츠, 자산 항목 또는 원하는 항목을 빠르게 식별할 수 있습니다. 관리 도구 모음은 완전히 사용자 정의 가능하므로 모든 컨트롤을 구현하거나 앱에 필요한 컨트롤만 구현할 수 있습니다.

![The Management ToolBar lets the user customize how the app displays content.](./clay-management-toolbar/images/01.png)

관리 툴바를 생성하려면 `clay:management-toolbar` taglib를 사용하세요. 도구 모음에는 몇 가지 주요 섹션이 포함되어 있습니다. 각 섹션은 서로 다른 속성을 사용하여 그룹화되고 구성됩니다. 이러한 속성은 아래에서 더 자세히 설명됩니다.

## 표시 컨텍스트를 사용하여 관리 도구 모음 구성

관리 도구 모음의 표시 옵션을 구성하기 위한 별도의 클래스인 표시 컨텍스트를 사용하여 도구 모음의 구성 옵션 전체 또는 일부를 정의하는 경우 `displayContext`를 사용하여 표시 컨텍스트를 지정할 수 있습니다. 기인하다. 예가 아래에 나와 있습니다.

```jsp
<clay:management-toolbar 
    displayContext="<%= viewUADEntitiesManagementToolbarDisplayContext %>" 
/>
```

[관리 도구 모음을 사용하여 항목 필터링 및 정렬](https://help.liferay.com/hc/ko/articles/360029526932-Filtering-and-Sorting-Items) 에서 표시 컨텍스트의 사용 사례 예를 볼 수 있습니다. -관리 도구 모음 사용). 관리 도구 모음 구성에는 표시 컨텍스트가 필요하지 않습니다. 원하는 대로 표시 컨텍스트를 통해 관리 도구 모음에 대한 구성 옵션을 최대한 또는 적게 제공할 수 있습니다.

## 체크박스와 액션

`actionDropdownItems`, `itemsTotal`, `searchContainerId` 및 `selectable` 속성을 사용하면 도구 모음에 확인란을 포함하여 모든 검색 컨테이너 결과를 선택하고 이에 대해 대량 작업을 실행할 수 있습니다. 개별 결과를 선택하거나 도구 모음에서 마스터 확인란을 선택하면 작업 및 전체 항목이 표시됩니다.

`actionDropdownItems`: 결과를 확인하거나 관리 도구 모음의 마스터 확인란을 선택했을 때 표시할 드롭다운 항목 목록입니다. 페이지 간에 여러 결과를 선택할 수 있습니다. 관리 도구 모음은 선택한 결과 수를 추적합니다.

`itemsTotal`: 페이지 매기기 전체 항목의 총 수입니다. 이 숫자는 하나 이상의 항목을 선택한 경우 나타납니다.

`searchContainerId`: 관리 도구 모음에 연결된 검색 컨테이너의 ID

`selectable`: 관리 도구 모음에 확인란을 포함할지 여부

예시 구성은 다음과 같습니다.

```jsp
actionDropdownItems="<%=
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

작업 항목은 페이지 매기기에서 선택한 항목 수와 함께 작업 메뉴에 나열됩니다.

![Actions are also listed in the Management Toolbar's dropdown menu when an item, multiple items, or the master checkbox is checked.](./clay-management-toolbar/images/02.png)

위 예의 삭제 및 다운로드 작업과 같이 작업에 아이콘이 지정된 경우 해당 아이콘은 작업 메뉴 옆에도 표시됩니다.

![The Management Toolbar keeps track of the results selected and displays the actions to execute on them.](./clay-management-toolbar/images/03.png)

## 검색 결과 필터링 및 정렬

`filterItems`, `sortingOrder` 및 `sortingURL` 속성을 사용하면 검색 컨테이너 결과를 필터링하고 정렬할 수 있습니다. 필터링과 정렬은 하나의 편리한 드롭다운 메뉴에 함께 그룹화되어 있습니다.

`filterItems`: 검색 컨테이너의 필터링 옵션을 설정합니다. 이 필터는 모든 제어판 응용 프로그램에 포함되어야 합니다. 필터링 옵션에는 정렬 기준, 정렬 순서 등이 포함될 수 있습니다.

`filterLabelItems`: 표시할 검색 컨테이너의 필터 라벨을 설정합니다. 이를 통해 사용자는 현재 어떤 필터가 적용되어 있는지 알 수 있습니다.

`sortingOrder`: 현재 정렬 순서: 오름차순 또는 내림차순.

`sortingURL`: 정렬 순서를 변경하는 URL

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

![You can also sort and filter search container results.](./clay-management-toolbar/images/04.png)

![You can also sort and filter search container results.](./clay-management-toolbar/images/05.png)

## 검색 양식

`clearResultsURL`, `searchActionURL`, `searchFormName`, `searchInputName` 및 `searchValue` 속성을 사용하면 검색 양식을 구성할 수 있습니다. 관리 도구 모음의 주요 부분은 검색 양식용으로 예약되어 있습니다.

`clearResultsURL`: 검색을 재설정할 URL

`searchActionURL`: 검색 양식을 보낼 작업 URL

`searchFormName`: 검색 양식의 이름

`searchInputName`: 검색 입력 이름

`searchValue`: 검색 입력 값

예시 구성은 다음과 같습니다.

```jsp
<clay:management-toolbar
    clearResultsURL="<%= searchURL %>"
    disabled="<%= isDisabled %>"
    itemsTotal="<%= itemsTotal %>"
    namespace="<%= renderResponse.getNamespace() %>"
    searchActionURL="<%= searchURL %>"
    searchFormName="fm"
    searchInputName="<%= DisplayTerms.KEYWORDS %>"
    searchValue="<%= ParamUtil.getString(request, searchInputName) %>"
    selectable="<%= false %>"
/>
```

![The search form comprises most of the Management Toolbar, letting users search through the search container results.](./clay-management-toolbar/images/06.png)

## 정보 패널

`infoPanelId` 및 `showInfoButton` 속성을 사용하면 검색 컨테이너 결과와 관련된 추가 정보를 표시하는 접이식 사이드바 패널을 추가할 수 있습니다.

`infoPanelId`: 전환할 정보 패널의 ID

`showInfoButton`: 정보 버튼 표시 여부

아래 예제 구성에서 `showInfoButton` 속성은 `displayContext` 속성으로 지정된 Display Context에 제공되며 `infoPanelId`는 JSP에서 명시적으로 설정됩니다.

```jsp
<clay:management-toolbar
    displayContext="<%= journalDisplayContext %>"
    infoPanelId="infoPanelId"
    namespace="<%= renderResponse.getNamespace() %>"
    searchContainerId="<=% searchContainerId %>"
/>
```

![The info panel keeps your UI clutter-free.](./clay-management-toolbar/images/07.png)

## 보기 유형

'viewTypes' 속성은 검색 컨테이너 결과에 대한 표시 옵션을 지정합니다. 선택할 수 있는 디스플레이 옵션은 세 가지가 있습니다.

**카드:** 가로 또는 세로 카드에 검색결과 열을 표시합니다.

![The Management Toolbar's icon display view gives a quick summary of the content's description and status.](./clay-management-toolbar/images/08.png)

**목록:** 검색 결과 열에 대한 요약 세부정보와 함께 자세한 설명을 표시합니다.

![The Management Toolbar's List view type gives the content's full description.](./clay-management-toolbar/images/09.png)

**테이블:** 기본 보기입니다. 검색 결과 열을 왼쪽에서 오른쪽으로 나열합니다.

![The Management Toolbar's Table view type list the content's information in individual columns.](./clay-management-toolbar/images/10.png)

예시 구성은 다음과 같습니다.

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

위의 예에서는 JSP에서 보기 유형을 구성하는 방법을 보여주지만 [각 보기 유형을 사용할 시기를 지정](https://help.liferay.com/hc/ko/articles/360029848351-Implementing-) 해야 합니다. 뷰 유형).

![The Management Toolbar offers three view type options.](./clay-management-toolbar/images/11.png)

## 생성 메뉴

`creationMenu` 속성은 하나 또는 여러 항목에 대한 메뉴 추가 버튼을 생성합니다. 새 엔터티(예: 새 블로그 항목)를 만드는 데 사용됩니다.

드롭다운 메뉴에 최상위 항목을 추가하려면 `addPrimaryDropdownItem()` 메서드를 사용하고, 드롭다운 메뉴에 보조 항목을 추가하려면 `addFavoriteDropdownItem()` 메서드를 사용하세요.

아래 구성 예에서는 두 개의 기본 생성 메뉴 항목과 두 개의 보조 생성 메뉴 항목을 추가합니다.

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

![The Management Toolbar lets you optionally add a Creation Menu for creating new entities.](./clay-management-toolbar/images/12.png)

## 관련 주제

* [클레이 드롭다운 메뉴 및 액션 메뉴](./clay-dropdown-and-action-menus.md)
* [클레이 아이콘](./clay-icons.md)
* [클레이 네비게이션 바](./clay-navigation-bars.md)
