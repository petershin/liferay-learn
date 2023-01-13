# JVM 조정

JVM(Java Virtual Machine) 조정은 주로 Java 힙 및 비힙 설정 조정과 가비지 수집 구성에 중점을 둡니다. 성능이 좋은 설정을 찾는 것은 시스템의 부하와 하드웨어에 따라 다릅니다. 여기에서 설명하는 설정은 JVM 조정을 위한 시작점으로 사용할 수 있습니다.

예제 Oracle JVM 설정을 JVM 설정에 적용할 수 있습니다. 호환되는 JVM에</a>

참조하십시오.</p> 



## 힙 및 비힙 공간 설정

JVM의 메모리는 힙 및 비힙 공간으로 구성됩니다. 힙에는 Young Generation 객체를 위한 공간과 Old Generation 객체를 위한 공간이 있습니다. 정적 콘텐츠 및 JIT(Just-In-Time) 컴파일 Java 코드는 힙이 아닌 기본 공간에 저장됩니다. 다음은 구성 예입니다.

**메모리 설정 예**



``` 
-Xms2560m -Xmx2560m 
-XX:NewSize=1536m -XX:MaxNewSize=1536m 
-XX:MetaspaceSize=768m -XX:MaxMetaspaceSize=768m 
-XX:InitialCodeCacheSize=64m -XX:ReservedCodeCacheSize=96m 
```


**메모리 설정 설명**

| 메모리 설정                          | 설명                                                                                      |
|:------------------------------- |:--------------------------------------------------------------------------------------- |
| `-Xms2560m`                     | 힙의 초기 공간.                                                                               |
| `-Xmx2560m`                     | 힙의 최대 공간.                                                                               |
| `-XX:NewSize=1536m`             | 초기 새 공간. 새 크기를 전체 힙의 절반으로 설정하면 일반적으로 더 작은 새 크기를 사용하는 것보다 더 나은 성능을 제공합니다.                |
| `-XX:MaxNewSize=1536m`          | 최대 새 공간.                                                                                |
| `-XX:MetaspaceSize=768m`        | 정적 콘텐츠를 위한 초기 공간입니다.                                                                    |
| `-XX:MaxMetaspaceSize=768m`     | 정적 콘텐츠를 위한 최대 공간.                                                                       |
| `-XX:InitialCodeCacheSize=64m`  | JIT 컴파일 코드를 위한 초기 공간. 코드 캐시가 너무 작으면(`48m` 이 기본값임) JIT가 고주파 방법을 최적화할 수 없기 때문에 성능이 저하됩니다. |
| `-XX:ReservedCodeCacheSize=96m` | JIT 컴파일 코드를 위한 최대 공간.                                                                   |




```{Note}
JVM이 동적으로 조정하지 않도록 최소(`-Xms`) 및 최대(`-Xmx`) 힙 크기를 동일한 값으로 설정하십시오.
```




```{warning}
JVM 힙에 32g 이상을 할당하지 마십시오. 힙 크기는 사용 가능한 CPU 리소스의 속도와 양에 비례해야 합니다.
```




## 생존자 공간 설정

구세대 공간(힙)에서 대규모 가비지 수집으로 인해 현저한 속도 저하가 발생할 수 있습니다. 구세대 공간으로 승격하기 전에 더 많은 객체가 *생존자 공간* 에 더 오래 머물도록 하여 이를 피하십시오. Survivor 공간은 Eden 가비지 수집에서 살아남은 젊은 세대 개체를 보유합니다. 시도해 볼 초기 생존자 공간 매개변수는 다음과 같습니다.

**생존자 설정 예시**



```
-XX:SurvivorRatio=16 -XX:TargetSurvivorRatio=50 -XX:MaxTenuringThreshold=15
```


**생존자 설정 설명**

| 생존자 설정                        | 설명                                                      |
|:----------------------------- |:------------------------------------------------------- |
| `-XX:SurvivorRatio=16`        | 생존자 공간을 새 공간의 1/16로 만듭니다(초기 새 공간은 `1536m`입니다).          |
| `-XX:TargetSurvivorRatio=50`  | 각 Eden 가비지 수집 후 서바이버 공간의 50%를 사용하도록 JVM에 지시합니다.         |
| `-XX:MaxTenuringThreshold=15` | 구세대 공간으로 승격되기 전에 최대 15개의 가비지 수집을 위해 생존자를 생존자 공간에 유지합니다. |




## 가비지 수집 구성

적절한 가비지 수집기(GC) 알고리즘을 선택하면 Liferay 인스턴스 응답성을 개선하는 데 도움이 됩니다.



### Java 8의 가비지 컬렉션

새로운 세대(ParNew)의 병렬 처리량 수집기와 이전 세대의 동시 마크 스윕(CMS) 낮은 일시 중지 수집기를 사용하여 튜닝을 시작하십시오.

**GC 설정 예**



```
-XX:+UseParNewGC -XX:ParallelGCThreads=16
-XX:+UseConcMarkSweepGC
-XX:+CMSParallelRemarkEnabled -XX:+CMSCompactWhenClearAllSoftRefs
-XX:CMSInitiatingOccupancyFraction=85 -XX:+CMSScavengeBeforeRemark
```


