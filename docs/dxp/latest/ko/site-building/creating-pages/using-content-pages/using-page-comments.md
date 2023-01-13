# 페이지 댓글 사용

콘텐츠 페이지를 구축할 때 귀하와 귀하의 팀은 Liferay의 페이지 설명 기능을 사용하여 협업할 수 있습니다. 주석은 Liferay DXP 7.3+에서 기본적으로 활성화되어 있지만 Liferay DXP 7.2에서는 기본적으로 비활성화되어 있습니다. 자세한 내용은 [댓글 활성화](#enabling-comments) 을 참조하십시오.

![페이지 댓글을 사용하여 협업하세요.](./using-page-comments/images/01.png) <!--TASK: UPDATE IMG FOR LRDOCS-10856-->

## 페이지 댓글 추가

페이지 댓글을 추가하려면 다음 단계를 따르세요.

1. 페이지 요소(예: 조각 또는 위젯)를 포함하는 콘텐츠 페이지로 이동하고 *편집* 버튼(![Edit Button](../../../images/icon-edit-pencil.png))을 클릭하여 페이지 편집을 시작합니다.

1. 사이드바 메뉴에서 *댓글* 패널(![Comments Icon](../../../images/icon-comments-w.png))을 열고 원하는 조각 또는 위젯을 선택합니다.

   또는 원하는 페이지 요소를 선택하고 주석 아이콘을 클릭할 수 있습니다. 댓글 패널이 열립니다.

   ![페이지 요소에 대한 주석 아이콘을 클릭하십시오.](./using-page-comments/images/02.png) <!--TASK: UPDATE IMG FOR LRDOCS-10856-->

   ```{note}
   [Fragment sub-elements](../page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md), 컨테이너 또는 그리드에는 주석을 추가할 수 없습니다. 
   ```

1. 사이드 패널에 댓글을 입력하고 *댓글*을 클릭합니다.

댓글이 추가된 후 *작업* 버튼(</em> )을 통해 댓글을 *수정* 또는 *삭제할![Actions Button](../../../images/icon-actions.png)있습니다. 사용자는 답글을 추가할 수도 있습니다.</p>

![주석을 편집, 삭제 또는 회신합니다.](./using-page-comments/images/03.png) <!--TASK: UPDATE IMG FOR LRDOCS-10856-->

```{note}
댓글을 삭제하면 댓글에 대한 모든 답글이 삭제됩니다.
```

## 페이지 댓글 검토

페이지 조각 또는 위젯에 댓글이 추가되면 댓글 측면 패널에서 댓글을 검토할 수 있습니다.

![댓글 측면 패널에서 페이지 댓글을 검토합니다.](./using-page-comments/images/04.png) <!--TASK: UPDATE IMG FOR LRDOCS-10856-->

협업할 때 *해결* 버튼(![Resolve Button](../../../images/icon-resolve.png))을 클릭하여 댓글을 해결된 것으로 표시할 수 있습니다. 기본적으로 해결된 댓글과 답글은 숨겨집니다. 그러나 *해결된 댓글 표시*을 선택하면 해결된 댓글을 볼 수 있습니다.

![댓글을 해결합니다.](./using-page-comments/images/05.png)

해결된 댓글을 보는 동안 녹색 *해결* 버튼을 클릭하여 댓글을 다시 열 수 있습니다.

![해결된 댓글을 보고 다시 엽니다.](using-page-comments/images/06.png) <!--TASK: UPDATE IMG FOR LRDOCS-10856-->

## 주석 활성화

콘텐츠 페이지에 대한 댓글을 활성화하려면 다음 단계를 따르십시오.

1. 제어판으로 이동하여 *구성* &rarr; *시스템 설정* &rarr; *콘텐츠 및 데이터* &rarr; *페이지*으로 이동합니다.

1. 가상 인스턴스 범위에서 *콘텐츠 페이지 편집기* 을 선택합니다. *Comments Enabled* 체크박스를 체크하고 *저장* 버튼을 클릭합니다.

   ![콘텐츠 페이지 편집기로 이동하여 댓글 사용 확인란을 선택합니다.](./using-page-comments/images/07.png)

   이제 콘텐츠 페이지 댓글을 사용할 수 있습니다.

```{note}
이렇게 하면 모든 인스턴스에 대해 콘텐츠 페이지 댓글이 활성화됩니다. 인스턴스별로 이를 제어하려면 (*시스템 설정* 대신) *인스턴스 설정*에서 동일한 설정으로 이동하십시오.
```

## 추가 정보

* [콘텐츠 페이지 사용](../using-content-pages.md)
* [콘텐츠 페이지에 요소 추가](./adding-elements-to-content-pages.md)
* [콘텐츠 페이지 편집기 UI 참조](./content-page-editor-ui-reference.md)
