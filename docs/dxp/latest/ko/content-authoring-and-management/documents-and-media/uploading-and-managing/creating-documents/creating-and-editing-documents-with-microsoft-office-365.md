# Microsoft Office 365로 문서 작성 및 편집

Office 365&trade; 을 사용하여 문서 및 미디어 라이브러리에 저장할 텍스트 문서, 스프레드시트 또는 프레젠테이션을 만들고 편집할 수 있습니다. Office 365&trade; 편집 세션을 마치면 문서를 체크인하여 문서 및 미디어 라이브러리에 변경 사항을 저장해야 합니다.

시작하기 전에 먼저 DXP 설치를 [활성화](../../devops/enabling-document-creation-and-editing-with-microsoft-office-365.md) 하여 Microsoft Office 365&trade;와 연결해야 합니다.

## 인증

Office 365&trade;을 통해 문서 및 미디어 파일을 처음 생성하거나 편집할 때 Microsoft 계정으로 인증해야 합니다. 이렇게 하면 OneDrive&trade; 이 DXP 계정에 연결되므로 한 번만 수행하면 됩니다.

계정 연결 해제는 세 단계만 거치면 됩니다.

1. **프로필** &rarr; **계정 설정** 을 클릭합니다.
1. **일반** 탭에서 **앱** 을 클릭합니다.
1. OneDrive&trade;옆에 있는 **취소** 을 클릭합니다.

    ![포털에서 계정 연결을 해제할 수 있습니다.](./creating-and-editing-documents-with-microsoft-office-365/images/01.png)

OneDrive&trade; 의 연결이 해제되었습니다.

## 파일 생성

1. **메뉴**(![Product Menu](../../../../images/icon-menu.png))을 열고 사이트 이름을 클릭한 다음 **콘텐츠 & 데이터** &rarr; **문서 및 미디어** 로 이동합니다.
1. ** 추가 아이콘(![Add](../../../../images/icon-add.png))을 클릭하고 문서 라이브러리에 추가할 Office 365&trade; 문서 유형을 선택합니다.

    * 워드&trade;
    * 엑셀&trade;
    * 파워포인트&trade;

    이러한 옵션 중 하나를 선택하면 문서 이름을 입력할 수 있는 새 창이 열립니다.

    ![만들려는 문서 유형을 선택합니다.](./creating-and-editing-documents-with-microsoft-office-365/images/02.png)

1. **제목** 필드에 문서 이름을 입력하고 **저장** 을 클릭합니다. **저장** 을 클릭하면 DXP가 임시 문서 및 미디어 파일을 만들고 새 Office 365&trade; 파일에 연결합니다. 그러면 브라우저에서 콘텐츠를 만들 수 있도록 해당 Office 365&trade; 파일이 포함된 새 창이 열립니다.

    ![문서를 만들 때 이름을 지정해야 합니다.](./creating-and-editing-documents-with-microsoft-office-365/images/03.png)

1. Office 365&trade; 편집기를 사용하여 문서의 콘텐츠를 만듭니다.

1. DXP에 대한 변경 사항을 저장하거나 취소합니다.

    **체크인:** Office 365&trade; 파일을 문서 및 미디어에 저장한 다음 Office 365&trade;에서 파일을 삭제합니다. 저장된 파일의 형식은 위의 2단계에서 선택한 문서 유형에 따라 다릅니다.

    * 워드: 마이크로소프트 워드&trade; (`.docx`)
    * PowerPoint: Microsoft PowerPoint&trade; (`.pptx`)
    * 엑셀: 마이크로소프트 엑셀&trade; (`.xlsx`)

    **체크아웃 취소:** Office 365&trade; 파일을 삭제하고 변경 사항을 무시합니다.

## 파일 편집

Office 365&trade; 을 사용하여 다음 유형의 문서 및 미디어 파일을 편집할 수 있습니다.

* 텍스트 파일(`.doc`, `.docx`, `.docm`, `.dot`, `.dotx`, `.dotm`, `.html`, `.txt`, `.rtf`, `.`)
* 프레젠테이션 파일(`.ppt`, `.pptx`, `.pptm`, `.pps`, `.ppsx`, `.ppsm`, `.pot`, `.potx`, `.potm`)
* 스프레드시트 파일(`.xls`, `.xlsx`, `.xlsm`, `.xlt`, `.xltx`, `.xltm`, `.ods`, `.csv`, `.tsv`, `. txt`, `.tab`)

Office 365&trade;에서 문서 및 미디어 파일을 편집하려면 다음 단계를 따르십시오.

1. 문서 및 미디어 라이브러리에서 파일로 이동합니다.

1. 파일의 작업 아이콘(![Actions](../../../../images/icon-actions.png))을 클릭하고 **Office 365에서 편집** 을 선택합니다. 그러면 자동으로 [파일을 체크아웃하고](../../publishing-and-sharing/managing-document-access/managing-document-changes-with-checkout.md) 해당 콘텐츠를 새 Office 365 파일로 전송하고&trade; 해당 파일 Office 365&trade;로 리디렉션합니다.

1. Office 365&trade;에서 파일을 편집합니다. 편집 과정은 위에서 설명한 파일 생성과 완전히 동일합니다.

    ![문서를 수정하려면 파일의 작업 메뉴에서 Office 365에서 편집을 선택합니다.](./creating-and-editing-documents-with-microsoft-office-365/images/04.png)

## 추가 정보

* [Microsoft Office 365로 문서 생성 및 편집 활성화](../../devops/enabling-document-creation-and-editing-with-microsoft-office-365.md)
* [Google 드라이브로 문서 생성 및 편집](./creating-and-editing-documents-with-google-drive.md)
