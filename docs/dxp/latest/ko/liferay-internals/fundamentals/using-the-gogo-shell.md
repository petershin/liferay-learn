---
toc:
  - ./using-the-gogo-shell/command-line-gogo-shell.md
  - ./using-the-gogo-shell/gogo-shell-commands.md
---
# Gogo 셸 사용

Gogo 쉘은 모듈 프레임워크와 상호작용하는 방법을 제공합니다. 무엇보다도 다음을 수행할 수 있습니다.

* 동적으로 번들(모듈) 설치/제거
* 패키지 종속성 검사
* 확장 지점 검사
* 서비스 참조 나열

제어판은 Gogo 셸에 액세스하는 가장 안전하고 안전한 방법입니다.

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** 탭을 선택합니다.

1. 시스템 섹션에서 **Gogo Shell** 을 클릭하세요.

   Gogo 쉘 명령 화면이 나타납니다.

   ![Gogo shell in the control panel](./using-the-gogo-shell/images/02.png)

   ```{note}
   DXP 7.2에서 제어판을 열고 *구성* &rarr;로 이동합니다. *고고쉘*
   ```

1. **g!** 텍스트 필드에 고고 셸 명령을 입력합니다. 예를 들어 `lb | grep "Liferay Announcements API"` 를 입력하면 공지사항 API 번들에 대한 정보가 나열됩니다.

   ```{note}
   클러스터가 있는 경우 모든 노드에서 Gogo 셸 명령을 실행해야 합니다. 제어판의 Gogo 셸에서 실행되는 명령은 현재 노드에만 영향을 미칩니다.
   ```

1. **실행** 을 클릭하세요.

   명령 결과 출력이 나타납니다.

   ![The output section shows the command result.](./using-the-gogo-shell/images/03.png)

```{warning}
Gogo 셸은 매우 강력하며 플랫폼의 핵심 기능을 조작할 수 있습니다. 신뢰할 수 있는 관리자에게만 Gogo 셸 액세스 권한을 부여하세요. 자세한 내용은 [역할 및 권한 이해](../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 참조하십시오.
```

## 결론

이제 Gogo 셸을 실행하는 방법을 알았으므로 사용 가능한 [Gogo 셸 명령](./using-the-gogo-shell/gogo-shell-commands.md) 을 살펴보세요. 개발자 환경에서 작업하는 경우 명령줄에서 Gogo 셸을 사용해 보세요. 자세한 내용은 [명령줄 Gogo Shell](./using-the-gogo-shell/command-line-gogo-shell.md) 을 참조하세요.
