# 위치 정보 자산

Geolocation은 자산이 메타데이터로 생성된 지리적 좌표를 자산에 추가합니다. 이 기능은 [웹 콘텐츠 구조](../web-content/web-content-structures/understanding-web-content-structures.md), 동적 데이터 목록 필드 또는 문서 및 미디어 [문서 유형](../documents-and-media/uploading-and-managing/managing-metadata/defining-document-types.md) 또는 [메타데이터 세트](../documents-and-media/uploading-and-managing/managing-metadata/defining-metadata-sets.md)에 포함될 수 있는 선택적 필드로 제공됩니다.

## 웹 콘텐츠의 지리적 위치 파악

웹 콘텐츠에서 지리 위치를 사용하려면 지리 위치 필드를 포함하는 [구조 및 템플릿](../web-content/web-content-structures/understanding-web-content-structures.md) 을 만들어야 합니다.

![그림 1: 구조에 지리적 위치 필드를 추가하여 웹 콘텐츠에서 지리적 위치를 활성화합니다.](./geolocating-assets/images/01.png)

1. 위의 이미지와 같이 Geolocation 필드가 있는 구조를 만듭니다.
1. 새 템플릿을 만들고 지리적 위치 필드로 방금 만든 구조를 선택합니다.
1. _Script_ 머리글까지 아래로 스크롤하고 _Fields_ 섹션을 찾습니다. 다음은 _개의 콘텐츠_ 및 _지리적 위치_ 스니펫입니다.
1. 스니펫을 클릭하여 템플릿에 추가합니다.

    ![그림 2: 콘텐츠 및 지리적 위치 스니펫을 추가하여 웹 콘텐츠 템플릿을 빠르게 생성합니다.](./geolocating-assets/images/02.png)

1. 완료되면 _저장_ 을 클릭합니다.

웹 콘텐츠에 대한 위치를 설정하려면 브라우저와 위치를 공유하거나 지도의 주소 표시줄에 특정 주소를 입력하거나 표시기를 끌어 지도의 아무 지점에 놓으면 주소가 자동으로 업데이트됩니다. 새로운 점을 반영합니다. 웹 콘텐츠가 저장되면 위치가 웹 콘텐츠에 메타데이터로 추가됩니다.

![주소 표시줄에 위치를 입력하거나 표시기를 위치로 이동하거나 브라우저와 위치를 공유할 수 있습니다.](./geolocating-assets/images/15.png)

```{note}
브라우저 설정에 따라 위치를 공유하도록 구성해야 할 수도 있습니다.
```

## 데이터 목록의 지리적 위치 파악

동적 데이터 목록에서 지리적 위치를 사용하려면 먼저 지리적 위치 필드를 포함하는 데이터 정의를 만들어야 합니다.

### 새 데이터 목록 정의 만들기

1. 제품 메뉴를 열고 사이트로 이동합니다.
1. _콘텐츠 & 데이터_ &rarr; _동적 데이터 목록_을 클릭합니다.

    ![사이트 관리에서 DDL로 이동합니다.](./geolocating-assets/images/03.png)

1. _옵션_ (![Options menu](../../images/icon-options.png)) 메뉴를 클릭하고 _데이터 정의_를 선택합니다.

    ![데이터 정의 관리로 이동하여 새 정의를 만듭니다.](./geolocating-assets/images/04.png)

1. _추가_ (![add](../../images/icon-add.png)) 버튼을 클릭하여 새 데이터 정의를 생성합니다.
1. 이름, 설명(선택 사항), 상위 데이터 정의(있는 경우)를 입력합니다.
1. 아래로 스크롤하여 추가하려는 다른 필드와 함께 *Geolocation* 필드를 데이터 정의에 추가합니다.

    ![새 정의를 만듭니다.](./geolocating-assets/images/05.png)

1. 완료되면 _저장_ 을 클릭합니다.

데이터 정의가 생성되었으므로 이 정의를 사용하여 새 데이터 목록을 생성합니다.

### 새 데이터 목록 만들기

새 데이터 정의를 사용하는 데이터 목록을 생성하려면:

1. 동적 데이터 목록 화면으로 돌아가서 _추가_ 버튼(![add](../../images/icon-add.png))을 클릭하여 새 목록을 만듭니다.
1. 이름과 선택적 설명을 입력합니다.
1. __ 선택 버튼을 클릭하고 새로 생성된 데이터 정의를 선택합니다.
1. 이 양식에 워크플로우가 있는지 여부를 선택하십시오.

    ![새 데이터 목록을 만듭니다.](./geolocating-assets/images/06.png)

1. 완료되면 _저장_ 을 클릭합니다.

