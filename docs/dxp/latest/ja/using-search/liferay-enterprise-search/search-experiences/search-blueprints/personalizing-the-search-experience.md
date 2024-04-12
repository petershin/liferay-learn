# Search Experiencesのパーソナライズ

Search ExperiencesとSearch Blueprintsの主な使用例の1つは、Liferayの検索結果 [](../../../search-pages-and-widgets/search-results.md)をパーソナライズすることです。 パーソナライズされた検索エクスペリエンスでは、各ユーザーは自分のコンテキストの特定の詳細に応じて結果を見る。 現在、次のようなコンテキストの質問の答えにブループリントを反応させるための要素があります。

* ユーザーはどこにいるのか？
* ユーザーにはどのような役割がありますか？
* そのユーザーが所属しているサイトは？
* ユーザーはどのようなコンテンツを所有しているのか？
* ユーザーはゲストですか？
* そのユーザーは新規ユーザーですか？
* どの [ユーザーセグメント](../../../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)に属しているか？

各ユーザーのコンテキストに合わせたブループリントがなければ、デフォルトの結果は、検索されたキーワードのテキストが、インデックス化されたドキュメントの [トークン化された](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/analysis-tokenizers.html) 値とどれだけ一致するかによって関連性を計算するクエリに基づいてスコア付けされる。

検索結果をパーソナライズすることで、ユーザーが成功に必要なものを見つけられる可能性が高まる。 これにより、ユーザーをコンテンツに引き付け続けることができ、サイトが成功する可能性が高まります。 いくつかの例を挙げます。

* ユーザーのIPアドレスに近い場合、特定の結果を優先する。
* ユーザーが初めての場合、特定のコンテンツを優先する
* ユーザーが認証されていない場合、特定のコンテンツを非表示にする

## パーソナライズ要素

パーソナライゼーションの取り組みに特に有効な要素がいくつかあります。

