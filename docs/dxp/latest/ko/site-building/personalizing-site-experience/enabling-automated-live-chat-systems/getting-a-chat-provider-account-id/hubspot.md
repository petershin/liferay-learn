# Hubspot

[Hubspot](https://www.hubspot.com/) 은 라이브 채팅 기능을 포함하는 CRM 플랫폼입니다. Hubspot과의 통합을 활성화하려면 라이브 채팅을 생성하고 Hubspot 계정에서 검색할 수 있는 두 가지 값(Hubspot 사용자 계정 ID 및 Hubspot API 토큰)의 조합이 필요합니다.

라이브 채팅을 만들고 구성하려면 [Hubspot의 지식 베이스](https://knowledge.hubspot.com/chatflows/create-a-live-chat)의 단계를 따르십시오.

## Hubspot 사용자 계정 ID 찾기

1. [Hubspot 계정](https://app.hubspot.com/login)에 로그인합니다.

1. 오른쪽 상단 모서리에 있는 프로필로 이동합니다.

    사용하려는 채널에 해당하는 계정 번호를 복사합니다. 이 번호는 Liferay Portal에서 Click to Chat을 활성화할 때 사용되는 계정 ID와 일치합니다.

    ![오른쪽 상단의 프로필로 이동하여 계정 번호를 사용하려는 채널에 복사하십시오.](./hubspot/images/01.png)

## Hubspot API 토큰 받기

Hubspot 계정에 로그인되어 있는 동안:

1. *설정* 버튼을 클릭합니다.

    ![설정 버튼을 클릭합니다.](./hubspot/images/02.png)

1. 페이지 왼쪽의 *통합* &rarr; *API 키* 를 클릭합니다.

    ![통합을 클릭하여 API 키에 액세스하십시오.](./hubspot/images/03.png)

1. *표시* 을 클릭하여 API 토큰 키를 표시합니다.

    ![표시를 클릭하여 API 토큰 키를 표시합니다.](./hubspot/images/04.png)

## 결론

사용자 계정 ID와 API 토큰이 있으면 Liferay로 [라이브 채팅을 활성화](../../enabling-automated-live-chat-systems.md)할 때 채팅 제공자 계정 ID로 사용할 수 있도록 결합하십시오. 사례. 채팅 제공자 계정 ID는 `[Hubspot 계정 ID]/[Hubspot API 토큰]` 형식을 따릅니다.