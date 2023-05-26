# 위젯 페이지를 콘텐츠 페이지로 변환

이전 버전에서 Widget Pages는 사용자 지정 레이아웃 및 사용자 지정 가능한 열과 같은 독점 기능을 제공했습니다. 이러한 독점 기능 중 다수는 7.3 이상의 [콘텐츠 페이지](../using-content-pages.md) 에서 사용할 수 있으므로 대부분의 경우 콘텐츠 페이지를 만들고 싶을 것입니다.

이전 버전에서 Liferay Portal 7.3 또는 7.4로 업그레이드하고 기존 위젯 페이지를 마이그레이션하는 경우 이를 콘텐츠 페이지로 변환할 수 있습니다. 위젯 페이지를 콘텐츠 페이지로 바로 변환하거나 변환을 미리 보고 변경한 다음 페이지를 변환할 수 있습니다.

변환할 페이지가 여러 개인 경우 사이트 관리를 통해 일괄 변환하거나 사용 가능한 API 및 내장 스크립트 편집기를 사용하여 모든 위젯 페이지를 한 번에 변환할 수 있습니다. 모든 접근 방식은 여기에 설명되어 있습니다.

## 위젯 페이지 미리보기 및 콘텐츠 페이지로 변환

위젯 페이지를 변환하기 전에 변환 초안을 미리 보려면 다음 단계를 따르십시오.

1. Liferay DXP 메뉴를 열고 사이트 메뉴에서 *Site Builder* &rarr; *Pages* 로 이동합니다.

1. 위젯 페이지 옆에 있는 작업 메뉴(![Actions](../../../images/icon-actions.png))를 열고 *미리보기 및 콘텐츠 페이지로 변환* 옵션을 선택합니다.

1. 모든 경고를 확인하고 변환 초안을 필요한 대로 조정합니다. 이 시점에서 원하는 조각을 초안에 추가할 수도 있습니다.

1. *Publish* 클릭하여 미리보기 초안을 게시하거나 *Discard Conversion Draft* 클릭하여 위젯 페이지를 원래 상태로 재설정합니다. 경고가 있는 경우 아래 설명된 대로 최선의 변환이 완료됩니다.

### 최선의 전환

위젯 페이지의 일부 기능은 콘텐츠 페이지에서 지원되지 않으므로 있는 그대로 변환할 수 없습니다. 이러한 경우 사용자에게 문제에 대해 경고하고 최선의 변환이 처리됩니다. 다음 위젯 페이지 기능은 지원되지 않습니다.

* **중첩된 애플리케이션:** 중첩된 애플리케이션은 대신 변환 중에 레이아웃의 동일한 열에 배치됩니다. 최상의 변환이 완료된 후 이러한 응용 프로그램을 재구성해야 할 수 있습니다.

* **사용자 지정 가능 섹션:** 페이지가 [사용자 지정 가능](./enabling-user-personalization-of-widget-pages.md)인 경우 사용자가 만든 모든 사용자 지정은 변환 중에 손실됩니다.

* **사용자 정의 페이지 레이아웃:** 레이아웃을 변환할 수 있는 경우 레이아웃 구조가 보존되고 사용자에게 경고가 표시되며 진행하기 전에 변환 초안을 검토할 기회가 주어집니다. 레이아웃을 변환할 수 없는 경우 모든 위젯이 단일 행과 열에 배치되며 페이지가 변환된 후 수동으로 재구성해야 합니다.

```{note}
사용자 지정 레이아웃 템플릿을 변환할 수 있음을 이미 확인한 경우 레이아웃을 사용하는 위젯 페이지를 변환할 때마다 표시되지 않도록 레이아웃 템플릿에 대한 레이아웃 템플릿 변환 경고를 비활성화할 수 있습니다. Liferay DXP 메뉴를 열고 *제어판* &rarr; *구성* &rarr; *시스템 설정*으로 이동합니다. 콘텐츠 및 데이터 아래에서 *페이지*를 선택하고 시스템 범위 아래의 "검증된 레이아웃 템플릿 ID" 목록에 레이아웃 템플릿 ID를 추가합니다.
```

