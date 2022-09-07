# 検索バーのサジェスチョンを設定する

{bdg-secondary}`7.4 U36+とGA36+`

Search Bar Suggestions は、Liferay の Search Bar ウィジェットに _search as you type_ functionality を追加します。

![ドロップダウン・リストから結果を選択するか、通常通り検索を実行します。](./configuring-search-bar-suggestions/images/01.gif)

ユーザーは通常通り、検索バーに検索キーワードを入力する。 キーワードはLiferayに取り込まれ、検索エンジンに送られ、結果はドロップダウン・リストで返されます。 続けて入力すると、さらにクエリーが送信されます。 リストから結果をクリックするか、通常通り虫眼鏡アイコンまたはEnterキーをクリックして検索を実行し、検索結果ウィジェットに結果を表示することができます。

## 設定オプション

[Instance Settings](#search-bar-suggestions-configuration-scope)で Search Bar Suggestions が有効になっている場合、Search Suggestions をウィジェット [scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)で設定することができます。

検索バーのサジェスチョンを設定する主な方法は、検索バーウィジェットの設定です。

![Search Barウィジェットの設定画面のSuggestions Configurationを使用します。](./configuring-search-bar-suggestions/images/02.png)

**サジェスチョンを有効にする。** サジェスチョンがデフォルトで有効になっています。 チェックを外すと、サジェスト機能がオフになります。

**サジェスチョンを表示するための文字数のしきい値。** 設定された文字数が検索バーに入力されるたびに、クエリが再処理され、それに応じて結果が更新されます。 この設定は、多くの検索要求の送信（つまり、閾値を低く設定しすぎると多くの検索要求を引き起こす）とユーザビリティ（つまり、閾値を高く設定しすぎると、最初の提案クエリを引き起こすためにユーザーが多くの文字を入力しなければならない）のバランスをとるために調整します。

**サジェスチョンコントリビューターの設定。** 検索エンジンに送信されるクエリを制御するコントリビューターを設定します。 この設定は、3つの値で構成されています。

1. **Suggestions Contributor**: デフォルトの投稿者、そしてLiferay CEですぐに利用できる唯一の投稿者は、 `Basic`. Liferay DXP では、代わりに1つまたは複数のブループリントのコントリビュータを使用することを選択することができます。 詳しくは、 [Search Bar Suggestions Blueprint](./search-bar-suggestions-blueprints.md) をご覧ください。

1. **表示グループ名**: デフォルトは `提案`. この値は、英語のUIにおける見出しとしてSuggestionsに解決される言語キーである。 言語キーを変更したり、独自の言語を追加することができます。 例えば、 `is-this-what-you're-looking-for`とした後、 [translation](../../../system-administration/configuring-liferay/changing-language-translations.md#adding-a-language-key-and-translation)を追加します。 複数のBlueprintコントリビューターを使用している場合、それぞれのDisplay Group Nameの値が一意であることを確認してください。

1. **Size**: Search Barのドロップダウンリストに表示する結果の最大件数を設定します。 デフォルトは `5`です。 表示スペースが限られているため、サイズを大きく設定するメリットはない。

```{tip}
検索ブループリント ユーザーは、検索バーのサジェストクエリを制御するためにブループリントを使用することを選択できます。 コントリビューターとして_Blueprint_を選択した場合、検索バーウィジェットの設定に追加の設定オプションが表示されます。 詳しくは、[検索バー提案のブループリント](./search-bar-suggestions-blueprints.md)をご覧ください。
```

## コントロールパネルで検索バーのサジェスチョンを設定する

検索バーのサジェスチョンに影響を与えるコントロールパネルの設定項目は、以下の3つです。

1. サービス・アクセス・ポリシー
1. システム設定での検索サジェスチョン
1. システム設定とインスタンス設定の検索バー

### サジェスチョンサービスのアクセスポリシーを設定する

[Service Access Policies](../../../installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies.md#understanding-service-access-policies) Liferayのサービスへのアクセスを制御します。 検索バーのサジェストに対するポリシーはデフォルトで有効になっており、認証されていないユーザーがサジェストを返すRESTサービスのエンドポイントにアクセスすることを許可しています。 つまり、ゲストユーザーが検索バーに入力する際に、検索バーの候補を表示させることができるようになるのです。

サービスアクセスポリシーを設定する。

1. グローバルメニュー &rarr; コントロールパネル &rarr; サービスアクセスポリシー（セキュリティセクション内）を開いてください。

1. _SEARCH_SUGGESTIONS_ のエントリーをクリックします。

ポリシーを無効にすると、ウィジェット構成でサジェストが有効になっていても、ゲストにはサジェストが表示されません。

### Suggestions RESTエンドポイントを設定する

検索バーのサジェスチョン機能を提供するRESTエンドポイントは、必要に応じて、システム設定またはインスタンス設定を使用して無効にすることができます。

Search Suggestionsエンドポイントを設定する。

1. Global Menu &rarr; Control Panel &rarr; Configuration セクションの System または Instance Settings に移動します。

1. Platform &rarr; Searchカテゴリで、Search Suggestionsエントリを開きます。

1. 設定は1つだけです。Enabled（有効）です。

無効の場合、必要なエンドポイントへの呼び出しは無視されるため、検索バーのサジェスチョンに関する他の設定は一切考慮されません。 実は、Search Barウィジェットの設定には、Search Bar Suggestionsの設定は表示されないのです。 この機能は、システムまたはインスタンス全体で完全に無効化されます。

### 検索バーでサジェスチョンを設定する

検索バーのサジェスチョンに関するほとんどの設定は、ウィジェットスコープで行われます。 Search Bar ウィジェットの設定に加えて、Search Bar Suggestions のデフォルトをシステムおよびインスタンス [のスコープ](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)で設定することができます。

![インスタンスまたはシステムスコープで検索バーのサジェスチョンを設定する。](./configuring-search-bar-suggestions/images/03.png)

以下は、システム、インスタンス、またはウィジェットで検索バーのサジェスチョンを有効または無効にした場合の動作です。 [スコープ](../../../system-administration/configuring-liferay/understanding-configuration-scope.md):

| コンフィギュレーションスコープ | 有効?      | サーチバーウィジェット結果                                                    |
|:--------------- |:-------- |:---------------------------------------------------------------- |
| システム設定          | &#10008; | すべてのインスタンスのデフォルトをdisabledに設定します。 サジェスチョン設定はウィジェット設定に表示されません。     |
| インスタンス設定        | &#10008; | ウィジェットの設定にサジェスチョン設定が表示されない。                                      |
| インスタンス設定        | &#10004; | サジェスチョンが有効になり、ウィジェット設定に設定が表示されます。 サジェストは、ウィジェットの設定で無効にすることができます。 |

他の設定は Liferay の [コンフィギュレーションスコープパラダイム](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)に従って動作します。system や instance などの高いスコープの設定はデフォルトを設定し、より細かいウィジェットスコープではこれらのデフォルトをオーバーライドすることができます。
