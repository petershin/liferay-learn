# 게시판 범주 메일링 목록 구성

이 문서는 **사이트 범위** 또는 **페이지 범위 메시지 게시판**에서 메시지 게시판 범주에 대한 메일링 목록을 구성하는 방법을 설명합니다. 범위 사용 방법을 알아보려면 [게시판 범위 지정](./scoping-your-message-boards.md) 기사를 참조하십시오. 글로벌 범위의 메시지 보드는 구독 및 메일링 리스트를 지원하지 않습니다. 게시판의 모든 카테고리는 자체 메일링 리스트를 가질 수 있습니다.

## 전제 조건

Message Boards 앱의 이메일 목록을 구성하기 전에 전체 DXP 인스턴스에 대해 메일 서버를 구성하는 방법에 대한 일반적인 지침은 [메일 구성](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) 기사를 참조하십시오.

## 게시판 카테고리에 메일링 리스트 추가하기

게시판 카테고리에 메일링 리스트를 추가하려면:

1. _Message Boards_ 위젯에서 범주 옆에 있는 _작업_ (![Actions](../../../images/icon-actions.png)) 아이콘을 클릭합니다(이 예에서는 _범주 1_).

    ![범주 편집](./configuring-a-message-boards-category-mailing-list/images/02.png)

1. _편집_ 을 클릭하여 기존 범주를 수정합니다.
1. _메일링 리스트_ 섹션을 펼치십시오.
1. _활성_ 토글을 _예_으로 전환합니다.
1. _익명 이메일 허용_ 토글을 _NO_으로 둡니다.

    ![카테고리 메일링 리스트 구성](./configuring-a-message-boards-category-mailing-list/images/01.png)

1. 다음을 입력:

   * **이메일 주소**: 이 카테고리의 전용 이메일 주소 또는 별칭(예: replies@lunar-resort.com)
   * **프로토콜**: POP
   * **서버 이름**: 메일 서버의 호스트 이름
   * **서버 포트**: 메일 서비스가 실행되는 포트(110)
   * **보안 네트워크 연결 사용**: 해당 여부 확인
   * **사용자 이름**: info@lunar-resort.com
   * **비밀번호**: *****
   * **읽기 간격(분)**: 5
   * **이메일 주소(발신)**: 사용자가 이메일을 사용하여 카테고리에 회신하도록 하려면 동일한 이메일을 사용하십시오.
   * **사용자 지정 발신 서버 사용**: 전역 기본값이 아닌 다른 메일 서버를 사용하는 경우 비워 둡니다.

1. _저장_을 클릭합니다.

이 카테고리에 대한 메일링 리스트가 활성화되었습니다. 이 카테고리를 구독한 사용자는 이제 카테고리의 새 스레드에 대한 이메일 알림을 받습니다.

```{important}
카테고리의 메일링 리스트에 [IMAP](https://support.google.com/mail/answer/7126229?hl=en) 프로토콜을 사용하는 경우 [메시지를 삭제하도록 IMAP 받은편지함 구성](https://support .google.com/mail/answer/78892?hl=en) 메일링 리스트의 사용자에게 메시지를 보내는 이메일 클라이언트에서 가져옵니다. 그렇지 않으면 카테고리에 새 게시물이나 업데이트가 있을 때마다 서버에 보관된 각 이메일 메시지가 메일링 리스트로 전송됩니다.
```

## 관련 정보

* [메일 구성](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
* [게시판 카테고리 만들기](./creating-message-boards-categories.md)
