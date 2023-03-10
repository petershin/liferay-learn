# 구성 모델 수신기 참조

자체 구성 [에서 모델](../configuration-framework.md) 를 사용하여 이벤트를 수신하고 응답으로 코드를 실행하십시오. 모델 리스너를 생성하려면 다음 세 단계만 필요합니다.

* [`ConfigurationModelListener`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/static/portal-configuration/portal-configuration-persistence-api/src/main/java/com/liferay/portal/configuration/persistence/listener/ConfigurationModelListener.java) 인터페이스 구현
* `@Component` 주석으로 리스너를 등록합니다. `service = ConfigurationModelListener.class`
* 리스너가 트리거될 때 발생하는 작업에 대한 사용자 정의 논리를 추가하십시오.

Liferay의 [`PasswordPoliciesConfigurationModelListener`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/password-policies-admin/password-policies-admin-web/src/main/java/com/liferay/password/policies/admin/web/internal/configuration/persistence/listener/PasswordPoliciesConfigurationModelListener.java) 에서 리스너 구현을 참조하십시오.

다음 사항에 유의하십시오.

* 구성 모델 리스너는 시스템, 인스턴스 및 사이트 설정 구성 변경 시 트리거 및 확인합니다.
* 구성 모델 리스너는 서버가 이미 시작되고 리스너가 등록될 때 구성 파일이 배포될 때 트리거됩니다.
* 구성 모델 리스너는 시작 **전에** 인스턴스에 배포된 구성 파일에 대해 트리거되지 않습니다.

모델 리스너에 대한 자세한 내용은 [모델 리스너 만들기](../../../liferay-internals/extending-liferay/creating-a-model-listener.md) 을 참조하십시오.
