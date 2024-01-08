# 웹 콘텐츠 번역

{bdg-secondary}`liferay DXP/포탈 7.3+`

Liferay는 웹 콘텐츠 기사 번역을 위한 통합 도구를 제공하므로 전 세계 사용자를 위한 매력적이고 현지화된 콘텐츠를 만들 수 있습니다. 이러한 도구를 사용하면 웹 콘텐츠를 수동으로 번역하거나 번역을 XLIFF 파일로 가져올 수 있습니다.

원하는 경우 사용자 정의 작업 흐름을 [하여](./enabling-workflows-for-translations.md) 번역에 대한 검토 및 게시 프로세스를 지시할 수 있습니다.

```{note}
번역 가능한 언어는 인스턴스의 현지화 설정에 따라 결정됩니다. 자세한 내용은 [초기 인스턴스 현지화](../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md) 및 [가상 인스턴스 현지화](../../system-administration/configuring-liferay/virtual-instances/localization.md) 을 참조하세요.
```

## 수동으로 콘텐츠 번역

```{note}
웹 콘텐츠를 수동으로 번역하려면 사용자에게 자산에 대한 보기 및 업데이트 권한이나 하나 이상의 언어에 대한 번역 권한이 있어야 합니다. 자세한 내용은 [번역 권한 관리](./managing-translation-permissions.md) 참조하세요.
```

1. **사이트 메뉴**(![사이트 메뉴](../../images/icon-product-menu.png))를 열고 **콘텐츠 및 데이터** &rarr; **웹 콘텐츠** 로 이동합니다.

1. 번역하려는 콘텐츠에 대해 **작업**(![작업 아이콘](../../images/icon-actions.png))을 클릭하고 **번역** 을 선택합니다.

   이렇게 하면 번역 인터페이스로 리디렉션되어 번역과 함께 콘텐츠의 원본 텍스트를 볼 수 있습니다.

   왼쪽 열에는 번역 중인 언어가 표시되고 오른쪽 열에는 번역에 사용할 수 있는 편집 가능한 필드가 제공됩니다.

   ![Selecting translate redirects you to the translation interface.](./translating-web-content/images/01.png)

1. 번역하려는 언어를 선택하세요.

   ```{important}
   콘텐츠 업데이트 권한이 있는 사용자는 원본 텍스트를 어떤 언어로든 번역할 수 있습니다.

   번역 권한이 있는 사용자는 원본 텍스트를 권한이 있는 언어로만 번역할 수 있습니다.
   ```

   ![Select the language you want to translate.](./translating-web-content/images/02.png)

1. 사용 가능한 필드에 번역을 입력하세요.

   ```{note}
   번역을 위한 친숙한 URL은 사용자가 입력하지 않는 한 비어 있습니다. 친숙한 URL이 비어 있으면 기본 언어의 친숙한 URL이 사용됩니다.
   ```

1. 웹 콘텐츠의 새 버전을 생성하거나 활성화된 경우 워크플로를 시작하려면 **게시** 를 클릭하세요.

   또는 **초안으로 저장** 을 클릭하여 번역을 저장하고 나중에 게시하세요.

## 지역화 가능한 필드를 사용하여 번역된 웹 콘텐츠 게시

지역화 가능한 필드의 번역된 웹 컨텐츠는 원래 언어로 표시되는 컨텐츠와 구조적으로 다를 수 있습니다. Liferay는 이를 통해 변경 사항이 이미 번역된 콘텐츠를 재정의하지 않도록 합니다. 이것이 어떻게 작동하는지 보려면 다음 단계를 따르십시오.

1. 웹 콘텐츠에서 구조로 이동하여 **추가** 를 클릭하세요.

1. 반복 가능한 필드 세트를 사용하여 구조를 만듭니다. 예를 들어 필드 세트에 텍스트 및 이미지 필드를 추가합니다. 둘 다 필수로 설정하고 **저장** 을 클릭하세요.

