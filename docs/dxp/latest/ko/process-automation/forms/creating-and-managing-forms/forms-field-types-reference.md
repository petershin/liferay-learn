
# 양식 필드 유형 참조

Liferay Forms 응용 프로그램에는 양식에 추가할 수 있는 많은 필드 유형과 요소가 포함되어 있습니다. 사용 가능한 요소를 찾으려면

1. **제품 메뉴**(![Product Menu](../../../images/icon-product-menu.png))을 열고 사이트 관리 메뉴에서 나침반 아이콘(![Compass](../../../images/icon-compass.png))을 클릭합니다. 양식이 생성될 사이트를 선택합니다.
1. **콘텐츠 & 데이터** &rarr; **양식** 클릭합니다.
1. **추가** 버튼(![Add](../../../images/icon-add.png))을 클릭합니다. 양식 작성기 보기가 나타납니다.
1. **추가** 버튼(![Add](../../../images/icon-add.png))을 한 번 더 클릭하여 **요소 추가** 사이드바를 표시합니다(아직 열리지 않은 경우).

![많은 유용한 양식 요소가 있습니다.](./forms-field-types-reference/images/01.png)

```{note}
**양식 필드 그룹화 및 반복성:** 양식 필드는 양식 전체에서 사용할 수 있도록 그룹화하거나([Element Sets](./reusing-sets-of-form-elements.md) 사용) 형태. 다른 필드 위에 필드를 놓아 필드 그룹을 만듭니다. 또한 각 필드는 해당 구성에서 _반복 가능_으로 표시될 수 있으므로 양식의 최종 사용자가 양식의 필드를 복제할 수 있습니다. 
```

## 필드 구성 개요

새 필드를 추가하거나 양식 작성기에서 기존 필드를 클릭할 때마다 필드 구성 편집기 사이드바가 나타납니다. 사용 가능한 구성 옵션은 필드 유형에 따라 다릅니다.

모든 양식 필드에는 기본 및 고급의 두 가지 이상의 구성 유형이 있습니다. 많은 양식은 다음과 같은 것을 포함하는 기본 구성만으로 [생성](../creating-and-managing-forms/creating-forms.md) 될 수 있습니다.

- 라벨
- [자리표시자 텍스트](../creating-and-managing-forms/providing-help-text-and-predefined-values.md)
- 필수(및 필수 메시지 내용)
- [도움말 텍스트](../creating-and-managing-forms/providing-help-text-and-predefined-values.md)

추가 필드별 기본 구성도 있습니다.

![목록에서 선택 필드에는 몇 가지 기본 구성이 있습니다.](./forms-field-types-reference/images/15.png)

고급 구성에는 다음이 포함됩니다.
- [미리 정의된 값](../creating-and-managing-forms/providing-help-text-and-predefined-values.md)
- 검색 구성
- 필드가 반복 가능한지 여부
- 시스템/프로그래매틱 필드 참조
- 현장확인
- 필드가 숨겨져 있는지 여부

추가 필드별 고급 구성도 있습니다.

![텍스트 필드에는 몇 가지 고급 구성이 있습니다.](./forms-field-types-reference/images/14.png)

### 필드 숨기기

때로는 외부 소스(예: [REST Data Provider](../data-providers/using-the-rest-data-provider-to-populate-form-options.md))의 정보를 [양식 규칙](../form-rules/form-rules-overview.md)트리거에만 사용되는 양식 필드로 전달하는 것이 유용합니다. 이 경우 필드 숨기기 구성(Liferay 7.4의 새로운 기능)을 사용하십시오.

### 현장확인

현장 확인은 버전 7.4부터 Liferay Forms에서 지원됩니다. 양식 본문에 직접 추가하는 양식 작성기의 필드가 아니라 한 줄 텍스트 또는 숫자 필드를 **확인 필요** 로 구성할 때만 확인 필드가 양식에 나타납니다(필드의 고급 구성 섹션 사용). 이 필드는 중요한 데이터가 있는 필드(예: 이메일 주소 필드)가 올바르게 입력되었는지 확인합니다.

![확인 필드는 사용자가 올바른 정보를 입력하도록 도와줍니다.](./forms-field-types-reference/images/21.png)

확인 필드를 활성화하면 새로운 구성 옵션이 나타납니다.

**방향:** 세로(기본값) 또는 가로를 선택하여 확인 필드를 원래 필드 아래에 표시할지 옆에 표시할지 결정합니다.

