---
toc:
  - ./configuring-mail/configuring-default-email-senders.md
  - ./configuring-mail/alternative-email-configuration-methods.md
  - ./configuring-mail/configuring-office-365-with-oauth.md
---
# 메일 구성

Liferay DXP/Portal은 메일 서버를 사용하여 사용자 등록 및 비밀번호 관리, 사이트 회원 알림, 콘텐츠 업데이트 등 다양한 목적으로 이메일 알림을 보내도록 구성할 수 있습니다. 데모 목적으로 Gmail 서버를 사용하도록 내장 메일 세션을 구성하는 과정을 안내합니다.

```{warning}
카테고리의 메일링 리스트에 [IMAP](https://support.google.com/mail/answer/7126229?hl=en) 프로토콜을 사용하는 경우, 메일링 리스트에 있는 사용자에게 메시지를 보내는 이메일 클라이언트에서 메시지를 가져올 때 [메시지를 삭제하도록 IMAP 받은 편지함을 구성](https://support.google.com/mail/answer/78892?hl=en) 해야 합니다. 그렇지 않으면 카테고리에 새 글이나 업데이트가 있을 때마다 서버에 보관된 각 이메일 메시지가 메일링 리스트에 전송됩니다.
```

## 내장 메일 세션 구성

제어판에서 메일 세션을 구성하려면 다음 단계를 따르십시오.

1. 관리 사용자( [기본 구성 페이지](../installing-liferay/running-liferay-for-the-first-time.md)에 지정된 사용자)로 로그인합니다.
1. **제어판 &rarr; 구성 &rarr; 서버 관리 &rarr; 메일** 로 이동합니다.
1. 다음 [개 필드](#mail-configuration-reference) 에 대한 값을 입력하세요.

    * **수신 POP 서버:** pop.gmail.com
    * **수신 포트:** 110
    * **보안 네트워크 연결 사용:** 플래그 지정
    * **사용자 이름:** joe.bloggs
    * **비밀번호: ** *****
    * **발신 SMTP 서버:** smtp.gmail.com
    * **나가는 포트:** 465
    * **보안 네트워크 연결 사용:** 플래그 지정
    * **사용자 이름:** joe.bloggs
    * **비밀번호: ** *****
    * **위 구성을 재정의하려면 추가 JavaMail 속성을 수동으로 지정합니다.** 지정해야 하는 추가 속성이 있는 경우 여기에 제공합니다.

    ![메일 서버 구성](./configuring-mail/images/01.png)

1. **저장** 클릭하세요.

DXP는 메일 세션에 즉시 연결됩니다.

## 메일 구성 참조

| 분야                                         | 묘사                                                                                                    |
|:------------------------------------------ |:----------------------------------------------------------------------------------------------------- |
| 들어오는POP서버                                  | Post Office Protocol을 실행하는 서버의 호스트 이름입니다. DXP는 메시지 게시판 응답과 같은 수신 메시지가 있는지 이 사서함을 확인합니다.               |
| 들어오는 항구                                    | POP 서버가 수신 대기하는 포트입니다.                                                                                |
| 안전한 통신망 연결을 이용하십시오                         | POP 서버에 연결할 때 암호화된 연결을 사용할지 여부를 활성화하는 확인란입니다.                                                         |
| 사용자 이름                                     | DXP가 POP 서버에 로그인하는 데 사용하는 사용자 ID입니다.                                                                  |
| 암호                                         | DXP가 POP 서버에 로그인하는 데 사용하는 비밀번호입니다.                                                                    |
| 나가는SMTP서버                                  | Simple Mail Transfer Protocol을 실행하는 서버의 호스트 이름입니다. DXP는 이 서버를 사용하여 비밀번호 변경 이메일 및 기타 알림과 같은 이메일을 보냅니다. |
| 나가는 항구                                     | SMTP 서버가 수신 대기하는 포트입니다.                                                                               |
| 안전한 통신망 연결을 이용하십시오                         | SMTP 서버에 연결할 때 암호화된 연결을 사용하십시오.                                                                       |
| 사용자 이름                                     | DXP가 SMTP 서버에 로그인하는 데 사용하는 사용자 ID입니다.                                                                 |
| 암호                                         | DXP가 SMTP 서버에 로그인하는 데 사용하는 비밀번호입니다.                                                                   |
| 수동으로 위 윤곽을 무시하기 위하여 JavaMail 추가 재산을 지정하십시오 | 이 필드는 추가 JavaMail 설정을 위한 것입니다.                                                                        |

## 관련 주제

* [기본 이메일 발신자 구성](./configuring-mail/configuring-default-email-senders.md)
* [대체 이메일 구성 방법](./configuring-mail/alternative-email-configuration-methods.md)
* [OAuth로 Office 365 구성](./configuring-mail/configuring-office-365-with-oauth.md)
