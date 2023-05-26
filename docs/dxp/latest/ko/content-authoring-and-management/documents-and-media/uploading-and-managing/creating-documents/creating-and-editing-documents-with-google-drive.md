# Google 드라이브로 문서 생성 및 편집

Google 문서&trade; 을 사용하여 문서 및 미디어 라이브러리에 저장할 텍스트 문서, 스프레드시트 또는 프리젠테이션을 만들고 편집할 수 있습니다. Google 문서&trade; 편집 세션을 마치면 변경 사항이 문서 및 미디어 라이브러리에 자동으로 저장됩니다.

## 인증

Google 문서&trade;을 통해 문서 및 미디어 파일을 처음 만들거나 편집할 때 Google 계정에 인증해야 합니다. 이렇게 하면 Google 드라이브&trade; 이 포털 계정에 연결되므로 한 번만 수행하면 됩니다.

계정 연결을 해제하려면

1. **프로필** &rarr; **계정 설정** 을 클릭합니다.
1. **일반** 탭에서 **앱** 을 클릭합니다.
1. Google 드라이브&trade;옆에 있는 **취소** 을 클릭합니다.

![포털에서 Google 계정의 연결을 해제할 수 있습니다.](./creating-and-editing-documents-with-google-drive/images/01.png)

Google 드라이브&trade; 에 대한 액세스가 연결 해제되었습니다.

## 파일 생성

Google 문서&trade;을 통해 새 문서 및 미디어 파일을 만들려면 다음 단계를 따르세요.

1. **메뉴**(![Product Menu](../../../../images/icon-menu.png))을 열고 사이트 이름을 클릭한 다음 **콘텐츠 & 데이터** &rarr; **문서 및 미디어** 로 이동합니다.
1. ** 추가 아이콘(![Add](../../../../images/icon-add.png))을 클릭하고 문서 라이브러리에 추가할 Google 문서 유형을 선택합니다.

    * 구글 문서&trade;
    * 구글슬라이드&trade;
    * 구글 시트&trade;

1. 이러한 옵션 중 하나를 선택하면 DXP는 임시 문서 및 미디어 파일을 생성하고 이를 새 Google 파일에 연결합니다. 그런 다음 브라우저는 콘텐츠를 만들 수 있도록 해당 Google 파일로 리디렉션합니다. 임시 문서 및 미디어 파일에 대한 일부 작업은 연결된 Google 파일에 영향을 줄 수 있습니다. 자세한 내용은 [다중 편집 세션](#multiple-editing-sessions) 을 참조하십시오.

    ![만들려는 Google 문서 유형을 선택합니다.](./creating-and-editing-documents-with-google-drive/images/02.png)

1. Google Docs&trade; 편집기를 사용하여 문서 콘텐츠를 만드세요. 공유를 제외한 모든 Google Docs&trade; 기능을 사용할 수 있습니다.

1. Google Docs&trade; 편집기에서 다음 툴바 버튼 중 하나를 클릭하여 변경사항을 저장하거나 취소합니다.

    **저장 후 Liferay로 돌아가기:** 문서를 문서 및 미디어 라이브러리에 새 파일로 저장하고 Google 파일을 삭제한 다음 포털로 돌아갑니다. 저장된 파일의 형식은 위의 2단계에서 선택한 Google 문서 유형에 따라 다릅니다.

    * Google 문서&trade;: Microsoft Word(`.docx`)
    * Google 슬라이드&trade;: 마이크로소프트 파워포인트(`.pptx`)
    * Google 스프레드시트&trade;: Microsoft Excel(`.xlsx`)

    **Discard Changes:** 문서 및 미디어 라이브러리 또는 Google 문서도구에 파일을 저장하지 않고 포털로 돌아갑니다&trade;.

    버튼을 클릭하지 않고 Google Docs&trade; 창을 닫을 수도 있습니다. 이 경우 편집 세션을 표시한 창이 닫혀도 편집 세션은 계속 열려 있습니다. 자세한 내용은 아래의 [다중 편집 세션](#multiple-editing-sessions) 섹션을 참조하십시오.

    ![편집기의 도구 모음을 사용하여 변경 사항을 저장하거나 취소하십시오.](./creating-and-editing-documents-with-google-drive/images/03.png)

## 파일 편집

Google Docs&trade; 을 사용하여 다음 유형의 문서 및 미디어 파일을 편집할 수 있습니다.

* 텍스트 파일(`.docx`, `.html`, `.txt`, `.rtf`, `.odt`)
* 프레젠테이션 파일(`.pptx`, `.odp`)
* 스프레드시트 파일(`.xlsx`, `.ods`, `.csv`, `.tsv`)
* PDF 파일

| **참고:** Google Docs&trade; 는 XML 기반이 아닌 이전 Microsoft Office 파일 형식(`.doc`, `.ppt`, `.xls`)을 지원하지 않습니다.

Google Docs&trade;에서 문서 및 미디어 파일을 수정하려면 다음 단계를 따르세요.

1. 문서 및 미디어 라이브러리에서 파일로 이동합니다.
1. 파일의 작업 아이콘(![Actions](../../../../images/icon-actions.png))을 클릭하고 **Google 문서에서 편집** 을 선택합니다. 이렇게 하면 자동으로 파일을 체크아웃하고 [콘텐츠를 새 Google Docs](../../publishing-and-sharing/managing-document-access/managing-document-changes-with-checkout.md) 파일로 전송하고 사용자를 해당 Google Docs&trade; 파일로 리디렉션&trade;.

    ![파일의 작업 메뉴에서 Google 문서도구에서 편집을 선택합니다.](./creating-and-editing-documents-with-google-drive/images/04.png)

1. Google 문서&trade;에서 파일을 편집합니다. 편집 과정은 위에서 설명한 파일 생성과 완전히 동일합니다.

## 여러 편집 세션

Google Docs&trade;에서 문서 및 미디어 파일을 만들거나 편집할 때 각각 **Save and Return to Liferay** 또는 **Discard Changes** 를 클릭하여 변경 사항을 저장하거나 취소할 수 있습니다. 아무 것도 클릭하지 않고 대신 창을 닫으면 편집 세션이 계속 존재합니다. 문서 및 미디어의 원본 파일을 통해 액세스할 수 있습니다. 파일이 이전에 존재하지 않은 경우(예: 새 파일을 만든 경우) 문서 및 미디어에 임시 파일로 나타납니다.

문서 및 미디어 파일에 대한 편집 세션이 이미 있는 경우 해당 파일의 작업 아이콘(![Actions](../../../../images/icon-actions.png))을 통해 다음 작업을 수행할 수 있습니다.

**Google 문서에서 편집:** Google 문서에서 파일 편집 재개&trade;.

**체크인:** Google 파일(변경 사항 포함)을 문서 및 미디어 파일에 저장한 다음 Google 파일을 삭제합니다. 이는 Google 문서&trade; 편집 창에서 **저장 후 Liferay** 로 돌아가기를 클릭하는 것과 같습니다.

**체크아웃 취소:** Google 파일을 삭제하고 변경 사항을 버립니다. 이는 Google Docs&trade; 편집 창에서 **Discard Changes** 을 클릭하는 것과 같습니다.

## 관련 주제

* [Microsoft Office 365로 문서 작성 및 편집](./creating-and-editing-documents-with-microsoft-office-365.md)
* [Google 드라이브의 파일에 연결](../linking-to-files-on-google-drive.md)
