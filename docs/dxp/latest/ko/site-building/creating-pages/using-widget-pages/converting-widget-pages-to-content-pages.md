# 위젯 페이지를 콘텐츠 페이지로 변환

이전 버전에서는 위젯 페이지가 사용자 정의 레이아웃 및 사용자 정의 가능한 열과 같은 독점 기능을 제공했습니다. 이러한 독점 기능 중 다수는 7.3 이상의 [콘텐츠 페이지](../using-content-pages.md)에서 사용할 수 있으므로 대부분의 경우 콘텐츠 페이지를 만드는 것이 좋습니다.

이전 버전에서 Liferay Portal 7.3 또는 7.4로 업그레이드하고 기존 위젯 페이지를 마이그레이션하는 경우 해당 페이지를 콘텐츠 페이지로 변환할 수 있습니다. 위젯 페이지를 콘텐츠 페이지로 즉시 변환할 수도 있고, 변환을 미리 보고 변경한 후 페이지를 변환할 수도 있습니다.

변환할 페이지가 여러 개인 경우 사이트 관리를 통해 대량 변환하거나 사용 가능한 API 및 내장 스크립트 편집기를 사용하여 모든 위젯 페이지를 한 번에 변환할 수 있습니다. 모든 접근 방식은 여기에 설명되어 있습니다.

## 위젯 페이지를 미리 보고 콘텐츠 페이지로 변환

위젯 페이지를 변환하기 전에 변환 초안을 미리 보려면 다음 단계를 따르세요.

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. 원하는 위젯 페이지 옆에 있는 **작업**(![Actions](../../../images/icon-actions.png))을 열고 **컨텐츠 페이지로 전환...** 을 선택합니다.

1. 모든 경고를 확인하고 변환 초안에 필요한 조정을 수행합니다. 이 시점에서 초안에 원하는 조각을 추가할 수도 있습니다.

1. **게시** 를 클릭하여 미리보기 초안을 게시하거나 **변환 초안 삭제** 를 클릭하여 위젯 페이지를 원래 상태로 재설정하세요. 경고가 있는 경우 아래 설명된 대로 최선의 변환이 완료됩니다.

### 최선의 노력 전환

위젯 페이지의 일부 기능은 콘텐츠 페이지에서 지원되지 않으므로 그대로 변환할 수 없습니다. 이러한 경우 사용자에게 문제에 대한 경고가 표시되고 최선의 변환이 처리됩니다. 다음 위젯 페이지 기능은 지원되지 않습니다.

**중첩 애플리케이션:** 중첩 애플리케이션은 대신 변환 중에 레이아웃의 동일한 열에 배치됩니다. 최선의 변환이 완료된 후 이러한 애플리케이션을 재구성해야 할 수도 있습니다.

**사용자 정의 가능한 섹션:** 페이지가 [customizable](./enabling-user-personalization-of-widget-pages.md)인 경우 사용자가 수행한 모든 사용자 정의는 변환 중에 손실됩니다.

**사용자 정의 페이지 레이아웃:** 레이아웃을 변환할 수 있는 경우 레이아웃 구조가 보존되며 사용자에게 경고가 표시되고 진행하기 전에 변환 초안을 검토할 수 있는 기회가 제공됩니다. 레이아웃을 변환할 수 없는 경우 모든 위젯은 단일 행과 열에 배치되며 페이지 변환 후 수동으로 재구성해야 합니다.

사용자 정의 레이아웃 템플릿을 변환할 수 있음을 이미 확인한 경우 해당 레이아웃을 사용하는 위젯 페이지를 변환할 때마다 표시되지 않도록 레이아웃 템플릿에 대한 레이아웃 템플릿 변환 경고를 비활성화할 수 있습니다.

**글로벌 메뉴**(![응용 프로그램 메뉴 아이콘](../../../images/icon-applications-menu.png))를 열고 **제어판** &rarr; **구성** &rarr; **시스템 설정으로 이동합니다.** .

