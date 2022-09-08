# Search Experiencesのパーソナライズ

Search Experiencesと検索ブループリントの主な使用例としては、Liferayの [検索結果](../../search-pages-and-widgets/search-results.md)をパーソナライズすることが挙げられます。 パーソナライズされた検索体験では、各ユーザーは状況に応じた検索結果が表示されます。 現在、次のようなコンテキストの質問の答えにブループリントを反応させるための要素があります。

* ユーザーはどこにいますか？
* ユーザーのロールとは？
* ユーザーが所属しているサイトは？
* ユーザーが所有しているコンテンツは何ですか？
* ユーザーはゲストですか？
* ユーザーは新規ユーザーですか？
* どのような[ユーザーセグメント](../../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)のユーザーでしょうか？

各ユーザーのコンテキストに合わせたブループリントがない場合、デフォルトの結果は、検索されたキーワードのテキストが、インデックスされたドキュメントの [文字分割](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/analysis-tokenizers.html) 値とどれだけ一致するかによって関連性を計算するクエリに基づいてスコア化されます。

検索結果をパーソナライズすることで、ユーザーの目的に必要なものを見つけられる可能性が高まります。 これにより、ユーザーがコンテンツに関心を持ち続けることで、サイトが成功する可能性が高まります。 いくつかの例を挙げます。

* ユーザーのIPアドレスに近い場合、特定の結果を優先的に表示します。
* 新規ユーザーの場合、特定のコンテンツを優先的に表示します。
* ユーザーが認証されていない場合、特定のコンテンツを隠すことができます。

## パーソナライズ要素

パーソナライゼーションの取り組みに特に有効な要素がいくつかあります。

