---
toc:
  - ./batch-client-extensions/batch-yaml-configuration-reference.md
---
# 배치 클라이언트 확장

{bdg-primary}`Liferay Self-Hosted`
{bdg-primary}`Liferay SaaS`
{bdg-warning}`Liferay PaaS`

{bdg-secondary}`Liferay 7.4+`

배치 클라이언트 확장은 Liferay의 [배치 엔진 프레임워크](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md)와 함께 작동하여 Liferay 인스턴스에 데이터 엔터티를 제공합니다. 한 인스턴스의 데이터를 내보냅니다(예: `curl` 또는 내보내기/가져오기 센터를 통해). 그런 다음 이를 배치 클라이언트 확장에 추가하고 [배포](./working-with-client-extensions.md#deploying-to-your-liferay-instance) 하여 데이터를 다른 Liferay 인스턴스로 가져옵니다.

배치 클라이언트 확장과 함께 사용할 데이터를 내보내려면 애플리케이션 메뉴( ![애플리케이션 메뉴 아이콘](../../images/icon-applications-menu.png) )를 통해 내보내기/가져오기 센터를 사용할 수 있습니다. 내보내기/가져오기 센터를 활성화하려면 Liferay를 시작하기 전에 이 [포털 속성](../../installation-and-upgrades/reference/portal-properties.md) 추가하세요.

```properties
feature.flag.COMMERCE-8087=true
```

```{warning}
배치 프레임워크의 내보내기/가져오기 센터는 개발 중인 [기능입니다](../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags) . 프로덕션에서는 개발 기능 플래그를 활성화하지 마십시오.
```

`client-extension.yaml` 파일에 배치 클라이언트 확장을 지정합니다.

```yaml
type: batch
```

[개체 정의](../objects/creating-and-managing-objects.md) 및 [워크플로 정의](../../process-automation/workflow/introduction-to-workflow.md) 포함하여 [엔진 프레임워크](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) 에서 지원하는 모든 유형의 데이터를 Liferay 인스턴스에서 내보낼 수 있습니다.

```{important}
내보낼 때 `jsont` 파일 형식을 사용하세요. 배치 클라이언트 확장과 함께 사용할 경우 `*.batch-engine-dat.json` 파일에 `jsont`가 필요합니다.
```

`*.batch-engine-data.json` 파일이 [배치 클라이언트 확장](./batch-client-extensions/batch-yaml-configuration-reference.md) 에 추가되면 [빌드된 아카이브](./packaging-client-extensions.md) Liferay Experience Cloud 또는 자체 호스팅 Liferay 인스턴스에 배포합니다.

## 관련 주제

* [클라이언트 확장 소개](../client-extensions.md)
* [`client-extension.yaml`에서 클라이언트 확장 구성](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
* [데이터 마이그레이션 센터](../../headless-delivery/consuming-apis/data-migration-center.md)
