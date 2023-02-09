---
toc:
- ./setting-up-liferay/activating-liferay-dxp.md
- ./../system-administration/configuring-liferay/virtual-instances/instance-configuration.md
- ./setting-up-liferay/initial-instance-localization.md
- ./setting-up-liferay/configuring-mail.md
- ./../system-administration/configuring-liferay/virtual-instances/users.md
- ./../system-administration/file-storage.md
- ./../system-administration/file-storage/enabling-antivirus-scanning-for-uploaded-files.md
- ./../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md
- ./maintaining-a-liferay-installation/backing-up.md
- ./../system-administration/installing-and-managing-apps.md
- ./setting-up-liferay/using-a-cdn.md
- ./setting-up-liferay/clustering-for-high-availability.md
- ./setting-up-liferay/tuning-liferay.md
- ./setting-up-liferay/tuning-your-jvm.md
---
# 라이프레이 설정

```{toctree}
:maxdepth: 3

setting-up-liferay/activating-liferay-dxp.md
../system-administration/configuring-liferay/virtual-instances/instance-configuration.md
setting-up-liferay/initial-instance-localization.md
setting-up-liferay/configuring-mail.md
../system-administration/configuring-liferay/virtual-instances/users.md
../system-administration/file-storage.md
../system-administration/file-storage/enabling-antivirus-scanning-for-uploaded-files.md
../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md
maintaining-a-liferay-installation/backing-up.md
../system-administration/installing-and-managing-apps.md
setting-up-liferay/using-a-cdn.md
setting-up-liferay/clustering-for-high-availability.md
setting-up-liferay/tuning-liferay.md
setting-up-liferay/tuning-your-jvm.md
```

Liferay [을 설치](./installing-liferay.md)후 필요에 맞게 구성하십시오. 다음은 일반적인 설정 작업입니다.

**설정 작업**