**레이블:** 원래 필드 레이블의 접두사를 선택합니다. 기본값은 확인이므로 이메일 주소라는 필드의 확인 필드 레이블은 **이메일 주소 확인** 입니다.

**오류 메시지:** 확인하는 필드에 따라 보다 구체적인 오류 메시지를 제공할 수 있습니다.

![확인 필드는 구성 가능합니다.](./forms-field-types-reference/images/22.png)

사용자가 유효한 형식으로 정보를 입력했는지 확인하는 방법에 대한 정보는 [텍스트 및 숫자 필드 항목 유효성 검사](validating-text-and-numeric-field-entries.md) 참조하십시오.

### 필드 이름, 필드 ID 및 필드 참조

Liferay 7.3의 첫 번째 릴리스에서는 편집 가능한 구성 필드 이름이 제거되었으며 읽기 전용 필드 ID가 각 필드의 고급 탭에 포함되었습니다. 그러나 이제 Liferay 7.3+에서 편집 가능한 대체 필드 참조를 사용할 수 있습니다. 프로그래밍 방식으로 필드를 참조할 때 7.2의 필드 이름 값과 7.3+의 필드 참조를 사용하십시오.

![필드 참조 구성은 양식 작성자에게 필드에 대해 사람이 읽을 수 있는 시스템 이름을 설정할 수 있는 기능을 제공합니다.](./forms-field-types-reference/images/20.png)

## 양식 필드 및 요소

### 절

단락 필드는 양식 작성자가 입력한 대로 양식에 정적 텍스트를 표시합니다. 사용자는 단락 필드에 데이터를 입력하지 않습니다. 이는 더 긴 지침에 유용합니다.

![단락 필드를 사용하여 더 긴 형식의 텍스트 블록을 제공할 수 있습니다.](./forms-field-types-reference/images/18.png)

단락 필드는 일반 텍스트보다 훨씬 더 많을 수 있습니다. 포함된 콘텐츠 편집기를 사용하여 풍부한 콘텐츠를 만듭니다.

![콘텐츠 편집기를 사용하여 단락 필드에 풍부한 콘텐츠를 만듭니다.](./forms-field-types-reference/images/19.png)

### 텍스트 항목

사용자는 이 필드에 자유 형식 텍스트를 입력합니다. 예를 들어 전체 이름 필드는 텍스트 필드입니다. 기본적으로 텍스트 필드는 한 줄의 텍스트에 모든 입력을 유지합니다. 더 긴 응답을 수용하려면 [이 예에서와 같이](./creating-forms.md) 텍스트 필드를 구성할 때 여러 줄 설정을 선택하십시오. 텍스트 필드의 [유효성 검사 옵션](./validating-text-and-numeric-field-entries.md ) .

![여러 줄 텍스트 필드는 여러 줄의 사용자 입력을 허용합니다.](./forms-field-types-reference/images/03.png)

### 목록에서 선택

사용자는 선택 목록에서 하나의 옵션(또는 허용하도록 구성된 경우 그 이상)을 선택합니다. 선택 항목은 수동으로 입력하거나 [데이터 공급자](../data-providers/data-providers-overview.md)에 의해 자동으로 채워집니다. 예를 들어 거주 국가 필드는 세계 국가 데이터 공급자가 채운 목록 필드에서 선택할 수 있습니다.

![양식 선택 목록 필드는 선택할 수 있는 옵션의 드롭다운 목록을 사용자에게 제공합니다.](./forms-field-types-reference/images/04.png)

### 단일 선택

사용자는 라디오 버튼을 사용하여 양식에 표시된 옵션 목록에서 하나의 옵션을 선택합니다.

![단일 선택 필드는 사용자에게 여러 옵션을 표시하여 하나만 선택할 수 있도록 합니다.](./forms-field-types-reference/images/05.png)

### 불리언

사용자는 확인란 또는 스사이트를 활성화 또는 비활성화하여 표시된 텍스트에 대한 `참` 또는 `거짓` 응답을 기록합니다.

![부울 필드는 사용자에게 응답에서 참 또는 거짓을 선택할 수 있는 단일 옵션을 표시합니다.](./forms-field-types-reference/images/17.png)

### 날짜

사용자는 날짜 선택기를 사용하여 날짜를 선택합니다.

![날짜 선택기는 날짜를 선택하는 편리한 방법을 제공합니다.](./forms-field-types-reference/images/06.png)

Liferay 7.4부터는 날짜 필드의 고급 구성에 유효성 검사가 포함됩니다. [필드 고급 구성의 유효성 검사 옵션](./validating-text-and-numeric-field-entry.md).