1. 새 구조에 필드 세트를 추가하고 반복 가능하게 만듭니다.

1. 왼쪽 상단에서 깃발 아이콘을 클릭하고 **번역 관리** 를 클릭합니다.

1. **추가**(![아이콘 추가.](../../images/icon-add.png))를 클릭하고 원하는 언어를 추가하세요. **완료** 를 클릭하세요.

1. 구조의 이름을 지정하고 **저장** 을 클릭하세요.

1. 이제 웹 콘텐츠로 이동하여 **새로 만들기** 를 클릭하세요. 방금 생성한 구조를 선택합니다.

1. 텍스트 필드에 값을 입력하고 이미지를 선택하세요.

1. 왼쪽 상단에서 깃발 아이콘을 클릭하고 이전에 번역으로 선택한 언어를 클릭합니다. 필드세트의 내용은 변경되지 않았습니다. 기본 언어를 사용하여 필드 세트를 복제할 때도 마찬가지입니다. 보조 언어의 내용은 변경되지 않습니다. 이제 번역을 다시 기본 언어로 변경하고 웹 콘텐츠의 이름을 지정하세요. **게시** 를 클릭하세요.

1. 웹 콘텐츠 옆에 있는 **작업**(![작업 아이콘](../../images/icon-actions.png))을 클릭하고 **번역** 을 클릭합니다.

1. 상단 모서리에 있는 번역에서 구조 생성에서 선택한 언어를 선택합니다. **게시** 를 클릭하세요.

1. 편집 모드로 들어가려면 웹 콘텐츠를 클릭하세요.

1. 왼쪽 상단에서 깃발 아이콘을 클릭하세요. 보조 언어 옆에 번역됨 메시지가 있는지 확인하세요.

![See the Translated message next to the language.](./translating-web-content/images/011.png)

1. 기본 언어를 사용하여 **복제**(![액션 아이콘](../../images/icon-actions.png))를 한 번 더 클릭하고 텍스트 필드에 값을 입력한 후 이미지를 선택합니다.

1. 왼쪽 상단에서 깃발 아이콘을 클릭하고 번역된 언어를 선택하세요. 이 번역을 사용하면 복제된 필드세트에 대해 선택한 콘텐츠가 존재하지 않는 것을 볼 수 있습니다.

이 동작을 통해 원본 언어와 독립적으로 번역을 관리할 수 있습니다.

## 번역 내보내기 및 가져오기

```{note}
콘텐츠 페이지 환경을 수동으로 번역하려면 사용자에게 콘텐츠 페이지에 대한 보기 및 업데이트 권한이나 하나 이상의 언어에 대한 번역 권한이 있어야 합니다. 자세한 내용은 [번역 권한 관리](./managing-translation-permissions.md) 참조하세요.
```

Liferay를 사용하면 번역용 웹 콘텐츠를 `.xliff` 또는 `.xlf` 파일로 내보낼 수 있습니다. 이러한 파일을 번역자에게 보낸 다음 번역을 `.zip` 파일로 함께 가져오거나 개별적으로 `.xliff` 또는 `.xlf` 파일로 가져올 수 있습니다.

```{important}
Liferay는 XLIFF 1.2 및 2.0 파일을 모두 지원합니다. 그러나 해당 형식이 제공하는 모든 기능을 지원하지 않을 수도 있습니다.
```

### 번역을 위해 콘텐츠 내보내기

1. **사이트 메뉴**(![사이트 메뉴](../../images/icon-product-menu.png))를 열고 **콘텐츠 및 데이터** &rarr; **웹 콘텐츠** 로 이동합니다.

1. 번역하려는 콘텐츠에 대해 **작업**(![작업 아이콘](../../images/icon-actions.png))을 클릭하고 **번역을 위해 내보내기** 를 선택합니다. 내보내기를 구성하기 위한 모달 창이 열립니다.

   ![Select Export for Translation.](./translating-web-content/images/03.png)

   Liferay Portal 7.4 GA26+에서는 여러 기사를 선택하고 **번역을 위해 내보내기** 버튼을 클릭할 수 있습니다.

   ![Select multiple articles and click Export for Translation](./translating-web-content/images/04.png)

