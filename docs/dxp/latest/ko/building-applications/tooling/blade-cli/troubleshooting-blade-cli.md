# 블레이드 CLI 문제 해결

Blade CLI가 예상대로 작동하지 않는 경우 여기에서 답을 찾을 수 있습니다.

## 내 CLI에서 블레이드 명령을 사용할 수 없습니다.

설치 스크립트를 사용한 경우 `블레이드` 실행 파일의 경로를 시스템 `$PATH` 변수에 추가해야 합니다.

**맥 OS**

```bash
echo 'export PATH="$PATH:$HOME/Library/PackageManager/bin"' >> ~/.bash_profile
```

**리눅스**

```bash
echo 'export PATH="$PATH:$HOME/jpm/bin"' >> ~/.bash_profile
```

`bash`이외의 셸을 사용하는 경우 `블레이드` 실행 파일에 대한 경로를 수동으로 추가해야 합니다.

## 블레이드를 업데이트할 수 없습니다.

최신 설치 프로그램을 다운로드하고 기존 버전 위에 설치하여 Blade CLI를 업데이트하려고 시도했을 수 있습니다. 이것은 지원되지 않으며 이제 컴퓨터에 두 개의 별도 설치가 있을 수 있습니다. 글로벌 폴더에 레거시 블레이드 파일이 있는 경우 삭제해야 합니다.

관리 계정을 사용하여 `[global folder]/jpm4j` 폴더로 이동하고 다음 두 파일을 삭제합니다.

- `/bin/blade`
- `/commands/blade`

이제 사용자 홈 폴더의 최신 설치가 인식되어 CLI에서 사용할 수 있습니다.
