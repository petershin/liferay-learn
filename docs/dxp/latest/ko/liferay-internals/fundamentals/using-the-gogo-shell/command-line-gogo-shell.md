# 명령줄 고고 셸

개발 환경에 있는 경우 명령줄에서 로컬로 모듈 프레임워크와 상호 작용할 수 있습니다.

```{warning}
Gogo 셸은 개발 환경의 명령줄에서만 실행해야 합니다. 프로덕션 환경에서는 [Gogo 셸 사용](../using-the-gogo-shell.md) 에 설명된 대로 제어판에서 Gogo 셸을 실행합니다.
```

## 전제 조건

명령줄의 Gogo 셸을 사용하려면 서버가 개발자 모드에서 실행 중이어야 합니다. 개발자 스튜디오의 서버에서 또는 다음 [포털 속성](../../../installation-and-upgrades/reference/portal-properties.md)을 설정하여 개발자 모드를 활성화할 수 있습니다.

```properties
include-and-override=portal-developer.properties
```

## 명령 실행

[블레이드 CLI](../../../building-applications/tooling/blade-cli/installing-and-updating-blade-cli.md) 또는 텔넷 세션을 사용하여 Gogo 셸 명령을 실행할 수 있습니다.

### 블레이드 CLI 사용

블레이드 CLI를 사용하여 개별 명령을 실행할 수 있습니다.

```bash
blade sh [Gogo shell command]
blade sh [another Gogo shell command]
...
```

### 텔넷 세션 사용

`telnet` 세션에서 명령을 실행할 수 있습니다.

1. 세션 열기:

    ```bash
    telnet localhost 11311
    ```

1. Gogo 셸 명령을 실행합니다.

1. 명령 실행을 마치면 `disconnect` 명령을 실행하여 세션을 종료합니다.

```{warning}
다음 명령을 실행하지 마십시오. 모듈 프레임워크를 중지합니다.

'닫기'

'종료'

'종료'
```

## 결론

이제 명령줄에서 Gogo 셸을 실행하는 방법을 알았으므로 사용 가능한 [Gogo 셸 명령](./gogo-shell-commands.md)을 탐색합니다. 프로덕션 환경에서 Gogo 셸을 사용해야 하는 경우 [Gogo 셸 사용](../using-the-gogo-shell.md)을 참조하십시오.