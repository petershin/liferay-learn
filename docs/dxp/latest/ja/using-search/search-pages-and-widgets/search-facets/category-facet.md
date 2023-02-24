# カテゴリファセット

Category Facetは、検索クエリのキーワードに合致するカテゴリに分類されたアセットの検索結果を絞り込みます。 各マッチング結果のカテゴリは、ファセット項として集約される。

![カテゴリファセットの結果の例。](./category-facet/images/02.png)

## カテゴリファセットを設定する

Category Facet を設定するには、Facet の **Options** メニュー (![Options](../../../images/icon-app-options.png)) を開き、 **Configuration** をクリックします。

![設定]オプションをクリックします。](./category-facet/images/03.png)

最初に表示されるのは「ディスプレイ設定」です。

**表示テンプレート。****Default** , **Cloud Layout** , **Compact Layout** , **Label Layout** , **Vocabulary Layout**(7.4 Update/GA 48+ で使用可能) から選択します。 Defaultレイアウトでは、各項目の横にチェックボックスが表示されますが、Compactレイアウトでは表示されません。 ラベルレイアウトでは、用語ごとにクリック可能な小さなラベルが表示されます。 [Vocabulary Layout](#display-facet-terms-categories-by-vocabulary) には、ファセット用語（カテゴリー）が語彙ごとに整理されて表示されます。

［詳細設定］セクションには、追加のオプションが含まれています。

**Category Parameter Name（カテゴリー・パラメーター名）。** FacetのURLのパラメータ名を変更します。 デフォルトは **カテゴリ** 。

```{important}
ファセットウィジェット間のANDスタイル選択を実現するためには、各ウィジェットに対して異なるカテゴリパラメータ名を設定する必要があります。 デフォルトでは、すべてのカテゴリファセットウィジェットは、このフィールドを_category_に設定します。 [以下の例](#example-creating-a-hierarchic-filtering-experience-in-the-category-facet-using-vocabularies) は、その使用例を示しています。 
```

**最大ターム数：** ファセットに一致する用語がいくつ見つかったかに関係なく、表示するファセット用語の最大数を設定します。

**頻度しきい値（Frequency Threshold）。** ファセット用語リストに用語を表示するために必要な最小頻度を設定する。 たとえば、ファセットの頻度しきい値が3に設定されている場合、一致する結果が2件の用語は、用語結果リストに表示されない。

**頻度を表示する。** 用語の頻度を表示するかどうかを選択します。

**Order Terms By:** Liferay 7.4 U56+/GA56+では、ファセットのタームソート戦略を選択することができます。Term Frequency Descending（デフォルト）、Term Frequency Ascending、Term Value Ascending、またはTerm Value Descendingです。 デフォルトのソートでは、ファセット用語のマッチ数が多いものから少ないものへと並べ替えられます。 用語値オプションは、ファセット用語をアルファベット順に並べる。

### 語彙によるファセット用語の表示とフィルタリング

{bdg-secondary}`7.4 U48+およびGA48+`

デフォルトでは、Category Facetウィジェットは、サイト内のすべての語彙から一致する結果のカテゴリを収集し、フラットなリストで表示します。 Update 48の機能強化により、新たな表示やフィルタリングの動作が可能になりました。

#### ファセット用語（カテゴリー）を語彙で表示する

Category Facetの設定画面でVocabulary Layoutを選択することで、カテゴリーをその語彙の下に表示することができます。

![カテゴリーはその語彙の下に表示されます。](./category-facet/images/04.png)

#### 語彙によるファセット用語（カテゴリー）の絞り込み

ファセットに表示する語彙とカテゴリーを選択する。 これを有効にするには、システム設定 &rarr; 検索 &rarr; カテゴリファセットフィールドの設定を、デフォルトフィールド `assetCategoryIds`、から `assetVocabularyCategoryIds` フィールドに切り替えてください。 この設定は、Category Facetで集計を作成するために使用されるフィールドを指定します。 `assetVocabularyCategoryIds` を設定すると、Category Facetウィジェットの設定画面内の語彙の設定が有効になります。

```{important}
7.4 Update/GA 48以前のLiferayのバージョンやアップデートからアップグレードする場合で、システム内に既に分類されたアセットがある場合は、検索ドキュメントに必要な `assetVocabularyCategoryIds` フィールドを含めるためにフルリインデックスを実行します。
```

![語彙を選択する。](./category-facet/images/06.png)

この動作により、強力な検索ファセット体験を提供することができます。 [以下の使用例](#example-creating-a-hierarchic-filtering-experience-in-the-category-facet-using-vocabularies) をご参照ください。


## 例ボキャブラリーを使ったCategory Facetでの階層的なフィルタリング体験の作成

自動車部品を購入するためのコマースポータルを検討する。 各パーツは、異なるボキャブラリーで分類された商材である。

- ボキャブラリー車両システム

   カテゴリ:
   - ブレーキシステム
    - エンジン
    - 排気系
    - サスペンション
    - トランスミッション
    - ターボチャージャー

- ボキャブラリー品質

   カテゴリ:
   - プレミアム
   - 標準

ユーザーが「エンジン」と「排気系」を選択した場合、どちらかのカテゴリーに該当する製品が表示されることを期待します。 そして、「品質」の語彙から「プレミアム」を選択すると、エンジンや排気系の高級自動車部品だけに絞られることが予想される。 7.4 Update/GA 48時点では、すぐにでも実現可能です。

上記のユースケースを構成するために

1. Global Menu &rarr; Control Panel &rarr; Sites から新しいサイトを作成します。 プロンプトが表示されたら、Miniumサイトテンプレートを選択します。
1. サイト名をFooとし、 **Add** をクリックします。
1. Globalサイトのメニュー &rarr; Categorization &rarr; Categoriesに移動します。 Qualityという語彙を追加し、2つのカテゴリを作成します。PremiumとStandardの2つのカテゴリを作成する。

   ```{important}
   Fooサイトのサイトカテゴリではなく、Globalサイトのグローバルカテゴリを作成する必要があります。
   ```

   ```{note}
   サイトの初期化時にサイト テンプレートによって作成された既存の語彙があります (サイトの名前にちなんで Foo と名付けられました)。構築する例に合わせ、_Vehicle Systems_ という名前を付けて、カテゴリをより明確にした方が良いでしょう (例: Brake System)。 ただし、Foo語彙のカテゴリは既存のCommerce製品から参照されるため、編集することはできません。 
   ```

   ![グローバルサイトにQuality vocabularyを作成します。](./category-facet/images/07.png)

1. Global Menu &rarr; Commerce &rarr; Products (Product Managementセクション)で、既存のCommerce Productsの一部を分類する。

   プレミアムカテゴリーを追加

   - プレミアムブレーキフルード
   - プレミアムブレーキパッド

   など、いくつかの追加製品にStandardカテゴリを追加します。

   - ABSセンサー
   - ブレーキフルード
   - ウェアセンサー
   - ブレーキパッド
   - ブレーキローター

   ![既存製品の一部をプレミアムとスタンダードに分類する。](./category-facet/images/09.png)

1. Fooサイトのトップページに移動します。 Miniumサイトのトップページは、デフォルトで製品カタログとなっており、基本的には空白検索を許可した検索ページとなっています。

   Category Facetウィジェットでは、両方の語彙のカテゴリが1つのフラットなリストで表示されます。 複数のファセット・ターム（例：SuspensionとStandard）を選択すると、ページ上の結果が拡張される。これは、ファセット・ターム間のOR演算子の動作を示している。

   ![利用可能なすべてのボキャブラリーのカテゴリが集約されている。](./category-facet/images/08.png)

   このページのウィジェットの中には、Commerceに特化したウィジェット（Specification Facetなど）もありますが、Category Facetは標準の検索ウィジェットになります。

1. Category Facet ウィジェットで、 `assetVocabularyCategoryIds` フィールドを使用して集約を作成するように変更します。 システム設定 &rarr; 「検索」にアクセスします。 Category Facet Field の項目で、Category Facet Field のセレクタで `assetVocabularyCategoryIds` を選択し、設定を更新します。

1. Fooサイトのホームページに、Foo語彙のカテゴリのみを表示するように設定されたCategory Facetウィジェットを追加します。

   - ページ上部の **プラスアイコン**(![Plus](../../../images/icon-plus.png)) をクリックします。
   - **Category Facet** ウィジェットを既存のウィジェットの直上または直下にドラッグします。
   - **Widget Configuration** 画面(![App Options](../../../images/icon-app-options.png))を開いてください。
   - 表示テンプレートのセレクタを開き、 **語彙レイアウト** を選択します。
   - Category Parameter Name を **foocategories** に変更します。
   - **Select Vocabularies** ラジオボタンをクリックします。 **Global** を展開し、 **Foo** を選択します。
   - ［**保存**］ をクリックします。

1. 同様の手順で、オリジナルのCategory Facetウィジェットを構成し、Qualityボキャブラリーのカテゴリのみを表示し、Vocabulary Layoutテンプレートを使用します。 新しいCategory FacetウィジェットのCategory Parameter Nameはすでに変更されているので、既存のウィジェットのデフォルト値のままでよい。

1. ページを更新してください。 Foo語彙を表示するCategory FacetウィジェットでBrake SystemとSuspensionのカテゴリを選択すると、表示される製品がBrake System OR Suspensionのカテゴリと一致するようになります。

   品質カテゴリーを表示するカテゴリーファセットで「標準」を選択すると、ブレーキシステムまたはサスペンションと標準に分類される製品のみに結果が絞り込まれます。

![Category Facetに階層的なフィルタリングを設定する。](./category-facet/images/10.png)