1. 내보내기 형식(**XLIFF 1.2** 또는 **XLIFF 2.0**)을 선택합니다.

1. 웹 콘텐츠의 원래 언어를 선택하세요.

1. 번역하려는 언어를 선택하세요.

   ![Select the languages you want to translate the content into.](./translating-web-content/images/05.png)

1. **내보내기** 를 클릭하세요.

Liferay는 선택한 각 언어에 대한 XLIFF 파일을 포함하는 ZIP 아카이브를 생성합니다. 그런 다음 호환되는 번역 소프트웨어를 사용하여 해당 파일을 사용할 수 있습니다.

### 콘텐츠 번역 가져오기

1. **사이트 메뉴**(![사이트 메뉴](../../images/icon-product-menu.png))를 열고 **콘텐츠 및 데이터** &rarr; **웹 콘텐츠** 로 이동합니다.

1. 번역된 웹 콘텐츠에 대해 **작업**(![작업 아이콘](../../images/icon-actions.png))을 클릭하고 **번역 가져오기** 를 선택합니다.

   ![Select Import Translation.](./translating-web-content/images/06.png)

   Liferay Portal 7.4 GA26+에서는 응용 프로그램 표시줄에서 **작업** 버튼(![작업 버튼](../../images/icon-actions.png))을 클릭하고 선택하여 여러 기사의 번역을 한 번에 가져올 수 있습니다. **번역 가져오기** .

   ![Upload translations for multiple articles.](./translating-web-content/images/07.png)

1. 가져오려는 `.xliff`, `.xlf` 및 `.zip` 파일을 선택합니다.

   ![Select the translation files you want to import.](./translating-web-content/images/08.png)

   ```{important}
   Liferay는 [번역을 위해 내보내기](#exporting-content-for-translation) 작업을 사용하여 생성된 XLIFF 파일 가져오기를 지원하지만 다른 방법으로 생성된 파일의 성공적인 가져오기를 보장할 수는 없습니다.
   ```

1. **게시** 를 클릭하세요.

   성공하면 Liferay는 가져온 파일과 함께 성공 메시지를 표시합니다. 웹 콘텐츠는 번역 파일에 포함된 모든 변경 사항으로 업데이트됩니다. 워크플로가 활성화된 경우 이 변경 사항은 다른 콘텐츠 업데이트와 마찬가지로 승인되어야 합니다.

   ![If successful, Liferay displays a success message with the imported files.](./translating-web-content/images/09.png)

   그러나 가져오는 동안 오류가 발생하면 Liferay는 실패한 파일을 알리고 다운로드 가능한 CSV 오류 보고서를 제공합니다.

   ![If errors occur during import, Liferay notifies you of the failing files and provides a downloadable CSV error report.](./translating-web-content/images/10.png)

## 제3자 서비스를 사용하여 웹 콘텐츠 번역

[Google Cloud Translation](https://cloud.google.com/translate/docs/setup) , [Amazon Translate](https://docs.aws.amazon.com/translate/latest/dg/what-is.html) 또는 [Microsoft Translator](https://docs.microsoft.com/en-us/azure/cognitive-services/translator/) 와 Liferay의 통합을 활성화한 경우 이를 사용하여 웹 콘텐츠를 자동으로 번역할 수 있습니다. 자세한 내용은 [번역에 제3자 활용](./using-third-parties-for-translation.md) 참조하세요.

## 관련 주제

[콘텐츠 페이지 번역](./translating-content-pages.md)

[제3자를 통한 번역](./using-third-parties-for-translation.md)

[번역을 위한 워크플로우 활성화](./enabling-workflows-for-translations.md)
