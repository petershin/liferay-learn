# 콘텐츠 페이지 번역

{bdg-secondary}`사용 가능한 Liferay 7.4 U15+ 및 GA15+`

Liferay는 *콘텐츠 페이지*번역을 위한 통합 도구를 제공하므로 글로벌 사용자를 위해 매력적이고 현지화된 경험을 만들 수 있습니다. 이러한 도구를 사용하여 콘텐츠 페이지 경험을 수동으로 번역하거나 번역을 XLIFF 파일로 가져올 수 있습니다.

```{important}
콘텐츠 페이지를 번역할 때 사용자는 페이지의 이름과 인라인 조각 텍스트(예: HTML, 헤더 등)만 번역할 수 있습니다. 위젯 또는 매핑된 조각 필드를 번역할 수 없습니다.
```

원하는 경우 [사용자 정의 작업 흐름을 활성화하여](./enabling-workflows-for-translations.md) 번역에 대한 검토 및 게시 프로세스를 지시할 수 있습니다.

```{note}
번역에 사용할 수 있는 언어는 인스턴스의 현지화 설정에 따라 결정됩니다. 자세한 내용은 [초기 인스턴스 현지화](../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md) 및 [가상 인스턴스 현지화](../../system-administration/configuring-liferay/virtual-instances/localization.md)를 참조하십시오.
```

## 콘텐츠 페이지 수동 번역

```{note}
콘텐츠 페이지 경험을 수동으로 번역하려면 사용자에게 콘텐츠 페이지에 대한 *보기* 및 *업데이트* 권한 또는 하나 이상의 언어에 대한 번역 권한이 있어야 합니다. 자세한 내용은 [번역 권한 관리](./managing-translation-permissions.md)를 참조하세요.
```

콘텐츠 페이지 경험을 수동으로 번역하려면 다음 단계를 따르세요.

1. *사이트 메뉴* (![Site Menu](../../images/icon-product-menu.png))을 열고 *사이트 빌더*확장한 다음 *페이지*으로 이동합니다.

1. 번역할 콘텐츠 페이지에 대해 *작업* 버튼(![Actions Button](../../images/icon-actions.png))을 클릭하고 *번역*선택합니다.

   이렇게 하면 번역과 함께 콘텐츠의 원본 텍스트를 볼 수 있는 번역 인터페이스로 리디렉션됩니다.

   왼쪽 열에는 번역 중인 언어가 표시되고 오른쪽 열에는 번역에 사용할 수 있는 편집 가능한 필드가 제공됩니다.

   ![번역을 선택하면 번역 인터페이스로 리디렉션됩니다.](./translating-content-pages/images/01.png)

1. 번역할 *경험* 및 *언어* 선택합니다.

   페이지 업데이트 권한이 있는 사용자는 원본 텍스트를 모든 언어로 번역할 수 있습니다.

   번역 권한이 있는 사용자는 원본 텍스트를 권한이 있는 언어로만 번역할 수 있습니다.

   ```{important}
   페이지 환경 간에 전환하면 저장되지 않은 모든 변경 사항이 삭제됩니다. 작업 손실을 방지하려면 다른 환경으로 전환하기 전에 변경 사항을 저장하십시오.
   ```

   ![번역하려는 경험과 언어를 선택하십시오.](./translating-content-pages/images/02.png)

1. 사용 가능한 필드에 대한 번역을 입력하십시오.

1. *게시* 또는 *초안으로 저장*클릭합니다.

   번역을 게시하면 콘텐츠 페이지에 적용되고 초안으로 저장됩니다.

   또한 워크플로가 활성화된 경우 번역을 게시하면 페이지에 적용되고 초안으로 저장되기 전에 검토 프로세스가 시작됩니다.

   또는 *초안으로 저장* 클릭하여 나중에 번역을 적용할 수 있습니다.

## 번역 내보내기 및 가져오기

```{note}
번역을 위해 페이지를 내보내거나 XLIFF 번역을 가져오려면 선택한 페이지에 대한 *보기* 및 *업데이트* 권한이 있어야 합니다. 자세한 내용은 [번역 권한 관리](./managing-translation-permissions.md)를 참조하세요.
```

Liferay를 사용하면 번역을 위해 콘텐츠 페이지 경험을 `.xliff` 또는 `.xlf` 파일로 내보낼 수 있습니다. 이러한 파일을 번역가에게 보낸 다음 번역을 `.zip` 파일로 함께 가져오거나 개별적으로 `.xliff` 또는 `.xlf` 파일로 가져올 수 있습니다.

