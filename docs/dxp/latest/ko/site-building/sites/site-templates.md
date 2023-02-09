---
toc:
- ./site-templates/creating-site-templates.md
- ./site-templates/propagating-template-changes.md
- ./site-templates/configuring-site-template-propagation.md
- ./site-templates/exporting-importing-site-templates.md
---
# 사이트 템플렛

```{toctree}
:maxdepth: 4

site-templates/creating-site-templates.md
site-templates/propagating-template-changes.md
site-templates/configuring-site-template-propagation.md
site-templates/exporting-importing-site-templates.md
```

Liferay는 사이트 생성 중에 사용할 수 있는 구조 및 콘텐츠를 설계하기 위한 사이트 템플릿을 제공합니다. 각 템플릿에는 페이지, 스타일북, 웹 콘텐츠 등을 추가하기 위한 대부분의 표준 사이트 응용 프로그램이 포함되어 있습니다. 템플릿으로 만든 사이트는 모든 데이터를 상속합니다. 자세한 내용은 [사이트 템플릿 만들기](./site-templates/creating-site-templates.md) 을 참조하십시오.

```{note}
사이트 템플릿은 스테이징, 워크플로, 구성원, 팀 및 세그먼트를 제외한 모든 사이트 응용 프로그램을 지원합니다.
```

템플릿을 사용하여 사이트를 만든 후에는 템플릿의 페이지를 변경하고 해당 변경 사항을 연결된 사이트에 자동으로 전파할 수 있습니다. 자세한 내용은 [템플릿 변경 전파](./site-templates/propagating-template-changes.md) 을 참조하십시오.

```{important}
사이트 템플릿은 주로 여러 사이트에서 페이지를 유지하기 위한 것입니다. 사이트 전체에서 웹 콘텐츠 및 기타 자산을 만들고 유지 관리해야 하는 경우 [자산 라이브러리](../../content-authoring-and-management/asset-libraries/asset-libraries-overview.md)를 사용하십시오.
```

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 사이트 템플릿 만들기
:link: ./site-templates/creating-site-templates.md
:::

:::{grid-item-card} 템플릿 변경 전파
:link: ./site-templates/propagating-template-changes.md
:::

:::{grid-item-card} 사이트 템플릿 전파 구성
:link: ./site-templates/configuring-site-template-propagation.md
:::

:::{grid-item-card} 사이트 템플릿 내보내기 및 가져오기
:link: ./site-templates/exporting-importing-site-templates.md
:::
::::
