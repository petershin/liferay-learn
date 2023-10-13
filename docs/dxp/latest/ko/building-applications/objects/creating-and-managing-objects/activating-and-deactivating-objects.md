# 개체 활성화 및 비활성화

사용자 정의 개체는 [게시](./creating-objects.md#publishing-object-drafts) 되면 **활성화** 됩니다. 활성 상태에서는 객체를 사용하여 Liferay UI 또는 전용 REST API를 통해 항목을 생성할 수 있습니다. 필요한 경우 언제든지 사용자 정의 개체를 비활성화할 수 있습니다.

이렇게 하면 사용자가 해당 항목을 만들거나 액세스할 수 없습니다. 비활성 상태에서는 해당 데이터를 사용할 수 없으며 개체의 정의만 편집할 수 있습니다. 객체에 관계가 있는 경우 해당 객체는 더 이상 관련 객체의 레이아웃에 나타나지 않습니다. 또한 개체는 [통합 프레임워크](../understanding-object-integrations.md)(예: 권한, 워크플로)에 나타나지 않습니다. 즉, 객체의 항목을 참조하는 사이트 요소가 비어 있게 됩니다.

개체를 비활성화해도 해당 데이터에는 영향이 없습니다. 개체가 다시 활성화될 때까지 사용자가 해당 개체에 액세스하는 것을 방지할 뿐입니다.

사용자 정의 개체를 비활성화하거나 재활성화하려면

1. 전역 메뉴(![Global Menu](../../../images/icon-applications-menu.png))를 열고 **Control Panel** 탭으로 이동한 다음 **Objects** 클릭합니다.

1. 원하는 개체를 클릭하세요. 시스템 개체를 비활성화할 수 없습니다.

1. 세부정보 탭의 개체 데이터에서 스사이트를 **활성** 또는 **비활성** 으로 전환합니다.

   ![개체를 활성 또는 비활성으로 전환합니다.](./activating-and-deactivating-objects/images/01.png)

1. **저장** 클릭하세요.

## 관련 주제

* [객체 생성](./creating-objects.md)
* [객체 삭제](./deleting-objects.md)
* [개체 정의 내보내기 및 가져오기](./exporting-and-importing-object-definitions.md)
