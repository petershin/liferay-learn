# 프래그먼트 변경 사항 전파

기본적으로 커스텀 프래그먼트의 코드에 대한 [변경 사항](../../../developer-guide/developer-page-fragments/using-the-fragments-editor.md)은 배포된 인스턴스에 전파되지 않습니다. 파편. 프래그먼트 전파를 사용하면 다음 두 가지 방법 중 하나로 변경 사항을 프래그먼트 인스턴스에 전파할 수 있습니다.

* [프래그먼트의 개별 인스턴스에 대해 수동으로](#manually-propagating-changes)
* [조각의 모든 인스턴스에 대해 자동으로](#automatically-propagating-changes)


```{important}
데이터 덮어쓰기를 방지하기 위해 편집 가능한 필드에 대한 변경 사항을 프래그먼트에 직접 전파할 수 없습니다. 그러나 프래그먼트의 필드 ID를 변경하여 강제로 전파할 수 있습니다. 전파되면 이전 필드 ID를 사용하여 데이터베이스에서 콘텐츠를 검색할 수 있지만 필드의 콘텐츠는 더 이상 표시되지 않습니다. 자세한 내용은 개발자 설명서의 [단편별 태그 및 속성 참조](../../../developer-guide/reference/fragments/fragment-specific-tags-reference.md) 를 참조하세요.
```

## 수동으로 변경 사항 전파

프래그먼트의 개별 인스턴스에 대한 변경 사항을 수동으로 전파하려면 다음 단계를 따르십시오.

1. **사이트 메뉴**(![Site Menu](../../../../images/icon-product-menu.png))을 열고 **디자인** &rarr; **조각** 로 이동합니다.

1. 원하는 조각에 대한 **조각 세트** 로 이동합니다.

1. 원하는 조각에 대해 **작업** 버튼(![Actions Button](../../../../images/icon-actions.png))을 클릭하고 **사용 보기** 를 선택합니다.
   
   ![프래그먼트의 작업 버튼을 클릭하고 사용 보기를 선택합니다.](./propagating-fragment-changes/images/01.png) 

   ```{tip}
   *View Usages* 옵션을 사용할 수 없으면 조각이 사용되지 않는 것입니다.
   ```

1. Usages and Propagation 페이지에서 최신 버전으로 업데이트할 프래그먼트 인스턴스를 확인합니다.
   
   표에서 페이지 또는 템플릿이 **이전 버전** 또는 **최신 버전** 을 사용하는지 여부를 검토할 수 있습니다.
   
   ![업데이트할 조각 인스턴스를 선택합니다.](./propagating-fragment-changes/images/02.png)

1. **Propagate** 버튼(![Propagate](../../../../images/icon-propagate.png))을 클릭하여 선택한 프래그먼트 인스턴스를 업데이트합니다.

편집할 수 없는 필드에 대한 변경 사항은 선택한 조각 인스턴스에 자동으로 전파됩니다.

## 변경 사항 자동 전파

프래그먼트의 모든 인스턴스에 변경 사항을 자동으로 전파하려면 다음 단계를 따르십시오.

```{warning}
자동 전파는 오타나 부정확한 콘텐츠가 게시되는 등 프로덕션 환경에서 의도하지 않은 결과를 초래할 수 있습니다. 테스트 또는 개발 목적으로만 자동 전파를 사용하십시오.
```

1. **글로벌 메뉴**(![Global Menu](../../../../images/icon-applications-menu.png))을 열고 **제어판** 탭을 클릭한 다음 **구성** &rarr; **시스템 설정** 로 이동합니다.

1. **콘텐츠 및 데이터** 섹션에서 **페이지 조각** 을 클릭합니다.

1. **Propagate Fragment Changes Automatically** 상자를 선택합니다.
   
   ![프래그먼트 변경 사항 자동 전파 상자를 선택합니다.](./propagating-fragment-changes/images/03.png)

1. **저장** 을 클릭합니다.

사용하도록 설정하면 조각의 편집할 수 없는 필드에 대한 변경 사항이 조각의 모든 인스턴스에 자동으로 전파됩니다.

## 관련 주제

* [조각 사용](../using-fragments.md)
* [조각 스타일 참조](./configuring-fragments/styles-reference.md)
* [콘텐츠 페이지 사용](../../using-content-pages.md)
