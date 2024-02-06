# 스레드 및 힙 덤프 생성

`liferay` 서비스의 성능에 문제가 있는 경우 귀하 또는 Liferay 클라우드 지원이 인스턴스를 최적화하거나 문제를 해결하는 데 도움이 되도록 스레드 또는 힙 덤프를 가져와야 할 수 있습니다.

문제 해결을 위해 스레드 또는 힙 덤프를 생성하려면 다음 단계를 따르십시오.

1. [덤프를 생성할 스크립트 선택](#choose-a-script-to-generate-the-dumps)

1. [Liferay 서비스 셸에서 스크립트 실행](#run-the-script-from-the-liferay-service-shell)

1. [백업을 통해 덤프 다운로드](#download-the-dumps-via-a-backup)

1. [완료되면 덤프를 삭제하십시오.](#delete-the-dumps-when-you-are-done)

다음 섹션에서는 Liferay Cloud 환경에 대한 스레드 또는 힙 덤프를 생성하기 위해 실행할 수 있는 예제 스크립트를 제공합니다.

## 덤프를 생성할 스크립트 선택

스레드 덤프를 생성하든 힙 덤프를 생성하든 `liferay` 서비스의 [셸](shell-access.md) 을 통해 스크립트를 실행하여 백업을 통해 다운로드할 수 있습니다.

### 스레드 덤프 생성 스크립트

스레드 덤프는 Liferay Cloud 환경에서 어떤 프로세스가 진행되고 있는지 이해하는 데 도움이 됩니다. 스레드 덤프 세트가 여러 개 있으면 문제가 있는 패턴이 Liferay 인스턴스에 존재할 수 있는지 여부를 보다 유용하게 볼 수 있습니다.

이 스크립트를 사용하여 모든 Liferay 클라우드 환경에서 Liferay 인스턴스에 대한 스레드 덤프를 생성할 수 있습니다.

```
#!/bin/bash

TARGET_THREAD_DUMP_FOLDER=${TARGET_THREAD_DUMP_FOLDER:-/opt/liferay/data/thread_dumps}

mkdir -p "${TARGET_THREAD_DUMP_FOLDER}"

take_thread_dump() {
    mkdir -p "${TARGET_THREAD_DUMP_FOLDER}/${1}"

    local pid=$(jps | grep -v Jps | awk '{print $1}')

    echo "[Liferay Cloud] jstack ${pid} > ${TARGET_THREAD_DUMP_FOLDER}/${1}/threaddump${2}.txt"

    jstack ${pid} > ${TARGET_THREAD_DUMP_FOLDER}/${1}/threaddump${2}.txt
}

take_thread_group() {
    local time=$(date +'%H%M%S')

    echo "[Liferay Cloud] Taking thread dumps with timestamp ${time}"

    for num in 1 2 3 4 5 6
    do
        take_thread_dump $time $num
        sleep 10
    done
}

main() {
    for num in 1 2 3 4
    do
        take_thread_group
        sleep 60
    done

    echo "[Liferay Cloud] Thread dumps generated"
}

echo "[Liferay Cloud] Take thread dumps"
main
```

이 스크립트는 `liferay` 서비스의 `$LIFERAY_HOME/data/` 폴더(기본적으로 이름이 `thread_dumps/` 임)에 새 폴더를 생성한 다음 각각 스레드 덤프 세트를 포함하는 여러 타임스탬프 하위 폴더를 생성합니다. 기본적으로 약 60초 간격의 타임스탬프가 있는 **4개의 하위 폴더** 을 만들고 각 하위 폴더를 약 10초 간격으로 **6개의 스레드 덤프** 로 채웁니다. 스레드 덤프는 [jstack 유틸리티](https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/tooldescr016.html) 로 생성됩니다.

이 동작을 변경하기 위해 여러 번 편집할 수 있습니다.

* 첫 번째 줄의 경로 끝에 있는 `thread_dumps/` 을 변경하여 스레드 덤프가 저장되는 디렉터리의 이름을 변경할 수 있습니다. 그러나 **백업을 통해 액세스할 수 있도록 폴더를 `데이터/` 디렉토리** 내부에 유지해야 합니다.

* `main` 함수의 루프에서 반복 횟수를 변경하여 생성된 세트 수를 변경할 수 있습니다. `take_thread_group` 함수에서 동일한 변경을 수행하여 세트당 스레드 덤프 수를 변경할 수 있습니다.

* 생성되는 각 세트의 빈도를 변경하기 위해 `주요` 기능에서 `sleep` 명령의 기간(초 단위)을 변경할 수 있습니다. `take_thread_group` 함수에서 동일한 변경을 수행하여 각 세트 내에서 스레드 덤프의 빈도를 변경할 수 있습니다.

### 힙 덤프 생성 스크립트

힙 덤프는 Liferay 인스턴스에서 어떤 데이터가 RAM을 소비하는지 이해하는 데 도움이 됩니다. 인스턴스의 메모리 할당 문제를 해결해야 하는 경우 문제가 있는지 확인하기 위해 서로 다른 주요 시간에 여러 힙 덤프를 수행해야 할 수 있습니다.

이 스크립트를 사용하여 모든 Liferay Cloud 환경에서 Liferay 인스턴스에 대한 힙 덤프를 생성할 수 있습니다.

```
#!/bin/bash

TARGET_HEAP_DUMP_FOLDER=${TARGET_HEAP_DUMP_FOLDER:-/opt/liferay/data/heap_dumps}

mkdir -p "${TARGET_HEAP_DUMP_FOLDER}"

take_heap_dump() {
    mkdir -p "${TARGET_HEAP_DUMP_FOLDER}/${1}"

    echo "[Liferay Cloud] Taking heap dump with timestamp ${1}"

    local pid=$(jps | grep -v Jps | awk '{print $1}')

    echo "[Liferay Cloud] jmap -dump:format=b,file=heapdump.txt ${pid}"

    jmap -dump:format=b,file=heapdump.txt ${pid}

    mv heapdump.txt ${TARGET_HEAP_DUMP_FOLDER}/${1}/heapdump.txt
}

main() {
    local time=$(date +'%H%M%S')

    take_heap_dump $time

    echo "[Liferay Cloud] Heap dump generated"
}

main
```

이 스크립트는 `liferay` 서비스의 `$LIFERAY_HOME/data/` 폴더(기본적으로 이름이 `heap_dumps/` 임)에 새 폴더를 생성한 다음 새로운 단일 힙 덤프를 포함하는 타임스탬프 하위 폴더를 생성합니다. 힙 덤프는 [jmap 유틸리티](https://docs.oracle.com/javase/7/docs/technotes/tools/share/jmap.html) 로 생성됩니다.

첫 줄의 경로 끝에 있는 `heap_dumps/` 을 변경하여 스레드 덤프가 저장되는 디렉터리의 이름을 변경할 수 있습니다. 그러나 **백업을 통해 액세스할 수 있도록 폴더를 `data/` 폴더** 안에 보관해야 합니다.

## Liferay 서비스 셸에서 스크립트 실행

사용할 스크립트가 있으면 이를 배포하고 Liferay Cloud 콘솔의 `liferay` 서비스 셸에서 실행해야 합니다.

### 프로젝트 저장소에 스크립트 저장

먼저 선택한 스크립트를 Liferay 인스턴스의 `$LIFERAY_HOME` 폴더에 배포할 수 있는 디렉터리에 저장합니다.

1. `liferay/configs/{ENV}/diagnostics/`와 같은 프로젝트 리포지토리의 Liferay 구성에서 수동 스크립트를 위한 새 폴더를 만듭니다. 적절한 `liferay/configs/{ENV}/` 디렉토리에 폴더를 생성하면 배포된 Liferay 인스턴스의 `$LIFERAY_HOME` 에 폴더 내용이 표시됩니다.

    ```bash
    cd liferay/configs/common/
    ```

    ```bash
    mkdir diagnostics/
    ```

1. 수동 스크립트(예: `liferay/configs/{ENV}/diagnostics/`)의 새 폴더에 있는 프로젝트 리포지토리의 Liferay 구성에 `generate_thread_dumps.sh` 또는 `generate_heap_dump.sh` 파일을 만듭니다.

    ```bash
    touch my_script_name.sh
    ```

1. [원하는 스크립트의 내용](#choose-a-script-to-generate-the-dumps) 을 새 파일에 저장합니다.

### 스크립트 배포 및 실행

스크립트를 `liferay/configs/{ENV}/`의 하위 폴더에 저장했으면 스크립트를 배포하고 Liferay Cloud 콘솔의 셸에서 실행해야 합니다.

1. [Liferay Cloud 배포 워크플로 개요](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) 에 설명된 단계에 따라 스크립트를 적절한 환경에 배포합니다.

1. Liferay Cloud 콘솔에서 적절한 환경의 `liferay` 서비스 페이지로 이동합니다.

1. **쉘** 탭을 클릭합니다.

    ![liferay 서비스 셸에 액세스하여 스크립트를 실행합니다.](./creating-thread-and-heap-dumps/images/01.png)

    이 환경에 배포한 스크립트는 이 셸을 통해 액세스할 수 있는 파일 시스템에 있습니다.

1. 셸에서 스크립트를 만들고 배포한 폴더로 이동합니다.

    ```bash
    cd diagnostics/
    ```

1. 배포한 스크립트를 실행할 수 있는 권한이 있는지 확인하십시오.

    ```bash
    chmod +x ./generate_thread_dumps.sh
    ```

1. 스크립트를 실행합니다.

    ```bash
    ./generate_thread_dumps.sh
    ```

1. 적절한 수의 스레드 덤프가 있는지 확인하려면 스크립트가 완료될 때까지 기다리십시오. 스크립트가 스레드 또는 힙 덤프 생성을 완료하면 확인 메시지가 나타납니다.

    ```
    [Liferay Cloud] Thread dumps generated
    ```

    ```{note}
    [이 섹션에서](#heap-dump-creation-script) 제공된 힙 덤프 스크립트는 하나의 힙 덤프만 생성합니다. 서로 다른 시간에 메모리 사용량을 분석하기 위해 여러 힙 덤프가 필요한 경우 해당 시간에 스크립트를 다시 실행해야 합니다.
    ```

스크립트 실행이 완료되면 스레드 또는 힙 덤프가 `$LIFERAY_HOME/data`내에서 사용 가능한 타임스탬프 하위 폴더에 저장됩니다. 다음으로 백업을 통해 덤프를 다운로드하여 로컬에서 검색해야 합니다.

## 백업을 통해 덤프 다운로드

`데이터` 볼륨의 백업과 함께 다운로드하여 스레드 또는 힙 덤프를 얻습니다. 덤프가 생성된 후 먼저 백업을 생성해야 합니다.

1. 화면 왼쪽에 있는 링크를 통해 동일한 환경에 대한 **백업** 화면으로 이동합니다.

1. 백업 페이지에서 **지금 백업** 을 클릭합니다.

    ![선택한 환경에 대한 백업을 수동으로 생성하려면 지금 백업을 클릭합니다.](./creating-thread-and-heap-dumps/images/02.png)

1. 백업이 생성되면 새 백업에 대한 작업 메뉴를 클릭하고 **다운로드** 을 클릭한 다음 `backup-lfr-<PROJECT_NAME>-<ENV>-<TIMESTAMP>.tgz` 다운로드 링크를 선택하여 `데이터` 볼륨을 다운로드합니다.

    ![데이터 볼륨을 다운로드하려면 올바른 링크를 선택하십시오.](./creating-thread-and-heap-dumps/images/03.png)

`데이터` 볼륨의 백업을 포함하는 다운로드가 시작됩니다. 덤프는 스크립트가 지정한 하위 폴더 내에 포함됩니다(예: `thread_dumps/` 또는 `heap_dumps/`).

## 완료되면 덤프 삭제

생성하는 스레드 및/또는 힙 덤프는 특히 스크립트를 여러 번 실행하는 경우 Liferay 서비스의 `데이터` 볼륨에서 상당한 공간을 차지할 수 있습니다. `데이터` 볼륨의 메모리 낭비를 방지하려면 덤프가 더 이상 필요하지 않을 때 환경에서 덤프를 삭제해야 합니다. Liferay Cloud 콘솔에서 Liferay 서비스 셸을 사용하여 덤프를 삭제합니다.

예를 들어 Liferay Cloud 콘솔에서 다음 명령을 실행하여 하나의 스레드 덤프 세트를 삭제합니다.

```bash
cd data/thread_dumps/
```

```bash
rm -r <TIMESTAMPED_FOLDER>/
```

여기에 제공된 [](#choose-a-script-to-generate-the-dumps) 스크립트는 스레드 및 힙 덤프를 생성 시기를 확인하는 데 사용할 수 있는 타임스탬프와 함께 하위 폴더에 저장합니다. 문제 해결에 더 이상 필요하지 않은 타임스탬프가 있는 하위 폴더만 삭제하도록 선택할 수 있습니다.

## 관련 주제

* [셸 액세스](./shell-access.md)
