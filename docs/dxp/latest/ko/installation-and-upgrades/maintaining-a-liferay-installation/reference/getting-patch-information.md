# 패치 정보 얻기

> 가입자

패치 정보를 한눈에 볼 수 있어 설치를 유지하고 Liferay 지원의 도움을 받을 수 있습니다. Patching Tool의 `info` 명령은 다음 정보를 나열합니다.

* 서비스 팩 버전
* 패치 도구 버전
* 설치된 패치
* 사용 가능한 패치( `patching-tool/patches/` 폴더에 있음)

그들은 당신이 설치한 것과 설치할 수 있는 것을 명확히 합니다.

다음은 실행 예입니다.

```
patching-tool>./patching-tool.sh info
Loading product and patch information...
Product information:
  * build number: 7310
  * service pack version:
    - available SP version: 1
    - installable SP version: 1
  * patching-tool version: 3.0.5
  * time: 2020-09-01 20:26Z
  * host: 91WRQ72 (8 cores)
  * plugins: no plugins detected

Currently installed patches: dxp-1-7310

Available patches: dxp-2-7310, dxp-3-7310

Detailed patch list:
  [*-] dxp-2-7310 :: Installed; Won't be installed: dxp-3 contains the fixes included in this one :: Built for LIFERAY
  [ I] dxp-3-7310 :: Currently not installed; Will be installed. :: Built for LIFERAY
```

이제 단일 명령을 사용하여 설치 세부 정보를 얻을 수 있습니다.