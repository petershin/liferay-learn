# 명령줄 도구

CLI 도구를 사용하여 Liferay Cloud 서비스를 보고 관리할 수 있습니다. 설치한 후에는 터미널에서 `lcp --help` 실행하여 사용 가능한 작업을 볼 수 있습니다.

```{tip}
추가 로깅 및 정보를 보려면 `lcp` 명령 끝에 `-v` 또는 `--verbose` 옵션을 실행할 수 있습니다. `lcp` 명령 끝에 `--help` 플래그를 실행하면 함께 사용할 수 있는 플래그를 확인할 수 있습니다.
```

* [CLI 도구 설치](#installing-the-cli-tool)
* [CLI 도구를 버전 2에서 3으로 업그레이드](#upgrading-the-cli-tool-from-version-2-to-3)
* [CLI 원격 구성](#configuring-the-cli-remote)
* [서비스 로그 표시](#showing-the-service-logs)
* [서비스 인스턴스 수 변경](#changing-the-number-of-service-instances)
* [프로젝트 또는 서비스 나열](#listing-projects-or-services)
* [서비스 다시 시작](#restarting-a-service)
* [Liferay Cloud 환경에 배포](#deploying-to-your-liferay-cloud-environment)
* [서비스 셸에 액세스](#accessing-a-services-shell)
* [CLI 도구 버전 3 제거](#uninstalling-version-3-of-the-cli-tool)

## CLI 도구 설치

### \*nix 시스템

터미널을 열고 다음 명령을 실행하세요.

```bash
curl https://cdn.liferay.cloud/lcp/stable/latest/install.sh -fsSL | bash
```

권한 오류가 발생하면 명령을 다시 실행하고 `bash` `sudo bash`으로 바꿔보세요.

### 윈도우 시스템

[Windows 설치 프로그램](https://cdn.liferay.cloud/lcp/stable/latest/lcp-install.exe) 의 최신 버전을 다운로드하고 마법사의 단계를 따르십시오.

## CLI 도구를 버전 2에서 3으로 업그레이드

버전 3을 설치하고 사용하려면 먼저 현재 버전을 제거해야 합니다. 이렇게 하면 동일한 바이너리 이름과의 충돌을 방지할 수 있습니다.

```{important}
이 지침은 CLI 버전 2 제거에만 적용되며 [CLI 도구 버전 3 제거](#uninstalling-version-3-of-the-cli-tool) 지침과 **같지** 않습니다.
```

### MacOS 또는 Linux에서 버전 2 제거

1. 터미널을 열고 다음을 실행합니다: `lcp uninstall`.

1. `lcp`명령을 실행하여 제거가 완료되었는지 확인합니다.

### Windows에서 버전 2 제거

1. Windows 10에서는 **제어판** &rarr; **프로그램** &rarr; **프로그램 제거** 로 이동합니다.

    또는 Windows 7 및 8의 경우 **제어판** &rarr; **프로그램 추가/제거** 로 이동합니다.

1. `lcp amd64-installer-0.3`선택

1. **제거** 을 클릭한 후 확인하세요.

1. `lcp` 또는 `lcp.exe`명령을 실행하여 제거가 완료되었는지 확인합니다.

버전 3을 설치하기 전에 CLI 버전 2가 제거되었는지 확인하십시오.

### 버전 3 설치

버전 2가 제거되면 위의 지침 [위의 지침](#installing-the-cli-tool) 따라 CLI 도구 버전 3을 설치할 수 있습니다.

## CLI 원격 구성

CLI 도구를 통해 Liferay Cloud 서비스에 액세스하려면 Liferay Cloud의 원격 URL: `liferay.cloud`을 가리키도록 구성해야 합니다.

CLI의 원격을 나열하려면 다음 명령을 실행하십시오.

```bash
lcp remote
```

다음 명령을 사용하여 CLI 도구에 새 원격 장치를 추가할 수 있습니다.

```bash
lcp remote set <remote-alias> <remote-url>
```

원하는 경우 기본 리모컨을 변경할 수 있습니다.

```bash
lcp remote default <remote-alias>
```

또는 원격 인라인을 지정할 수 있습니다.

```bash
lcp shell -p <project-id> --service <service-id> --remote <remote-alias>
```

## 백업 다운로드

해당 ID를 사용하여 특정 백업을 다운로드하려면 `lcp backup` 명령을 사용하십시오.

데이터베이스와 문서 라이브러리를 동시에 다운로드하려면 다음 명령을 실행하세요.

```bash
lcp backup download --backupId <ID>
```

또는 `--database` 또는 `--doclib` 플래그를 추가하여 지정된 항목만 다운로드합니다.

```bash
lcp backup download <type> --backupId <ID>
```

## 서비스 로그 표시

특정 프로젝트, 서비스 및 인스턴스에 대한 로그를 표시하려면 `lcp log` 명령을 사용하십시오. 다음은 몇 가지 일반적인 명령입니다. `lcp log --help`을 실행하면 사용 가능한 명령 옵션을 볼 수 있습니다.

프로젝트 환경에 대한 모든 서비스 로그를 봅니다.

```bash
lcp log -p <project>-<environment>
```

프로젝트 환경에서 단일 서비스에 대한 로그를 봅니다.

```bash
lcp log -p <project>-<environment> -s <service>
```

또는 서비스의 전체 URL을 사용하여 해당 로그를 확인하세요.

```bash
lcp log --url <service>-<project>-<environment>.lfr.cloud
```

기본적으로 `lcp log` 명령은 네트워크 영향을 줄이기 위해 10,000줄만 반환합니다. 그러나 `--since` 및 `--until` 매개변수를 사용하여 기간을 지정하면 이러한 제한을 피할 수 있습니다(예: `어제`, `"어제 오후 9시"`, `"10분 전"`, `"mm/dd/YYYY HH:mm:ss"`).

특정 시간부터 현재까지 프로젝트 환경에 대한 모든 서비스 로그를 봅니다.

```bash
lcp log -p <project>-<environment> --since <start_time>
```

특정 기간의 프로젝트 환경에 대한 모든 서비스 로그를 봅니다.

```bash
lcp log --since "<start_time>" --until "<end_time>"
```

명령 끝에 `>> "<new-file.txt>"` 추가하여 `lcp log` 명령의 출력을 파일로 파이프할 수도 있습니다. 실행하면 터미널의 현재 경로에 새 파일이 생성됩니다.

```bash
lcp log -p <project>-<environment> -s <service> --since "<start_time>" --until "<end_time>" >> "<new-file.txt>"
```

## 서비스 인스턴스 수 변경

환경 서비스를 개별적으로 확장하려면 `lcp scale` 명령을 사용하세요. 이 예에는 몇 가지 일반적인 명령이 포함되어 있지만 `lcp scale --help`을 실행하여 사용 가능한 명령 옵션을 볼 수 있습니다.

프로젝트 환경에 대한 모든 서비스와 해당 인스턴스를 확인한 후 확장할 서비스를 선택합니다.

```bash
lcp scale -p <project>-<environment>
```

그런 다음 터미널 프롬프트에 따라 서비스를 선택하고 해당 인스턴스 수를 결정합니다.

또는 `lcp scale` 명령의 일부로 대상 서비스와 원하는 인스턴스 수를 지정합니다.

```bash
lcp scale -p <project>-<environment> -s <service> <instances>
```

전체 URL을 사용하여 인스턴스를 확장할 수도 있습니다.

```bash
lcp scale --url <service>-<project>-<environment>.lfr.cloud <instances>
```

## 프로젝트 또는 서비스 나열

`lcp list` 명령을 사용하면 각각의 이미지와 상태가 포함된 프로젝트 서비스를 볼 수 있습니다. 이 예에는 몇 가지 일반적인 명령이 포함되어 있지만 `lcp list --help`을 실행하여 사용 가능한 명령 옵션을 볼 수 있습니다.

귀하가 소유하거나 공동 작업하는 프로젝트, 서비스 및 인스턴스의 전체 목록을 확인하세요.

```bash
lcp list
```

환경별 서비스의 이미지 및 상태 보기:

```bash
lcp list -p <project>-<environment>
```

특정 서비스의 이미지와 상태를 확인하세요.

```bash
lcp list -p <project>-<environment> --service <serviceID>
```

또는 전체 URL을 `lcp list`에 전달하여 서비스를 확인할 수 있습니다.

```bash
lcp list --url <service>-<project>-<environment>.lfr.cloud
```

## 서비스 다시 시작

환경 서비스를 다시 시작하려면 `lcp restart` 명령을 사용하십시오. 이러한 예에는 몇 가지 일반적인 명령이 포함되어 있지만 `lcp restart --help`을 실행하여 사용 가능한 명령 옵션을 볼 수 있습니다.

모든 프로젝트 환경 및 서비스를 확인한 후 다시 시작할 환경 서비스를 선택합니다.

```bash
lcp restart
```

프로젝트에서 특정 서비스를 다시 시작합니다.

```bash
lcp restart -p <project>-<environment> -s <service>
```

또는 전체 URL을 `lcp restart`에 전달하여 서비스를 다시 시작합니다.

```bash
lcp restart --url <serviceID>-<projectID>.lfr.cloud
```

## Liferay Cloud 환경에 배포

특정 서비스 또는 모든 서비스를 환경 중 하나에 배포하려면 `lcp 배포` 명령을 사용합니다.

```bash
lcp deploy
```

저장소의 루트 디렉터리에서 `lcp 배포` 실행하면 적용 가능한 모든 서비스가 선택한 환경에 배포됩니다. 한 서비스의 폴더(해당 폴더에 서비스의 `LCP.json` 파일 포함)에서 명령을 실행하여 해당 서비스를 환경에 구체적으로 배포합니다.

기본값이 아닌 원격(해당 ID로)을 지정하려면 `-r` 과 함께 명령을 실행하십시오.

```bash
lcp deploy -r <remote-id>
```

자세한 내용은 [CLI 도구를 통해 변경 사항 배포](../updating-services-in-liferay-paas/deploying-changes-via-the-cli-tool.md) 을 참조하세요.

## 서비스 셸에 액세스

서비스 컨테이너의 셸에 액세스하려면 다음 명령을 실행하세요.

```bash
lcp shell
```

그러면 컨테이너의 모든 서비스가 나열되고 액세스할 서비스를 선택하라는 메시지 표시됩니다.

또는 서비스의 프로젝트 ID와 서비스 ID를 `lcp shell` 명령에 추가하여 특정 서비스 컨테이너의 셸에 액세스합니다.

```bash
lcp shell -p <project>-<environment> -s <service>
```

## 문서 열기

`lcp docs` 명령을 사용하여 공식 문서, 도움말 센터 콘텐츠 등을 포함한 Liferay Cloud 리소스에 액세스하세요.

## CLI 도구 버전 3 제거

Mac 및 Linux의 경우 다음 명령을 실행하세요.

```bash
curl https://cdn.liferay.cloud/lcp/stable/latest/uninstall.sh -fsSL | bash
```

Windows 7 및 8의 경우 **제어판** &rarr; **프로그램 추가/제거** 로 이동합니다. Windows 10에서는 **제어판** &rarr; **프로그램** &rarr; **프로그램 제거** 로 이동합니다. 그런 다음 프로그램 목록에서 **LCP CLI** 찾아 선택하고 **Uninstall** 클릭합니다. 마법사의 단계를 따르십시오.

## 관련 주제

* [문제 해결 도구 및 리소스](../support-and-troubleshooting/troubleshooting-tools-and-resources.md)
* [CLI 도구를 통해 변경 사항 배포](../updating-services-in-liferay-paas/deploying-changes-via-the-cli-tool.md)
* [Liferay Cloud 스택 업그레이드](./upgrading-your-liferay-cloud-stack.md)