* [Liferay](#activate-liferay) 활성화(구독 필요)
* [인스턴스 구성](#configure-your-instance)
* [인스턴스 현지화](#localize-your-instance)
* [메일 구성](#configure-mail)
* [사용자 구성](#configure-users)
* [파일 스토리지 구성](#configure-file-storage)
* [검색 엔진 설치](#install-a-search-engine)
* [보안 라이프레이](#secure-liferay)
* [백업 구성](#configure-backups)

**기타 설정 작업**

* [Marketplace에서 앱 설치](#install-apps-from-marketplace)
* [역할 및 권한 구성](#configure-roles-and-permissions)
* [사용자 정의 필드 추가](#add-custom-fields)
* [기존 시스템과 통합](#integrate-with-existing-systems)
* [미디어 파일 미리보기 구성](#configure-media-file-previews)
* [CDN 구성](#configure-a-cdn)
* [고가용성 구성](#configure-high-availability)
* [라이프레이 조정](#tune-liferay)
* [JNDI 설정](#setting-up-jndi)

위의 각 작업은 해당 문서에 대한 참조를 포함하는 아래 설명으로 연결됩니다. 첫 번째 작업은 생산 준비가 된 Liferay 인스턴스에 필수적입니다. 시스템에도 적용되는 *기타 설정 작업* 을 검토하십시오. 작업을 완료하면 위의 체크리스트를 다시 확인하십시오.

## 라이프레이 활성화

`Subscribers`

Liferay DXP를 사용하는 경우 [활성화 키를 적용합니다](./setting-up-liferay/activating-liferay-dxp.md).

## 인스턴스 구성

가상 인스턴스의 기본 모양, 연락처 정보, 사용 약관 및 랜딩 페이지와 로그아웃 페이지를 포함한 필수 페이지를 구성합니다. [인스턴스 구성](../system-administration/configuring-liferay/virtual-instances/instance-configuration.md) 은 모든 작업을 수행하는 방법을 설명합니다.

## 인스턴스 현지화

인스턴스의 로캘과 시간대를 구성합니다. 자세한 내용은 [초기 인스턴스 현지화](./setting-up-liferay/initial-instance-localization.md) 을 참조하십시오.

## 메일 구성

[사용자와 통신하기 위해 메일 서버](./setting-up-liferay/configuring-mail.md) 을 설정합니다. 그런 다음 이메일 확인, 비밀번호 재설정 및 비밀번호 변경을 위한 이메일 발신자 및 메시지 템플릿을 포함하여 [이메일 설정](../system-administration/configuring-liferay/virtual-instances/email-settings.md)을 구성합니다.

## 사용자 구성

사용자 [을 이해](../users-and-permissions/users/understanding-users.md)후 인스턴스에 맞게 구성하십시오.

* 사용자 필드 활성화/비활성화
* 필요한 [사용자 지정 사용자 필드 추가](../users-and-permissions/users/adding-custom-fields-to-users.md)
* 낯선 사람이 계정을 만들 수 있도록 허용할지 여부 지정
* 정의 [사용자 인증](./securing-liferay/authentication-basics.md)
* 특정 사이트, [역할](../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)및 [사용자 그룹](../users-and-permissions/user-groups.md)에 대한 사용자 자동 연결 구성

자세한 내용은 [사용자](../system-administration/configuring-liferay/virtual-instances/users.md), [사용자 인증](../system-administration/configuring-liferay/virtual-instances/user-authentication.md)및 [사용자 정의 필드 추가](../users-and-permissions/users/adding-custom-fields-to-users.md) 를 방문하십시오.

## 파일 스토리지 구성

[문서 및 미디어](../content-authoring-and-management/documents-and-media.md), 파일 첨부 및 콘텐츠에 이미지 삽입을 사용하려면 파일 저장소가 필요합니다. [File Storage](../system-administration/file-storage.md) 을 방문하여 구성하십시오.

파일 저장소를 설정한 후 바이러스 백신 파일 검사를 활성화하는 것이 좋습니다. 자세한 방법은 [업로드된 파일에 대한 바이러스 백신 검사 활성화](../system-administration/file-storage/enabling-antivirus-scanning-for-uploaded-files.md) 을 참조하십시오.

## 검색 엔진 설치

사용자가 귀하의 사이트를 검색할 수 있도록 합니다. Liferay Enterprise Search와 같은 검색 엔진은 결과를 빠르게 반환합니다. [검색 엔진 설치](../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md)을 방문하십시오.

## 보안 라이프레이

Liferay를 확보하는 것도 정말 중요합니다. 자세한 내용은 [Liferay](./securing-liferay.md) 확보로 이동하십시오.

## 백업 구성

가상 인스턴스를 개발할 때 반드시 백업하십시오. 지침은 [백업](./maintaining-a-liferay-installation/backing-up.md) 을 참조하십시오.

## 기타 설정 작업

위에서 설명한 작업은 일반적으로(항상 그런 것은 아님) 먼저 완료됩니다. 어쨌든 다음 해당 작업도 곧 수행해야 할 수 있습니다.

## Marketplace에서 앱 설치

[테마](../getting-started/changing-your-sites-appearance.md), 커넥터 및 [Liferay Marketplace](https://web.liferay.com/marketplace)에서 사용할 수 있는 모든 종류의 응용 프로그램으로 사이트를 개선하십시오. [앱](../system-administration/installing-and-managing-apps/installing-apps.md) 설치 및 관리가 그 어느 때보다 쉬워졌습니다.

## 역할 및 권한 구성

[역할](../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 을 사용하여 모든 사용자를 분류하십시오. 인스턴스 및 사이트에서 사용자가 수행하는 활동에 대해 [권한](../users-and-permissions/roles-and-permissions/defining-role-permissions.md) 을 정의합니다.

## 사용자 정의 필드 추가

인스턴스 및 애플리케이션의 엔터티는 추가 필드로 사용자 지정할 수 있습니다. 여기에는 사용자에 대한 필드 추가가 포함될 수 있습니다. 자세한 내용은 [사용자 정의 필드 추가](../system-administration/configuring-liferay/adding-custom-fields.md) 및 [사용자를 위한 사용자 정의 필드 추가](../users-and-permissions/users/adding-custom-fields-to-users.md)을 참조하십시오.

## 기존 시스템과 통합

Liferay는 다른 시스템과 통합할 수 있습니다. 예를 들어 LDAP와 같은 디렉터리를 사용하는 경우 여기에서 사용자를 가져올 수 있습니다. [LDAP 디렉터리에 연결](../users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory.md) 은 프로세스를 보여줍니다. 필요할 수 있는 통합에 대해 이 사이트를 검색하십시오.

## 미디어 파일 미리보기 구성

사이트의 이미지, 비디오 및 오디오 파일에 대한 외부 서비스를 설정합니다. 자세한 방법은 [외부 서비스 구성](../system-administration/using-the-server-administration-panel/configuring-external-services.md) 을 참조하십시오.

## CDN 구성

콘텐츠 전송 네트워크(CDN)를 통해 정적 콘텐츠를 더 빠르게 제공합니다. 자세한 내용은 [CDN 사용](./setting-up-liferay/using-a-cdn.md) 을 참조하십시오.

## 고가용성 구성

사이트 가동 중지 시간을 제거하거나 최소화해야 합니다. 서버에 장애가 발생하거나 유지 관리를 위해 종료해야 하는 경우 다른 서버에서 요청을 처리하도록 하는 것이 중요합니다. Liferay, 검색 엔진 및 기타 구성 요소에 대해 여러 서버를 구성하여 사이트 가용성을 최대화할 수 있습니다. [고가용성을 위한 클러스터링](./setting-up-liferay/clustering-for-high-availability.md)에서 서버를 클러스터링하는 방법을 알아보세요.

## 라이프레이 조정

최적의 성능을 위해 Liferay의 JVM, 연결 풀 등을 조정하십시오. 자세한 내용은 [튜닝 Liferay](./setting-up-liferay/tuning-liferay.md) 및 [JVM](./setting-up-liferay/tuning-your-jvm.md) 튜닝을 참조하십시오.

## 다음

Liferay DXP를 사용 중이고 [활성화](./setting-up-liferay/activating-liferay-dxp.md)하지 않은 경우 먼저 활성화하십시오. 그런 다음 [인스턴스 구성](../system-administration/configuring-liferay/virtual-instances/instance-configuration.md) 및 위에 나열된 다른 [설정 작업](#setup-tasks)을 계속 진행합니다.

```{important}
프로덕션으로 이동하기 전에 설치 및 데이터 백업 프로세스를 구성하십시오. 자세한 내용은 [백업](./maintaining-a-liferay-installation/backing-up.md)을 참조하십시오.
```
