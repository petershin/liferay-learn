---
toc:
  - ./creating-and-managing-objects/creating-objects.md
  - ./creating-and-managing-objects/extending-system-objects.md
  - ./creating-and-managing-objects/using-the-objects-model-builder.md
  - ./creating-and-managing-objects/organizing-objects-with-folders.md
  - ./creating-and-managing-objects/fields.md
  - ./creating-and-managing-objects/relationships.md
  - ./creating-and-managing-objects/actions.md
  - ./creating-and-managing-objects/layouts.md
  - ./creating-and-managing-objects/views.md
  - ./creating-and-managing-objects/validations.md
  - ./creating-and-managing-objects/localizing-object-definitions-and-entries.md
  - ./creating-and-managing-objects/using-system-objects-with-custom-objects.md
  - ./creating-and-managing-objects/activating-and-deactivating-objects.md
  - >-
    ./creating-and-managing-objects/exporting-and-importing-object-definitions.md
  - ./creating-and-managing-objects/auditing-object-events.md
  - ./creating-and-managing-objects/deleting-objects.md
  - ./creating-and-managing-objects/managing-objects-with-headless-apis.md
---
# オブジェクトの作成と管理

```{toctree}
:maxdepth: 3

creating-and-managing-objects/creating-objects.md
creating-and-managing-objects/extending-system-objects.md
creating-and-managing-objects/using-the-objects-model-builder.md
creating-and-managing-objects/organizing-objects-with-folders.md
creating-and-managing-objects/fields.md
creating-and-managing-objects/relationships.md
creating-and-managing-objects/actions.md
creating-and-managing-objects/layouts.md
creating-and-managing-objects/views.md
creating-and-managing-objects/validations.md
creating-and-managing-objects/localizing-object-definitions-and-entries.md
creating-and-managing-objects/using-system-objects-with-custom-objects.md
creating-and-managing-objects/activating-and-deactivating-objects.md
creating-and-managing-objects/exporting-and-importing-object-definitions.md
creating-and-managing-objects/auditing-object-events.md
creating-and-managing-objects/deleting-objects.md
creating-and-managing-objects/managing-objects-with-headless-apis.md
```

{bdg-secondary}`Liferay 7.4+`

Liferay Objectでは、コードを記述することなくビジネスニーズを満たすカスタムアプリケーションを [作成](./creating-and-managing-objects/creating-objects.md) するための便利なUIを提供します。 オブジェクトを使用して、システムオブジェクトとカスタムオブジェクトの両方を管理および拡張することもできます。 これには、 [フィールド](./creating-and-managing-objects/fields.md) 、 [リレーションシップ](./creating-and-managing-objects/relationships.md) 、 [アクション](./creating-and-managing-objects/actions.md) 、 [レイアウト](./creating-and-managing-objects/layouts.md) 、 [ビュー](./creating-and-managing-objects/views.md) 、 [バリデーション](./creating-and-managing-objects/validations.md) 、 [カスタムステータス](./creating-and-managing-objects/fields/adding-and-managing-custom-states.md) の追加が含まれます。 オブジェクト定義に関連するこれらの操作やその他の操作を実行するために必要な権限については、 [オブジェクトアプリケーションの権限](./objects-application-permissions.md) を参照してください。

!!! note 
    システムオブジェクトはオブジェクトフレームワークと統合されたデフォルトのLiferayアプリケーションで、カスタムオブジェクトはユーザーによって作成され公開された定義です。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} オブジェクトの作成
:link: ./creating-and-managing-objects/creating-objects.md
:::

:::{grid-item-card} システムオブジェクトの拡張
:link: ./creating and-managing-objects/extending-system-objects.md
:::

:::{grid-item-card} 項目
:link: ./creating-and-managing-objects/fields.md
:::

:::{grid-item-card} 関連
:link: ./creating-and-managing-objects/relationships.md
:::

:::{grid-item-card} 操作
:link: ./creating-and-managing-objects/actions.md
:::

:::{grid-item-card} レイアウト
:link: ./creating-and-managing-objects/layouts.md
:::

:::{grid-item-card} 閲覧数
:link: ./creating-and-managing-objects/views.md
:::

:::{grid-item-card} 検証
:link: ./creating-and-managing-objects/validations.md
:::

:::{grid-item-card} オブジェクト定義とエントリのローカライズ
:link: ./creating-and-managing-objects/localizing-object-definitions-and-entries.md
:::

:::{grid-item-card} カスタム・オブジェクトでシステム・オブジェクトを使う
:link: ./creating and-managing-objects/using-system-objects-with-custom-objects.md
:::

:::{grid-item-card} オブジェクトの有効化と無効化
:link: ./creating and-managing-objects/activating and-deactivating-objects.md
:::

:::{grid-item-card} オブジェクト定義のエクスポートとインポート
:link: ./creating-and-managing-objects/exporting-and-importing-object-definitions.md
:::

:::{grid-item-card} オブジェクト定義イベントの監査
:link: ./creating and-managing-objects/auditing-object-events.md
:::

:::{grid-item-card} オブジェクトの削除
:link: ./creating-and-managing-objects/deleting-objects.md
:::

:::{grid-item-card} ヘッドレスAPIでオブジェクトを管理する
:link: ./creating and-managing-objects/managing-objects-with-headless-apis.md
:::
::::