---
toc:
- ./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id.md
---
# 자동화된 라이브 채팅 시스템 활성화

```{toctree}
:maxdepth: 3

enabling-automated-live-chat-systems/getting-a-chat-provider-account-id.md
```

{bdg-secondary}`사용 가능한 Liferay 7.4+`

Liferay는 이제 여러 라이브 지원 채팅 플랫폼과의 통합을 제공합니다. 이 통합을 활성화하면 Liferay 인스턴스의 사이트에 채팅 창이 추가되고 사용자를 위한 향상된 지원 및 사이트 경험을 활성화하는 데 사용할 수 있습니다.

## 클릭 투 채팅 활성화

Click To Chat을 활성화하려면 **인스턴스 설정** 로 이동하십시오.

1. **글로벌 메뉴로 이동**(![icon](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **인스턴스 설정** .

    ![제어판에서 인스턴스 설정으로 이동합니다.](./enabling-automated-live-chat-systems/images/02.png)

1. **콘텐츠 및 데이터** 섹션에서 **Click To Chat** 을 클릭합니다.

    ![콘텐츠 및 데이터 아래에서 Click To Chat의 아이콘을 볼 수 있습니다.](./enabling-automated-live-chat-systems/images/03.png)

1. 인스턴스에 대해 Click to Chat을 활성화하려면 **Enable Click to Chat** 토글을 전환합니다.

    ![Click to Chat을 활성화하려면 스사이트를 켭니다.](./enabling-automated-live-chat-systems/images/04.png)

1. 활성화되면 [사이트 설정](../site-settings.md) 전략을 선택해야 합니다. 사이트 설정 전략은 주어진 [Liferay 인스턴스](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)에 존재하는 사이트에서 Click to Chat이 활성화되는 방식을 결정합니다.

    ![사이트 설정 전략 옵션을 선택하십시오.](./enabling-automated-live-chat-systems/images/05.png)

   **Always Inherit** : Click To Chat은 인스턴스의 모든 사이트에 대해 활성화되며 사이트 설정에서 만든 구성을 무시합니다.

   **항상 재정의** : 사이트 설정에서 구성된 Click to Chat 구성이 항상 인스턴스 설정에서 구성된 구성보다 우선합니다.

   **상속 또는 재정의** : 사이트의 사이트 설정에서 달리 구성되지 않는 한 사이트는 인스턴스 설정에서 구성을 상속합니다.

1. 채팅 제공자를 선택하고 채팅 제공자가 제공한 [계정 ID 또는 토큰](#getting-the-chat-provider-account-id-or-token) 을 입력합니다.

    ![사용하려는 채팅 공급자를 선택합니다. ](./enabling-automated-live-chat-systems/images/06.png)

1. (선택 사항)**게스트 사용자 허용** 토글을 클릭하여 게스트 사용자(인증되지 않은 사용자)가 사이트의 Click to Chat 기능에 액세스할 수 있는지 여부를 구성합니다.

1. **저장** 을 클릭합니다.

이제 라이브 채팅 공급자와의 Click To Chat 통합이 구성되었습니다.

## 채팅 제공자 계정 ID 또는 토큰 얻기

채팅 공급자의 계정 ID 또는 토큰을 얻는 방법을 잘 모르는 경우 사용 가능한 채팅 공급자에 대한 다음 문서를 참조하십시오.

* [Chatwoot](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/chatwoot.md)
* [Crisp](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/crisp.md)
* [Hubspot](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/hubspot.md)
* [지보챗](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/jivochat.md)
* [LiveChat](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/livechat.md)
* [LivePerson](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/liveperson.md)
* [Smartsupp](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/smartsupp.md)
* [톡톡](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/tawk-to.md)
* [Tidio](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/tidio.md)
* [Zendesk](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/zendesk.md)
