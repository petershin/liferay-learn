# 検索バーのサジェスチョンを設定する

{bdg-secondary}`7.4 U36+とGA36+`

Search Bar Suggestionsは、LiferayのSearch Barウィジェットに **search as you type** functionalityを追加します。

![ドロップダウン・リストから結果を選択するか、通常通り検索を実行します。](./configuring-search-bar-suggestions/images/01.gif)

ユーザーは通常通り、検索バーに検索キーワードを入力します。 キーワードはLiferayによって取り込まれ、検索エンジンに送られ、結果はドロップダウンリストで返されます。 続けて入力すると、さらにクエリーが送信されます。 検索結果のリストから1つをクリックするか、虫眼鏡アイコンまたはEnterキーをクリックして通常通り検索を実行し、検索結果ウィジェットに結果を表示することができます。

## 設定オプション

[インスタンス設定](#search-bar-suggestions-configuration-scope) で「検索バーのサジェスチョン」が有効になっている場合、ウィジェット [スコープ](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)で「検索サジェスチョン」を設定することができます。

検索バーのサジェスチョンを設定する主な方法は、検索バーウィジェットの設定です。

![検索バーウィジェットの設定画面の［サジェスチョン設定］を使用します。](./configuring-search-bar-suggestions/images/02.png)

**サジェスチョンを有効にする：** サジェスチョンがデフォルトで有効になっています。 チェックを外すと、サジェスト機能をオフにすることができます。

**サジェスチョンを表示するための文字数しきい値：** 検索バーに設定された文字数が入力されるたびに、クエリは再処理され、結果はそれに応じて更新されます。 この設定は、多くの検索要求を送信すること(つまり、閾値を低く設定すると多くの検索要求が発生する）とユーザビリティ(つまり、閾値を高く設定すると、最初の候補クエリを起動するためにユーザーが多くの文字を入力しなければならない）のバランスをとるために調整します。

**Suggestions Contributor Configuration(サジェスト・コントリビューター・コンフィギュレーション）：** 検索エンジンに送信されるクエリを制御するコントリビューターを設定します。 この設定は、3つの値で構成されています：

1. **Suggestions Contributor** : デフォルトのコントリビューターで、Liferay CEですぐに利用できるのは `Basic`です。 Liferay DXPでは、代わりに1つまたは複数のBlueprintコントリビューターを使用することを選択できます。 詳しくは、 [検索バーの提案 ブループリント](./search-bar-suggestions-blueprints.md) をご覧ください。

1. **表示グループ名** : デフォルトは `提案`. この値は、英語のUIにおける見出しとしてSuggestionsに解決する言語キーです。 言語キーを変更したり、独自に追加することも可能です。 例えば、 `is-this-what-you're-looking-for`とした後、 [translation](../../../system-administration/configuring-liferay/changing-translations-with-language-override.md#adding-a-language-key-and-translation) を追加します。 複数のBlueprintコントリビューターを使用している場合は、それぞれに固有のDisplay Group Nameの値があることを確認してください。

1. **Size** : Search Bar のドロップダウンリストに表示する結果の最大数を設定します。 デフォルトは `5`です。 表示スペースが限られているため、サイズを大きく設定するメリットはない。

```{tip}
Search Blueprints ユーザーは、Search Bar Suggestions のクエリを制御するために、Blueprint を使用することを選択することができます。 投稿者として_Blueprint_が選択されている場合、検索バーウィジェット構成に追加の構成オプションが表示されます。 詳しくは、[検索バーの提案のブループリント](./search-bar-suggestions-blueprints.md)をご参照ください。
```

## コントロールパネルで検索バーのサジェスチョンを設定する

検索バーのサジェスチョンに影響を与える可能性のあるコントロールパネルの設定項目は3つあります：

1. サービス・アクセス・ポリシー
1. システム設定での検索サジェスチョン
1. システム設定とインスタンス設定にある検索バー

### サジェスチョンサービスのアクセスポリシーを設定する

[Service Access Policies](../../../installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies.md#understanding-service-access-policies) Liferayのサービスへのアクセスを制御します。 検索バーのサジェストに関するポリシーは、デフォルトで有効になっており、認証されていないユーザーがサジェストを返すRESTサービスのエンドポイントにアクセスできるようになっています。 つまり、ゲストユーザーが検索バーに入力する際に、検索バーのサジェストを可能にするものです。

サービスアクセスポリシーを設定するには

1. グローバルメニュー &rarr; コントロールパネル &rarr; サービスアクセスポリシー(「セキュリティ」セクション内）を開いてください。

1. **SEARCH_SUGGESTIONS** のエントリーをクリックします。

ポリシーを無効にすると、ウィジェットの設定でサジェストが有効になっていても、ゲストにサジェストが表示されなくなります。

### サジェスチョンRESTエンドポイントを設定する

検索バーのサジェスト機能を提供するRESTエンドポイントは、必要に応じて、システムまたはインスタンス設定を使用して無効にすることができます。

検索サジェスチョンエンドポイントを設定するには、次のようにします、

1. Global Menu &rarr; Control Panel &rarr; ConfigurationセクションのSystemまたはInstance Settingsに移動します。

1. Platform &rarr; Searchカテゴリで、Search Suggestionsエントリーを開きます。

1. 設定は1つだけです：Enabled(有効）です。

無効の場合、必要なエンドポイントへの呼び出しは無視されるため、検索バーのサジェスチョンに関する他の設定は一切考慮されません。 実は、Search Barウィジェットの設定には、Search Bar Suggestionsの設定は表示されないのです。 この機能は、システムまたはインスタンス全体で完全に無効化されます。

### 検索バーを使ったサジェスチョンを設定する

検索バーのサジェスチョンに関するほとんどの設定は、ウィジェットのスコープで行われます。 サーチバーウィジェットの設定に加えて、システムおよびインスタンス [スコープ](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)でサーチバーサジェッションのデフォルトを設定することができます。

![インスタンスまたはシステムスコープでサーチバーサジェスチョンを設定する。](./configuring-search-bar-suggestions/images/03.png)

システム、インスタンス、ウィジェットで検索バーのサジェスチョンを有効または無効にすると、次のようになります。 [範囲](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)：

| コンフィギュレーションスコープ | 有効?      | 検索バーウィジェット結果                                                     |
|:--------------- |:-------- |:---------------------------------------------------------------- |
| システム設定          | &#10008; | すべてのインスタンスのデフォルトをdisabledに設定します。 サジェスチョン設定は、ウィジェットの設定に表示されません。   |
| インスタンス設定        | &#10008; | サジェスチョン設定は、ウィジェットの設定に表示されません。                                    |
| インスタンス設定        | &#10004; | サジェスチョンが有効になり、ウィジェット構成に設定が表示されます。 サジェストは、ウィジェットの設定で無効にすることができます。 |

その他の設定は Liferay の [設定スコープパラダイム](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)に従って動作します。system や instance などの上位スコープの設定はデフォルトを設定しますが、より細かい widget スコープはこれらのデフォルトをオーバーライドすることができます。
