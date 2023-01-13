# Blade CLI로 프로젝트 생성

블레이드 CLI는 Liferay Workspaces에서 Liferay 프로젝트를 생성, 구축 및 배포하기 위해 존재합니다. 일단 생성되면 이러한 프로젝트를 IDE로 가져오거나 직접 작업할 수 있습니다. 여기에서 Liferay 프로젝트를 생성하고 관리할 수 있는 다양한 방법을 배우게 됩니다.

## Liferay 작업 공간 만들기

Liferay Workspace는 프로젝트 및 DevOps 구성을 저장하는 시스템의 폴더 세트입니다. Liferay 작업 공간은 Gradle 프로젝트이기 때문에 모든 IDE로 가져올 수 있습니다. 자세한 내용은 [Liferay Workspace](../liferay-workspace/what-is-liferay-workspace.md) 을 참조하십시오. Liferay Workspace를 생성하려면 다음 단계를 따르십시오.

1. CLI에서 Liferay Workspace를 생성하려는 폴더로 이동합니다.

1. 다음 명령을 실행합니다.

   ```bash
   blade init -v 7.3 [workspace name]
   ```

## 프로젝트 생성

프로젝트는 Liferay Workspace에 존재합니다. 기억해야 할 중요한 옵션은 다음과 같습니다.

**-t:** 사용할 프로젝트 템플릿을 지정합니다. `blade create -l`을 입력하면 목록을 얻을 수 있습니다.

**-p:** 클래스의 패키지 이름을 지정합니다.

**-c:** 클래스 이름을 지정합니다.

**-v:** Liferay 버전을 지정합니다. 예를 들어, `7.1`, `7.2`, `7.3`또는 `7.4`. 참고: 이 옵션을 생략할 수 있으며 Blade는 Workspace에 구성된 버전으로 기본 설정됩니다.

이들을 종합하여 "방명록"이라는 Liferay MVC 포틀릿을 생성하려면 다음 명령을 사용하십시오.

```bash
blade create -t mvc-portlet -p com.acme.z3x1.portlet -c GuestbookPortlet guestbook
```

이렇게 하면 MVC 포틀릿 템플릿을 사용하여 프로젝트가 생성됩니다. 기본 패키지는 `com.acme.z3x1.portlet`이고 포틀릿 클래스는 `GuestbookPortlet`이며 Liferay 7.4의 경우 *방명록*입니다. 이제 Workspace를 IDE로 가져올 수 있습니다. Liferay IntelliJ 플러그인 또는 Liferay Developer Studio의 Eclipse 플러그인은 향상된 지원을 제공합니다. Blade를 사용하여 프로젝트에 새 Workspace를 생성하는 경우 IDE에서 Gradle 프로젝트를 새로 고쳐야 합니다.

## 샘플 프로젝트 만들기

Liferay는 [샘플 프로젝트](https://github.com/liferay/liferay-blade-samples/tree/7.4)의 GitHub 저장소를 유지합니다. 이들은 프로젝트의 시작점으로 사용할 수 있는 다양한 Liferay 기술의 완전히 구현된 샘플입니다. 그러나 액세스 권한을 얻기 위해 리포지토리를 복제하는 대신 Blade CLI를 사용하여 로컬에서 생성할 수 있습니다.

1. 원하는 샘플 프로젝트를 찾습니다.

   ```bash
   blade samples
   ```

1. [모델 리스너](../../../liferay-internals/extending-liferay/creating-a-model-listener.md)의 작업 예제를 원한다고 가정합니다. 다음 명령을 입력하십시오.

   ```bash
   blade samples model-listener
   ```

1. 샘플의 특정 버전을 원하는 경우 버전을 전달할 수 있습니다.

   ```bash
   blade samples -v 7.1 model-listener
   ```

## 레거시 플러그인 SDK 프로젝트 변환

버전 7.0 이전의 Liferay 프로젝트가 있는 경우 플러그인 SDK에 있습니다. 6.2 이상 버전의 Liferay에서 사용하려면 플러그인 SDK에서 Liferay 작업 공간으로 마이그레이션해야 합니다.

1. 아직 생성하지 않은 경우 [Liferay Workspace](#creating-a-liferay-workspace) 을 생성합니다.

1. Liferay Workspace 내에서 다음 명령을 실행합니다.

   ```bash
   blade convert -s [path to old Plugins SDK] -a
   ```

   이렇게 하면 Plugins SDK의 모든 프로젝트가 Workspace 프로젝트로 변환됩니다.

1. 단일 프로젝트만 변환하려면 다음 명령을 대신 사용하십시오.

   ```bash
   blade convert -s [path to old Plugins SDK] [name of Plugins SDK project to convert]
   ```

- Service Builder 서비스가 포함된 프로젝트를 변환할 때 Blade CLI는 별도의 API 및 서비스 OSGi 모듈을 생성합니다. 포틀릿은 WAR로 유지되며 `wars` 폴더로 이동합니다.
- 테마는 Liferay 7.x 테마와 같은 NodeJS를 활용하도록 변환됩니다. Java 기반 테마를 변환하려면 Theme Builder Gradle 플러그인을 대신 사용하는 `-t` 옵션을 추가합니다.

## 관련 항목

[Liferay Workspace](../liferay-workspace/what-is-liferay-workspace.md)