콘텐츠 및 데이터에서 **페이지** 를 선택하고 **위젯 페이지에서 콘텐츠 페이지 변환기** 로 이동한 다음 확인된 레이아웃 템플릿 ID 목록에 레이아웃 템플릿 ID를 추가합니다.

```{note}
포틀릿은 위젯의 [render-weight](https://resources.learn.liferay.com/reference/latest/en/dxp/definitions/liferay-portlet-app_7_4_0.dtd.html#render-weight) 에 따라 렌더링됩니다. 이는 콘텐츠 페이지에는 해당되지 않습니다. 포틀릿은 콘텐츠 페이지의 페이지에 나타나는 순서대로(예: 왼쪽에서 오른쪽, 위에서 아래로) 렌더링되므로 일부 포틀릿은 콘텐츠 페이지에서의 배치에 따라 조만간 렌더링되거나 나중에 렌더링될 수 있습니다.
```

## 위젯 페이지를 콘텐츠 페이지로 직접 변환

미리보기 없이 위젯 페이지를 콘텐츠 페이지로 변환하려면 다음 단계를 따르세요.

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. 위젯 페이지 또는 여러 위젯 페이지의 확인란을 선택하세요. 관리 도구 모음에서 **작업**(![작업 메뉴](../../../images/icon-actions.png))을 클릭하고 **컨텐츠 페이지로 변환** 옵션을 선택합니다.

![You can convert multiple widget pages through the context menu](./converting-widget-pages-to-content-pages/images/01.png)

1. 변환을 완료하려면 나타나는 프롬프트에서 **확인** 을 클릭하세요.

## API를 사용하여 모든 위젯 페이지를 콘텐츠 페이지로 대량 변환

내장된 스크립트 편집기를 사용하여 사이트의 모든 위젯 페이지를 콘텐츠 페이지로 대량 변환할 수 있습니다.

1. **글로벌 메뉴**(![응용 프로그램 메뉴 아이콘](../../../images/icon-applications-menu.png))를 열고 **제어판** &rarr; **시스템** &rarr; **서버 관리** 로 이동합니다. &rarr; **스크립트** .

1. 스크립트 창에 이 스크립트를 입력하고 그룹 ID를 자신의 것으로 바꾸십시오. Groovy 스크립트는 [`BulkLayoutConverter` 인터페이스](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/layout/com.liferay.layout.api/com/liferay/layout/util/BulkLayoutConverter.html) 를 사용하여 지정된 그룹 ID를 가진 모든 위젯 페이지를 콘텐츠 페이지로 변환합니다.

```groovy
import com.liferay.layout.util.BulkLayoutConverter
import com.liferay.portal.kernel.util.ArrayUtil
import org.osgi.framework.ServiceReference
import org.osgi.framework.BundleContext
import com.liferay.portal.kernel.module.util.SystemBundleUtil
import org.osgi.framework.BundleContext

BundleContext bundleContext = SystemBundleUtil.getBundleContext();

ServiceReference serviceReference = bundleContext.getServiceReference(BulkLayoutConverter.class.getName());

BulkLayoutConverter bulkLayoutConverter = bundleContext.getService(serviceReference);

long groupId = 20118L // Use your groupId

long[] plids = bulkLayoutConverter.getConvertibleLayoutPlids(groupId)

out.println("Convertible layouts before conversion:" + ArrayUtil.toStringArray(plids))

long[] convertedLayoutPlids = bulkLayoutConverter.convertLayouts(groupId)

out.println("Converted layouts:" + ArrayUtil.toStringArray(convertedLayoutPlids))

plids = bulkLayoutConverter.getConvertibleLayoutPlids(groupId)

out.println("Convertible layouts after conversion: " + ArrayUtil.toStringArray(plids))
```

1. **실행** 을 클릭하여 스크립트를 실행하세요.

1. 변환 가능한 레이아웃(페이지)이 남아 있지 않음을 보여주기 위해 출력은 아래 스니펫과 유사해야 합니다.

```bash
Convertible layouts before conversion:[25, 26, 27]
Converted layouts:[25, 26, 27]
Convertible layouts after conversion: []
```
