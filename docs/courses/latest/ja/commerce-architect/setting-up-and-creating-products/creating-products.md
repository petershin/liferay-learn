# 製品を作る

クラリティは幅広い種類のメガネ、レンズ、サングラスなどを顧客に提供している。 Liferayのすぐに使える製品管理機能を使えば、統一されたインターフェイスでさまざまな種類の製品を作成できます。 Liferayは、サードパーティシステムからの製品のインポートもサポートしています。 ダミアンは今、カタログにいくつかの製品を作るためにあなたの助けを必要としている。

まず、製品カタログに簡単な製品を作成します。 クラリティのメガネ、マリヤを作るのだ。

1. グローバルメニュー (**![グローバルメニュー](../../images/icon-applications-menu.png))を開き、**Commerce** &rarr; **Products** に移動します。

1. **追加**(![Add](../../images/icon-add.png)) をクリックし、この製品を入力します：

   **氏名：** マリヤ

   **クラリティ製品カタログ

   ![Enter the name and catalog for the product.](./creating-products/images/01.png)

1. **Submit** をクリックしてください。

これにより、ドラフト状態の製品が作成される。 そのまま公開することも可能だが、まずは基本的な設定を行うべきだ。

## 製品の基本構成

商品の詳細を追加しよう。

1. **Details** の下に、以下の説明を入力する：

   ```
   スタイルと機能性の完璧な融合、Maliyahメガネをご紹介します。頑丈なフレームに洗練されたデザインのプロ用メガネ。ファッション性と実用性の両方を求めるプロフェッショナルに最適なMaliyahで、よりクリアで快適な掛け心地を体験してください。
   ```

1. Categorization "の下にある "Clarity "の横にある " **Select** "をクリックします。 眼鏡*カテゴリーを選択してください。 ストアフロントを構築する際、これらのカテゴリーをファセットで使用することができる。

1. **SKUs** タブを開き、`default` skuを選択する。 SKUテキストフィールドに`CLA-EYE-FR-0003`と入力してください。

1. ［**公開**］ をクリックします。

1. **Configuration** タブに移動し、 **Shipping** カードに以下の値を入力します。

   **幅:** 2

   **高さ:** 6

   **深さ：** 1.5

   **重量：** 0.22

1. ** Free Shipping **と** Ship Separately**を無効にしてください。

1. 在庫カードで、「在庫が少ないアクション」で「未発表に設定*」を選択する。

1. バックオーダーを許可する]と[在庫数を表示する]を無効にし、[在庫状況を表示する]を有効にします。

1. 最大注文数量*を5とする。

   ![Configure the basic details of the product.](./creating-products/images/02.png)

1. **詳細 **タブに戻り、**公開** をクリックします。

これは、いくつかの基本的な詳細と製品を公開します。 次に、以下の情報を使ってさらに2つの製品を作成する。 先に作成した製品と同じトグルを有効または無効にする。

| 製品名    | カタログ        | カテゴリ | SKU          | 寸法                    | 重さ   | 最大注文数 | 在庫数低下時のアクション |
| :----- | :---------- | :--- | :----------- | :-------------------- | :--- | ----- | ------------ |
| フルーレット | クラリティ製品カタログ | メガネ  | クラアイ-FR-0004 | 幅: 2, 高さ: 6, 奥行き: 1.5 | 0.22 | 5     | 未公開として設定     |
| ラテファ   | クラリティ製品カタログ | メガネ  | クラアイ-FR-0001 | 幅: 2, 高さ: 6, 奥行き: 1.5 | 0.22 | 5     | 未公開として設定     |

　 あなたはこのモジュールを完了しました。 次のモジュールでは、商品とそのSKUを設定し、在庫、価格、その他の必要な情報を追加して、ストアフロントの体験を豊かにします。

[コースに戻る](../../commerce-architect.md) 
