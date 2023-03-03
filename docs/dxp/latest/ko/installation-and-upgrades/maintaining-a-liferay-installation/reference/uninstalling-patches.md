# 패치 제거

> 가입자

패치를 설치한 후 설치를 이전 패치 수준으로 복원하도록 결정할 수 있습니다. 여기에서 방법을 배우게 됩니다.

* 패치 제거
* 모든 패치를 한 번에 되돌리기(제거)합니다.

## 패치 제거

패치를 제거하고 설치를 원하는 패치 수준으로 복원할 수 있습니다.

1. `패치` 폴더에서 원하지 않는 패치를 제거합니다.

1. `./patching-tool.sh install` 명령을 실행하여 나머지 `패치` 폴더의 나머지 패치가 정의하는 패치 수준으로 설치를 복원합니다.

이제 DXP 설치에는 패치가 지정하는 패치 수준이 있습니다.

## 모든 패치 되돌리기

패치의 전부 또는 대부분을 제거하려는 경우 Patching Tool의 `revert` 명령을 사용하는 것이 더 쉬울 수 있습니다. `revert` 명령은 DXP 설치에서 모든 패치를 제거하여 원래 설치된 버전(예: GA1)으로 되돌립니다.

1. 모든 패치를 제거하십시오.

    ```bash
    ./patching-tool.sh revert
    ```

    모든 패치가 `패치` 폴더에서 제거됩니다.

1. 적용 가능한 패치를 설치 [하여 설치를 원하는 패치 수준으로 되돌](../patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md).

```{tip}
설치를 특정 패치 수준으로 복원하려는 경우 편리한 사이트에 패치를 저장하는 것이 좋습니다. 언제든지 [Customer Portal](https://customer.liferay.com/downloads) 에서 수정 팩을 다시 다운로드할 수 있습니다.
```

## 핫픽스 되돌리기

현재 수정팩을 보존하면서 핫픽스를 설치 제거할 수 있습니다.

```bash
./patching-tool.sh revert -hotfix
```

설치된 모든 핫픽스가 제거되고 현재 수정팩 레벨이 유지됩니다.

이제 패치를 제거하고 되돌려 DXP 설치를 복원하는 방법을 알았습니다.

## 추가 정보

* [패치 설치](../patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md)
* [패치 유형 이해](../patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.md)