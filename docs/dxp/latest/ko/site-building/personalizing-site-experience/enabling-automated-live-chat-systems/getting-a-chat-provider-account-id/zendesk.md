# Zendesk

[Zendesk](https://www.zendesk.com/) 은 고객 서비스 플랫폼입니다. 이 문서에서는 Liferay 인스턴스와의 통합을 활성화하기 위해 [계정 ID를 찾는 방법을 설명](../../enabling-automated-live-chat-systems.md).

## Zendesk 계정 ID 찾기

1. [Zendesk 계정](https://www.zendesk.com/login/#login) 에 로그인합니다.

1. 대시보드 홈 페이지에서 *위젯* 관리 링크를 클릭합니다.

    ![Zendesk 대시보드 페이지를 볼 수 있습니다.](./zendesk/images/01.png)

1. (선택 사항) *설정* 로 이동하고 다음 단계의 지침을 따릅니다.

    ![Zendesk 설정 섹션을 볼 수 있습니다.](./zendesk/images/02.png)

1. Zendesk는 웹 위젯을 삽입하기 위한 코드 스니펫을 제공합니다. 계정 ID는 스니펫에서 `...snippet.js?key=`다음 부분입니다. 스니펫의 해당 부분을 선택 및 복사하고 이를 채팅 제공자 계정 ID로 사용하여 Liferay 인스턴스와 자동 라이브 채팅 통합 [을 활성화](../../enabling-automated-live-chat-systems.md).

   ![스니펫의 일부를 복사하여 채팅 제공자 계정 ID로 사용합니다.](./zendesk/images/03.png)