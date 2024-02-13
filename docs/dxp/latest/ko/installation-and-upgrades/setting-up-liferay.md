---
toc:
  - ./setting-up-liferay/activating-liferay-dxp.md
  - >-
    - ./setting-up-liferay/initial-instance-localization.md
    - ./setting-up-liferay/configuring-mail.md
    - ./../system-administration/configuring-liferay/virtual-instances/users.md
    - ./../system-administration/file-storage.md
  - >-
    ./../system-administration/file-storage/enabling-antivirus-scanning-for-uploaded-files.md
  - >-
    - ./maintaining-a-liferay-installation/backing-up.md
    - ./../system-administration/installing-and-managing-apps.md
    - ./setting-up-liferay/using-a-cdn.md
    - ./setting-up-liferay/clustering-for-high-availability.md
    - ./setting-up-liferay/tuning-liferay.md
    - ./setting-up-liferay/tuning-your-jvm.md
---
# Liferay 설정

[에서 Liferay](./installing-liferay.md)를 설치한 후 필요에 맞게 구성합니다. 다음은 일반적인 설정 작업입니다.

**설정 작업**

* [Liferay 활성화](#activate-liferay) (구독 필요)
* [인스턴스 구성](#configure-your-instance)
* [인스턴스 현지화](#localize-your-instance)
* [메일 구성](#configure-mail)
* [사용자 구성](#configure-users)
* [파일 스토리지 구성](#configure-file-storage)
* [검색 엔진 설치](#install-a-search-engine)
* [안전한 라이프레이](#secure-liferay)
* [백업 구성](#configure-backups)

**기타 설정 작업**

* [마켓플레이스에서 앱 설치](#install-apps-from-marketplace)
* [역할 및 권한 구성](#configure-roles-and-permissions)
* [사용자 정의 필드 추가](#add-custom-fields)
* [기존 시스템과 통합](#integrate-with-existing-systems)
* [미디어 파일 미리보기 구성](#configure-media-file-previews)
* [CDN 구성](#configure-a-cdn)
* [고가용성 구성](#configure-high-availability)
* [라이프 레이 튜닝](#tune-liferay)
* [JNDI 설정](#setting-up-jndi)

위의 각 작업은 해당 문서에 대한 참조가 포함된 아래 설명으로 연결됩니다. 첫 번째 작업은 프로덕션 준비가 완료된 모든 Liferay 인스턴스에 필수적입니다. 시스템에 적용되는 **기타 설정 작업** 을 검토하세요. 작업을 완료할 때마다 위의 체크리스트를 다시 확인하세요.

## 라이프레이 활성화

`Subscribers`

Liferay DXP를 사용하는 경우 [활성화 키 적용](./setting-up-liferay/activating-liferay-dxp.md).

## 인스턴스 구성

가상 인스턴스의 기본 모양, 연락처 정보, 이용 약관, 랜딩 페이지 및 로그아웃 페이지를 포함한 필수 페이지를 구성합니다. [인스턴스 구성](../system-administration/configuring-liferay/virtual-instances/instance-configuration.md) 에서 이 모든 작업을 수행하는 방법을 설명합니다.

## 인스턴스 현지화

인스턴스의 로캘 및 시간대를 구성합니다. 자세한 내용은 [초기 인스턴스 현지화](./setting-up-liferay/initial-instance-localization.md) 을 참조하세요.

## 메일 구성

[사용자와 통신할 메일 서버](./setting-up-liferay/configuring-mail.md) 를 설정합니다. 그런 다음 이메일 확인, 비밀번호 재설정 및 비밀번호 변경을 위한 이메일 발신자 및 메시지 템플릿을 포함하여 [이메일 설정](../system-administration/configuring-liferay/virtual-instances/email-settings.md)을 구성합니다.

## 사용자 구성

[사용자를 이해한 후](../users-and-permissions/users/understanding-users.md)인스턴스에 맞게 사용자를 구성합니다.

* 사용자 필드 활성화/비활성화
* 필요한 [사용자 지정 사용자 필드 추가](../users-and-permissions/users/adding-custom-fields-to-users.md)
* 모르는 사람이 계정을 만들 수 있도록 허용할지 여부를 지정합니다.
* 정의 [사용자 인증](./securing-liferay/authentication-basics.md)
* 사용자를 특정 사이트( [역할](../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md), [사용자 그룹](../users-and-permissions/user-groups.md))에 자동으로 연결하도록 구성합니다.

자세한 내용은 [사용자](../system-administration/configuring-liferay/virtual-instances/users.md), [사용자 인증](../system-administration/configuring-liferay/virtual-instances/user-authentication.md), [사용자에 대한 사용자 지정 필드 추가하기](../users-and-permissions/users/adding-custom-fields-to-users.md) 를 참조하세요.

## 파일 스토리지 구성

[문서 및 미디어](../content-authoring-and-management/documents-and-media.md), 파일 첨부 및 콘텐츠에 이미지 삽입을 사용하려면 파일 저장 공간이 필요합니다. [파일 저장소](../system-administration/file-storage.md) 를 방문하여 구성하세요.

파일 저장소를 설정한 후에는 바이러스 백신 파일 검사를 사용하도록 설정하는 것이 좋습니다. 방법을 알아보려면 [업로드된 파일에 대한 바이러스 백신 검사 사용 설정](../system-administration/file-storage/enabling-antivirus-scanning-for-uploaded-files.md) 을 참조하세요.

## 검색 엔진 설치

사용자가 사이트를 검색할 수 있도록 지원하세요. Liferay 엔터프라이즈 검색과 같은 검색 엔진은 결과를 빠르게 반환합니다. [검색 엔진 설치하기](../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md).

## 안전한 라이프레이

라이프레이를 보호하는 것도 정말 중요합니다. 자세한 내용은 [보안 라이프레이](./securing-liferay.md) 에서 확인하세요.

## 백업 구성

가상 인스턴스를 개발할 때는 반드시 백업하세요. 자세한 내용은 [백업](./maintaining-a-liferay-installation/backing-up.md) 을 참조하세요.

## 기타 설정 작업

위에서 설명한 작업은 일반적으로(항상 그런 것은 아니지만) 먼저 완료됩니다. 어떤 경우든 곧 다음과 같은 해당 작업을 수행해야 할 수도 있습니다.

## 마켓플레이스에서 앱 설치

[테마](../getting-started/changing-your-sites-appearance.md), 커넥터 및 모든 종류의 애플리케이션 [Liferay 마켓플레이스](https://web.liferay.com/marketplace) 로 사이트를 개선하세요. [앱 설치 및 관리(](../system-administration/installing-and-managing-apps/installing-apps.md) )가 그 어느 때보다 쉬워졌습니다.

## 역할 및 권한 구성

[역할](../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 을 사용하여 모든 사용자를 분류합니다. 사용자가 인스턴스 및 사이트에서 수행하는 활동에 대해 [권한](../users-and-permissions/roles-and-permissions/defining-role-permissions.md) 을 정의합니다.

## 사용자 지정 필드 추가

인스턴스 및 애플리케이션의 엔티티는 추가 필드를 사용하여 사용자 지정할 수 있습니다. 여기에는 사용자에 대한 필드 추가가 포함될 수 있습니다. 자세한 내용은 [사용자 정의 필드 추가하기](../system-administration/configuring-liferay/adding-custom-fields.md) 및 [사용자 정의 필드 추가하기](../users-and-permissions/users/adding-custom-fields-to-users.md)를 참조하세요.

## 기존 시스템과 통합

Liferay는 일부 다른 시스템과 통합할 수 있습니다. 예를 들어 LDAP와 같은 디렉터리를 사용하는 경우 해당 디렉터리에서 사용자를 가져올 수 있습니다. [LDAP 디렉터리에 연결하기](../users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory.md) 는 프로세스를 보여줍니다. 이 사이트에서 필요한 통합 기능을 검색해 보세요.

## 미디어 파일 미리보기 구성

사이트의 이미지, 동영상 및 오디오 파일에 대한 외부 서비스를 설정합니다. 방법을 알아보려면 [외부 서비스 구성하기](../system-administration/using-the-server-administration-panel/configuring-external-services.md) 를 참조하세요.

## CDN 구성

CDN(콘텐츠 전송 네트워크)을 통해 정적 콘텐츠를 더 빠르게 전송하세요. 자세한 내용은 [CDN 사용](./setting-up-liferay/using-a-cdn.md) 을 참조하세요.

## 고가용성 구성

사이트 다운타임을 없애거나 최소화하고 싶을 것입니다. 서버에 장애가 발생하거나 유지보수를 위해 서버를 종료해야 하는 경우, 요청을 처리할 다른 서버를 확보하는 것이 중요합니다. Liferay, 검색 엔진 및 기타 구성 요소에 대해 여러 서버를 구성하여 사이트 가용성을 극대화할 수 있습니다. [고가용성을 위한 클러스터링](./setting-up-liferay/clustering-for-high-availability.md)에서 서버를 클러스터링하는 방법을 알아보세요.

## 라이프 레이 튜닝

최적의 성능을 위해 Liferay의 JVM, 연결 풀 등을 조정하세요. 자세한 내용은 [튜닝 Liferay](./setting-up-liferay/tuning-liferay.md) 및 [튜닝 JVM](./setting-up-liferay/tuning-your-jvm.md) 을 참조하세요.

## 다음 단계

Liferay DXP를 사용 중이고 [활성화(](./setting-up-liferay/activating-liferay-dxp.md) )를 하지 않았다면 먼저 활성화하세요. 그런 다음 [인스턴스 구성](../system-administration/configuring-liferay/virtual-instances/instance-configuration.md) 및 위에 나열된 다른 [설정 작업](#setup-tasks) 을 계속 진행합니다.

```{important}
프로덕션으로 전환하기 전에 설치 및 데이터를 백업하는 프로세스를 구성하세요. 자세한 내용은 [백업](./유지보수-라이파이-설치/백업.md)을 참조하세요.
```