![날짜 필드에 대한 확인 규칙을 입력합니다.](./forms-field-types-reference/images/26.png)

### 날자와 시간

Liferay 7.4에 추가된 사용자는 한 필드에 날짜와 시간을 모두 입력합니다.

![날짜 및 시간 필드는 유효한 날짜와 시간을 결합합니다.](./forms-field-types-reference/images/28.png)

날짜 및 시간 필드는 `DD/MM/YYYY HH:MM [AM/PM]`형식을 따르는 입력을 허용합니다. 예를 들어, `01/06/1981 12:15 PM` 1981년 1월 6일 정오 15분을 나타냅니다. 날짜 및 시간 선택기를 사용하거나 사용자가 필드에 직접 날짜를 입력할 수 있습니다.

### 다중 선택

사용자는 확인란(또는 구성된 경우 토글)에서 하나 이상의 옵션을 선택합니다.

![다중 선택 필드를 통해 사용자는 표시된 옵션 중 둘 이상을 선택할 수 있습니다.](./forms-field-types-reference/images/07.png)

### Grid

라디오 버튼을 사용하여 사용자는 행과 열에 배치된 옵션 중에서 선택합니다. 행당 하나의 항목을 선택할 수 있습니다. 이것은 여러 질문에 대해 동일한 응답 지표가 필요할 때 유용합니다.

![그리드 필드를 사용하면 사용자가 동일한 응답 옵션 목록에서 여러 문의에 응답할 수 있습니다.](./forms-field-types-reference/images/08.png)

### 숫자

사용자는 숫자 데이터(정수 또는 소수)를 숫자 필드에 입력합니다. 숫자 이외의 입력은 허용되지 않습니다.

![숫자 필드는 사용자 입력을 숫자(정수 또는 소수)로 제한합니다.](./forms-field-types-reference/images/09.png)

숫자 필드에 대한 몇 가지 흥미로운 고급 필드 설정이 있습니다.

