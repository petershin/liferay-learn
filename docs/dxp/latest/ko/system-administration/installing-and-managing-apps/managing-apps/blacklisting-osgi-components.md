# OSGi 구성요소 블랙리스트 작성

구성 요소 블랙리스트는 여러 [OSGi 선언적 서비스 구성 요소](https://help.liferay.com/hc/articles/360028846452-Declarative-Services) (구성 요소)을 관리하는 편리한 방법입니다. 목록은 DXP가 구성 요소를 비활성화하는 데 사용하는 [OSGi 구성](../../configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) 입니다. 이 목록은 [응용 프로그램 관리자](./using-the-app-manager.md) 또는 [Gogo 셸](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)을 사용하여 개별적으로 수정하는 수고를 덜어줍니다.

블랙리스트는 제어판에서 OSGi 구성(`.config`) 파일로 내보낼 수 있습니다. 파일을 수정하고 DXP에 배포하면 다음과 같은 추가 효과가 있습니다.

* DXP 서버 시작 시 변경 사항 유지
* 로컬 클러스터 노드에서 다른 모든 노드로 변경 사항을 전파합니다.

UI 및 구성 파일을 사용하여 구성 요소를 블랙리스트에 추가하는 방법이 시연됩니다.

## 블랙리스트 구성 요소

OSGi 구성 요소를 비활성화하려면 다음 단계를 따르십시오.

1. 제어판에서 *구성* &rarr; *시스템 설정* &rarr; *모듈 컨테이너*로 이동합니다. 구성 요소 블랙리스트 화면이 나타납니다.

1. 구성 요소 블랙리스트 화면에서 비활성화할 구성 요소의 이름을 추가하고 *저장* 버튼을 클릭합니다. 구성 요소가 즉시 비활성화됩니다.

    ![이 블랙리스트는 com.liferay.portal.security.ldap.internal.authenticator.LDAPAuth 및 com.liferay.ip.geocoder.sample.web.internal.portlet.IPGeocoderSamplePortlet 구성 요소를 비활성화합니다.](./blacklisting-osgi-components/images/01.png)

1. 블랙리스트를 내보내려면 구성 요소 블랙리스트 모듈의 작업 버튼(![액션](./blacklisting-osgi-components/images/02.png)) 다음 *내보내기*을 클릭합니다. 그런 다음 블랙리스트 구성 파일이 다운로드됩니다(`com.liferay.portal.component.blacklist.internal.ComponentBlacklistConfiguration.config`). 다음은 예제 목록에서 생성된 파일의 내용입니다.

    ```properties
    blacklistComponentNames=["com.liferay.portal.security.ldap.internal.authenticator.LDAPAuth","com.liferay.ip.geocoder.sample.web.internal.portlet.IPGeocoderSamplePortlet "]
    ```

1. 활성화하지 않으려는 아직 나열되지 않은 구성 요소(예: 아직 설치되지 않은 모듈 구성 요소)의 이름을 추가하십시오.

    ```{important}
    구성 값에는 추가 공백이 포함될 수 없습니다. 추가 공백은 목록을 단락시키거나 구성 항목을 무효화할 수 있습니다.
    ```

1. 구성 파일을 배포하려면 `[Liferay Home]/osgi/configs`폴더에 복사합니다. Liferay Home 폴더는 일반적으로 앱 서버의 상위 폴더입니다.

## 블랙리스트에 포함된 구성 요소 재활성화

블랙리스트에 있는 OSGi 구성 요소를 다시 활성화하고 활성화하려면 다음 단계를 따르십시오.

1. 구성 파일 `[Liferay Home]/osgi/configs/com.liferay.portal.component.blacklist.internal.ComponentBlacklistConfiguration.config`을 엽니다.

1. `blacklistComponentNames` 목록에서 구성 요소 이름을 제거하고 파일을 저장합니다.

블랙리스트에 있는 구성 요소를 *모두* 활성화하려면 구성 파일을 제거하십시오.

```{note}
블랙리스트에 포함된 구성 요소를 일시적으로 다시 활성화하려면 시스템 설정의 구성 요소 블랙리스트 구성 모듈에서 해당 이름을 제거하고 *업데이트*를 클릭하십시오. 구성 요소 블랙리스트 구성 파일(``[Liferay Home]/osgi/configs`` 폴더에 있음)을 사용 중이고 이후 서버 시작 시 구성 요소를 활성화하려면 파일에서 구성 요소의 이름을 제거해야 합니다.
```

축하합니다! 이제 간단한 목록을 사용하여 여러 구성 요소를 관리할 수 있습니다.

## 추가 정보

* [블랙리스트 앱](./blacklisting-apps.md)
* [앱 관리](./using-the-app-manager.md)
* [Felix Gogo 셸 사용](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)