# 문서 및 미디어에 워크플로 사용

문서 및 미디어는 Liferay의 [워크플로우 엔진](../../../process-automation/workflow/introduction-to-workflow.md)과 완전히 통합됩니다. 즉, 파일에 대한 사용자 지정 검토 및 승인 프로세스를 정의할 수 있습니다. 표준 워크플로 기능 외에도 Documents and Media는 여러 워크플로 사용을 지원합니다. 모든 문서 유형에 대한 기본 워크플로를 설정하고 특정 문서 유형에 대해 대체 워크플로를 사용하도록 개별 폴더를 구성할 수 있습니다.

마케팅, 법률 및 회계 파일에 대해 서로 다른 [문서 유형](../uploading-and-managing/managing-metadata/defining-document-types.md) 을 정의한 시나리오를 고려하십시오. 콘텐츠로 인해 각 문서 유형은 특정 검토 및 승인 프로세스를 거쳐야 합니다. 이를 위해 각 유형에 대해 [사용자 지정 워크플로를 만든 다음](../../../process-automation/workflow/designing-and-managing-workflows/workflow-designer.md) 사용자 지정 워크플로를 사용하도록 문서 및 미디어 폴더를 구성할 수 있습니다. 또한 다른 모든 문서 유형이 동일한 검토 및 승인 프로세스를 거쳐야 하는 경우 문서 및 미디어 루트 폴더에 대한 기본 워크플로를 설정할 수 있습니다.

## 기본 워크플로우 활성화

모든 문서 유형에 대해 기본 워크플로우를 활성화하려면 다음 단계를 따르십시오.

1. 원하는 사이트 또는 자산 라이브러리에서 **문서 및 미디어** 애플리케이션을 엽니다.

1. 루트 폴더(예: Home)에서 Application Bar의 **Actions** 버튼(![Actions Button](../../../images/icon-actions.png))을 클릭하고 **Edit** 선택합니다.

   ![애플리케이션 표시줄에서 작업 버튼을 클릭하고 편집을 선택합니다.](./using-workflow-with-documents-and-media/images/01.png)

1. 드롭다운 메뉴에서 원하는 **워크플로** 선택합니다.

   ![워크플로 정의를 선택합니다.](./using-workflow-with-documents-and-media/images/02.png)

1. **저장** 클릭합니다.

이렇게 하면 사이트 또는 자산 라이브러리의 모든 문서 유형에 대한 기본 워크플로가 활성화됩니다. 이제 사용자가 파일을 업로드하거나 편집할 때마다 **게시** 버튼이 **워크플로** 제출 버튼으로 대체됩니다. 필요한 경우 개별 폴더에 대해 이 워크플로를 재정의할 수 있습니다. 자세한 내용은 [폴더 및 문서 유형에 대한 대체 워크플로우 활성화](#enabling-alternative-workflows-for-folders-and-document-types) 참조하십시오.

## 폴더 및 문서 유형에 대한 대체 워크플로우 활성화

개별 폴더 및 문서 유형에 대한 워크플로를 활성화 또는 비활성화하려면 다음 단계를 따르십시오.

1. 원하는 사이트 또는 자산 라이브러리에서 **문서 및 미디어** 애플리케이션을 엽니다.

1. 원하는 폴더에 대해 **동작** 버튼(![Actions Button](../../../images/icon-actions.png))을 클릭하고 **편집** 선택합니다.

   ![폴더에 대한 작업 버튼을 클릭하고 편집을 선택합니다.](./using-workflow-with-documents-and-media/images/03.png)

1. **Document Type Restrictions and Workflow** 아래에서 원하는 구성을 선택합니다.

   **상위 폴더(상위 폴더)의 문서 유형 제한 및 워크플로 사용** : 상위 폴더의 구성을 사용합니다. 이것이 기본값입니다.

   **이 폴더(현재 폴더)에 대한 특정 문서 유형 제한 및 워크플로우 정의** : 개별 문서 유형에 대해 **사용자 정의 워크플로우** 선택하거나 개별 유형에 대한 기본 워크플로우를 비활성화하려면 **워크플로우 없음** 선택합니다.

   **이 폴더의 기본 워크플로우(current-folder**) : 현재 폴더의 기본 워크플로우를 선택합니다. 이렇게 하면 문서 유형에 관계없이 폴더의 모든 파일에 워크플로우가 적용됩니다.

   ![문서 유형 제한 및 작업 흐름에서 원하는 구성을 선택합니다.](./using-workflow-with-documents-and-media/images/04.png)

1. **저장** 클릭합니다.

이렇게 하면 선택한 폴더 및 문서 유형에 대해 선택한 워크플로가 활성화됩니다.

## 추가 정보

* [워크플로 디자이너](../../../process-automation/workflow/designing-and-managing-workflows/workflow-designer.md)
* [문서 및 미디어 UI 참조](../documents-and-media-ui-reference.md)
