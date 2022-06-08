# 管理バーにアクションを含める

通常、アクションメニューは各検索コンテナの結果に含まれていますが、これらのアクションを管理バーに含めることもできます。 これにより、すべてが同じUI内に整理されます。 この更新により、各検索コンテナの結果の横にチェックボックスが追加され、管理バー自体にもすべての結果を選択するためのチェックボックスが追加されます。 チェックボックスがオンになっている（個別またはすべてを選択）場合はアクションが表示され、それ以外の場合は非表示になります。

![個別の結果またはすべての結果を一度に選択できます。](./including-actions-in-the-management-bar/images/01.png)

次の手順に従って、管理バーにアクションを含めます。

1. `<liferay-frontend:management-bar>`タグを更新して、チェックボックスを含め、検索コンテナのIDを指定します。

    ```jsp
    <liferay-frontend:management-bar
        includeCheckBox="<%= true %>"
        searchContainerId="mySearchContainerId"
    >
    ```

1. `</liferay-frontend:management-bar-filters>`タグを閉じた後、`<liferay-frontend:management-bar-action-buttons>`タグを追加します。

    ```jsp
    <liferay-frontend:management-bar-action-buttons>

    </liferay-frontend:management-bar-action-buttons>
    ```

1. 利用可能な管理バーボタンのtaglib（たとえば、`management-bar-button`）を使用して、アプリの管理バーのアクションボタンを作成します。  サイト管理ポートレットのコードスニペットを以下に示します。

    ```jsp
    <liferay-frontend:management-bar-action-buttons>
        <liferay-frontend:management-bar-sidenav-toggler-button
            icon="info-circle"
            label="info"
        />

        <liferay-frontend:management-bar-button
            href="javascript:deleteEntries();"
            icon="trash"
            id="deleteSites"
            label="delete"
        />
    </liferay-frontend:management-bar-action-buttons>
    ```

![アプリに必要な数のアクションを実行できます。](./including-actions-in-the-management-bar/images/02.png)

## 関連トピック

* [管理バーのすべてまたは一部を無効にする](./disabling-the-management-bar.md)
* [Clay管理ツールバー](../clay-tag-library/clay-management-toolbar.md)