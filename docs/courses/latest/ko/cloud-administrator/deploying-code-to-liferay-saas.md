---
toc:
  - ./deploying-code-to-liferay-saas/deploying-and-managing-a-microservice-client-extension-project.md
  - ./deploying-code-to-liferay-saas/troubleshooting-a-microservice-in-the-cloud-console.md
---
# LXC에 코드 배포

이제 Cloud 콘솔에 액세스하여 사용을 시작했으므로 클라이언트 확장 프로젝트를 LXC 인스턴스에 배포할 준비가 되었습니다.

```{note}
이 모듈에는 Liferay Experience Cloud에 대한 프로젝트가 필요합니다. 자체 관리 버전(LXC-SM)의 프로젝트만 있는 경우 [클라우드 구성](./cloud-configuration.md)으로 건너뛰세요.
```

LXC를 사용하면 Liferay 외부의 인프라 구성이나 유지 관리에 대해 걱정할 필요가 없으므로 Liferay DXP 내의 도구를 사용하여 사이트를 구축하고 관리하는 데만 집중할 수 있습니다. 그러나 Liferay의 기본 도구가 충분하지 않은 경우 클라이언트 확장을 사용할 수 있습니다.

[원격 앱](https://learn.liferay.com/w/dxp/building-applications/client-extensions) 은 LXC를 확장하는 포괄적인 수단입니다. [배치 클라이언트 확장](https://learn.liferay.com/w/dxp/building-applications/client-extensions/batch-client-extensions) 에 클라이언트 확장을 배포하고 [프런트엔드 클라이언트 확장](https://learn.liferay.com/w/dxp/building-applications/client-extensions/front-end-client-extensions) 또는 [마이크로서비스 클라이언트 확장](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions) . 귀하의 코드와 리소스는 Liferay의 코드에 의존하지 않으며 생성하려는 모든 것에 집중할 수 있습니다.

Delectable Bonsai의 개발자는 Liferay의 [개체](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects) 을 사용하여 고객 피드백을 수집하고 추적하는 새로운 방법을 구축하려고 합니다. 이 모듈에서는 마이크로서비스에서 간단한 카운터를 구현하기 위해 [개체 작업 YAML 구성 참조](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions/object-action-yaml-configuration-reference) 에 대한 변경 사항을 테스트, 수정 및 문제 해결하여 클라이언트 확장 배포에 대해 알아봅니다.

[갑시다!](./deploying-code-to-liferay-saas/deploying-and-managing-a-microservice-client-extension-project.md)
