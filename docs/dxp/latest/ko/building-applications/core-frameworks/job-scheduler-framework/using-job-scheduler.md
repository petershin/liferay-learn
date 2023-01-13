# 작업 스케줄러 사용

[Job Scheduler](https://github.com/liferay/liferay-portal/tree/master/modules/apps/dispatch) 은 비즈니스 로직을 실행하고 예약하기 위해 Liferay의 스케줄러 엔진에 구축된 유연한 프레임워크입니다. 이 프레임워크는 `DispatchTaskExecutor` 인터페이스를 사용하여 제어판을 통해 [작업 생성](#adding-a-new-job-scheduler-task) 에 사용할 수 있는 사용자 지정 논리로 템플릿을 정의합니다. Job Scheduler 작업을 생성한 후 해당 동작 및 실행 [일정](#scheduling-the-job-scheduler-task) 을 구성할 수 있습니다.

![작업 스케줄러 페이지를 통해 작업 스케줄러 작업을 추가하고 관리합니다.](./using-job-scheduler/images/01.png)

Job Scheduler는 `MessageListener` 인터페이스</a>을 사용하여 예약된 모든 인스턴스
작업을 보고 관리하기 위한 편리한 UI를 제공합니다.</p> 



```{note}
Job Scheduler 또는 'MessageListener'를 사용하여 인스턴스 작업을 예약할지 여부를 결정할 때 다음과 같은 Job Scheduler 이점을 고려하십시오.
Job Scheduler 작업은 Job Scheduler UI를 통해 런타임에 작업을 변경할 수 있기 때문에 `MessageListener`를 사용하여 예약된 작업보다 더 유연합니다. `MessageListener` 작업에 대한 변경 사항은 코딩, 컴파일 및 재배포되어야 합니다. 
Job Scheduler UI는 또한 각 Job Scheduler 작업의 실행 속성(예: cron 표현식, 시작/종료 날짜, 클러스터 모드) 및 실행 기록에 대한 보다 완전한 개요를 제공합니다. 이 정보는 `MessageListener` 작업의 UI에 제공되지 않습니다.
```




## 새 작업 스케줄러 작업 추가

1. *전역 메뉴* (![Global Menu](../../../images/icon-applications-menu.png))을 열고 *제어판*을 클릭한 다음 *구성* &rarr; *작업 스케줄러*로 이동합니다.

1. *추가* 버튼(![Add Button](../../../images/icon-add.png))을 클릭하고 작업 스케줄러 작업에 대해 원하는 템플릿을 선택합니다. 선택한 템플릿은 작업의 필수 논리를 정의합니다.
   
   각 템플릿은 `DispatchTaskExecutor` 인터페이스의 구현이며 각 작업 스케줄러 작업은 선택한 템플릿의 인스턴스입니다. 작동 방식에 대한 자세한 내용은 [작업 스케줄러 프레임워크 이해](./understanding-the-job-scheduler-framework.md) 을 참조하십시오. 
   
   

   ```{note}
   Liferay DXP는 다양한 Job Scheduler 작업 템플릿을 제공하는 반면 Liferay Portal에는 Talend Job Scheduler Task Executor만 포함되어 있습니다.

   자신만의 템플릿을 만들 수도 있습니다. 자세한 방법은 [새 작업 스케줄러 작업 실행자 만들기](./creating-a-new-job-scheduler-task-executor.md)를 참조하십시오.
   ```


![추가 버튼을 클릭하고 작업에 대한 Job Scheduler Task Executor 템플릿을 선택합니다.](./using-job-scheduler/images/02.png)

1. 작업 스케줄러 작업의 이름을 입력합니다.

1. (선택 사항) 설정 편집기를 사용하여 런타임 시 삽입되는 작업 스케줄러 작업의 속성을 정의합니다.
   
   이러한 설정을 사용하여 실행 흐름 등을 미세 조정할 수 있습니다.
   
   이 방식으로 추가된 모든 설정은 소프트 코딩되므로 Executor의 코드를 편집하고 재배포하지 않고도 작업 스케줄러 작업을 구성할 수 있습니다. 
   
   

   ```{tip}
   동일한 Job Scheduler Task Executor의 인스턴스를 여러 개 만들고 설정 편집기를 사용하여 해당 속성과 동작을 수정할 수 있습니다.
   ```


1. *저장* 을 클릭하여 선택한 템플릿에 대한 새 작업 스케줄러 작업을 만듭니다.
   
   ![이름을 입력하고 선택적으로 설정 편집기를 사용하여 작업 스케줄러 작업에 대한 속성을 정의합니다.](./using-job-scheduler/images/03.png)

인스턴스에 추가된 모든 Job Scheduler 작업은 Job Scheduler 페이지에 나타납니다. 여기에서 작업을 클릭하여 해당 설정을 편집하거나 작업 스케줄러 트리거를 구성하여 실행 일정을 잡을 수 있습니다. *지금 실행* 을 클릭하여 작업을 수동으로 실행할 수도 있습니다. 로그 탭에는 선택한 작업 스케줄러 작업에 대한 모든 실행 기록이 표시됩니다.

![Job Scheduler 페이지에서 모든 인스턴스 Job Scheduler 작업을 보고 관리하고 구성합니다.](./using-job-scheduler/images/04.png)



## 작업 스케줄러 작업 예약

기본적으로 모든 Job Scheduler 작업 트리거는 생성 시 비활성화됩니다. 작업의 작업 스케줄러 트리거를 활성화하고 실행 일정을 예약하려면 다음 단계를 따르십시오.

1. Job Scheduler 페이지의 *Job Scheduler Triggers* 탭으로 이동하고 원하는 작업을 클릭합니다.

1. *작업 스케줄러 트리거* 탭을 클릭하고 아래 필드를 구성합니다.

1. *저장*을 클릭합니다.
   
   ![작업 스케줄러 작업이 실행되는 시간을 예약합니다.](./using-job-scheduler/images/05.png)

**활성**: 작업 스케줄러 트리거를 활성화 또는 비활성화합니다. 트리거를 활성화하려면 유효한 cron 표현식을 입력해야 합니다. 활성화되면 작업 스케줄러 작업이 설정된 일정에 따라 실행됩니다. 비활성화하면 트리거가 실행되지 않습니다.

**작업 실행 클러스터 모드**: 작업 스케줄러 작업이 클러스터 환경의 하나 또는 모든 노드에서 실행되는지 여부를 결정합니다.

**중복 허용**: 작업 스케줄러 작업에 대한 동시 실행을 활성화 또는 비활성화합니다. 활성화되면 이전 실행이 계속 실행 중인지 여부에 관계없이 설정된 일정에 따라 새 작업 실행이 시작됩니다.

**시간대**: Job Scheduler 작업을 실행할 시간대를 선택합니다. 이것은 Liferay 인스턴스의 시간대와 무관합니다. 이 필드는 Liferay DXP 7.4 U35+/GA35+부터 사용할 수 있습니다.  

**Cron 식**: Job Scheduler 작업이 실행되는 시기를 결정하는 유효한 Cron 식을 입력합니다.

**시작 날짜**: 작업 스케줄러 작업의 시작 날짜를 결정합니다.

**종료 날짜**: 확인란을 사용하여 cron 일정에 의해 Job Scheduler 작업이 더 이상 실행되지 않는 시기를 결정합니다. 기본적으로 현재 날짜와 시간으로 설정됩니다.

작업 스케줄러 작업은 이제 지정된 날짜/시간에 cron 간격에 따라 자동으로 시작 및 중지됩니다.



## Talend 작업 스케줄러 작업 설정

Talend는 맞춤형 데이터 통합 작업을 정의하기 위한 오픈 소스 데이터 통합 소프트웨어입니다. 이러한 작업은 `.zip` 아카이브로 내보내고 Talend 실행기 템플릿을 사용하는 모든 작업 스케줄러 작업에 업로드할 수 있습니다. 업로드되면 Job Scheduler 작업이 실행될 때마다 Talend 데이터 통합 작업이 실행됩니다.

작업 스케줄러 작업에 Talend *작업 아카이브* 을 업로드하려면 다음 단계를 따르십시오.

1. Talend 실행자 템플릿을 사용하여 새 작업 스케줄러 작업을 인스턴스에 추가합니다. 자세한 지침은 [새 작업 스케줄러 추가 작업](#adding-a-new-job-scheduler-task) 을 참조하십시오.

1. Job Scheduler 페이지의 *Job Scheduler Triggers* 탭으로 이동하고 원하는 작업을 클릭합니다.

1. *Talend* 탭을 클릭합니다.
   
   ![Talend 탭을 클릭하고 Talend 작업 아카이브를 업로드합니다.](./using-job-scheduler/images/06.png)

1. Talend *Job Archive*용 ZIP 파일을 업로드합니다.

1. *저장*을 클릭합니다.



## 예약된 작업 보기 및 관리

작업 스케줄러 페이지의 *예약된 작업* 탭에는 `MessageListener` 인터페이스를 사용하여 Liferay 인스턴스에서 예약된 모든 작업이 나열됩니다. 여기에서 각 작업에 대한 일반 세부 정보(예: 이름, 상태)를 볼 수 있을 뿐만 아니라 수동으로 실행을 시작하거나 작업을 개별적으로 일시 중지/재개할 수 있습니다.

![MessageListener 인터페이스를 사용하여 예약된 모든 작업을 봅니다.](./using-job-scheduler/images/07.png)



## 추가 정보

* [작업 스케줄러 UI 참조](./job-scheduler-ui-reference.md)
* [작업 스케줄러 프레임워크 이해](./understanding-the-job-scheduler-framework.md)
* [새 작업 스케줄러 작업 실행기 만들기](./creating-a-new-job-scheduler-task-executor.md)
