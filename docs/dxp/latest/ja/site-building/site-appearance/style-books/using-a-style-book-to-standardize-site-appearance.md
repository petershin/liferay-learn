# スタイルブックを使用してサイトの外観を標準化する

{bdg-secondary}`7.3+で利用可能`

**スタイル・ブック** とは、ページ全体で一貫した体験を提供するために、サイトに適用される視覚的なルールのセットです。 これらのルールによって、要素（ウィジェットなど）間の間隔、色、フォントなど、サイトのさまざまな視覚的設定が決定まります。 これらの各設定は、スタイルブックを使用するすべてのページに等しく適用されます。

サイトのページに割り当てるテーマによって、サイトのスタイル・ブックで利用できる設定のカテゴリが決まります。 開発者は、スタイルブックを構成するための新しいオプションを使用してカテゴリをカスタマイズできます。 詳細は [スタイルブックトークンの定義](./developer-guide/frontend-token-definitions.md) を参照のこと。

## ページのスタイルブックの選択

ページに特定のスタイルブックを選択しない場合、そのページは [マスターページ](../../creating-pages/defining-headers-and-footers/master-page-templates.md) のスタイルブックを使用します。 どちらも設定されていない場合、ページはサイトのデフォルトのスタイル・ブックを使用します。

```{note}
Liferay 7.4 U10+とGA14+から、すべてのサイトには*Styles from Theme*と呼ばれるスタイルブックが少なくとも1つあります。 このスタイルブックでは、テーマで定義されたトークン定義を、すべてのデフォルト値で使用します。 このスタイル・ブックは編集することができず、他のスタイル・ブックが設定されていない場合、サイトのデフォルトとして使用されます。
```

次の手順に従って、ページのスタイルブックを設定します。

1. ページ上部の **編集**（![編集アイコン](../../../images/icon-edit.png)）をクリックします。

1. サイドバーの **ページデザインオプション**(![ページデザインオプション](../../../images/icon-format.png))をクリックします。

1. クリックすると **スタイルブック** タブが開きます。

   ![Open the Style Book tab to choose the desired Style Book from the list.](./using-a-style-book-to-standardize-site-appearance/images/01.png)

1. リストから目的のスタイルブックを選択します。

1. ［**公開**］ をクリックします。

このページは、新しいスタイルブックを使用して公開されます。

## 新しいスタイルブックの作成

1. **サイトメニュー** &rarr; **デザイン** &rarr; **スタイルブック** に移動します。

1. ページ上部の **追加**（![アイコンの追加](../../../images/icon-add.png)）をクリックします。

1. スタイルブックの名前を入力し、 **保存** をクリックします。

