# カテゴリーファセット

カテゴリーファセットは、検索クエリのキーワードに一致するカテゴリーに分類されたアセットの検索結果を絞り込みます。 一致する各結果のカテゴリーは、ファセット用語として集約されます。

![Example of category facet results.](./category-facet/images/02.png)

## カテゴリーファセットの設定

カテゴリー・ファセットを設定するには、ファセットの **Options** メニュー（ [Options](../../../images/icon-app-options.png) ）を開き、 **Configuration** をクリックします。

![Click the Configuration option.](./category-facet/images/03.png)

［表示設定］が最初に表示されます。

**表示テンプレート:** **Default** , **Cloud Layout** , **Compact Layout** , **Label Layout** , **Vocabulary Layout**(7.4 Update/GA 48+ で使用可能)から選択。 デフォルトのレイアウトでは、各用語の横にチェックボックスが表示されますが、コンパクトレイアウトでは表示されません。 ラベルレイアウトでは、用語ごとにクリック可能な小さなラベルが表示されます。 [ボキャブラリレイアウト](#display-facet-terms-categories-by-vocabulary) では、ボキャブラリごとに整理されたファセット用語（カテゴリー）が表示されます。

［詳細設定］セクションには、追加のオプションが含まれています。

**カテゴリ・パラメータ名:** ファセットのURLのパラメータ名を変更します。 デフォルトは **category** である。

```{important}
ファセット ウィジェット間で AND スタイルの選択を実現するには、ウィジェットごとに異なるカテゴリ パラメータ名を設定する必要があります。 デフォルトでは、すべてのカテゴリ ファセット ウィジェットのこのフィールドは _category_ に設定されています。 [以下の例](#example-creating-a-hierarchic-filtering-experience-in-the-category-facet-using-vocabularies) は使用例を示しています。 
```

**最大用語数:** ファセットに一致する用語の数に関係なく、表示するファセット用語の最大数を設定します。

**頻度のしきい値：** ファセット用語リストに用語を表示するために必要な最小頻度を設定する。 たとえば、ファセットの頻度の閾値が3に設定されている場合、一致する結果が2つの用語は用語結果リストに表示されません。

**頻度を表示する：** 項目の頻度を表示するかどうかを選択する。

**Order Terms By:** Liferay 7.4 U56+/GA56+では、ファセット用語のソート戦略を選択できます：用語頻度降順（デフォルト）、用語頻度昇順、用語値昇順、用語値降順。 デフォルトのソートでは、ファセット用語のマッチ数が多いものから少ないものへと並べ替えられます。 用語の値オプションでは、ファセット用語をアルファベット順に並べます。

### ボキャブラリごとのファセット用語の表示とフィルタリング

{bdg-secondary}`7.4 U48+とGA48+について`

デフォルトでは、カテゴリーファセットウィジェットは、サイト内のすべてのボキャブラリから一致する結果のカテゴリを収集し、フラットリストで表示します。 アップデート48における機能拡張により、新たな表示やフィルタリングの動作が可能になりました。

#### ファセット用語（カテゴリー）をボキャブラリ別に表示する

カテゴリーファセットの設定画面でボキャブラリレイアウトを選択することで、カテゴリーをそのボキャブラリ下に表示できます。

![Categories are displayed under their vocabulary.](./category-facet/images/04.png)

#### ファセット用語（カテゴリー）をボキャブラリ別に絞り込む

ファセットに表示するボキャブラリとカテゴリーを選択します。 これを有効にするには、System Settings &rarr; Search &rarr; Category Facet Field の設定を、デフォルトのフィールド `assetCategoryIds` から `assetVocabularyCategoryIds` フィールドに切り替えます。 この設定は、カテゴリーファセットで集計を作成するために使用されるフィールドを指定します。 assetVocabularyCategoryIds`を設定すると、Category Facetウィジェットの設定画面内の語彙設定が有効になります。

```{important}
Liferay 7.4 Update/GA 48より前のバージョンやアップデートからアップグレードする場合で、システム内にすでにカテゴリー化されたアセットがある場合は、すべての検索インデックスのインデックスを再作成して、検索ドキュメントに必要な`assetVocabularyCategoryIds`フィールドを含めてください。
```

![Select the vocabulary.](./category-facet/images/06.png)

この動作により、強力な検索ファセット体験を提供することができます。 [以下の使用例](#example-creating-a-hierarchic-filtering-experience-in-the-category-facet-using-vocabularies) をご参照ください。

## 例：ボキャブラリーを使用してカテゴリーファセットで階層型フィルタリングエクスペリエンスを作成する

自動車部品を購入するためのコマースポータルを考えてみます。 各パーツは、異なるボキャブラリーで分類されたコマース製品です。

- ボキャブラリ：Vehicle System

   カテゴリー：
   - Brake System
   - Engine
   - Exhaust System
   - Suspension
   - Transmission
   - Turbocharger

- ボキャブラリー：Quality

   カテゴリー：
   - Premium
   - 標準

ユーザーは、「エンジン」と「排気システム」を選択した場合に、いずれかのカテゴリーに一致する製品が表示されることを期待します。 さらに、「Quality」のボキャブラリから「Premium」を選択した場合、エンジンや排気システムのプレミアムな自動車部品だけに絞られることを期待します。 7.4 アップデート/GA 48バージョンでは、すぐにそれを実現することができます。

上記のユースケースを設定するには、

1. グローバルメニュー &rarr; ［コントロールパネル］&rarr; ［サイト］で新規サイトを作成します。 プロンプトが表示されたら、Miniumサイトテンプレートを選択します。

1. サイト名をFooとし、 **Add** をクリックしてください。

1. グローバル サイトのメニュー &rarr; ［カテゴリー設定］&rarr; ［カテゴリー］に移動します。 「Quality」というボキャブラリ名を追加し、「Premium」と「Standard」という2つのカテゴリーを作成します。

   ```{important}
   Fooサイトのサイトカテゴリーではなく、グローバルサイトのグローバルカテゴリーを作成する必要があります。
   ```

   ```{note}
   サイトの初期化時にサイトテンプレートによって作成された既存のボキャブラリがあります（サイト名にちなみFooとされています）。構築する例に合わせ、_Vehicle Systems_ という名前を付けて、カテゴリーをより明確にした方が良いでしょう （例: Brake System）。 ただし、Fooボキャブラリのカテゴリーは既存のコマース製品から参照されるため、編集することはできません。 
   ```

   ![Create a Quality vocabulary in the global site.](./category-facet/images/07.png)

1. グローバルメニュー &rarr; コマース &rarr; ［Products］（製品管理セクション下）で、既存のコマース製品の一部を分類します。

   「Premium」カテゴリーを以下に追加します。

   - Premium Brake Fluid
   - Premium Brake Pad

   以下のように、いくつかの追加製品に「Standard」カテゴリを追加します。

   - ABS Sensor
   - Brake Fluid
   - Wear Sensors
   - Brake Pads
   - Brake Rotors

   ![Categorize some existing products as Premium or Standard.](./category-facet/images/09.png)

1. Fooサイトのホームページに移動します。 Miniumサイトのホームページは、デフォルトで製品カタログとなっており、基本的には［空の検索を許可する］を有効にした検索ページとなっています。

   カテゴリーファセットウィジェットでは、両方のボキャブラリのカテゴリーが1つのフラットリストに表示されます。 複数のファセット用語（例：「Suspension」と「Standard」など）を選択すると、ページ上に結果が展開されます。これは、ファセット用語間のOR演算子の動作を示しています。

   ![The categories of all available vocabularies are aggregated.](./category-facet/images/08.png)

   このページのウィジェットの中には、コマースに特化したウィジェット（仕様ファセットなど）もありますが、カテゴリーファセットは標準の検索ウィジェットになります。

1. `assetVocabularyCategoryIds`フィールドを使用して集約を作成するように、Category Facetウィジェットを変更します。 ［システム設定］&rarr; ［検索］に移動します。 Category Facet Field項目で、Category Facet Fieldセレクタで`assetVocabularyCategoryIds`を選択し、設定を更新する。

1. Fooサイトのホームページに、Fooボキャブラリのカテゴリーのみを表示するように設定されたカテゴリーファセットウィジェットを追加します。

   - ページ上部の **プラスアイコン** をクリックします（！ [Plus](../../../images/icon-plus.png) ）。
   - カテゴリファセット*ウィジェットを既存のウィジェットの真上または真下にドラッグします。
   - ウィジェット設定*画面を開く(![アプリオプション](../../../images/icon-app-options.png))。
   - 表示テンプレートのセレクタを開き、 **語彙レイアウト** を選択します。
   - Categoryパラメータ名を **foocategories** に変更する。
   - ボキャブラリーの選択」ラジオボタンをクリックします。 Global **を展開し、** Foo_を選択する。
   - 保存」をクリックする。

1. 同様の手順で、オリジナルのカテゴリーファセットウィジェットを設定し、「Quality」ボキャブラリのカテゴリーのみを表示し、ボキャブラリレイアウトテンプレートを使用します。 新しいカテゴリーファセットウィジェットのカテゴリーパラメータ名はすでに変更されているので、既存ウィジェットのデフォルト値のままにしておくことができます。

1. ページを更新します。 Fooボキャブラリを表示するカテゴリーファセットウィジェットで「Brake System」と「Suspension」のカテゴリーを選択すると、表示される製品が「Brake System OR Suspension」のカテゴリーと一致するようになります。

   「Quality」カテゴリーを表示するカテゴリーファセットで「Standard」を選択すると、「Brake System OR Suspension AND Standard」に分類される製品のみに結果が絞り込まれます。

![Configure hierarchic filtering in the Category Facet.](./category-facet/images/10.png)
