---
toc:
  - ./batch-client-extensions/batch-yaml-configuration-reference.md
---
# 배치 클라이언트 확장

{bdg-link-primary}`[개발 기능](../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags)`

{bdg-secondary}`Liferay Experience Cloud 및 Liferay DXP 7.4+(자체 호스팅)`

```{toctree}
:maxdepth: 3

batch-client-extensions/batch-yaml-configuration-reference.md
```

배치 클라이언트 확장은 Liferay의 [배치 엔진 프레임워크](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) 과 함께 작동하여 Liferay 인스턴스에 데이터 엔터티를 제공합니다. Liferay의 가져오기/내보내기 센터에서 한 인스턴스의 데이터를 내보냅니다. 그런 다음 배치 클라이언트 확장에 추가하고 [배포](./working-with-client-extensions.md#deploying-to-your-liferay-instance) 데이터를 다른 Liferay 인스턴스로 가져옵니다.

배치 클라이언트 확장을 활성화하려면 Liferay를 시작하기 전에 이 [포털 속성](../../installation-and-upgrades/reference/portal-properties.md) 추가하십시오.

```properties
feature.flag.COMMERCE-8087=true
```

```{warning}
이것은 [개발 중인 기능](../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags)입니다. 프로덕션 환경에서 개발 기능 플래그를 사용하지 마세요.
```

`client-extension.yaml` 파일에서 배치 클라이언트 확장을 지정합니다.

```yaml
type: batch
```

[배치 엔진 프레임워크](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) 에서 지원하는 모든 유형의 데이터를 Liferay 인스턴스에서 내보낼 수 있습니다. 여기에는 [객체 정의](../objects/creating-and-managing-objects.md) 및 [워크플로우 정의](../../process-automation/workflow/introduction-to-workflow.md)가 포함됩니다. 내보낼 때 JSONT 파일 형식을 선택합니다. `*.batch-engine-data.json` 파일이 [배치 클라이언트 확장](./batch-client-extensions/batch-yaml-configuration-reference.md)에 추가되면 [빌드된 아카이브](./packaging-client-extensions.md) Liferay Experience Cloud 또는 자체 호스팅 Liferay 인스턴스에 배포합니다.

## 추가 정보

* [클라이언트 확장 소개](../client-extensions.md)
* [`client-extension.yaml`에서 클라이언트 확장 구성](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
