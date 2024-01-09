# 예: 중간 저널 기사 버전 제거

이 지침과 코드 샘플은 중간 저널 기사 버전을 제거하는 방법을 보여줍니다. [스크립트 콘솔](../../../system-administration/using-the-script-engine/running-scripts-from-the-script-console.md)에서 Java 또는 Groovy 코드를 실행하여 불필요한 개체 버전을 제거할 수 있습니다.

중간 저널 기사 버전을 제거하기 위한 예시 단계는 다음과 같습니다.

1. **유지할 최신 버전 수를 결정합니다.** 원래 버전과 가장 최신 버전을 유지해야 하지만 추가로 최신 버전을 유지할 수도 있습니다. 예를 들어 두 개의 최신 버전을 유지하거나 최신 버전만 유지하려고 할 수 있습니다.

2. **엔터티 버전을 삭제하는 방법을 찾습니다.** Liferay DXP [앱 API](https://docs.liferay.com/dxp/apps/) 및 [com.liferay.portal.kernel API](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/) 는 사용할 수 있는 옵션입니다.

    [Service Builder](https://help.liferay.com/hc/ko/articles/360030958811-Running-Service-Builder) 엔터티인 경우 엔터티의 `*LocalServiceUtil` 클래스에서 `delete*` 메서드를 검사합니다.

    예를 들어, 이 `deleteArticle` in [`JournalArticleLocalServiceUtil`](https://docs.liferay.com/dxp/apps/web-experience/latest/javadocs/com/liferay/journal/service/JournalArticleLocalServiceUtil.html#deleteArticle-long-java.lang.String-double-java.lang.String-com.liferay.portal.kernel.service.ServiceContext-) 는 저널 기사 버전을 삭제합니다.

    ```java
    deleteArticle(long groupId, java.lang.String articleId, double version,
        java.lang.String articleURL,
        com.liferay.portal.kernel.service.ServiceContext serviceContext)
    ```

3. **삭제할 엔터티 버전과 삭제에 필요한 정보를 집계합니다.** 예를 들어 범위 내에서 제거 기준과 일치하는 `JournalArticle` 버전을 모두 가져오고 엔티티 ID와 그룹 ID를 여기에 연결합니다(위에 표시된 `deleteArticle` 메서드에는 엔티티 ID와 그룹 ID가 필요함).

    엔터티 개체(예: `JournalArticle`)에는 일반적으로 버전 필드가 있습니다. `JournalArticleResource` 에는 각각 `JournalArticle`의 기사 ID(엔터티 ID)와 그룹 ID가 있습니다. `JournalArticleResource` 은 여러 버전을 가질 수 있는 각 `JournalArticle`을 가져오는 열쇠입니다. 삭제할 `JournalArticle` 버전을 식별하는 단계는 다음과 같습니다.

    1. 모든 `JournalArticleResource` 개체를 가져옵니다.

        ```java
        List<JournalArticleResource> journalArticleResources =
            JournalArticleLocalServiceUtil.getJournalArticleResources(start, end);
        ```

    1. 각 `JournalArticleResource`와 연결된 `JournalArticle` 개체를 통해 각 `개의 JournalArticle` 버전의 워크플로 상태를 가져옵니다. [Dynamic Query](https://help.liferay.com/hc/ko/articles/360030614272-Dynamic-Query) 은 각 개체에서 원하는 데이터를 정확하게 가져오는 효율적인 방법입니다.


        <!--Add back link for 'Dynamic Query' once dynamic-query article is available-->

        ```java
        for (JournalArticleResource
            journalArticeResource : journalArticleResources) {

            List<Double> journalArticlesVersionsToDelete =
                new ArrayList<Double>();

            DynamicQuery dq =
                DynamicQueryFactoryUtil.forClass(JournalArticle.class)
                    .setProjection(ProjectionFactoryUtil.projectionList()
                        .add(ProjectionFactoryUtil.property("id"))
                        .add(ProjectionFactoryUtil.property("version"))
                        .add(ProjectionFactoryUtil.property("status")))
                    .add(PropertyFactoryUtil.forName("groupId")
                        .eq(journalArticeResource.getGroupId()))
                    .add(PropertyFactoryUtil.forName("articleId")
                        .eq(journalArticeResource.getArticleId()))
                    .addOrder(OrderFactoryUtil.asc("version"));

            List<Object[]> result =
                JournalArticleLocalServiceUtil.dynamicQuery(dq);

            // See the next step for the sample code that goes here
        }
        ```

    1. 각 `개의 JournalArticleResource` (각 `JournalArticle` 엔터티마다 하나씩 있음)에 대해 유지하려는 첫 번째 또는 최신 버전의 범위에 있고 해당 상태가 삭제 자격이 있는 중간 버전 목록을 작성합니다. 예를 들어 승인되었거나 만료된 중간 기사 버전(예: [WorkflowConstants.STATUS_APPROVED_WorkflowConstants.STATUS_EXPIRED](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/workflow/WorkflowConstants.html) )을 삭제할 수 있습니다. `MIN_NUMBER_FIRST_VERSIONS_KEPT` 및 `MIN_NUMBER_LATEST_VERSIONS_KEPT` 변수는 유지할 첫 번째(가장 오래된) 버전과 최신(최신) 버전의 최소 및 최대 수를 표시합니다.

        ```java
        List<Double> journalArticlesVersionsToDelete =
            new ArrayList<Double>();

        for (int i=0; i < result.size(); i++) {
            long id = (long) result.get(i)[0];
            double version = (double) result.get(i)[1];
            int status = (int) result.get(i)[2];

            if ((status == WorkflowConstants.STATUS_APPROVED) || (status == WorkflowConstants.STATUS_EXPIRED) {

                if (i < MIN_NUMBER_FIRST_VERSIONS_KEPT) {
                    continue;
                }

                if (i >= (result.size() -
                    MIN_NUMBER_LATEST_VERSIONS_KEPT)) {
                    continue;
                }

                journalArticlesVersionsToDelete.add(version);
            }
        }

        // See the next step for the sample code that goes here
        ```

4. 마지막으로 집계한 버전과 일치하는 각 저널 기사를 삭제합니다.

    ```java
    for (double version : journalArticlesVersionsToDelete) {
    {
        JournalArticleLocalServiceUtil.deleteArticle(journalArticeResource.getGroupId(),
            journalArticeResource.getArticleId(),
            journalArticlesVersionsToDelete(i), null, null);
    }
    ```

유사한 코드를 작성하여 다른 엔터티의 중간 버전을 제거할 수 있습니다. 코드가 준비되면 샘플 모듈을 사용하거나 스크립트 콘솔을 사용하여 스크립트로 실행합니다.

```{tip}
제거하려는 각 개체의 버전(및 관심 있는 기타 정보)을 인쇄합니다. 개체 삭제 호출을 주석 처리하고 삭제를 커밋하기 전에 테스트로 제거할 버전의 인쇄물을 읽을 수도 있습니다.
```

## 관련 주제

* [데이터베이스 가지치기](./database-pruning-for-faster-upgrades.md)
* [데이터 업그레이드를 위한 조정](./database-tuning-for-upgrades.md)
