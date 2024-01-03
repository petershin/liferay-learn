# 다중 디스플레이 페이지 템플릿을 사용하여 다단계 애플리케이션 생성

```{important}
이 기능은 현재 릴리스 기능 플래그 뒤에 있습니다. 자세한 내용은 [릴리스 기능 플래그](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) 을 읽어보세요.
```

표시 페이지 템플릿은 전용 URL에 콘텐츠를 표시합니다. 이 URL을 사용하고 콘텐츠를 보려면 먼저 이를 표시할 템플릿을 정의해야 합니다.

일반적으로 특정 콘텐츠 유형에 대해 기본 표시 페이지 템플릿이 설정됩니다. 그러나 여러 디스플레이 페이지 템플릿을 동일한 콘텐츠 유형과 연결하고 해당 옵션을 링크에 매핑할 수 있습니다. 이는 사용자가 여러 단계를 거쳐 애플리케이션(예: [사용자 정의 개체에서 매핑된 양식](../../../building-applications/objects/using-fragments-to-build-forms.md) 을 만들 수 있음을 의미합니다. 여러 표시 템플릿을 사용하면 각 단계가 다른 표시 페이지 템플릿에 연결되므로 여러 단계로 구성된 양식을 만들 수 있습니다.

표시 페이지 템플릿, 개체 및 양식 컨테이너 조각을 사용하여 사용자가 개체 항목을 추가하고 다른 페이지에서 편집할 수 있는 페이지를 생성할 수 있습니다. 그렇게 하려면 사용자 [개체](#tasks-custom-object), 개체 항목을 편집하기 위한 표시 페이지 템플릿 [표시 페이지 템플릿](#edit-display-page-template) 사용자가 새 개체 항목을 입력하고 기존 개체 항목 목록을 볼 수 있는 콘텐츠 페이지 [콘텐츠 페이지](#content-page-to-display-the-application) 만들어야 합니다.

## 작업 사용자 정의 개체

1. [사용자 정의 개체](../../../building-applications/objects/creating-and-managing-objects/creating-objects.md) 을 만들고 _작업_이라는 레이블을 붙입니다.

1. _작업_ 개체를 클릭하세요.

1. 필드 탭 아래에 _설명_이라는 라벨이 붙은 텍스트 유형 필드를 추가합니다.

1. 작업 탭 아래에 _작업_을 추가하고 _편집_이라는 라벨을 붙입니다.

1. Action Builder에서 _Standalone_을 트리거로 선택합니다.

   이 옵션을 사용하면 [작업을 버튼](../../../building-applications/objects/creating-and-managing-objects/actions/using-manual-actions.md#mapping-buttons-to-object-actions-in-content-pages) 에 매핑할 수 있습니다.

1. 작업으로 _개체 항목 업데이트_를 선택합니다.

   이 옵션은 트리거가 활성화될 때마다 선택한 값을 사용하여 개체 항목을 업데이트합니다.

1. 값에서 _추가_를 클릭하고 _설명_ 필드를 선택합니다. 새 값 아래에 _설명_(필드 이름)을 입력합니다. 그러면 개체 항목의 설명 필드 값이 새 값으로 대체됩니다.

   ![Create the Edit action to update the object description value](./using-multiple-display-page-templates-to-create-multi-step-applications/images/01.png)

1. _오류 메시지_를 추가하고 _저장_을 클릭하세요.

1. 세부 정보 탭에서 개체의 _범위_를 선택하고 오른쪽 상단에 있는 _게시_를 클릭합니다.

이제 개체가 게시되었으며 콘텐츠 페이지 또는 표시 페이지 템플릿에서 양식 컨테이너 조각을 사용하여 양식을 생성하는 데 사용할 수 있습니다.

![Creating the Task object](./using-multiple-display-page-templates-to-create-multi-step-applications/images/02.gif)

## 애플리케이션을 표시하는 콘텐츠 페이지

1. [콘텐츠 페이지 만들기](../../creating-pages/adding-pages/adding-a-page-to-a-site.md) . 빈 템플릿을 사용하고 페이지 이름을 _작업 목록_으로 지정합니다.

1. 페이지에 _그리드_ 조각을 추가합니다. 그것을 클릭하고 오른쪽 패널에서 _모듈 수_를 _2_로 설정합니다.

1. 조각 및 위젯 사이드바에서 양식 컨테이너 조각을 찾습니다. 왼쪽 그리드 모듈에 끌어다 놓고 _없음_을 클릭한 후 작업 개체에 매핑합니다.

   왼쪽 그리드 모듈에서 사용자는 개체에 새 항목을 추가할 수 있습니다.

1. _양식 컨테이너_ 조각을 클릭하고 성공 상호 작용을 _페이지 유지_로 설정합니다.

   사용자가 개체에 항목을 추가하면 페이지가 업데이트되지만 아무 일도 일어나지 않습니다.

1. 오른쪽 그리드 모듈에 _제목_ 조각을 추가합니다. 편집하려면 해당 항목을 두 번 클릭하세요. 제목으로 _작업 목록_을 입력합니다.

1. 제목 아래 오른쪽 그리드 모듈에 _컬렉션 표시_ 조각을 추가합니다. 조각을 클릭하세요. 일반 탭에서 _컬렉션_을 클릭합니다.

   오른쪽 그리드 모듈에서 사용자는 작업 목록을 볼 수 있습니다.

1. 컬렉션 공급자 탭에서 _작업_을 선택합니다.

   컬렉션 공급자는 사용자가 디자인한 방식으로 작업 항목을 표시합니다.

1. 컬렉션 공급자에 _그리드_를 추가하고 오른쪽 패널에서 _모듈 수_를 _2_로 설정합니다.

   ![The grids are marked in red.](./using-multiple-display-page-templates-to-create-multi-step-applications/images/03.png)

1. 컬렉션 표시의 왼쪽 그리드 모듈에 _제목_ 조각을 추가하고 두 번 클릭하세요. 매핑 탭에서 설명을 필드로 선택합니다.

   이 작업은 설명 필드에 추가된 텍스트를 제목 콘텐츠로 매핑합니다.

1. 컬렉션 표시의 오른쪽 그리드 모듈에 _버튼_ 조각을 추가하고 텍스트를 두 번 클릭하여 편집하세요. 텍스트를 _편집_으로 변경합니다.

1. 페이지 게시

페이지를 보고, 개체 항목을 추가하고, 업데이트된 작업 목록을 볼 수 있지만 여전히 불완전합니다. 편집 [표시 페이지 템플릿 편집](#edit-display-page-template) 만들어야 하며 사용자를 편집 표시 페이지 템플릿으로 안내하려면 편집 버튼을 페이지에 매핑해야 합니다.

![Creating a content page to display the application](./using-multiple-display-page-templates-to-create-multi-step-applications/images/04.gif)

## 디스플레이 페이지 템플릿 수정

1. [디스플레이 페이지 템플릿](./creating-and-managing-display-page-templates.md) 만들고 이름을 _Edit_로 지정한 다음 _Task_를 콘텐츠 유형으로 선택합니다.

   이제 표시 페이지 템플릿이 작업 개체와 연결됩니다.

1. 조각 및 위젯 사이드바에서 양식 컨테이너 조각을 찾습니다. 페이지에 끌어다 놓고 _없음_을 클릭한 다음 작업 개체에 매핑합니다.

   선택한 객체 정의의 필드를 사용하여 양식이 자동으로 생성됩니다.

   ```{warning}
   마스터 페이지 템플릿의 양식 필드는 디스플레이 페이지에 채워지지 않습니다. 디스플레이 페이지의 마스터 페이지에서 개체에 연결된 양식 컨테이너를 추가하면 개체와 관련된 양식 필드를 시각화할 수 없습니다.
   ```

1. 양식 컨테이너를 선택합니다. 성공 상호 작용을 _페이지로 이동_으로 설정하고 작업 목록 페이지를 선택합니다.

   양식이 제출되면 작업 목록 페이지가 나타납니다.

1. _제출_ 버튼을 두 번 클릭하세요. 필드에서 _편집_ 작업을 선택합니다.

   사용자가 제출 버튼을 클릭하면 작업 목록 페이지로 이동될 뿐만 아니라 이전 설명 값을 새로 추가된 값으로 바꾸는 편집 작업도 활성화됩니다.

```{tip}
디스플레이 페이지 템플릿에서 양식 컨테이너 조각이 활성화되었습니다. 양식 컨테이너 조각을 편집하고 입력 조각의 하위 집합만 사용할 수도 있습니다. 그런 다음 개체 항목이 업데이트되면 사용 가능한 필드만 업데이트됩니다.

적절하다고 생각되는 대로 조각을 편집하고 양식 컨테이너 조각을 콘텐츠 페이지와 표시 페이지 모두에서 사용할 컴포지션으로 저장합니다.
```

![Creating the Edit display page template](./using-multiple-display-page-templates-to-create-multi-step-applications/images/05.gif)

## 표시 페이지 템플릿에 대한 SEO 고려 사항

디스플레이 페이지가 기본값으로 표시된 경우

   - `Sitemap.xml` 구성이 활성화되어 있으며 고객은 요구 사항에 따라 이를 사용자 정의할 수 있습니다. 주요 변경 사항은 없습니다.

   - 기본 표시 페이지가 특정 표시 페이지로 매핑되면 `<link> ` 요소가 `rel="canonical"` 속성과 함께 `<head>` 섹션에 추가되어 자산의 URL을 표준 페이지로 가리킵니다.

디스플레이 페이지가 기본값으로 표시되지 않은 경우 다음 변경 사항이 자동으로 적용됩니다.

   - 표시 페이지는 `Sitemap.xml`에 색인화되어 있지 않습니다.

   - 로봇 구성이 비활성화되었습니다.

   - `"noindex, nofollow"` 값은 로봇 구성에 설정되어 있습니다.

   - 다른 페이지에 표시 페이지 템플릿에 대한 링크가 있으면 템플릿의 `<a>` 태그에 `rel="nofollow"` 속성을 추가하세요.

   - 동일한 개체에 대해 기본값으로 표시된 표시 페이지가 존재하는 경우 `<link>` 요소는 `rel="canonical"` 속성과 함께 `<head>` 섹션에 추가되어 기본 표시 페이지 템플릿을 표준 페이지로 가리킵니다.

![SEO configuration page for the display page template.](./using-multiple-display-page-templates-to-create-multi-step-applications/images/06.png)

## 결과 신청

결과 애플리케이션을 사용하기 전에,

1. 작업 목록 콘텐츠 페이지에서 _편집_ 버튼을 두 번 클릭하세요.

1. 링크 탭 아래 링크 아래에서 _매핑된 URL_을 선택하고 _편집_ 디스플레이 페이지 템플릿을 선택합니다.

   사용자가 편집 버튼을 클릭하면 편집 표시 페이지 템플릿으로 이동하여 항목을 편집하고 양식을 다시 제출한 후 작업 목록 콘텐츠 페이지로 돌아갈 수 있습니다.

1. 작업 목록 페이지를 게시합니다.

이제 작업 목록 페이지에 액세스하여 애플리케이션을 테스트할 수 있습니다. 페이지 왼쪽에 작업 설명을 추가합니다. 페이지가 업데이트되고 컬렉션 디스플레이 오른쪽에 새 작업 설명이 표시됩니다.

편집 버튼을 클릭하면 항목을 편집할 수 있는 표시 편집 페이지로 이동됩니다. 제출을 클릭하면 작업 목록 페이지로 다시 이동됩니다.

```{tip}
초기 단계로 표시 페이지 템플릿을 생성하고 다음 표시 페이지 템플릿을 가리키는 항목 표시 페이지로 이동하도록 양식 컨테이너의 성공 상호 작용을 구성할 수 있습니다. 그러면 연결된 다단계 양식이 생성됩니다.
```

![Testing your resulting application.](./using-multiple-display-page-templates-to-create-multi-step-applications/images/07.gif)

## 관련 주제

[조각을 사용하여 양식 작성](../../../building-applications/objects/using-fragments-to-build-forms.md)

[객체 생성](../../../building-applications/objects/creating-and-managing-objects/creating-objects.md)

[사이트에 페이지 추가하기](../../creating-pages/adding-pages/adding-a-page-to-a-site.md)

[표시 페이지 템플릿 생성 및 관리](./creating-and-managing-display-page-templates.md)
