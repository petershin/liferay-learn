# 템플릿 변경 사항 전파

사이트 템플릿 전파가 활성화되면 템플릿의 페이지를 변경하고 연결된 사이트에 해당 변경 사항을 자동으로 전파할 수 있습니다. 그러나 템플릿에서 상속된 사이트 페이지를 변경하면 해당 페이지에 템플릿 변경 사항이 전파되지 않습니다. 페이지에 대한 전파를 복원하려면 사이트에서 해당 페이지에 대한 변경 사항을 삭제해야 합니다. 상속된 여러 페이지를 편집한 후 사이트 템플릿에서 전파를 복원하려면 각 페이지에 대한 변경 사항을 개별적으로 재설정해야 합니다.

```{note}
기본적으로 전파는 연결된 각 사이트에 대해 변경 후 사용자가 처음 방문했을 때 개별적으로 트리거됩니다. 그러나 사용자가 템플릿을 *전파 준비*로 전환할 때마다 연결된 사이트로의 전파가 동시에 트리거되도록 시스템을 구성할 수도 있습니다. 자세한 내용은 [사이트 템플릿 전파 구성하기](./configuring-site-template-propagation.md)를 참조하세요.
```

## 어떤 템플릿 변경 사항이 전파되나요?

템플릿의 페이지 및 페이지 요소에 대한 변경 사항만 연결된 사이트에 전파됩니다. 여기에는 새로 생성된 페이지뿐만 아니라 기존 페이지의 조각 및 위젯에 대한 변경 사항도 포함됩니다. 다른 애플리케이션 데이터는 초기 사이트 생성 시에만 복사되며 이후 변경 사항은 자동으로 전파되지 않습니다.

이러한 이유로 사이트 템플릿은 주로 여러 사이트의 페이지를 유지 관리하기 위한 것입니다. 여러 사이트에서 웹 콘텐츠 및 기타 자산을 생성하고 유지 관리해야 하는 경우 [자산 라이브러리](../../../content-authoring-and-management/asset-libraries/asset-libraries-overview.md)를 사용하세요.

## 전파 활성화 및 비활성화하기

[템플릿을 만들 때](./creating-site-templates.md)자동 전파를 활성화할지 비활성화할지 결정하지만 이 설정은 언제든지 변경할 수 있습니다.

![템플릿을 만드는 동안 자동 전파를 활성화 또는 비활성화합니다.](./propagating-template-changes/images/01.png)

템플릿 생성 후 전파를 활성화 또는 비활성화하려면 다음 단계를 따르세요:

1. *글로벌 메뉴* (![Global Menu](../../../images/icon-applications-menu.png))를 열고 *제어판* 탭으로 이동한 다음 *사이트 템플릿*을 클릭합니다.

1. 원하는 템플릿을 선택합니다.

1. *전파* 버튼(![Propagation Button](../../../images/icon-merge.png))을 클릭합니다.

   전파가 활성화된 경우 *전파 비활성화* 를 클릭하여 템플릿 변경 사항이 연결된 사이트 페이지에 자동으로 전파되지 않도록 합니다.

   ![전파가 활성화된 경우 전파 비활성화를 클릭합니다.](./propagating-template-changes/images/02.png)

   전파가 비활성화되어 있는 경우 *전파 준비 완료* 를 클릭하여 자동 전파를 활성화하세요.

   ![전파가 비활성화되어 있으면 전파 준비를 클릭합니다.](./propagating-template-changes/images/03.png)

또는 사이트 템플릿 신청 페이지를 통해 자동 전파를 사용하거나 사용하지 않도록 설정할 수 있습니다. *작업* (![Actions Button](../../../images/icon-actions.png)) 원하는 템플릿을 클릭하고 *전파 비활성화* 또는 *전파 준비*를 선택하면 됩니다.

![원하는 사이트 템플릿의 작업 버튼을 클릭하고 전파 사용 안 함 또는 전파 준비됨을 선택합니다.](./propagating-template-changes/images/04.png)

## 상속된 페이지를 해당 템플릿에 다시 연결하기

템플릿에서 상속된 사이트 페이지를 변경하는 경우 템플릿 페이지에서 연결이 끊어지며 자동으로 전파되지 않습니다. 사이트 페이지를 템플릿에 다시 연결하려면 사이트 페이지에 대한 변경 사항을 삭제해야 합니다.

사이트 페이지의 변경 사항을 삭제하고 템플릿과 다시 동기화하려면 다음 단계를 따르세요:

1. 사이트 페이지로 이동합니다.

1. 애플리케이션 표시줄에서 *추가 정보* 아이콘(![Information](../../../images/icon-control-menu-information.png))을 클릭합니다.

   ![추가 정보 아이콘을 클릭하고 변경 사항 재설정을 선택합니다.](./propagating-template-changes/images/05.png)

1. *변경 사항 재설정*을 클릭합니다.

   ```{warning}
   변경 사항을 초기화하면 **사이트 페이지에 적용된 변경 사항이 바로 되돌아갑니다**. 이로 인해 데이터가 손실될 수 있습니다. 주의해서 진행하세요.
   ```

<!-- ## Resolving Propagation Conflicts

In some cases, you may encounter conflicts when propagating Site Template changes. For example, if Pages in a template have conflicting friendly URLs, Liferay DXP stops the propagation and displays an error message.

![You may encounter propagation conflicts.](./propagating-template-changes/images/06.png)

After encountering a conflict, follow these steps to restore automatic propagation:

1. Manually resolve all conflicts identified in the error message.

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), expand *Configuration*, and go to *Site Settings*.

1. Click the *Reset and Propagate* button to reset the merge fail count and attempts to propagate your site's changes again. -->

## 관련 주제

* [위치 템플렛](../site-templates.md)
* [사이트 템플릿 전파 구성](./configuring-site-template-propagation.md)