**GC 설정 설명**

| GC 설정                                   | 설명                                                                                                                                     |
|:--------------------------------------- |:-------------------------------------------------------------------------------------------------------------------------------------- |
| `-XX:+UseParNewGC`                      | 새로운 세대를 위한 병렬 수집기를 활성화합니다.                                                                                                             |
| `-XX:ParallelGCThreads=16`              | 병렬 가비지 수집을 위해 16개의 스레드를 할당합니다. `cat /proc/cpuinfo`을 실행하여 Linux에서 얻을 수 있는 사용 가능한 CPU 스레드를 기반으로 스레드 수를 설정합니다. 스레드는 이전 세대 공간의 메모리를 사용합니다. |
| `-XX:+UseConcMarkSweepGC`               | 이전 세대에 대한 동시 마크 스윕 GC 알고리즘을 활성화합니다.                                                                                                    |
| `-XX:+CMSParallelRemarkEnabled`         | 프로그램 실행 중 리마킹을 활성화합니다.                                                                                                                 |
| `-XX:+CMSCompactWhenClearAllSoftRefs`   | `ClearAllSoftRefs` 설정으로 CMS를 사용할 때 메모리 블록을 더 가깝게 이동합니다.                                                                                |
| `-XX:CMSInitiatingOccupancyFraction=85` | 구세대 공간의 이 비율이 점유되면 CMS를 시작합니다.                                                                                                         |
| `-XX:+CMSScavengeBeforeRemark`          | CMS의 객체를 다시 표시하기 전에 Eden GC를 실행하십시오.                                                                                                   |




```{note}
G1(Garbage-First)과 같은 추가 "새로운" 알고리즘이 있지만 G1에 대한 Liferay Engineering의 테스트에서는 성능이 향상되지 않는 것으로 나타났습니다. 애플리케이션 성능이 다를 수 있으므로 테스트 및 튜닝 계획에 G1을 추가해야 합니다.
```




### Java 11의 가비지 컬렉션

CMS 및 ParNew 알고리즘은 Java 11에서 더 이상 사용되지 않으므로 G1(Garbage-First) 알고리즘을 사용하십시오. 기본적으로 활성화되어 있습니다. G1의 기본 설정으로 테스트를 시작합니다.



## 큰 페이지 사용 고려

큰 힙 크기(예: 4GB 이상)가 필요한 시스템에서는 큰 페이지 크기를 사용하는 것이 좋습니다.



### 컴퓨터에서 큰 페이지 구성

다음은 Linux에서 대형 페이지("대형 페이지"라고도 함)를 구성하는 방법입니다.

1. 하드웨어 사양 및 응용 프로그램 프로필에 따라 사용할 페이지 수를 결정합니다. Linux에서 다음 명령을 실행하여 페이지 크기를 보고합니다. 
   
   

    ```bash
    cat /proc/meminfo | grep Hugepagesize
    ```


결과: 



    ```properties
    Hugepagesize = 2048 kB
    ```


1. 활성화할 페이지 수를 설정합니다. Linux에서 `/etc/sysctl.conf` 파일을 편집하고 `vm.nr_hugepages` 을 페이지 수로 설정합니다. 예를 들어, 
   
   

    ```properties
    vm.nr_hugepages = 10
    ```


1. 페이지를 활성화합니다. Linux에서 다음을 실행합니다. 
   
   

    ```bash
    sysctl -p
    ```


1. 컴퓨터를 다시 시작하십시오.



### JVM에서 대형 페이지 구성

대형 페이지를 사용하도록 JVM을 구성하는 방법은 다음과 같습니다.

**큰 페이지 설정 예**



```
-XX:+UseLargePages -XX:LargePageSizeInBytes=256m
```


**큰 페이지 설정 설명**

| 큰 페이지 설정                        | 설명                                                                                                         |
|:------------------------------- |:---------------------------------------------------------------------------------------------------------- |
| `-XX:+UseLargePages`            | 큰 페이지를 활성화합니다.                                                                                             |
| `-XX:LargePageSizeInBytes=256m` | 총 대형 페이지 크기( `cat /proc/meminfo`, 계산 `HugePages_Total * Hugepagesize`)가 JVM의 모든 메모리 사용량을 포함할 수 있는지 확인하십시오. |


하드웨어 사양 및 응용 프로그램 프로필에 따라 페이지 크기를 조정하십시오.



## 결론

이제 공통 JVM 옵션 및 예제 구성에 익숙해졌으므로 테스트 환경에서 실험을 시작하십시오. 가비지 수집 통계를 모니터링하여 환경에 충분한 메모리 할당이 있는지 확인합니다. 성능에 대한 가비지 수집 효과를 최소화하고 처리 속도를 최대화하도록 설정을 조정하십시오. 적절한 테스트 및 조정을 통해 Liferay 인스턴스에 대해 JVM을 최적화할 수 있습니다.
