---
toc:
  - ./using-the-gogo-shell/command-line-gogo-shell.md
  - ./using-the-gogo-shell/gogo-shell-commands.md
---

# 고고 셸 사용

```{toctree}
:maxdepth: 3

using-the-gogo-shell/command-line-gogo-shell.md
using-the-gogo-shell/gogo-shell-commands.md
```

Gogo 셸은 모듈 프레임워크와 상호 작용하는 방법을 제공합니다. 무엇보다도 다음을 수행할 수 있습니다.

* 번들(모듈)을 동적으로 설치/제거
* 패키지 종속성 검사
* 확장점 검사
* 서비스 참조 나열

제어판은 Gogo 셸에 액세스하는 가장 안전하고 안전한 방법입니다.

1. **글로벌 메뉴**(![icon](../../images/icon-applications-menu.png))을 엽니다.

1. **제어판** 탭을 선택합니다.

1. 시스템 섹션에서 **Gogo Shell** 을 클릭합니다.

   Gogo 셸 명령 화면이 나타납니다.

   ![제어판의 Gogo 셸](./using-the-gogo-shell/images/02.png)

   ```{note}
   DXP 7.2에서 제어판을 열고 *구성* &rarr; *Gogo Shell*로 이동합니다.
   ```

1. **!에 Gogo 쉘 명령을 입력하십시오.** 텍스트 필드. 예를 들어 `| grep "Liferay Announcements API"` 알림 API 번들에 대한 정보를 나열합니다.

1. **실행** 클릭합니다.

    명령 결과 출력이 나타납니다.

    ![출력 섹션에는 명령 결과가 표시됩니다.](./using-the-gogo-shell/images/03.png)

```{warning}
Gogo 셸은 매우 강력하며 플랫폼의 핵심 기능을 조작할 수 있습니다. 신뢰할 수 있는 관리자에게만 Gogo 셸 액세스 권한을 부여하세요. 자세한 내용은 [역할 및 권한 이해하기](../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)를 참조하십시오.
```

## 결론

이제 Gogo 셸을 실행하는 방법을 알았으므로 사용 가능한 [Gogo 셸 명령](./using-the-gogo-shell/gogo-shell-commands.md)을 탐색합니다. 개발자 환경에서 작업하는 경우 명령줄에서 Gogo 셸을 고려하십시오. 자세한 내용은 [명령줄 고고 셸](./using-the-gogo-shell/command-line-gogo-shell.md) 을 참조하십시오.