이제 데이터 목록이 완성되었으므로 [데이터 목록 표시 포틀릿](../../process-automation/forms/dynamic-data-lists/getting-started-with-dynamic-data-lists.md) 을 사용하여 표시할 수 있습니다.

## 문서 및 미디어의 지리적 위치 파악

문서 및 미디어에서 지리적 위치를 활성화하려면 먼저 지리적 위치 메타데이터를 포함하는 [문서 유형](../documents-and-media/uploading-and-managing/managing-metadata/defining-document-types.md) 을 생성해야 합니다. 또는 [Metadata Set](../documents-and-media/uploading-and-managing/managing-metadata/defining-metadata-sets.md)의 일부로 지리적 위치 메타데이터를 추가할 수 있습니다. 해당 메타데이터 세트를 생성하면 문서 유형의 일부로 포함될 수 있습니다.

### 메타데이터 세트에 지리적 위치 추가

아래 단계를 따르십시오.

1. 제품 메뉴를 열고 사이트로 이동합니다.
1. _콘텐츠 & 데이터_ &rarr; _문서 및 미디어_를 클릭합니다.
1. _메타데이터 세트_ 탭을 클릭합니다.

    ![DM에서 메타데이터 세트 탭으로 이동합니다.](./geolocating-assets/images/07.png)

1. _추가_ (![add](../../images/icon-add.png)) 버튼을 클릭하고 이름, 설명(선택 사항) 및 상위 메타데이터 세트(있는 경우)를 입력합니다.
1. 아래로 스크롤하여 원하는 추가 필드와 함께 *Geolocation* 필드를 추가합니다.

    ![Geolocation 필드를 다른 필드와 함께 드래그 앤 드롭하여 메타데이터 세트를 생성합니다.](./geolocating-assets/images/08.png)

1. 완료되면 _저장_ 을 클릭합니다.

### 문서 유형에 지리적 위치 필드 추가

아래 단계를 따르십시오.

1. 제품 메뉴를 열고 사이트로 이동합니다.
1. _콘텐츠 & 데이터_ &rarr; _문서 및 미디어_를 클릭합니다.
1. _문서 유형_ 탭을 클릭합니다.

    ![DM에서 문서 유형 탭으로 이동합니다.](./geolocating-assets/images/09.png)

1. _추가_ 버튼(![add](../../images/icon-add.png))을 클릭하고 이름과 선택적 설명을 입력합니다.
1. 기본 메타데이터 필드 제목까지 아래로 스크롤하고 문서 유형에 대해 원하는 다른 필드와 함께 _지리적 위치_ 필드를 추가합니다.

    ![DM에서 문서 유형 탭으로 이동합니다.](./geolocating-assets/images/10.png)

1. 메타데이터 세트를 사용하는 경우 추가 메타데이터 필드 제목까지 아래로 스크롤하고 _메타데이터 세트_ 선택 버튼을 클릭합니다.
1. 지리적 위치 메타데이터가 포함된 메타데이터 세트를 선택합니다.
1. *저장*을 클릭합니다.

### 문서에 지리적 위치 추가

아래 단계를 따르십시오.

1. _문서 및 미디어_ 탭으로 이동합니다.

    ![DM에서 문서 및 미디어 탭으로 이동합니다.](./geolocating-assets/images/11.png)

1. _추가_ 버튼(![add](../../images/icon-add.png))을 클릭하고 새로 만든 문서 유형을 선택합니다.

   ![DM에서 문서 및 미디어 탭으로 이동합니다.](./geolocating-assets/images/12.png)

1. 문서에 대한 정보를 입력하면 귀하의 위치가 브라우저에서 자동으로 가져와 문서에 추가됩니다.

    ![DM에서 문서 및 미디어 탭으로 이동합니다.](./geolocating-assets/images/13.png)

1. 완료되면 _게시_ 을 클릭합니다.

자산에 지리적 위치가 활성화되면 [Asset Publisher](../../site-building/displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md) 은 지도 표시 템플릿을 사용하여 지도에 자산의 위치를 표시할 수 있습니다. 자세한 내용은 [Asset Publisher 디스플레이 설정 구성](../../site-building/displaying-content/using-the-asset-publisher-widget/configuring-asset-publisher-display-settings.md) 을 확인하십시오.

![자산 게시자는 위치 정보가 있는 자산을 지도에 표시할 수 있습니다.](./geolocating-assets/images/14.png)

## 추가 정보

* [자산 자동 태그 지정 구성](./auto-tagging/configuring-asset-auto-tagging.md)
* [콘텐츠 태깅 및 태그 관리](./tagging-content-and-managing-tags.md)
* [문서 유형 정의](../documents-and-media/uploading-and-managing/managing-metadata/defining-document-types.md)
* [메타데이터 세트 정의](../documents-and-media/uploading-and-managing/managing-metadata/defining-metadata-sets.md)
