---
uuid: cb91de54-1b09-4b55-88db-7e69a9e98822
---

# 외부 비디오 바로 가기 만들기

> Liferay 7.4+에서 사용 가능

Liferay의 문서 및 미디어 응용 프로그램을 사용하면 외부 플랫폼에서 호스팅되는 비디오에 대한 참조를 저장할 수 있습니다. 그런 다음 이러한 참조를 사용하여 Liferay 자산 또는 사이트 페이지에 [동영상을 삽입](./embedding-videos-into-liferay-assets-and-pages.md)할 수 있습니다. YouTube, Facebook, Vimeo 및 Twitch는 기본적으로 지원되지만 이 기능을 [맞춤 동영상 소스 지원](../developer-guide/creating-video-shortcut-providers.md)으로 확장할 수 있습니다.

외부 비디오 바로 가기를 만들려면 다음 단계를 따르십시오.

1. 사이트 또는 자산 라이브러리에서 문서 및 미디어 응용 프로그램으로 이동합니다. 

   ```{note}
   사이트에서 만든 바로 가기는 해당 사이트로 범위가 지정되는 반면, 자산 라이브러리에서 만든 바로 가기는 여러 사이트에서 공유할 수 있습니다. 자세한 내용은 [자산 라이브러리 개요](../../asset-libraries/asset-libraries-overview.md)를 참조하세요.
   ```

2. **추가** 버튼(![Add Button](../../../images/icon-add.png))을 클릭하고 **외부 비디오 바로 가기** 선택합니다.
   
   ![새 외부 비디오 바로 가기를 추가합니다.](./creating-external-video-shortcuts/images/01.png)

3. 지원되는 플랫폼(YouTube, Vimeo, Facebook 또는 Twitch)의 동영상 URL을 입력하세요.
   
   YouTube 및 Vimeo의 비디오는 URL 썸네일을 표시합니다. Facebook 및 Twitch 동영상은 지원되지 않습니다.
   
   ![동영상 URL을 입력하세요.](./creating-external-video-shortcuts/images/02.png)

4. 바로 가기의 제목을 입력합니다.
   
   이 필드는 YouTube 및 Vimeo에 대해 자동으로 채워집니다. Facebook 및 Twitch는 수동 입력이 필요합니다.

5. (선택 사항) 비디오의 표시 페이지 템플릿을 선택합니다.
   
   선택한 템플릿은 고유하고 친숙한 URL에 비디오를 표시하고 디스플레이 페이지의 레이아웃을 정의합니다. 자세한 내용은 [디스플레이 페이지 템플릿 생성 및 관리](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md) 을 참조하십시오.
   
   ![비디오의 디스플레이 페이지 템플릿을 선택합니다.](./creating-external-video-shortcuts/images/03.png)

6. (선택사항) 태그 [개와 카테고리](../../tags-and-categories/organizing-content-with-categories-and-tags.md)를 사용하여 동영상 바로가기를 분류합니다.

7. (선택 사항) 동영상 바로가기에 대한 관련 자산을 선택합니다.

8. (선택 사항) 비디오 바로 가기에 대한 권한을 구성합니다.

9. 완료되면 **게시** 클릭합니다.
   
   다른 문서 및 미디어 자산과 같은 외부 비디오 바로 가기를 보고 관리할 수 있습니다.
   
   ![문서 및 미디어에서 외부 비디오 바로 가기를 보고 관리합니다.](./creating-external-video-shortcuts/images/04.png)

생성된 외부 비디오 바로 가기는 대부분의 Liferay 자산에 내장될 수 있습니다. 자세한 내용은 [Liferay 자산 및 페이지에 비디오 포함](./embedding-videos-into-liferay-assets-and-pages.md) 을 참조하십시오.

## 추가 정보

* [Liferay 자산 및 페이지에 비디오 포함](./embedding-videos-into-liferay-assets-and-pages.md)
* [사용자 지정 비디오 바로 가기 공급자 만들기](../developer-guide/creating-video-shortcut-providers.md)
