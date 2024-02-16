# 첨부파일 필드

첨부 파일 필드는 인스턴스의 [문서 라이브러리](../../../../system-administration/file-storage.md)에 파일을 업로드하기 위한 것입니다. 파일이 업로드되면 항목의 첨부 필드에 연결되며 각 필드는 한 번에 하나의 파일에만 연결할 수 있습니다. 파일은 개체 정의(예: 회사 또는 사이트)에서 해당 범위를 상속합니다. 첨부되면 개체 항목을 보고 파일을 다운로드하거나 필드에서 제거할 수 있습니다. 7.4 U45/GA45부터는 [개체의 응용 프로그램 페이지](../views/designing-object-views.md)에서 항목 첨부 파일을 다운로드할 수도 있습니다.

![개체 항목에 파일을 첨부합니다.](./attachment-fields/images/01.png)

```{important}
자산은 개체 항목에서 제거될 때 문서 라이브러리에서 삭제되지 않습니다.
```

필드를 생성하는 동안 요청 파일 필드를 사용하여 사용자가 객체 항목에 파일을 업로드하는 방법을 결정할 수 있습니다.

**사용자 컴퓨터에서 직접 업로드** : 사용자는 운영 체제의 파일 선택기를 사용하여 항목에 파일을 업로드할 수 있습니다. 기본적으로 이 방법은 첨부 파일 필드에 대해 자동 생성된 개인 폴더에 파일을 저장합니다. 이 폴더는 Liferay UI에 나타나지 않습니다. 그러나 **Show Files in Documents and Media** 을 활성화하면 업로드된 파일이 Documents and Media의 폴더에 저장됩니다. 기본적으로 이 폴더는 개체 정의의 이름을 사용하지만 필드를 구성할 때 변경할 수 있습니다.

**문서 및 미디어 항목 선택기에서 업로드 또는 선택** : 사용자는 문서 및 미디어에 있는 기존 파일에서 선택하거나 항목 선택기를 사용하여 파일을 업로드할 수 있습니다. 업로드된 파일은 문서 및 미디어의 루트 폴더에 저장되며 다른 파일처럼 관리할 수 있습니다.

![요청 파일 필드는 사용자가 객체 항목에 파일을 추가하는 방법을 결정합니다.](./attachment-fields/images/02.png)

```{note}
원하는 경우 이 [포털 속성](../../../../installation-and-upgrades/reference/portal-properties.md)을 추가하여 문서 및 미디어에 숨겨진 첨부 파일 필드 폴더를 표시할 수 있습니다. 서버: `dl.show.hidden.mount.folders=true`. 
```

| 구성 | 설명 |
| :--- | :--- |
| 허용되는 파일 확장자 | 허용되는 파일 확장자 목록을 입력하여 사용자가 필드에 업로드할 수 있는 파일 유형을 결정합니다. 각 확장자는 쉼표로 구분해야 합니다. 첨부 필드는 [문서 및 미디어](../../../../content-authoring-and-management/documents-and-media.md)에서 허용하는 모든 파일 유형을 지원합니다. |
| 최대 파일 크기 | 필드에서 허용되는 최대 파일 크기를 입력합니다. 기본값은 100MB입니다. 원하는 경우 값을 0으로 설정하여 서버의 전체 최대 업로드 요청 크기 속성을 사용할 수 있습니다. |
| 저장 폴더(**문서 및 미디어의 파일 표시용**) | 업로드된 파일이 문서 및 미디어에 저장되는 사이트를 결정하려면 폴더 이름을 입력하십시오. 기본적으로 폴더는 개체 정의의 이름(예: `/Employee`, `/TimeOffRequest`)을 사용합니다. |


## API에서 첨부 파일 필드 사용

헤드리스 API를 사용하여 객체 항목의 첨부 파일 필드에 파일을 추가하려면 파일이 Liferay에 있어야 합니다. [문서 라이브러리 API](../../../../content-authoring-and-management/documents-and-media/developer-guide/document-api-basics.md) 을 사용하여 파일을 업로드하고 해당 ID를 검색합니다.

`"[attachmentField]": [FileEntryId]`구문을 사용하여 개체 API 호출에 ID를 전달합니다.

### 예

아래 예제는 `timeOffRequest`이라는 객체에 항목을 추가합니다. ID가 `12345` 인 파일을 첨부 필드 `문서`에 추가합니다.

```bash
curl -X "POST" "http://localhost:8080/o/c/timeOffRequest?restrictFields=actions" \
     -H "Content-Type: application/json" \
     -u 'test@liferay.com:test' \
     -d $'{
  "document": 12345
}'
```

## 관련 주제

* [분야](../fields.md)
* [개체에 필드 추가](./adding-fields-to-objects.md)
* [파일 스토리지](../../../../system-administration/file-storage.md)
