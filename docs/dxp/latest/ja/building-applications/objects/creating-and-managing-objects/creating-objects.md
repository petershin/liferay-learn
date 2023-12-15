# オブジェクトの作成

{bdg-secondary}`liferay 7.4 2023.Q4+/GA102+`.

Liferay Objectは、Liferay UIの開発機能を提供します。 オブジェクトを使用すると、コードを記述したり、モジュールを手動でデプロイしたりすることなく、完全に統合されたLiferayアプリケーションを構築できます。 このプロセスには、 [](#creating-object-drafts) オブジェクトドラフトを作成し、 [](#editing-object-drafts) を編集し、最後に [](#publishing-object-drafts) をパブリッシュして新しいアプリケーションを作成する。

ここでは、デフォルトのオブジェクト UI を使用してオブジェクト定義を作成する方法を学びますが、モデル・ビルダー GUI を使用してオブジェクト定義を作成、管理、拡張することもできます。 詳しくは [Using Objects Model Builder](./using-the-objects-model-builder.md) を参照してください。

!!! 重要
Liferayはオブジェクト定義を公開する際にデータベーステーブルを作成するので、 [Database Configurations](../../../installation-and-upgrades/reference/database-configurations.md#high-security-database-user-practices) で説明されている高セキュリティのデータベースプラクティスでObjectsを使用することはできません。

## オブジェクトドラフトの作成

オブジェクトドラフトは、オブジェクトアプリケーションを作成するために必要なデータを格納するアプリケーションテンプレートです。 ドラフト・オブジェクトを作成する、

1. **グローバルメニュー**(![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］**タブで***［ オブジェクト**］ をクリックします。

   !!! note
   Liferay 7.4 2023.Q4+/GA102+ では、Objects UI にアクセスするには **Object Folder > View** 権限も必要です。 詳細は [オブジェクトアプリケーションの権限](../objects-application-permissions.md) を参照。

1. 目的の [オブジェクトフォルダ](./organizing-objects-with-folders.md) に移動し、 **追加** ボタン (![追加ボタン](../../../images/icon-add.png))をクリックします。

1. ドラフトにこれらの詳細を提供する。

   **ラベル** :Objects admin およびサポートされているアプリケーションコンテキスト（ワークフロー、表示ページテンプレート、フォームなど）でオブジェクトを識別します。

   **Plural Label** ：UIにおけるオブジェクト・アプリケーションの表示名を決定します。

   **オブジェクト名** ：オブジェクトの `definition.name` を決定し、公開後に変更することはできません。

   ![Enter a Label, Plural Label, and Name for the object draft.](./creating-objects/images/01.png)

1. ［**保存**］をクリックします。

保存されると、設定やデータ要素のない空白のオブジェクトドラフトが作成されます。 ドラフトは、オブジェクト管理でシステムオブジェクトと一緒に表示できます。 作成プロセスを完了するには、ドラフトを [編集](#editing-object-drafts) してから、Liferayインスタンスに [公開](#publishing-object-drafts) する必要があります。

![You can view the new object draft in the Objects admin.](./creating-objects/images/02.png)

## オブジェクトドラフトの編集

{bdg-secondary}`liferay 7.4 2023.Q3+/GA98+`.

オブジェクトを公開する前に、要素の追加や設定を行うことができます。 これには、フィールドの追加、バリデーションの定義、データ範囲の設定などが含まれます。

```{note}
フィールド、リレーションシップ、またはレイアウトを追加するたびに、オブジェクトドラフトが自動的に保存されます。 ただし、他のタブに移動すると、［Details］タブで保存されていない変更はすべて失われます。
```

オブジェクトドラフトを編集するには、次の手順に従います。

1. オブジェクト管理ページから、新しく作成したオブジェクトのドラフトをクリックして、編集を開始します。

   オブジェクトの機能と設定オプションは、［Details］、［Fields］、［Relationships］、［Layouts］、［Actions］、［Views］、［Validations］、［State Manager］のタブにまとめられています。

   ![Object features and configuration options are organized into eight tabs.](./creating-objects/images/03.png)

1. カスタムフィールドを追加するには、 **フィールド** タブをクリックします。 各フィールドは、特定のタイプの値を格納するためのデータベースカラムを表します。 [オブジェクトへのフィールドの追加](./fields/adding-fields-to-objects.md) を参照してください。

   デフォルトでは、すべてのオブジェクトに次のシステムフィールド、［Author］、［Create Date］、［External Reference Code］、［ID］、［Modified Date］および［Status］が含まれます。

   ![Add fields to the object from the Fields tab.](./creating-objects/images/04.png)

1. (オプション)**関係** タブをクリックして関係を追加します。 リレーションシップは、オブジェクト定義間の接続で、そのエントリーをリンクさせるために使用できます。 [オブジェクトリレーションの定義](./relationships/defining-object-relationships.md) を参照してください。

   ![Add relationships to the object from the Relationships tab.](./creating-objects/images/05.png)

1. (オプション)**Layouts** タブをクリックしてレイアウトを追加します。 オブジェクトレイアウトは、オブジェクトエントリーを作成したり表示したりする際に、フィールドや関連をどのように表示するかを決定します。 [オブジェクトレイアウトの設計](./layouts/designing-object-layouts.md) を参照してください。

   ```{note}
   カスタムレイアウトを追加せず、デフォルトとして設定した場合、オブジェクトはそのエントリーに自動生成されたレイアウトを使用します。 このレイアウトには、すべてのオブジェクトフィールドをアルファベット順に表示し、リレーションシップを表示しない単一のタブがあります。 リレーションシップを表示するには、専用のリレーションシップタブを使用してカスタムレイアウトを作成する必要があります。
   ```

   ![Add custom layouts to the object from the Layouts tab.](./creating-objects/images/06.png)

1. (オプション)［Actions］タブをクリックして、カスタムアクションを追加します。 各アクションは、設定されたトリガーに従って自動的に実行される操作を定義します。 [オブジェクトアクションの定義](./actions/defining-object-actions.md) を参照してください。

   ![Add custom actions to the object from the Actions tab.](./creating-objects/images/07.png)

1. (オプション)［Views］タブをクリックし、カスタムビューを追加します。 オブジェクトビューは、オブジェクトのアプリケーションページでエントリーをどのように表示するかを決定します。 [オブジェクトビューの設計](./views/designing-object-views.md) を参照してください。

   ![Add custom views to the object from the Views tab.](./creating-objects/images/08.png)

1.(オプション) バリデーション・タブをクリックして、バリデーションを追加する。各バリデーションは、有効なフィールド項目を決定するためのルールを設定します。[フィールド検証の追加](./validations/adding-field-validations.md)を参照してください。

   ![Add custom validations to the object from the Validations tab.](./creating-objects/images/09.png)

1. (オプション) ステータスフィールドをドラフトに追加した場合、そのフローを定義するには［State Manager］タブをクリックします。 [カスタムステートの追加と管理](./fields/adding-and-managing-custom-states.md) を参照してください。

   ![Define flows for state fields in the State Manager tab.](./creating-objects/images/10.png)

1. ［Details］タブで、オブジェクトドラフトを設定します。

1. (オプション) オブジェクトの名前、ラベル、または複数形のラベルを変更します。

    ![Change the name, label and plural label for the object.](./creating-objects/images/11.png)

1. エントリーのタイトルを選択します。 これは、UIでオブジェクトのエントリーを識別するために使用されるフィールドを決定します（例：関連フィールドなど）。 デフォルトでは、オブジェクトはIDフィールドを使用します。

    ![Once a field is added to an object, you can select it as the Entry Title.](./creating-objects/images/12.png)

1. オブジェクト **スコープ** を選択します。 これにより、オブジェクトのデータの保存方法が決まります。

    **Company**（デフォルト）：Companyでスコープされた場合、オブジェクトのデータはLiferayインスタンスごとに保存されます。

    **サイト** ：Siteによってスコープされた場合、オブジェクトのデータはSiteごとに保存されます。

1. パネルリンクを選択し、Liferayのどこに定義が表示されるかを決定します。

    カンパニースコープオブジェクトについては、グローバルメニュー(![グローバルメニュー](../../../images/icon-applications-menu.png))でタブとカテゴリを選択します。

    サイト・スコープ・オブジェクトの場合は、サイト・メニュー(![サイト・メニュー](../../../images/icon-menu.png))でセクションを選択します。

    UIメニューにアプリケーションを表示したくない場合は、この値を空白にすることができます。

    ![Select a scope and panel link for the object.](./creating-objects/images/13.png)

1. アカウント制限を設定し、アカウントによってオブジェクトエントリーへのアクセスを制限します。 この設定は、公開前にしか設定できません。

    このオプションは、オブジェクトがアカウントシステムオブジェクトとの1対多のリレーションの子側にある場合にのみ表示されます。 [アカウントによるオブジェクトデータへのアクセス制限](./using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md) を参照してください。

    ![Determine whether to limit restrict access to object entries by account.](./creating-objects/images/14.png)

1. オブジェクトのページウィジェットを表示または非表示にします。

    有効になっている間は、オブジェクトのウィジェットをサイトページに追加することができます。 [オブジェクトウィジェットのサイトへのデプロイ](../deploying-object-widgets-to-sites.md) を参照してください。

1. オブジェクトエントリのカテゴリ化を有効または無効にする。

    有効にすると、カスタムレイアウトのフィールドタブにカテゴリー設定ブロックを追加できます。 [フィールドタブへのカテゴリー設定の追加](./layouts/adding-categorization-to-fields-tabs.md) を参照してください。 さらに、フォームコンテナにタグとカテゴリのフラグメントを追加することで、オブジェクトエントリにメタデータを添付することができます。

1. オブジェクト表示ページのコメントを有効または無効にします。

    有効にすると、エントリー表示ページでページコメントウィジェットを使用することができます。 [オブジェクトの表示ページテンプレートの作成](../displaying-object-entries.md#creating-display-page-templates-for-objects) を参照してください。

1. オブジェクトエントリーの履歴を有効または無効にします。

   有効になっている間、Liferayはエントリーイベントの履歴を保持し、AuditアプリケーションまたはREST APIコールで見ることができます。[オブジェクト定義イベントの監査](./auditing-object-events.md) を参照してください。

1. {bdg-link-primary}`[Beta Feature](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)` オブジェクトエントリーのドラフトモードを有効または無効にする。

   有効にすると、ユーザはエントリを下書きとして保存し、後で確定することができます。下書きを保存しても、カスタムバリデーション、ワークフロープロセス、エントリー作成時にトリガーされるアクションはトリガーされません。

   ```{note}
   この設定はいつでも行うことができます。ドラフトモードを無効にしても既存のエントリーの状態は変わりません。
   ```

1. [カスタムテキスト[フィールド](./fields.md)の翻訳サポートを有効または無効にします。

    有効にすると、カスタムテキストフィールドの翻訳を有効にすることができます。 詳しくは [Object Definitions and Entriesのローカライズ](./localizing-object-definitions-and-entries.md) を参照してください。

1. ［**保存**］をクリックします。

ドラフトの設定と編集が終わったら、 [公開](#publishing-object-drafts) できます。

## オブジェクトドラフトの公開

オブジェクトを公開すると、新しいアプリケーションが作成されてアクティブ化されます。 アクティベートされると、ユーザーはそのスコープとパネルリンクに従ってLiferay UIでアクセスできます。 オブジェクトを公開する前に、以下の情報を確認して、ドラフトを公開した場合の結果を理解してください。

### 公開設定時の処理

公開プロセスには、次の操作が含まれます。

* ドラフトのデータ定義を使用して、オブジェクトのデータベーステーブルが作成されます。

* CRUD操作用に新しいヘッドレスAPIが自動的に作成されます。

* オブジェクトのエントリーを表示するためのコレクションプロバイダーが作成されます。

* オブジェクトに対してページウィジェットが作成されます。

* オブジェクトは情報フレームワークと統合されているため、 [表示ページテンプレート](../../../site-building/displaying-content/using-display-page-templates.md) のコンテンツの種類としてオブジェクトを選択できます。

* オブジェクトは [権限設定フレームワーク](../understanding-object-integrations/permissions-framework-integration.md) と統合されているため、新しいアプリケーションとそのリソースの権限を管理できます。

* オブジェクトはワークフローフレームワークと統合されているため、オブジェクトのカスタムワークフローを構成できます。

* オブジェクトはフォームと統合されているため、データストレージオプションとしてオブジェクトを選択できます。

### 公開されたオブジェクトの構成制限

{bdg-secondary}`liferay 7.4 U86+/GA86+`.

データの損失やシステムの競合を防ぐため、Liferayは公開後のオブジェクト定義に対してこれらの設定オプションを制限しています：

* 名前
* 範囲
* アカウント制限（有効な場合）
* エントリー翻訳

Liferayはまた、いくつかのカスタムフィールドオプションを制限しています（必須値、ユニーク値など）。

```{note}
Liferay 7.4 U85/GA85以前のバージョンでは、公開時にオブジェクト定義に含まれるフィールドを削除することはできません。
```

## 関連トピック

* [オブジェクトの概要](../../objects.md) 
* [オブジェクトへのフィールドの追加](./fields/adding-fields-to-objects.md) 
* [オブジェクトの関係の定義](./relationships/defining-object-relationships.md) 
* [オブジェクトのレイアウトをデザインする](./layouts/designing-object-layouts.md) 
