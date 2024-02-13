---
toc:
  - ./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id.md
---
# 자동화된 라이브 채팅 시스템 활성화

{bdg-secondary}`liferay 7.4+`

Liferay는 이제 다양한 실시간 지원 채팅 플랫폼과의 통합을 제공합니다. 이 통합을 활성화하면 Liferay 인스턴스의 사이트에 채팅 창이 추가되고 이를 사용하여 사용자에 대한 향상된 지원 및 사이트 경험을 제공할 수 있습니다.

## 클릭 투 채팅 활성화하기

Click To Chat을 활성화하려면 **인스턴스 설정** 으로 이동하세요.

1. **전역 메뉴**(![icon](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **인스턴스 설정** 으로 이동합니다.

   ![Go to Instance Settings under Control Panel.](./enabling-automated-live-chat-systems/images/02.png)

1. **콘텐츠 및 데이터** 섹션에서 **채팅하려면 클릭** 을 클릭하세요.

   ![You can see Click To Chat's icon under Content and Data.](./enabling-automated-live-chat-systems/images/03.png)

1. 인스턴스에 대해 클릭하여 채팅을 활성화하려면 **클릭하여 채팅 활성화** 토글을 전환하세요.

   ![Toggle the switch on to enable Click to Chat.](./enabling-automated-live-chat-systems/images/04.png)

1. 활성화되면 [사이트 설정](../site-settings.md) 전략을 선택해야 합니다. 사이트 설정 전략은 주어진 [Liferay 인스턴스](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md) 에 존재하는 사이트 전반에 걸쳐 Click to Chat이 활성화되는 방식을 결정합니다.

   ![Choose your Site Settings Strategy option.](./enabling-automated-live-chat-systems/images/05.png)

   **항상 상속** : Click To Chat은 인스턴스의 모든 사이트에 대해 활성화되며 사이트 설정에서 이루어진 구성을 무시합니다.

   **항상 재정의** : 사이트 설정에서 구성된 Click to Chat 구성은 항상 인스턴스 설정에서 이루어진 구성보다 우선합니다.

   **상속 또는 재정의** : 사이트의 사이트 설정에서 다르게 구성되지 않는 한 사이트는 인스턴스 설정에서 구성을 상속합니다.

1. 채팅 제공자를 선택하고 채팅 제공자가 제공한 [계정 ID 또는 토큰](#getting-the-chat-provider-account-id-or-token) 입력하세요.

   ![사용하려는 채팅 제공자를 선택하세요. ](./enabling-automated-live-chat-systems/images/06.png)

1. (선택 사항)**게스트 사용자 허용** 토글을 클릭하여 게스트 사용자(인증되지 않은 사용자)가 사이트의 채팅하려면 클릭 기능에 액세스할 수 있는지 여부를 구성합니다.

1. **저장** 을 클릭하세요.

이제 실시간 채팅 제공업체와의 Click To Chat 통합이 구성되었습니다.

## 채팅 제공자 계정 ID 또는 토큰 가져오기

채팅 제공자의 계정 ID 또는 토큰을 얻는 방법을 잘 모르는 경우 사용 가능한 채팅 제공자에 대한 다음 문서를 참조하세요.

* [챗우트](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/chatwoot.md)
* [바삭함](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/crisp.md)
* [허브스팟](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/hubspot.md)
* [지보챗](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/jivochat.md)
* [라이브챗](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/livechat.md)
* [실시간사람](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/liveperson.md)
* [스마트공급](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/smartsupp.md)
* [토크투](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/tawk-to.md)
* [티디오](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/tidio.md)
* [젠데스크](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/zendesk.md)
