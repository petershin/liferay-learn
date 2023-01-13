# 프래그먼트 구성 필드 현지화

> 사용 가능: Liferay DXP/Portal 7.4+

Liferay Fragments를 사용할 때 대상 고객의 언어와 일치하도록 다음 Fragment 구성 필드를 현지화할 수 있습니다.

* [이미지 설명(*대체 텍스트*)](#localizing-image-descriptions)
* [수정 가능한 URL](#localizing-editable-urls)<!-- * \[Collection Filter Label Text\](#localizing-collection-filter-label-text) -->프래그먼트 개발 중에 `지역화 가능` 속성을 사용하여 프래그먼트의 구성 필드를 지역화 가능하게 만들 수 있습니다. 자세한 내용은 [Fragment Specific Tags and Attributes Reference](../../../../developer-guide/reference/fragments/fragment-specific-tags-reference.md)을 참조하십시오.

## 이미지 설명 현지화

내장 및 사용자 지정 조각에서 이미지 설명( *대체 텍스트* 또는 *대체 텍스트*이라고도 함)에 대해 다른 언어로 현지화를 추가할 수 있습니다. 편집기 도구 모음(A)의 언어 선택기를 사용하여 콘텐츠 페이지의 대상 언어를 변경하면 이미지 설명을 편집하여 대상 언어에 대한 텍스트를 조정할 수 있습니다(B).

![콘텐츠 페이지 편집기에서 이미지 설명을 현지화할 수 있습니다.](./localizing-fragment-configuration-fields/images/01.png)

```{tip}
현지화 가능한 필드는 이미지 설명 옆에 플래그 아이콘을 표시합니다. 
```

이미지 설명에 번역이 없으면 설명에 기본 콘텐츠 페이지 언어가 표시됩니다.

## 편집 가능한 URL 현지화

콘텐츠 페이지의 URL 또는 링크를 현지화하면 대상 언어에 따라 다른 URL 및 콘텐츠로 리디렉션할 수 있습니다. 편집기 도구 모음(A)의 언어 선택기를 사용하여 콘텐츠 페이지의 대상 언어를 변경하면 URL을 원하는 링크로 업데이트할 수 있습니다(B).

![콘텐츠 페이지 편집기에서 링크를 현지화할 수 있습니다.](./localizing-fragment-configuration-fields/images/02.png)

수동으로 입력한 링크와 콘텐츠 필드의 링크를 현지화할 수 있습니다. 링크에 번역이 없는 경우 활성 URL은 기본 콘텐츠 페이지 언어에 대한 URL입니다.

<!--TASK: explain.
## Localizing Collection Filter Label Text -->

## 추가 정보

- [콘텐츠 페이지 사용](../../../using-content-pages.md)
- [콘텐츠 페이지 편집기 UI 참조](../../../using-content-pages/content-page-editor-ui-reference.md)
- [조각 사용](../../using-fragments.md)
