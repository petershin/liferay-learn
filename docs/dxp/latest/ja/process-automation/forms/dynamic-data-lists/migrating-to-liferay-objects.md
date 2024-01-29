# Liferayオブジェクトへの移行

ダイナミック・データ・リストは非推奨であり、2024年末までに削除される予定である。 データの損失を防ぎ、同じ機能を実現するために、構造やデータをLiferay Objectsに移行してください。 [オブジェクト](../../../building-applications/objects.md) は、コードを書いたりモジュールをデプロイすることなく、Liferay UIでアプリケーションを構築するためのローコード機能を提供します。 各アプリケーションはLiferayのコアフレームワーク（ヘッドレス、パーミッション、ワークフローなど）と完全に統合されており、UIまたは専用のREST APIからアクセスしてデータエントリーを作成・管理することができます。

ダイナミック・データ・リストを扱うには、データ定義を作成し、それを使ってデータ項目(`DDLRecords`)のリストを格納するフォーム(`DDLRecordSet`)を作成する。 オブジェクトの使用には、オブジェクト定義の作成、関連付け、公開が含まれます。 パブリッシュされると、アプリケーションにアクセスしてオブジェクト・エントリーを作成することができる。 DDLと比較して、Objectsはデータ構造をモデリングするためのはるかに堅牢で統合されたエクスペリエンスを提供し、カスタムビジネスロジックの実装やユーザーインターフェイスの設計のための追加ツールも含まれています。

データを移行するには

1. ダイナミック・データ・リストのオブジェクト定義を作成します。 リストに選択フィールドやラジオフィールドが含まれている場合は、これらのオプションを定義するためのピックリストも作成する必要があります。

1. データリストのレコードをXMLまたはCSVファイルとしてエクスポートし、JSONファイルに変換します。

1. [バッチテンプレートデザイナー](../../../headless-delivery/consuming-apis/data-migration-center.md) を使用して、JSON ファイルをオブジェクト定義にインポートします。

!!! note
    Data Migration Center を使用するには、COMMERCE-8087 [beta feature flag](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) を有効にする必要があります。

## ダイナミック・データ・リストのオブジェクト定義の作成