```{important}
Liferay는 XLIFF 1.2 및 2.0 파일을 모두 지원합니다. 그러나 해당 형식이 제공하는 모든 기능을 지원하지 않을 수 있습니다.
```

### 번역을 위해 페이지 내보내기

다음 단계를 따르세요.

1. *사이트 메뉴* (![Site Menu](../../images/icon-product-menu.png))을 열고 *사이트 빌더*확장한 다음 *페이지*으로 이동합니다.

1. 번역할 콘텐츠 페이지에 대해 *작업* 버튼(![Actions Button](../../images/icon-actions.png))을 클릭하고 *번역을 위해 내보내기*선택합니다. 그러면 내보내기 구성을 위한 모달 창이 열립니다.

   ![번역을 위해 내보내기를 선택합니다.](./translating-content-pages/images/03.png)

1. 내보내기 형식 선택: *XLIFF 1.2* 또는 *XLIFF 2.0*.

1. 콘텐츠 페이지의 원래 언어를 선택합니다.

1. 번역할 언어를 선택합니다.

1. 번역하려는 경험을 선택하십시오.

   ![내보내기를 구성합니다.](./translating-content-pages/images/04.png)

1. *내보내기*클릭합니다.

Liferay는 선택한 각 경험에 대한 XLIFF 파일이 포함된 ZIP 아카이브를 생성합니다. 그런 다음 이러한 파일을 호환되는 번역 소프트웨어와 함께 사용할 수 있습니다.

### 페이지 번역 가져오기

다음 단계를 따르세요.

1. *사이트 메뉴* (![Site Menu](../../images/icon-product-menu.png))을 열고 *사이트 빌더*확장한 다음 *페이지*으로 이동합니다.

1. 번역된 콘텐츠 페이지에 대해 *작업* 버튼(![Actions Button](../../images/icon-actions.png))을 클릭하고 *번역 가져오기*선택합니다.

   ![번역 가져오기를 선택합니다.](./translating-content-pages/images/05.png)

1. 가져올 `.xliff`, `.xlf`및 `.zip` 파일을 선택합니다.

   ![가져올 번역 파일을 선택합니다.](./translating-content-pages/images/06.png)

   ```{important}
   Liferay는 [번역을 위해 내보내기](#exporting-pages-for-translation) 작업을 사용하여 생성된 XLIFF 파일 가져오기를 지원하지만 다른 방법으로 생성된 파일의 성공적인 가져오기를 보장할 수 없습니다.
   ```

1. *게시*클릭합니다.

   가져오기에 성공하면 Liferay는 가져온 파일과 함께 성공 메시지를 표시합니다. 번역이 콘텐츠 페이지에 적용되고 페이지가 초안으로 저장됩니다. 워크플로가 활성화된 경우 페이지에 적용되기 전에 번역이 승인되어야 합니다.

   ![가져오기에 성공하면 Liferay는 가져온 파일과 함께 성공 메시지를 표시합니다.](./translating-content-pages/images/07.png)

   그러나 가져오기 중에 오류가 발생하면 Liferay는 실패한 파일을 알리고 다운로드 가능한 CSV 오류 보고서를 제공합니다.

   ![가져오기 중에 오류가 발생하면 Liferay는 실패한 파일을 알리고 다운로드 가능한 CSV 오류 보고서를 제공합니다.](./translating-content-pages/images/08.png)

## 타사 서비스를 사용하여 콘텐츠 페이지 번역

[Google Cloud Translation](./using-third-parties-for-translation.md#enabling-google-cloud-translation) , [Amazon Translate](./using-third-parties-for-translation.md#enabling-amazon-translate) 또는 [Microsoft Translator](./using-third-parties-for-translation.md#enabling-microsoft-translator) 와 Liferay의 통합을 활성화한 경우 이를 사용하여 웹 콘텐츠를 자동으로 번역할 수 있습니다. 자세한 내용은 [번역에 제3자 사용](./using-third-parties-for-translation.md) 참조하십시오.

## 관련 주제

* [웹 콘텐츠 번역](./translating-web-content.md)
* [제3자를 번역에 사용](./using-third-parties-for-translation.md)
* [번역을 위한 워크플로우 활성화](./enabling-workflows-for-translations.md)