**Boost Proximity:** は、 [ipstack](https://ipstack.com) サービスを使って、ドキュメント内の [geopoint](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/geo-point.html) フィールドによってマークされたユーザーの位置により近い検索結果をブーストする。 [下記の例](#building-a-blueprint-to-personalize-search-results) では、サービスの設定方法とBoost Proximity要素の使用方法を紹介しています。

**現在の言語用にコンテンツをブーストする:** 現在のセッションの言語にマッチする `defaultLanguageId` フィールドを持つ検索結果をブーストする。

**Hide Contents in a Category for Guest Users:** 検索ユーザーが認証されていない場合、 [特定のカテゴリー](../../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) フィールドにマッチする検索結果を非表示にします。

**Limit Search to My Contents:** 文書の `userId` フィールドが検索ユーザーと一致する場合のみ、検索結果を返します。

**Limit Search to My Sites:**[ユーザーがメンバーであるサイト](../../../../site-building/sites/site-membership/adding-members-to-sites.md)にスコープされた検索結果のみを返します。

**Boost Contents on My Sites:** は、検索ユーザーがスコープされているサイトのメンバーである場合に、検索結果をブーストします。

**ブースト・コンテンツ・オン・マイ・サイト:** 検索ユーザーが、検索結果がスコープされているサイトのメンバーである場合、検索結果がブーストされます。

**新規ユーザーアカウントのカテゴリ内コンテンツをブースト：** 検索ユーザーのアカウントが特定の時間範囲に作成された場合、 [特定のカテゴリ](../../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) で検索結果をブーストします。

**Boost Contents in a Category for a User Segment:** ユーザーが特定の[ユーザーセグメント](../../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) に属している場合、[特定のカテゴリ](../../../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) で検索結果をブーストします。

<!-- TODO: Move these descriptions to the Elements Reference guide when written, and link to them. Since we don't currently have the Elements Reference guide written, we must describe them here. -->

## 検索結果をパーソナライズするためのブループリントの構築

ユーザーの位置情報に基づいて結果を表示したい場合があります。 そのためには

- [ユーザーのIPアドレスをジオロケーションするサービスを設定します。 <https://ipstack.com>.](#configure-the-ipstack-service)
- [Liferay アセットのジオロケーションします。](#configure-a-geolocated-asset)
- [位置情報サービスと通信する要素を含むブループリントを作成します。](#configure-a-geolocation-aware-blueprint)

### Ipstackサービスの設定

ブループリントを設定する前に、 [ipstack key](https://ipstack.com/) を取得し、Liferay で ipstack サービスを有効にする必要があります。

1. <https://ipstack.com> にアクセスし、APIキーを取得します。
1. Liferayの［システム設定］ &rarr; ［プラットフォーム］ &rarr; ［Search Experiences］ &rarr; ［Ipstack］に進みます。
1. ［**有効**］ をクリックします。
1. APIキーを入力します.
1. ［**保存**］ をクリックします。

![システム設定でipstackサービスを設定する。](./personalizing-the-search-experience/images/01.png)

### 位置情報アセットを設定する

ipstackサービスとBoost Proximity Elementで動作するためには、検索ドキュメントに [geopointフィールド](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/geo-point.html) 。 Liferayには互換性のある位置情報フィールドがあり、既存のアセットにカスタムフィールドとして追加することができます。

1. ［コントロールパネル］ &rarr; ［カスタムフィールド］ に移動します。
1. ブログのエントリに新規カスタムフィールドを追加します。 
      - タイプ：位置情報
   - フィールド名：場所
1. ［**保存**］ をクリックします。
1. 2つの新規ブログを追加します（サイトメニューを開き、［コンテンツ］ & ［データ］ &rarr; ［ブログ］に移動します）。 
      - 最初のブログのエントリ 
          - タイトル： **ブログタイトル**
     - コンテンツ： **ブログの内容**
     - カスタムフィールドで、現在地から約100km離れた場所に位置情報ピンをドラッグします。
     - ブログを公開します。
   - 2つ目のブログのエントリ 
          - タイトル： **2つ目のブログタイトル**
     - コンテンツ： **2つ目のブログの内容**
     - カスタムフィールドで、位置情報ピンを現在地にできるだけ近くなるようにドラッグします。
     - ブログを公開します。

```{tip}
ピンをより正確に配置するために、ジオロケーションマップをズームします。
```

検索ページで **blog** 。 タイトルとコンテンツ・フィールドが短いブログ・エントリー（最初のもの、タイトルは **ブログタイトル**）は、検索結果ウィジェットに最初に表示される。 

### 位置情報認識機能を持ったブループリントを設定する

これで ipstack サービスが設定され、ジオポイントデータを含む検索ドキュメントが作成されたので、検索ユーザーからの近さによって特定の結果を高めるブループリントを設定する準備ができました：

1. ［グローバルメニュー］ &rarr; ［アプリケーション］ (Search Experiences) から ［**ブループリント**］ をクリックして、ブループリントアプリケーションを開きます。

1. **Add**(![Add](../../../../images/icon-add.png)) をクリックしてブループリントを追加します。

   ![Add Blueprint ウィンドウからブループリントの作成を開始します。](./creating-and-managing-search-blueprints/images/02.png)

1. ［新規検索ブループリント］ウィンドウで、ブループリントに［name］ (必須) と［description］(オプション) を指定します。

1. [クエリビルダー](#using-the-query-builder) を使用して、Boost Proximity要素を追加してください。

   - フィールドを `expando__keyword__custom_fields__location_geolocation`として設定します。
   - 減衰を0.8に設定します。
   - スケールを10kmに設定します。
   - ブーストの値を100に設定します。
![Boost Proximity要素を設定します。](./personalizing-the-search-experience/images/02.png)

1. ブループリントを構築し、構成しながらテストします。 ［**プレビュー**］ をクリックします。

1. 現在地のユーザーの検索体験をモデル化するには、歯車のアイコン(![Cog](../../../../images/icon-cog3.png))をクリックして、あなたのパブリックIPV4アドレスを検索コンテキストに設定します。 

   - キー:  `search.experiences.ip.address`。
   - 値：`[自分のパブリックIPV4アドレス]`。

［**完了**］ をクリックします。

1. キーワード **ブログ** を入力し、現在地から近いブログのエントリーが、遠いブログのエントリーよりも先に返されることを確認する。

1. ブループリントの作成が完了したら、 ［**保存**］ をクリックします。

これで、 [ブループリントをLiferayの検索ページに適用することができます](./using-a-search-blueprint-on-a-search-page.md)。

送信IPアドレスに近いかどうかで文書をスコアリングするガウス関数を調整する必要があるかもしれない： 

**Decay** は、ユーザーとアセットの距離がスケールと等しい場合に、ブースト値を減少させる係数を定義します。

**スケール** は、ユーザーのIPアドレス位置からの距離で、これを超えると結果の関連性が低下し始める。

**ブースト** は、定義されたスケール内で結果をブーストするための数値である。

例えば、ユーザーから 10 km 以内に位置する検索結果に対して 100 のブーストを指定し、減衰係数を 0.5 と定義した場合、ユーザーからちょうど 10 km 離れた検索結果は最大ブースト値の半分、つまり 50 のブーストを受けます。 10km以上の距離では、ガウス関数が残りのスコアを決定することになります。

詳しくは [ElasticのFunction Score Query](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/query-dsl-function-score-query.html) ドキュメントをご覧ください。