1. **グローバルメニュー**(![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］ タブで ［**オブジェクト**］ をクリックします。

1. 目的のオブジェクトフォルダに移動し、 **追加** ボタン(![追加ボタン](../../../images/icon-add.png))をクリックします。

1. ドラフトにこれらの詳細を提供する。

   **ラベル**: Objects admin およびサポートされているアプリケーションコンテキスト（ワークフロー、表示ページテンプレート、フォームなど）でオブジェクトを識別します。

   **Plural Label** ：UIにおけるオブジェクト・アプリケーションの表示名を決定します。

   **オブジェクト名** ：オブジェクトの `definition.name` を決定し、公開後に変更することはできません。

   ![Enter a Label, Plural Label, and Name for the object draft.](./migrating-to-liferay-objects/images/01.png)

1. ［**保存**］をクリックします。

一度作成すると、オブジェクトを編集して、そのスコープやプラットフォーム統合などを設定することができます。 詳しくは [Editing Object Drafts](../../../building-applications/objects/creating-and-managing-objects/creating-objects.md#editing-object-drafts) を参照してください。

ダイナミック・データ・リストにSelectフィールドとRadioフィールドが含まれている場合、これらのフィールド・オプションを保存するために [、picklists](#adding-picklists) を追加する必要があります。 そうでなければ、 [オブジェクト定義にデータフィールド](#adding-data-fields) を追加し続けることができる。

### ピックリストの追加

1. **グローバルメニュー**(![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］タブで［**選択リスト**］ をクリックします。

1. 追加* (![追加ボタン](../../../images/icon-add.png))をクリックします。

1. リストの名前を入力します。

   ![Enter a name for the picklist.](./migrating-to-liferay-objects/images/02.png)

1. ピックリストを編集する。

1. [Items]で、 **Add**(![Add Button](../../../images/icon-add.png)) をクリックします。

1. アイテムの名前とキーを入力します。

   **名前** ：アイテムの表示名を決定し、作成後にローカライズすることができます。

   **キー** : オブジェクトフィールドに格納されている項目の値を決定し、キャメルケースを使用する。

   !!! important
   項目のキー値は、データ・リストの Select または Radio フィールドに設定されたオプション名と一致しなければならない。 SelectフィールドとRadioフィールドがキャメルケースを使用していない場合、オプション名をピックリストのアイテムキーと一致するように更新します。

   ![Enter a name and key for the item.](./migrating-to-liferay-objects/images/03.png)

1. ［Save］をクリックします。

1. 他の項目を追加するには、上記の手順を繰り返します。

   ![Repeat the process to add multiple items to the list.](./migrating-to-liferay-objects/images/04.png)

ピックリストを作成したら、オブジェクト定義のデータフィールドに使用することができます。

### データフィールドの追加

1. オブジェクト定義の編集を始める。

1. **Fields** タブに移動し、 **Add**(![Add Button](../../../images/icon-add.png)) をクリックします。

1. ラベル **とフィールド名** を入力します。

   **ラベル** ：この値はObjects UIでフィールドを識別し、フィールド作成後にローカライズすることができます。

   **フィールド名** ：この値はバックエンドでのフィールド名を決定し、キャメルケースを使用します。 フィールドが公開されると、この値は変更できません。

1. フィールド **タイプ** を選択します。 どのフィールド・タイプが DDL フィールドと互換性があるかについては、 [Field Compatibility Reference](#field-compatibility-reference) を参照してください。

1. フィールドが必須かどうかを判断する。

   ![Enter a label and field name, select a field type, and determine whether the field is mandatory.](./migrating-to-liferay-objects/images/05.png)

1. ［Save］をクリックします。

1. 他のフィールドを追加するには、上記の手順を繰り返します。

   ![Repeat the above steps to add other fields.](./migrating-to-liferay-objects/images/06.png)

データ・フィールドを追加したら、それらを編集して、検索可能性、デフォルト値、ローカライズ可能性などの追加設定を行います。 詳しくは [フィールド](../../../building-applications/objects/creating-and-managing-objects/fields.md) を参照のこと。

### オブジェクト定義の公開

オブジェクト定義を構成し、データ・フィールドを追加したら、オブジェクトをパブリッシュして使用できるようにします。 これを行うには、オブジェクトの **Details** タブに行き、 **Publish** をクリックします。 パブリッシュされると、オブジェクトのフォームやディスプレイをデザインできます。 管理インターフェイスを設計するには、 [レイアウト](../../../building-applications/objects/creating-and-managing-objects/layouts.md) および [ビュー](../../../building-applications/objects/creating-and-managing-objects/views.md) を参照。 オブジェクトとinfoフレームワークやページビルダーの機能の統合については、 [オブジェクトエントリーの表示](../../../building-applications/objects/displaying-object-entries.md) および [フォームを構築するためのフラグメントの使用](../../../building-applications/objects/using-fragments-to-build-forms.md) を参照してください。

次に、データ・リストのレコードをエクスポートし、カスタム・オブジェクト定義にインポートします。

## データエントリーのエクスポートと変換

1. ![サイトメニュー](../../../images/icon-product-menu.png))を開き、[コンテンツとデータ]を展開し、[ダイナミック・データ・リスト]をクリックします。

1. 必要なデータリストの **Actions** ボタン(![Actions Button](../../../images/icon-actions.png)) をクリックし、 **Export** を選択します。

   !!! important
   入れ子のフィールド値はエクスポートされません。

1. **CSV**または **XML**を選択し、**OK** をクリックします。

   ![Select a file extension type and click OK.](./migrating-to-liferay-objects/images/07.png)

1. サードパーティのサービスを使ってファイルをJSONに変換する。

JSONファイルの準備ができたら、カスタム・オブジェクト定義にインポートすることができます。

## DDLエントリーのインポート

1. グローバルメニュー(![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、 **アプリケーション** タブに移動し、 **データ移行センター** をクリックします。

1. **Add** (![Add Button](../../../images/icon-add.png)) をクリックし、**Import File** を選択します。

1. インポートの **名前** を入力します。

1. Entity Type（エンティティ・タイプ）では、 **カスタム・オブジェクト** を選択します。

   ![Enter a name and select an Entity Type.](./migrating-to-liferay-objects/images/08.png)

1. データリストのレコードを含む **JSONファイル** を選択します。

   ![Select the JSON file with your data list records.](./migrating-to-liferay-objects/images/09.png)

1. **ソース・ファイル・フィールド** をオブジェクト定義フィールドにマッピングする。

   ![Map the source file fields to object definition fields.](./migrating-to-liferay-objects/images/10.png)

1. ［**Next**］をクリックします。

1. レコードのフィールドマッピングを確認し、 **Start Import** をクリックします。

   ![Review the mapping and click Start Import.](./migrating-to-liferay-objects/images/11.png)

1. インポートが成功したことを確認する。

   ![Confirm the import is successful.](./migrating-to-liferay-objects/images/12.png)

1. カスタムオブジェクトにエントリが表示されることを確認する。

    ![Verify the entries appear in the custom object.](./migrating-to-liferay-objects/images/13.png)

## フィールド互換性リファレンス

| DDLフィールド・タイプ | オブジェクト・フィールド・タイプ |
| :----------- | :--------------- |
| ブール値         | ブール値             |
| 色            | テキストボックス         |
| 日付           | 日付               |
| 小数           | 小数               |
| ドキュメントとメディア  | 添付ファイル           |
| ジオロケーション     | テキストボックス         |
| HTML         | リッチテキスト          |
| 整数           | 整数               |
| ページへのリンク     | リッチテキスト          |
| 数字           | 小数               |
| ラジオ          | 候補リスト            |
| 選択           | 候補リスト            |
| テキストボックス     | テキストボックス         |
| テキストエリア      | 長いテキスト           |
| Webコンテンツ     | リッチテキスト          |

## 関連トピック

* [オブジェクト](../../../building-applications/objects.md)
* [オブジェクトの作成](../../../building-applications/objects/creating-and-managing-objects/creating-objects.md)
* [オブジェクトへのフィールドの追加](../../../building-applications/objects/creating-and-managing-objects/fields/adding-fields-to-objects.md)
* [ピックリストの作成](../../../building-applications/objects/picklists/creating-picklists.md)
