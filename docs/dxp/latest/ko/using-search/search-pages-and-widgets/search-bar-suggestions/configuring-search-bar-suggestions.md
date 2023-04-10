# 검색창 제안 구성

{bdg-secondary}`7.4 U36+ 및 GA36+`

검색창 제안은 Liferay 검색창 위젯에 기능을 입력할 때 **search를 추가합니다** .

![드롭다운 목록에서 결과를 선택하거나 평소와 같이 검색을 실행합니다.](./configuring-search-bar-suggestions/images/01.gif)

사용자는 평소와 같이 검색창에 검색 키워드를 입력합니다. 키워드는 Liferay에서 수집되어 검색 엔진으로 전송됩니다. 결과는 드롭다운 목록으로 반환됩니다. 입력을 계속하면 추가 쿼리가 전송됩니다. 목록에서 결과 중 하나를 클릭하거나 검색 결과 위젯에서 결과를 보려면 돋보기 아이콘 또는 Enter 키를 클릭하여 평소와 같이 검색을 실행할 수 있습니다.

## 구성 옵션

[인스턴스 설정](#search-bar-suggestions-configuration-scope) 에서 검색창 제안이 활성화된 경우 위젯 [범위](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)에서 검색 제안을 구성할 수 있습니다.

검색창 제안을 구성하는 기본 방법은 검색창 위젯의 구성을 사용하는 것입니다.

![검색창 위젯 설정 화면의 추천 설정을 이용하세요.](./configuring-search-bar-suggestions/images/02.png)

**제안 활성화:** 제안은 기본적으로 활성화됩니다. 제안을 끄려면 확인란의 선택을 취소하십시오.

**제안 표시를 위한 문자 임계값:** 구성된 문자 수가 검색 표시줄에 입력될 때마다 쿼리가 다시 처리되고 그에 따라 결과가 새로 고쳐집니다. 이 설정을 조정하여 많은 검색 요청 전송(즉, 임계값을 너무 낮게 설정하면 많은 검색 요청이 트리거됨)과 유용성(즉, 임계값을 너무 높게 설정하면 사용자가 첫 번째 추천 검색어를 트리거하려면 많이 입력해야 함)의 균형을 맞춥니다.

**제안 기여자 구성:** 검색 엔진으로 전송되는 쿼리를 제어하는 기여자를 구성합니다. 이 설정은 세 가지 값으로 구성됩니다.

1. **제안 제공자** : 기본 제공자이자 Liferay CE에서 기본 제공되는 유일한 제공자는 `Basic`입니다. Liferay DXP에서는 대신 하나 이상의 Blueprint 기여자를 사용하도록 선택할 수 있습니다. 자세한 내용은 [검색창 제안 청사진](./search-bar-suggestions-blueprints.md) 을 참조하십시오.

1. **표시 그룹 이름** : 기본값은 `제안`입니다. 이 값은 영어에 대한 UI의 제목으로 Suggestions로 확인되는 언어 키입니다. 언어 키를 변경하거나 직접 추가할 수 있습니다. 예를 들어 `is-this-what-you're-looking-for`로 만든 다음 [번역](../../../system-administration/configuring-liferay/changing-language-translations.md#adding-a-language-key-and-translation) 추가합니다. 둘 이상의 Blueprint 기여자를 사용하는 경우 각각 고유한 표시 그룹 이름 값이 있는지 확인하십시오.

1. **크기** : 검색 표시줄 드롭다운 목록에 표시할 최대 결과 수를 설정합니다. 기본값은 `5`입니다. 표시 공간이 제한되어 있으므로 크기를 크게 설정해도 이점이 없습니다.

```{tip}
Search Blueprints 사용자는 Blueprint를 사용하여 Search Bar Suggestions 쿼리를 제어하도록 선택할 수 있습니다. _Blueprint_가 기여자로 선택되면 검색 표시줄 위젯 구성에 추가 구성 옵션이 나타납니다. 자세한 내용은 [검색창 제안 블루프린트](./search-bar-suggestions-blueprints.md)를 참조하세요.
```

## 제어판에서 검색창 제안 구성

검색 표시줄 제안에 영향을 줄 수 있는 세 가지 제어판 구성 항목이 있습니다.

1. 서비스 접근 정책
1. 시스템 설정의 검색 제안
1. 시스템 및 인스턴스 설정의 검색 표시줄

### 제안 서비스 액세스 정책 구성

[서비스 액세스 정책](../../../installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies.md#understanding-service-access-policies) Liferay 서비스에 대한 액세스를 제어합니다. 검색창 제안에 대한 정책은 기본적으로 활성화되어 인증되지 않은 사용자가 제안을 반환하는 REST 서비스 엔드포인트에 액세스할 수 있습니다. 즉, 게스트 사용자가 검색창에 입력할 때 검색창 제안을 활성화합니다.

서비스 액세스 정책을 구성하려면

1. 전역 메뉴 &rarr; 제어판 &rarr; 서비스 액세스 정책(보안 섹션)을 엽니다.

1. **SEARCH_SUGGESTIONS** 항목을 클릭합니다.

정책을 비활성화하면 위젯 구성에서 제안이 활성화된 경우에도 게스트에게 제안이 표시되지 않습니다.

### 제안 REST 끝점 구성

검색 창 제안 기능을 제공하는 REST 끝점은 필요한 경우 시스템 또는 인스턴스 설정을 사용하여 비활성화할 수 있습니다.

검색 제안 끝점을 구성하려면

1. 전역 메뉴 &rarr; 제어판 &rarr; 구성 섹션에서 시스템 또는 인스턴스 설정으로 이동합니다.

1. 플랫폼 &rarr; 검색 범주에서 검색 제안 항목을 엽니다.

1. 하나의 설정만 있습니다: 사용.

비활성화되면 필수 엔드포인트에 대한 호출이 무시됩니다. 따라서 검색창 제안에 대한 다른 구성은 고려되지 않습니다. 실제로 검색창 위젯 구성에는 검색창 추천 설정이 표시되지 않습니다. 이 기능은 시스템 또는 인스턴스 전체에서 완전히 비활성화됩니다.

### 검색 표시줄로 제안 구성

대부분의 검색 표시줄 제안 구성은 위젯 범위에서 발생합니다. 검색 창 위젯의 구성 외에도 시스템 및 인스턴스 [범위](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)에서 검색 창 제안 기본값을 구성할 수 있습니다.

![인스턴스 또는 시스템 범위에서 검색 창 제안을 구성합니다.](./configuring-search-bar-suggestions/images/03.png)

다음은 시스템, 인스턴스 또는 위젯 [범위](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)에서 검색 표시줄 제안을 활성화하거나 비활성화할 때 발생하는 상황입니다.

| 구성 범위   | 가능하게 하는? | 검색창 위젯 결과                                             |
|:------- |:-------- |:----------------------------------------------------- |
| 시스템 설정  | &#10008; | 모든 인스턴스의 기본값을 비활성화로 설정합니다. 제안 설정은 위젯 구성에 나타나지 않습니다.   |
| 인스턴스 설정 | &#10008; | 제안 설정은 위젯 구성에 나타나지 않습니다.                              |
| 인스턴스 설정 | &#10004; | 제안이 활성화되고 위젯 구성에 설정이 나타납니다. 제안은 위젯 구성에서 비활성화할 수 있습니다. |

다른 설정은 Liferay의 [구성 범위 패러다임](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)에 따라 작동합니다. 시스템 및 인스턴스와 같은 더 높은 범위의 설정은 기본값을 설정하는 반면 더 세분화된 위젯 범위는 이러한 기본값을 재정의할 수 있습니다.