**Boost Proximity** は、 [ipstack](https://ipstack.com) サービスを利用して、ドキュメント内の [geopoint](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/geo-point.html) フィールドで示されるユーザーの位置により近い検索結果を後押しする Element である。 [下記の例](#building-a-blueprint-to-personalize-search-results) では、サービスの設定方法とBoost Proximity要素の使用方法を紹介しています。

**現在の言語のコンテンツのブースト** は、 `defaultLanguageId`フィールドが現在のセッションの言語に一致する検索結果をブーストする要素です。

**ゲストユーザーに対して、あるカテゴリの内容を隠す** は、検索ユーザーが未認証の場合に、[特定のカテゴリ](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md)フィールドとマッチした検索結果を隠す要素です。

**検索を自分のコンテンツに制限する** は、ドキュメントの`userId` フィールドが検索ユーザーに一致する場合のみ、検索結果を返す要素です。

**検索をマイサイトに制限する** は、[ユーザーが所属するサイト](../../../site-building/sites/site-membership/adding-members-to-sites.md)を対象とした検索結果のみを返す要素です。

**マイサイトのコンテンツをブースト** は、検索ユーザーが検索結果の対象となるサイトのメンバーである場合、検索結果をブーストする要素です。

**新規ユーザーアカウントのカテゴリのコンテンツをブースト** は、検索ユーザーのアカウントが特定の時間範囲で作成された場合、[特定のカテゴリ](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md)で検索結果をブーストする要素である。

**ユーザーセグメントのカテゴリでコンテンツをブースト** は、ユーザーが特定の[ユーザーセグメント](../../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)に属している場合に、[特定のカテゴリ](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md)で検索結果をブーストする要素である。

<!-- TODO: Move these descriptions to the Elements Reference guide when written, and link to them. Since we don't currently have the Elements Reference guide written, we must describe them here. -->

## 検索結果をパーソナライズするためのブループリントの構築

Search Experiencesのパーソナライズ機能の重要な使い方のひとつに、検索ユーザーの位置情報に基づいた検索結果の提示があります。

このユースケースを実証するためには、複数の構成エクササイズを行う必要があります。

- [ユーザーのIPアドレスをジオロケーションするサービスを設定します。 <https://ipstack.com>.](#configure-the-ipstack-service)
- [Liferay アセットのジオロケーションします。](#configure-a-geolocated-asset)
- [位置情報サービスと通信する要素を含むブループリントを作成します。](#configure-a-geolocation-aware-blueprint)

### Ipstackサービスの設定

ブループリントを設定する前に、 [ipstack key](https://ipstack.com/) を取得し、Liferay で ipstack service を有効にする必要があります。

1. <https://ipstack.com> にアクセスし、APIキーを取得します。
1. Liferayの［システム設定］ &rarr; ［プラットフォーム］ &rarr; ［Search Experiences］ &rarr; ［Ipstack］に進みます。
1. ［**有効**］ をクリックします。
1. APIキーを入力します.
1. ［**保存**］ をクリックします。

![システム設定でipstackサービスを設定します。](./personalizing-the-search-experience/images/01.png)

### 位置情報アセットを設定する

ipstack サービスと Boost Proximity Element で動作させるには、検索ドキュメントに [geopoint フィールドが必要です](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/geo-point.html) 。 Liferayには互換性のある位置情報フィールドがあり、既存のアセットにカスタムフィールドとして追加することができます。

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
ピンをより正確に配置するために、位置情報マップをズームインします。
```

検索ページで **ブログ** と検索すると、タイトルとコンテンツ欄が短いブログのエントリ（最初のタイトルは **Blog title**）が検索結果ウィジェットに最初に表示されるようになります。 検索ユーザーであるあなたに近いコンテンツをブーストするブループリントを作りましょう。

### 位置情報認識機能を持ったブループリントを設定する

ipstack サービスの設定と、ジオポイントデータを含む検索ドキュメントの設定ができたので、検索ユーザーへの近さによって特定の結果を後押しするブループリントを設定する準備ができました。

1. ［グローバルメニュー］ &rarr; ［アプリケーション］ (Search Experiences) から ［**ブループリント**］ をクリックして、ブループリントアプリケーションを開きます。

1. 追加 (![Add](../../../images/icon-add.png)) ボタンをクリックし、ブループリントを追加します。

   ![［ブループリントの追加］モーダルウィンドウからブループリントの作成を開始します。](./creating-and-managing-search-blueprints/images/02.png)

1. ［新規検索ブループリント］ウィンドウで、ブループリントに［name］ (必須) と［description］(オプション) を指定します。

1. [クエリビルダー](#using-the-query-builder) を使用して、Boost Proximity要素を追加してください。
   - フィールドを `expando__keyword__custom_fields__location_geolocation`として設定します。
   - 減衰を0.8に設定します。
   - スケールを10kmに設定します。
   - ブーストの値を100に設定します。

   ![Boost Proximity要素を設定します。](./personalizing-the-search-experience/images/02.png)

1. ブループリントを構築し、構成しながらテストします。 ［**プレビュー**］ をクリックします。

1. あなたの地域のユーザーの検索体験をモデル化するには、歯車のアイコン（![Cog](../../../images/icon-cog3.png)）をクリックして、あなたのパブリックIPV4アドレスを検索コンテキストに設定します。
   - キー:  `search.experiences.ip.address`。
   - 値：`[自分のパブリックIPV4アドレス]`。

［**完了**］ をクリックします。

1. キーワード **ブログ** を入力し、現在地に近いBlogsエントリーが遠いブログのエントリより先に返されることを確認します。

   ```{note}
   送信IPアドレスの近さでドキュメントをスコアリングするために使用されるガウス関数は、調整が必要な場合があります。 Boost Proximity 要素では、減衰、スケール、ブーストを調整することができます。

   - 減衰は、ユーザーへのアセットの近接度がスケールと等しい場合に、ブースト値を減らす係数を定義します。

   - スケールは、ユーザーのIPアドレスの位置からの距離で、それ以上になると結果の関連性が低下し始めるはずです。

   - ブーストは、定義されたスケールの範囲内にある結果をブーストするための数値です。

   例えば、ユーザーから10km以内に位置する検索結果に対してブーストを100と指定し、減衰係数を0.5と定義した場合、ユーザーからちょうど10km離れた検索結果には最大ブースト値の半分、つまり50がブーストされることになります。 10km以上の距離では、ガウス関数が残りのスコアを決定することになります。

   詳しくは [ElasticのFunction Score Query](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-function-score-query.html) のドキュメントをご覧ください。
   ```

1. ブループリントの作成が完了したら、 ［**保存**］ をクリックします。

これで、 [ブループリントをLiferayの検索ページに適用することができます](./using-a-search-blueprint-on-a-search-page.md)。