```{note}
포틀릿은 위젯 페이지에서 [render-weight](https://docs.liferay.com/ce/portal/7.3-latest/definitions/liferay-portlet-app_7_3_0.dtd.html#render-weight) 에 따라 렌더링되지만 이는 사실이 아닙니다. 콘텐츠 페이지의 경우. 포틀릿은 콘텐츠 페이지의 페이지에 나타나는 순서대로(즉, 왼쪽에서 오른쪽으로, 위에서 아래로) 렌더링되므로 일부 포틀릿은 콘텐츠 페이지에서의 사이트에 따라 조만간 렌더링될 수 있습니다.
```

## 위젯 페이지를 콘텐츠 페이지로 직접 변환

미리보기 없이 위젯 페이지를 콘텐츠 페이지로 변환하려면 다음 단계를 따르세요.

1. Liferay DXP 메뉴를 열고 사이트 메뉴에서 *Site Builder* &rarr; *Pages* 로 이동합니다.

1. 위젯 페이지 또는 여러 위젯 페이지의 확인란을 선택합니다. 관리 도구 모음에서 *작업* 메뉴를 열고 *콘텐츠 페이지로 변환* 옵션을 선택합니다.

   ![컨텍스트 메뉴를 통해 여러 위젯 페이지를 변환할 수 있습니다.](./converting-widget-pages-to-content-pages/images/01.png)

1. 변환을 완료하기 위해 나타나는 프롬프트에서 *확인* 클릭합니다.

## API를 사용하여 모든 위젯 페이지를 콘텐츠 페이지로 대량 변환

내장된 스크립트 편집기를 사용하여 사이트의 모든 위젯 페이지를 콘텐츠 페이지로 일괄 변환할 수 있습니다.

1. Liferay DXP 메뉴를 열고 *제어판* &rarr; *구성* &rarr; *서버 관리* &rarr; *스크립트*으로 이동합니다.

1. 스크립트 창에 이 스크립트를 입력하고 그룹 ID를 자신의 ID로 바꾸십시오. Groovy 스크립트는 [`BulkLayoutConverter` 인터페이스](https://docs.liferay.com/dxp/portal/7.3-latest/apps/layout-3.0.0/javadocs/com/liferay/layout/util/BulkLayoutConverter.html) 사용하여 지정된 그룹 ID가 있는 모든 위젯 페이지를 콘텐츠 페이지로 변환합니다.

    ```groovy
    import com.liferay.layout.util.BulkLayoutConverter
    import com.liferay.portal.kernel.util.ArrayUtil
    import com.liferay.registry.Registry
    import com.liferay.registry.RegistryUtil
    import org.osgi.framework.ServiceReference
    import org.osgi.framework.BundleContext

    Registry registry = RegistryUtil.getRegistry()

    BundleContext bundleContext = registry._bundleContext

    ServiceReference serviceReference = bundleContext.getServiceReference(BulkLayoutConverter.class.getName())

    BulkLayoutConverter bulkLayoutConverter = bundleContext.getService(serviceReference);

    long groupId = 20118L // Use your groupId

    long[] plids = bulkLayoutConverter.getConvertibleLayoutPlids(groupId)

    out.println("Convertible layouts before conversion:" + ArrayUtil.toStringArray(plids))

    long[] convertedLayoutPlids = bulkLayoutConverter.convertLayouts(groupId)

    out.println("Converted layouts:" + ArrayUtil.toStringArray(convertedLayoutPlids))

    plids = bulkLayoutConverter.getConvertibleLayoutPlids(groupId)

    out.println("Convertible layouts after conversion: " + ArrayUtil.toStringArray(plids))
    ```

1. *실행* 클릭하여 스크립트를 실행합니다.

1. 변환 가능한 레이아웃(페이지)이 남아 있지 않음을 보여 주는 출력은 아래 스니펫과 유사해야 합니다.

  ```bash
  Convertible layouts before conversion:[25, 26, 27]
  Converted layouts:[25, 26, 27]
  Convertible layouts after conversion: []
  ```