1. 画面右側のメニューにあるドロップダウンボックスのカテゴリからオプションを変更します。

   ![Select any of the available categories and customize your Style Book.](./using-a-style-book-to-standardize-site-appearance/images/02.png)

   これらのオプションは、サイトで使用されているテーマに基づいています。 デフォルトのクラシックテーマで利用可能なカテゴリの詳細については、 [デフォルトのクラシックテーマのカテゴリ](#default-classic-theme-categories) を参照してください。

1. 選択したカテゴリの下にある提供されたフィールドのいずれかをカスタマイズします。 カラーフィールドは特に、 [色を選択する複数の方法を提供する](#customizing-your-style-book-s-colors) 。

1. ［**公開**］ をクリックします。

編集時に、スタイルブックを任意のページのオプションとして選択できるようになりました。

このスタイルブックをあなたのサイトの新しいデフォルトにするには、新しく作成したスタイルブックの横にあるアクションメニュー（![アクションアイコン](../../../images/icon-actions.png)）を開き、 **デフォルトとしてマーク** をクリックします。

### スタイルブックのプレビュー

{bdg-secondary}`利用可能な7.4 DXP U9+またはGA13+`

スタイル・ブックを作成または編集している間、ページ、ページ・テンプレート、ページ・フラグメントなど、サイトのさまざまなコンポーネントの外観に与える影響をプレビューすることができます。

画面上部の2つのドロップダウンメニューを使用して、プレビューするコンポーネントを選択します。 左のドロップダウンメニューは、表示する全体のタイプ（ページ、ページテンプレート、マスターページテンプレート、表示ページテンプレート、ページフラグメント）を決定します。 右のドロップダウンメニューは、選択したタイプのどの特定のインスタンスを表示するか（該当する場合はカテゴリー）を決定します。リストから **More** をクリックしない限り、最近使用された4つのオプションのみが右のドロップダウンメニューに表示されます。

![Use the two drop-down menus together to select what to display to preview your Style Book.](./using-a-style-book-to-standardize-site-appearance/images/03.png)

ページフラグメントのコレクションをプレビューすると、コレクション内のすべてのフラグメントが表示されます。 プレビューでは、複数の（選択可能な）設定オプションを持つフラグメントが、各オプションのインスタンスとともに表示されます。

![If you are previewing the Style Book's effect on Page Fragments, you can preview any configuration of the Fragments from the chosen Collection.](./using-a-style-book-to-standardize-site-appearance/images/04.png)

### スタイルブックの色をカスタマイズする

スタイル・ブック内のカラー・フィールドで色を選択する場合、複数の方法で色を選択することができます：

* 左側の色をクリックしてカラーピッカーを開き、任意の色を選択します。

* 任意の色に変更するには、希望の色の16進コードをテキストボックスに入力します。

* スタイルブックからの値*ボタンをクリックすると、あらかじめ定義された色のメニューが開きます。 カスタマイズできる一般的なカテゴリーから、それぞれ色を選んで再利用することができる。

![You have several options available to change the color for any color option.](./using-a-style-book-to-standardize-site-appearance/images/05.png)

スタイルブックからの値] ボタンをクリックし、スタイルブック トークン値（別のカテゴリーでも定義されている）を選択すると、そのカラー フィールドは選択したスタイルブック トークンにリンクされます。 将来、このスタイル・ブックのトークン値を変更すると、このカラー・フィールドも変更されます。

カラーフィールドがスタイルブックトークンに結びつけられている場合、[スタイルブックから値を取得]ボタンは **トークンを削除** ボタンに置き換えられます。 このボタンをクリックすると、トークンからカラーフィールドが切り離されます（ただし、同じカラー値は保持されます）。

![Click the Detach Token button to detach a color field from the Style Book token, but keep the same color value.](./using-a-style-book-to-standardize-site-appearance/images/06.png)

```{note}
カラー値をスタイルブックトークンにアタッチまたはデタッチするには、Liferay DXP 7.4 U10+またはGA14+が必要です。
```

右側の **Clear Selection** ボタンをクリックして、色をデフォルト値（テーマで定義）に戻します。

```{note}
特定のページでスタイル・ブックから色を編集する場合も、色を選択するオプションは同じです。 しかし、*Clear Selection*ボタンをクリックすると、代わりに選択した*Style Book*で定義されたデフォルトの色にリセットされます。
```

### カラーピッカーを使う

スタイルブックをカスタマイズしている間、カラーピッカーを使って色を検索し、検索結果をフィルタリングしてください。

カラーピッカーの使用はスタイルブックに限定されません。 Liferayの他の部分でも見つけることができます（例えば、 [コンテンツページの編集中](../../creating-pages/using-content-pages.md) ）。

カラー・ピッカーにアクセスするには、カラー値（背景や枠線など）の横にある **スタイル・ブックからの値**（![スタイル・ブックからの値アイコン](../../images/icon-theme.png)）をクリックするか、アイコンがない場合はカラー値をクリックします（テキスト・カラーなど）。

![Access the color picker by clicking the Value from Style Book icon or by clicking on the color value when the icon is not available.](./using-a-style-book-to-standardize-site-appearance/images/10.png)

カラーピッカーでは、既存の色がカテゴリーとトークンセットで分けられている。 色の上にカーソルを置くと、その色のトークン値を見ることができます。

![See a color's token value by hovering the cursor over the color in the color picker.](./using-a-style-book-to-standardize-site-appearance/images/11.png)

特定の色を検索するには、検索バーを使用します。 [カテゴリ](./developer-guide/frontend-token-definitions.md#token-categories) 、 [トークンセット](./developer-guide/frontend-token-definitions.md#token-sets) 、 [トークン値](./developer-guide/frontend-token-definitions.md#token-definitions) 、 [16進カラー値](https://www.w3schools.com/html/html_colors_hex.asp) で検索できます。

検索バーを使用する場合、検索システムは大文字と小文字を区別しません。 また、検索で結果が得られなかった場合、検索エリアに **No Results Found** というメッセージが表示される。

![If a search returns no results, a "No Results Found" message is displayed in the search area.](./using-a-style-book-to-standardize-site-appearance/images/12.png)

## デフォルトの標準テーマカテゴリ

スタイルブックを編集しているとき、ドロップダウンボックスから利用できるカテゴリには、ページのスタイルを設定するためのさまざまなオプションが表示されます。 各カテゴリーで利用可能なオプションは、テーマによって定義されます。

```{tip}
ページに`スタイルガイドサンプル`ウィジェットを配置して、スタイルブックカテゴリのさまざまなオプションをテストするのに役立てることができます。 このサンプルウィジェットには、標準テーマのほとんどの機能を活用するさまざまなUI要素が含まれているため、これを使用してページスタイルをテストできます。
```

ここにリストされているカテゴリは、標準テーマのオプションとして利用できます。

```{tip}
幅、マージン、パディングなど、色に関係のないオプションを変更する場合は、定義済みの単位セットから選択するか、カスタム単位を指定することができます。 いくつかのオプションには、ピクセル(PX)、パーセント(%)、em幅(EM)、ルートem(REM)があります。
```

### 色体系

テーマで定義されているフォントと視覚要素に使用される色は、［色体系］カテゴリでカスタマイズできます。 通常、これは、ページの本文、背景、およびテキストの色を変更できることを意味します。

![Change the colors used for displays or UI elements with options under the Color System category.](./using-a-style-book-to-standardize-site-appearance/images/07.png)

```{note}
アラート関連の要素（*成功*や*注意*など）の色を変更しても、各タイプのアラートは多くの色のうちのいずれかを使用する可能性があるため、サイトの着信アラートの色には影響しない場合があります。 アラートの色を完全にカスタマイズするには、カスタマイズ可能な色を定義して、独自のテーマのカテゴリで使用する必要があります。
```
### 間隔

Spacingカテゴリのオプションを使用して、ページの主要な要素間の間隔を調整します。 対応するスタイルブックを使ってページフラグメントを設定すると、フラグメントのマージンとパディングのサイズのオプションとしてこれらの値が与えられます。

![Change the colors used for displays or UI elements with options under the Color System category.](./using-a-style-book-to-standardize-site-appearance/images/08.png)

```{tip}
width、margin、paddingなど、色に関係のないトークンを変更する場合、定義済みの単位セットから選択するか、カスタム単位を指定することができます。 この柔軟性により、スタイリングをより正確にコントロールすることができる。 いくつかのオプションには、ピクセル(PX)、パーセント(%)、em幅(EM)、ルートem(REM)があります。
```

### 共通

これらのオプションは、サイトのすべてのページに表示される要素の色と間隔を変更します。 例えば、 **Body Background** オプションは、すべてのページの背景色を変更します。

### レイアウト

これらのオプションは、ページ上のコンテナの幅を変更します。 たとえば、新しい空白ページのデフォルトコンテナは、特大設定のサイズから設定できます。

### 文字体裁

これらのオプションは、ページの新しいフォントを定義します。 このカテゴリのオプションを使用して、ヘッダのサイズを調整することもできます。

### ボタン

これらのオプションは、デフォルトタイプのボタンのスタイルを変更します。 標準テーマで使用される各ボタンの背景色、前景色、および線の色をカスタマイズできます。

![Change the colors under Button Primary to affect many common buttons for out-of-the-box widgets when using the Classic theme.](./using-a-style-book-to-standardize-site-appearance/images/09.png)

## 関連トピック

* [スタイルブック・トークンの定義](./developer-guide/frontend-token-definitions.md)
