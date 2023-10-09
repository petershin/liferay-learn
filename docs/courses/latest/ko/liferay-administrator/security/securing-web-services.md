---
toc:
  - ./securing-web-services/service-access-policies.md
  - ./securing-web-services/cross-origin-resource-sharing.md
---
# 웹 서비스 보안

Liferay는 거의 모든 기능에 대한 API를 제공합니다. 이러한 API를 사용하여 Liferay의 엔터티 또는 직접 생성한 개체와 프로그래밍 방식으로 상호 작용할 수 있습니다.

서비스 액세스 정책은 원격으로 호출할 수 있는 서비스 또는 서비스 방법을 정의합니다. 사용자의 접근 인증 여부와 관계없이 서비스 접근 정책에 따라 해당 서비스에 대한 접근이 허용되지 않으면 원격으로 호출할 수 없습니다.

여기에서는 용도에 맞게 서비스 액세스 정책을 조정하는 방법을 알아봅니다.

CORS(교차 원본 리소스 공유)는 브라우저에 대해 Liferay 시스템의 어떤 리소스를 다른 도메인 또는 원본과 공유할 수 있는지 정의합니다. Liferay 시스템에 저장된 리소스에 액세스해야 하는 별도의 도메인에 애플리케이션이 있는 경우 CORS를 구성해야 합니다. 샘플 앱을 배포하고 방법을 알아봅니다.

다음: [서비스 액세스 정책](./securing-web-services/service-access-policies.md)

## 관련 개념

- [서비스 액세스 정책 설정](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies)
- [CORS 설정](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors)
