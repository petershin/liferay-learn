# 프로젝트에 팀 구성원 추가

Marcus는 전체 Delectable Bonsai 프로젝트에 대해 Liferay Cloud 콘솔에 액세스할 수 있지만 그의 직원인 Kyle도 액세스해야 합니다.

여기에서는 팀 구성원에게 초대장을 보내는 방법을 알아봅니다.

## 팀 초대장 보내기

Marcus가 자신의 이메일 주소로 초대장을 보내 Kyle Klein을 팀에 기여자로 추가할 수 있도록 도와주세요.

1. Liferay Cloud 콘솔의 화면 상단에 있는 드롭다운 메뉴에서 프로덕션 환경을 선택합니다.

1. *팀*을 클릭합니다.

1. 팀 페이지에서 팀원의 이메일 주소(예: kyle.klein@bonsaisyrup.com)를 입력하세요.

   ![팀 페이지를 통해 팀원의 이메일 주소로 초대장을 보냅니다.](./adding-team-members-to-the-project/images/01.png)

1. 해당 역할 [에 대한 역할 드롭다운 메뉴](https://learn.liferay.com/w/liferay-cloud/manage-and-optimize/environment-teams-and-roles#understanding-team-roles)기여자 ** 선택합니다.

1. *초대장 보내기*클릭하세요.

Liferay Cloud는 프로젝트에 참여하기 위해 제공된 이메일 주소로 초대장을 보냅니다. 초대된 팀원이 아직 콘솔 계정이 없는 경우 초대를 수락하려면 계정을 만들어야 합니다.

다른 환경(예: UAT)에 대해 이 프로세스를 반복하여 팀 구성원이 모든 적절한 환경에 액세스할 수 있는지 확인하세요.

```{note}
각 환경에서 팀원의 역할에 적합한 역할을 부여하세요. 예를 들어 개발자가 해당 환경의 모든 작업을 처리해야 하는 경우 'dev' 환경에서 관리자 역할이 있어야 합니다. 자세한 내용은 [환경 팀 및 역할](https://learn.liferay.com/w/liferay-cloud/manage-and-optimize/environment-teams-and-roles)을 확인하세요.
```

다음: [변경 사항을 환경에 푸시하고 배포할 수 있도록 CLI 도구](./using-the-cli-tool.md) 을 설치합니다.

## 관련 개념

* [환경팀 및 역할](https://learn.liferay.com/w/liferay-cloud/manage-and-optimize/environment-teams-and-roles)
