# Clay 드롭다운 메뉴 및 작업 메뉴

`clay:dropdown-menu` 및  `clay:actions-menu` taglibs를 통해 앱에 드롭다운 메뉴를 추가할 수 있습니다. Clay taglibs는 선택할 수 있는 몇 가지 메뉴 변형을 제공합니다. 몇 가지 예제가 포함된 두 taglib가 아래에 나와 있습니다.

## 드롭다운 메뉴

기본 드롭다운 메뉴:

```jsp
<clay:dropdown-menu
    items="<%= dropdownsDisplayContext.getDefaultDropdownItems() %>"
    label="Default"
/>
```

![Clay taglibs는 앱에 드롭다운 메뉴를 추가하는 데 필요한 모든 것을 제공합니다.](./clay-dropdown-and-action-menus/images/01.png)

드롭다운 메뉴의 항목은 Java 클래스(이 경우`dropdownDisplayContext` )에서 정의됩니다. 메뉴 항목은 `NavigationItem` 개체입니다. `setDisabled(true)` 메서드로 메뉴 항목을 비활성화하고 `setActive(true)` 메서드로 메뉴 항목을 활성화할 수 있습니다. `href` 속성은 `setHref()` 메서드로 설정되고 레이블은 `setLabel()` 메서드로 정의됩니다. 다음은 `dropdownDisplayContext` 클래스의 구현 예입니다.

```java
if (_defaultDropdownItems != null) {
  return _defaultDropdownItems;
}

_defaultDropdownItems = new ArrayList<>();

for (int i = 0; i < 4; i++) {
  NavigationItem navigationItem = new NavigationItem();

  if (i == 1) {
    navigationItem.setDisabled(true);
  }
  else if (i == 2) {
    navigationItem.setActive(true);
  }

  navigationItem.setHref("#" + i);
  navigationItem.setLabel("Option " + i);

  _defaultDropdownItems.add(navigationItem);
}

return _defaultDropdownItems;
}
```

`NavigationItem`의 유형을 `TYPE_GROUP` 으로 설정하고 항목을 별도의 `ArrayList`에 중첩하여 메뉴 항목을 그룹으로 구성할 수 있습니다. `setSeparator(true)` 메서드를 사용하여 수평 구분 기호를 추가하여 그룹을 시각적으로 구분할 수 있습니다. 다음은 `dropdownsDisplayContext` 클래스의 코드 스니펫입니다.

```java
group1NavigationItem.setSeparator(true);
group1NavigationItem.setType(NavigationItem.TYPE_GROUP);
```

해당 taglib:

```jsp
<clay:dropdown-menu
    items="<%= dropdownsDisplayContext.getGroupDropdownItems() %>"
    label="Dividers"
/>
```

![드롭다운 메뉴 항목을 그룹으로 구성할 수 있습니다.](./clay-dropdown-and-action-menus/images/02.png)

드롭다운 메뉴에 입력을 추가할 수도 있습니다. 드롭다운 메뉴에 입력을 추가하려면 `setType()` 메서드(예: `NavigationItem.TYPE_CHECKBOX`)로 입력 유형, `setInputName()` 메서드로 이름, `setInputValue() 값으로 설정합니다.` 방법. 다음은 구현 예입니다.

```java
navigationItem.setInputName("checkbox" + i);
navigationItem.setInputValue("checkboxValue" + i);
navigationItem.setLabel("Group 1 - Option " + i);
navigationItem.setType(NavigationItem.TYPE_CHECKBOX);
```

해당 taglib:

```jsp
<clay:dropdown-menu
    buttonLabel="Done"
    items="<%= dropdownsDisplayContext.getInputDropdownItems() %>"
    label="Inputs"
    searchable="<%= true %>"
/>
```

![입력은 드롭다운 메뉴에 포함될 수 있습니다.](./clay-dropdown-and-action-menus/images/03.png)

메뉴 항목에는 아이콘도 포함될 수 있습니다. 메뉴 항목에 아이콘을 추가하려면 `setIcon()` 메서드를 사용하십시오. 아래는 예입니다.

```java
navigationItem.setIcon("check-circle-full")
```

해당 taglib:

```jsp
<clay:dropdown-menu
    items="<%= dropdownsDisplayContext.getIconDropdownItems() %>"
    itemsIconAlignment="left"
    label="Icons"
/>
```

![아이콘은 드롭다운 메뉴에 포함될 수 있습니다.](./clay-dropdown-and-action-menus/images/04.png)

## 작업 메뉴

기본 작업 메뉴:

```jsp
<clay:dropdown-actions
    items="<%= dropdownsDisplayContext.getDefaultDropdownItems() %>"
/>
```

![Clay taglibs로 Actions 메뉴를 생성할 수도 있습니다.](./clay-dropdown-and-action-menus/images/05.png)

작업 메뉴는 사용자에게 도움말 텍스트를 표시할 수도 있습니다.

```
<clay:dropdown-actions
    buttonLabel="More"
    buttonStyle="secondary"
    caption="Showing 4 of 32 Options"
    helpText="You can customize this menu or see all you have by pressing \"more\"."
    items="<%= dropdownsDisplayContext.getDefaultDropdownItems() %>"
/>
```

![조치 메뉴에서 도움말 텍스트를 제공할 수 있습니다.](./clay-dropdown-and-action-menus/images/06.png)

Clay taglibs를 사용하면 드롭다운 메뉴와 작업 메뉴를 앱에 쉽게 추가할 수 있습니다.

## 관련 항목

* [점토 양식 요소](./clay-form-elements.md)
* [클레이 내비게이션 바](./clay-navigation-bars.md)
* [클레이 진행률 표시줄](./clay-progress-bars.md)