- **[Require Confirmation](#field-confirmation)** 은 사용자가 데이터를 올바르게 입력했는지 확인합니다.
- **[유효성 검사](./validating-text-and-numeric-field-entries.md)** 사전 구성된 요구 사항에 대한 사용자 입력을 제한합니다. ![숫자 입력을 확인합니다.](./forms-field-types-reference/images/25.png)

- **[입력 마스크](./validating-text-and-numeric-field-entries.md#masking-numeric-fields)** 을 사용하면 사용자가 숫자 데이터를 입력할 때 올바른 형식을 표시할 수 있습니다.

### 업로드

업로드 필드를 통해 사용자는 로컬 파일 시스템에서 파일을 업로드할 수 있습니다. 로그인 사용자는 이전에 업로드한 파일 중에서 선택하거나 새 파일을 업로드할 수 있습니다.

```{note}
7.2에서 로그인한 사용자는 문서 및 미디어 라이브러리에서 기존 파일을 선택하거나 로컬 파일 시스템에서 파일을 업로드하도록 선택할 수 있습니다.
```

![업로드 필드를 통해 사용자는 파일을 업로드하거나 기존 문서 및 미디어 항목에서 선택할 수 있습니다.](./forms-field-types-reference/images/10.png)

Liferay 7.3(DXP FP1+ 및 CE GA7+)부터 인증되지 않은 게스트 사용자가 파일을 업로드하도록 허용할 수 있습니다. 양식 필드의 구성 내에서 게스트 업로드를 활성화합니다.

![게스트가 파일을 업로드하도록 허용할지 여부를 선택할 수 있습니다.](./forms-field-types-reference/images/16.png)

업로드된 문서는 [문서 및 미디어 저장소](./../../../system-administration/file-storage.md)의 숨겨진 폴더에 저장됩니다. 문서 및 미디어 애플리케이션에 표시하려면 `Portal-ext.properties` 파일에서 다음 [포털 속성](../../../installation-and-upgrades/reference/portal-properties.md) 설정합니다.

```properties
dl.show.hidden.mount.folders=true
```

제어판에서 게스트 업로드 동작을 구성합니다: 시스템 설정 &rarr; 양식(콘텐츠 및 데이터) &rarr; 양식 또는 com.liferay.dynamic.data.mapping.form.web.internal.configuration이라는 [구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) `하여 구성합니다. DDMFormWebConfiguration.config`.

```{tip}
[인스턴스 범위](../../../system-administration/configuring-liferay/understanding-configuration-scope.md#scope-definitions) 에서 Forms 애플리케이션을 구성하려면 인스턴스 설정에서 Forms 항목을 사용합니다.
```

**게스트 업로드 파일 확장자(`guestUploadFileExtensions`):** 허용되는 파일 확장자의 쉼표로 구분된 목록을 입력합니다. 기본적으로 다음 목록이 지원됩니다: `doc`, `docx`, `jpeg`, `jpg`, `pdf`, `png`, `ppt`, `pptx`, `tiff`, `txt`, `xls`, `xlsx`.

**게스트 업로드 최대 파일 크기(`guestUploadMaximumFileSize`):** 게스트 사용자가 업로드 필드를 통해 업로드할 수 있는 최대 파일 크기를 설정합니다. 이는 문서 및 미디어 애플리케이션 구성에서 인증된 사용자에 대해 구성되며 전체 최대 업로드 요청 크기라는 필드의 업로드 서블릿 요청 시스템 설정 항목에 시스템 전체 제한이 정의됩니다. 기본적으로 제한은 25MB입니다.

**업로드 필드의 최대 반복(`maximumRepetitionsForUploadFields`):** 필드가 반복 가능하도록 구성된 경우 사용자가 필드를 양식에 추가할 수 있는 최대 횟수를 설정합니다(게스트 사용자 및 로그인 사용자에게 동일하게 적용됨). 기본적으로 제한은 5입니다.

**게스트 업로드 필드에 대한 최대 제출(`maximumSubmissionsForGuestUploadFields`):** 게스트 사용자가 게스트 활성화 업로드 필드를 포함하는 양식을 제출할 수 있는 최대 횟수를 설정합니다. 게스트 사용자의 IP 주소는 제출을 추적하는 데 사용됩니다. 기본적으로 제한은 5입니다.

### 심상 화랑 심상

사용자는 웹 콘텐츠 이미지, 문서 및 미디어 라이브러리에서 이미지 파일(`.gif`, `.jpeg`, `.jpg`또는 `.png`)을 선택하거나 로컬 파일 시스템에서 이미지 파일을 업로드할 수 있습니다.

![이미지 필드를 통해 사용자는 이미지를 업로드하거나 문서 및 미디어 또는 웹 콘텐츠 이미지의 기존 이미지에서 선택할 수 있습니다.](./forms-field-types-reference/images/11.png)

```{important}
게스트 사용자는 이미지에 액세스하거나 이미지를 업로드할 수 없습니다. 인증된 사용자만 양식에 액세스할 수 있는 경우가 아니면 이 필드를 사용하지 마십시오.
```

이미지를 추가한 후 사용자는 이미지에 대한 추가 필드인 **설명** 채울 수 있습니다. 이미지 필드가 선택 사항인 경우 사용법은 간단합니다. 이미지나 해당 설명이 필요하지 않습니다. 그러나 모든 양식 필드와 마찬가지로 이미지 필드도 필수로 표시될 수 있습니다. 이미지 필드가 필수인 경우 양식 작성자는 설명이 필수인지 선택 사항인지 선택할 수 있습니다.

![필수 이미지 필드의 설명 필드는 필수 또는 선택 사항일 수 있습니다.](./forms-field-types-reference/images/27.png)

### 색깔

사용자는 색상 선택기에서 선택하거나 코드를 직접 입력하여 색상의 16진수 코드를 입력할 수 있습니다.

![색상 필드를 사용하면 색상 선택기에서 색상을 선택하여 색상의 16진수 코드를 입력할 수 있습니다.](./forms-field-types-reference/images/13.png)

### 서식있는 텍스트

사용자는 서식 있는 텍스트 콘텐츠(형식 있는 텍스트, 포함된 이미지, 첨부 파일 등 포함)를 양식 필드에 입력할 수 있습니다.

![서식 있는 텍스트 필드를 통해 사용자는 양식에 이미지가 포함된 서식 있는 텍스트를 작성할 수 있습니다.](./forms-field-types-reference/images/12.png)

### 사이트 검색

Liferay 7.4+의 검색 사이트 필드를 사용하여 양식 사용자로부터 유효한 주소를 편리하게 수집하십시오.

![검색 사이트 필드에는 Google Places API 키가 필요합니다.](./forms-field-types-reference/images/23.png)

자세한 내용은 [사이트 검색 필드 사용](using-the-search-location-field.md) 참조하십시오.

## 추가 정보

- [양식 만들기](./creating-forms.md)
