# CLI 도구 사용

이제 Delectable Bonsai 사이트가 Liferay Experience Cloud에서 실행되고 있으므로 Kyle은 개발 팀이 만든 클라이언트 확장 [원격 앱](https://learn.liferay.com/w/dxp/building-applications/client-extensions) . 시작하려면 [명령줄 도구](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) 을 설치해야 합니다.

여기에서는 CLI 도구를 설치하고 이를 사용하여 Cloud Console에 로그인합니다.

## CLI 도구 설치

다음 명령을 사용하여 명령줄에서 도구를 설치합니다.

```bash
curl https://cdn.liferay.cloud/lcp/stable/latest/install.sh -fsSL | sudo bash
```

```{note}
Windows 환경을 사용하시는 경우 대신 [Windows 설치 프로그램](https://cdn.liferay.cloud/lcp/stable/latest/lcp-install.exe) 을 다운로드하여 실행하시면 됩니다.
```

이 작업이 완료되면 `lcp` 명령으로 도구를 사용할 수 있습니다.

## 도구를 사용하여 로그인

클라이언트 확장 프로젝트를 배포하려면 CLI 도구를 통해 로그인해야 합니다.

`lcp login` 명령을 실행하여 로그인하고 브라우저를 열라는 메시지가 표시되면 `y` 입력합니다.

![CLI 도구는 브라우저를 통해 로그인하라는 메시지를 표시합니다.](./using-the-cli-tool/images/01.png)

브라우저 탭이 자동으로 열립니다. `https://console.liferay.cloud/login`. 콘솔 세션이 만료된 경우 CLI 도구를 인증하려면 받은 자격 증명으로 다시 로그인하세요.

![로그인하면 CLI 도구가 콘솔의 환경에 액세스할 수 있는 권한이 부여됩니다.](./using-the-cli-tool/images/02.png)

이제 도구를 환경에 연결하여 클라이언트 확장을 포함한 프로젝트를 배포할 수 있습니다.

훌륭한! 클라우드 인스턴스 설정에 대한 이 모듈을 완료했습니다.

다음: LXC 인스턴스에 코드를 배포하는 [을 알아보세요](../deploying-code-to-liferay-saas.md).

## 관련 개념

* [명령줄 도구](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool)
