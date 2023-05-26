# 표시된 콘텐츠의 자동 게시 구성

{bdg-secondary}`가능 7.4+`

기본적으로 게시 프로세스에 명시적으로 포함된 콘텐츠만 Live에 게시됩니다. 원하는 경우 동적 데이터 목록 표시, 양식, 웹 콘텐츠 표시 및 Wiki 표시 위젯을 사용하여 표시되는 콘텐츠를 항상 게시하도록 인스턴스를 구성할 수 있습니다. 이렇게 하면 표시되는 콘텐츠가 Live에서 항상 최신 상태인지 확인할 수 있습니다.

이 스테이징 동작을 구성하려면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **제어판** 을 클릭한 다음 **시스템 설정** &rarr; **인프라** 로 이동합니다.

1. 왼쪽 메뉴의 Virtual Instance Scope에서 **Staging** 을 클릭합니다.

1. **Publish Displayed Content by Default** 를 선택하거나 선택 취소합니다.

   사용하도록 설정하면 게시 프로세스의 구성에 관계없이 다음 위젯에 대해 표시된 콘텐츠가 다시 게시됩니다. 동적 데이터 목록 표시, 양식, 웹 콘텐츠 표시 및 Wiki 표시.

   비활성화되면 게시 프로세스의 구성에 포함된 콘텐츠만 게시됩니다.

   ```{tip}
   표시된 콘텐츠를 항상 Live에 다시 게시하는 것은 불필요할 수 있으며 게시 속도가 느려질 수 있습니다.
   ```

1. **저장** 을 클릭합니다.

![기본적으로 표시된 콘텐츠 게시를 선택하거나 선택 취소합니다.](./configuring-automatic-publishing-of-displayed-content/images/01.png)

## Asset Publisher에 대한 게시 구성

기본적으로 Asset Publisher는 표시된 콘텐츠를 Live로 자동으로 내보내지 않습니다. 위젯의 콘텐츠는 일반적으로 Live에서 사용할 수 있기 때문입니다. Liferay는 Asset Publisher 위젯을 사용하여 표시되는 콘텐츠 항목에 대한 추가 구성을 제공합니다.

Asset Publisher 위젯에 대한 동적 또는 수동 내보내기를 활성화하려면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **제어판** 을 클릭한 다음 **시스템 설정** &rarr; **자산** 로 이동합니다.

1. 왼쪽 메뉴의 시스템 범위에서 **Asset Publisher** 을 클릭합니다.

1. 선택/선택 취소 **동적 내보내기 활성화** .

   활성화되면 Asset Publisher 내보내기에는 **동적 내보내기 제한** 내의 모든 관련 자산이 포함됩니다.

1. **수동 내보내기 활성화** 을 선택하십시오.

   활성화되면 사용자는 내보내기에 수동으로 포함할 관련 자산을 선택할 수 있습니다.

1. **저장** 을 클릭합니다.

## 관련 주제

* [스테이징](../staging.md)
* [게시 프로세스 이해](./understanding-the-publishing-process.md)
* [사이트 준비 UI 참조](./site-staging-ui-reference.md)
