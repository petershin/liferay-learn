# 시뮬레이션 패널 사용

{bdg-secondary}`사용 가능한 Liferay DXP 2023.Q4+/Portal GA102+`

다양한 시나리오를 시뮬레이션하여 페이지의 응답성을 확인할 수 있습니다.

Liferay를 사용하면 시뮬레이션 패널을 사용하여 [화면 크기](#simulation-panel-screen-size) 시뮬레이션하고 이를 사용 가능한 [세그먼트](../../personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) 로 향하는 [페이지 콘텐츠](#simulation-panel-page-content) 또는 페이지에 적용된 다양한 [경험](../../personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md) 과 결합합니다.

## 시뮬레이션 패널에 액세스하기

시뮬레이션 패널(![시뮬레이션 패널](../../../images/icon-simulation.png))은 응용 프로그램 표시줄에 있습니다.

![The Simulation panel is located in the application bar.](./using-the-simulation-panel/images/01.png)

해당 주소를 사용하여 페이지에 액세스하거나 페이지 애플리케이션을 통해 시뮬레이션 패널을 사용합니다. 페이지 애플리케이션을 통해 페이지를 보려면,

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. 보려는 페이지를 찾아 **작업**(![작업 아이콘](../../../images/icon-actions.png)) &rarr; **보기** 를 클릭합니다.

!!! important
시뮬레이션 패널을 사용하려면 장치에서 미리보기 권한이 필요합니다. 제어판 &rarr; 사이트 &rarr; 사이트 &rarr; 리소스 권한 &rarr; 사이트 아래에 있습니다. 권한에 대한 자세한 내용은 [역할 권한 정의](../../../users-and-permissions/roles-and-permissions/defining-role-permissions.md) 참조하십시오.

## 시뮬레이션 패널: 화면 크기

화면 크기를 시뮬레이션할 때 5가지 옵션, 즉 미리 정의된 3가지 값(데스크톱, 태블릿 또는 모바일)과 2가지 가변 값(자동 크기 및 사용자 정의)이 있습니다. 콘텐츠를 시뮬레이션하려면 **옵션**( [옵션](../../../images/icon-options.png) )을 클릭하세요.

|                                                                              옵션 | 고도            | 폭      |
| ------------------------------------------------------------------------------: | :------------ | :----- |
|          데스크탑(![데스크탑 아이콘](../../../images/icon-desktop.png)) | 1050px        | 1300px |
|             태블릿(![태블릿 아이콘](../../../images/icon-tablet.png)) | 900px         | 808px  |
|             모바일(![모바일 아이콘](../../../images/icon-mobile.png)) | 640px         | 400px  |
| 자동 크기 조정(![자동 크기 조정 아이콘](../../../images/icon-autosize.png)) | 창에 적응[^1]     | 창에 적응  |
|       사용자 정의(![사용자 정의 아이콘](../../../images/icon-custom.png)) | 사용자 정의 입력[^2] | 맞춤 입력  |

[^1]: 자동 크기 조정 옵션은 시뮬레이션을 창 크기에 맞게 조정합니다.

[^2]: 시뮬레이션된 화면의 높이와 너비에 대한 사용자 정의 값을 입력합니다.

![Simulating a desktop using the default experience.](./using-the-simulation-panel/images/02.png)

## 시뮬레이션 패널: 페이지 콘텐츠

세그먼트 또는 경험이 있는 경우 적용된 세그먼트 또는 경험을 기반으로 콘텐츠를 시뮬레이션할 수도 있습니다. 시뮬레이션 패널을 사용하면 경험과 세그먼트가 시뮬레이션 화면에서 어떻게 보이는지 시각화할 수 있습니다.

1. 첫 번째 선택기에서 미리보기 기준 아래에서 **세그먼트** 또는 **경험** 을 선택하여 두 번째 선택기에서 사용 가능한 세그먼트와 경험을 확인합니다.

1. 사용 가능한 세그먼트나 경험이 있는 경우 두 번째 선택기에서 선택합니다.

!!! note
시뮬레이션 콘텐츠 상단에는 적용된 구간/체험에 대한 정보를 제공하는 메시지가 표시됩니다.

![Selecting different experiences using the Page Content selectors.](./using-the-simulation-panel/images/03.gif)

## 관련 주제

[반응형 사이트 구축](../building-a-responsive-site.md)

[사용자 세그먼트 생성 및 관리](../../personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)

[경험 생성 및 관리](../../personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md)
