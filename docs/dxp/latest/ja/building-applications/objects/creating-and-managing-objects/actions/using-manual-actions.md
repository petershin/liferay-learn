# 手動アクションの使用

{bdg-secondary}`liferay 7.4 U60+/GA60+`.

オブジェクトアクションにスタンドアローントリガーを使用すると、アクションは自動ではなく手動になります。 これらのメソッドを使用して、これらのアクションをトリガーする：

* [オブジェクトのUI](#trigger-actions-via-the-object-entry-ui) 
* [専用アクションAPI](#trigger-actions-via-apis) 
* [ページ内のボタン](#trigger-actions-via-pages) 

この例では、通知を送信するためのスタンドアロンアクションを作成します。

![You can use the standalone trigger to run any type of object action manually.](./using-manual-actions/images/01.png)

詳しくは、 [オブジェクトアクションの定義](./defining-object-actions.md) をご覧ください。

## オブジェクト入力UIによるトリガーアクション

有効なスタンドアロンアクションは、オブジェクトエントリーのアクションメニューに表示されます。 UIでこれらのアクションをトリガーするには、

1. オブジェクト定義のアプリケーションページに移動します。

1. 目的のエントリーの **Actions** ボタン(![Action Button](../../../../images/icon-actions.png)) をクリックし、スタンドアロンアクションを選択します。

   この例では、アクションは［Send Reminder］です。

   ![Click the Actions button for the desired entry and select the standalone action.](./using-manual-actions/images/02.png)

## APIによるアクションのトリガー

Liferayは公開されたオブジェクト定義に対してREST APIを自動生成します。 これらには、有効なスタンドアロンアクションのAPIが含まれています。

これらのAPIを表示するには、

1. Liferay の API Explorer を `[server]:[port]/o/api` で開きます（例：`localhost:8080/o/api`）。

1. **REST Applications** をクリックし、目的のオブジェクト定義を選択します。 カスタムオブジェクトは `c/[pluralobjectlabel]` という命名パターンを使用します（例：`c/tickets`）。

各スタンドアロンアクションに対して、Liferayは2つのPUT APIを生成します。1つはエントリーのIDを使用し、もう1つはエントリーの外部参照コード（ERC）を使用します。

![Liferay generates two PUT APIs: one that uses the entry's ID and another that uses the entry's ERC.](./using-manual-actions/images/03.png)

いずれかのAPIを呼び出すと、指定されたエントリーのアクションがトリガーされます。

![Calling the API triggers the action for the specified entry.](./using-manual-actions/images/04.png)

## ページ経由でアクションをトリガーする

スタンドアロンアクションをページ上のボタンにマップすることができます ( [コンテンツページ](#mapping-buttons-to-object-actions-in-content-pages) または [表示ページテンプレート](#mapping-buttons-to-object-actions-in-display-page-templates) )。

Liferayのすぐに使えるボタンフラグメントがあなたのユースケースを満たさない場合、HTMLタグに`data-lfr-editable-id="action"`と`data-lfr-editable-type="action"`の属性を追加することで、カスタムボタンにアクションをマッピングすることができます。 フラグメントへの属性の追加について詳しくは、 [フラグメント固有のタグと属性のリファレンス](../../../../site-building/developer-guide/reference/fragments/fragment-specific-tags-reference.md) を参照してください。

アクションレディのカスタムボタンの例です：

```html
<button class="btn btn-${configuration.buttonSize} btn-${configuration.buttonType}" 
        data-lfr-editable-id="action" data-lfr-editable-type="action">
    Go Somewhere
</button>
```

### コンテンツ・ページでボタンをオブジェクト・アクションにマッピングする

1. [ページの作成](../../../../site-building/creating-pages.md) .

1. **ボタン** フラグメントをレイアウトに追加します。 コンテンツページの編集方法については、 [コンテンツページに要素を追加する](../../../../site-building/creating-pages/using-content-pages/adding-elements-to-content-pages.md) を参照してください。

1. ボタンを一度クリックする。 Button Optionsで、タイプとして **Action** を選択します。 これでボタンにアクションをマッピングできる。

1. もう一度ボタンをクリックする。 右側にアクションメニューが開く。

1. [Mapping]タブで、 **Item** フィールドをクリックするか、フィールドの横にある **Select Item** アイコン(![Select Item](../../../../images/icon-add-app.png))をクリックする。

1. 上部のリストからオブジェクトを選択します。

   利用可能なオブジェクトエントリが下部に表示されます。

1. 特定のオブジェクトエントリを選択します。

   ![Select a specific object entry](./using-manual-actions/images/05.png)

1. ボタンラベルにマッピングする **フィールド** を選択します。

1. アクションタブで、特定のオブジェクトエントリーを選択する。

1. アクションを選択する。

1. オプションで、SuccessとErrorのインタラクションを設定します。 詳細は [成功とエラーの相互作用の管理](#managing-success-and-error-interactions) を参照のこと。

```{tip}
アクションにマッピングされたコンポーネントを持つコレクション表示フラグメントまたはフォームフラグメントを使用できます。 詳しくは [コレクションの表示](../../../../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md) と [フォームを構築するためのフラグメントの使用](../../using-fragments-to-build-forms.md) を参照してください。
```

ボタンがクリックされると、選択されたアクションが実行されるようになりました。

### 表示ページテンプレートでボタンをオブジェクトアクションにマッピングする

1. [表示ページテンプレート](../../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md) を作成し、コンテンツタイプとしてオブジェクトを選択します。

   これにより、ボタンやアクションをマッピングする際に、あなたのオブジェクトがデフォルトのソースとなります。

   ![Chose your object as the content type when creating a display page template.](./using-manual-actions/images/06.png)

1. **ボタン** フラグメントをレイアウトに追加します。

1. ボタンを一度クリックする。 Button Optionsで、タイプとして **Action** を選択します。

   この設定により、ボタンにアクションをマッピングすることができます。

1. もう一度ボタンをクリックする。

   右側にアクションメニューが開きます。 マッピングとアクション・タブでは、オブジェクトはすでにデフォルト・ソースとして設定されています。

   ```{note}
   特定のコンテンツを選択する必要がある場合は、*ソース*フィールドをクリックし、*特定のコンテンツ*を選択し、特定の*アイテム*を選択します。
   ```

1. ボタンラベルにマッピングする **フィールド** を選択します。

1. Actionタブで、ユーザーがボタンをクリックしたときにトリガーするアクションを選択します。

1. オプションで、SuccessとErrorのインタラクションを設定します。 詳細は [成功とエラーの相互作用の管理](#managing-success-and-error-interactions) を参照のこと。

ボタンがクリックされると、選択されたアクションが実行されるようになりました。

### 成功とエラーの相互作用を管理する

ユーザーがアクションにマッピングされたコンポーネントをクリックすると、そのアクションが成功または失敗したときに何が起こるかを選択できます。

どちらの結果にも4つのオプションが用意されている：

1. **None** ：アクション実行後は何も起こらない。

1. **通知を表示** ：ユーザーに通知します。 カスタム成功/エラーメッセージを書き、通知をプレビューし、アクションがトリガーされた後にページをリロードするように設定することができます。

1. **ページに移動します**：サイト内の成功/エラーページに移動します。

1. **外部URLに移動します**：外部URLに移動します。

![You can choose what happens after an action is performed when the user clicks on a button or fragment mapped to an action: nothing, the user receives a notification, the user is redirected to a page, or the user is redirected to an external URL.](./using-manual-actions/images/07.png)

選択されたオプションは、ユーザーがアクションをトリガーした後に実行される。

## アクションの権限

Liferayは、どのロールがスタンドアロンアクションをトリガーできるかを管理するための権限を自動的に生成します。 各パーミッションは`action.[actionName]`の命名パターンに従います(例: `action.sendReminder`)。 オブジェクトのパーミッションの詳細については、 [権限設定フレームワークの統合](../../understanding-object-integrations/permissions-framework-integration.md) ]を参照してください。

![Standalone permissions use the action.[actionName] naming pattern.](./using-manual-actions/images/08.png)

## 関連トピック

* [オブジェクト・アクションの定義](./defining-object-actions.md) 
* [アクションタイプを理解する](./understanding-action-types.md) 
* [ヘッドレス・フレームワークの統合](../../understanding-object-integrations/using-custom-object-apis.md) 
