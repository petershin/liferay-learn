# 관계 제거

{bdg-secondary}`사용 가능한 Liferay 7.4 U26+/GA26+`

초안 및 게시된 개체 정의 모두에서 관계를 제거할 수 있습니다. 관계를 제거하면 관련 개체 정의에서 해당 필드가 영구적으로 삭제됩니다. 게시된 정의의 경우 이는 많은 레코드에 영향을 줄 수 있습니다.

```{important}
Liferay 7.4 U26/GA26 이전 버전의 경우 사용자는 [publishing](../creating-objects.md#publishing-object-drafts) 시점에 객체에 포함된 관계를 삭제할 수 없습니다.
```

게시된 개체 정의에서 관계를 제거하려면 다음 단계를 따르십시오.

1. *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png))을 열고 *Control Panel* 탭으로 이동하여 *Objects*을 클릭합니다.

1. 원하는 개체 정의 편집을 시작하고 *관계* 탭으로 이동합니다.

1. 원하는 관계에 대해 *작업* 버튼(![Actions Button](../../../../images/icon-actions.png))을 클릭하고 *삭제*를 선택합니다.

1. 대화창에서 관계의 이름을 입력하고 *삭제* 을 클릭하여 확인합니다.

   ![관계 이름을 입력하고 완료를 클릭합니다.](./removing-relationships/images/01.png)

## 추가 정보

* [개체 만들기](../creating-objects.md)
* [개체 관계 정의](./defining-object-relationships.md)
