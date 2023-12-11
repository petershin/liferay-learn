# 指標 説明

アナリティクス クラウドで使用されるさまざまなメトリクスの説明とその計算方法を参照してください。

インデックス

* [A/Bテスト - 勝者が決定するまでの推定時間](./metrics-description.md#ab-testing---estimated-time-to-declare-winner) 
* [A/Bテスト - 改善](./metrics-description.md#ab-testing---improvement) 
* [A/Bテスト - 勝つ確率](./metrics-description.md#ab-testing---probability-to-win) 
* [獲得 - セッションに占める割合](./metrics-description.md#acquisitions---percentage-of-sessions) 
* [アクティブな個人](./metrics-description.md#active-individuals) 
* [匿名の個人](./metrics-description.md#anonymous-individuals) 
* [視聴者 - ダウンロードされたセグメント](./metrics-description.md#audience---downloaded-segments) 
* [オーディエンス - ダウンロード](./metrics-description.md#audience---downloads) 
* [オーディエンス - セグメント化されたダウンロード](./metrics-description.md#audience---segmented-downloads) 
* [オーディエンス - セグメント化された投稿](./metrics-description.md#audience---submissions) 
* [視聴者 - セグメント化された視聴者](./metrics-description.md#audience---segmented-viewers) 
* [オーディエンス - セグメント化されたビュー](./metrics-description.md#audience---segmented-views) 
* [観客 - 投稿](./metrics-description.md#audience---submissions) 
* [オーディエンス - 投稿者セグメント](./metrics-description.md#audience---submitter-segments) 
* [視聴者 - 視聴者セグメント](./metrics-description.md#audience---viewer-segments) 
* [観客 - 閲覧数](./metrics-description.md#audience---views) 
* [観客 - 来場者](./metrics-description.md#audience---visitors) 
* [直帰率](./metrics-description.md#bounce-rate) 
* [クリック](./metrics-description.md#clicks) 
* [コメント](./metrics-description.md#comments) 
* [ダウンロード](./metrics-description.md#downloads) 
* [エントランス](./metrics-description.md#entrances) 
* [退場率](./metrics-description.md#exit-rate) 
* [書式 - 放棄](./metrics-description.md#forms---abandonment) 
* [趣味 - 正会員に占める割合]() 
* [興味 - セッションの割合](./metrics-description.md#interests---percentage-of-sessions) 
* [利害 - 個人全体に占める割合](./metrics-description.md#interests---percentage-of-total-individuals) 
* [既知の個人](./metrics-description.md#known-individuals) 
* [プレビュー](./metrics-description.md#preview) 
* [読書時間](./metrics-description.md#reading-time) 
* [検索 - セッションの割合](./metrics-description.md#search---percentage-of-sessions) 
* [セッション時間](./metrics-description.md#session-duration) 
* [場所別セッション](./metrics-description.md#sessions-by-location) 
* [テクノロジー別セッション](./metrics-description.md#sessions-by-technology) 
* [訪問者あたりのセッション数](./metrics-description.md#sessions-per-visitor) 
* [投稿](./metrics-description.md#submissions) 
* [ページ滞在時間](./metrics-description.md#time-on-page) 
* [個人またはユニークビジター総数](./metrics-description.md#total-individuals-or-unique-visitors) 
* [ビュー](./metrics-description.md#views) 
* [曜日・時間帯別訪問者数](./metrics-description.md#visitors-by-day-and-time) 

## A/Bテスト - 勝者が決定するまでの推定時間

これは、勝者を決定するためにA/Bテストを実行する必要がある期間である。  なお、これは直帰率タイプのA/Bテストでのみ有効です。

## A/Bテスト - 改善

これはコントロールからの相対的な改善を示している。 例えば、コントロールの定着率は15％であったかもしれないが、バリアントは16％であった。 改善度は次のように計算される。

```
((16 - 15) / 15) * 100 = ~6.67% improvement.
```

この指標はリフトとも呼ばれる。

## A/Bテスト - 勝つ確率

これは、ある変種がコントロールに勝つ割合の予測である。

## 獲得数 - セッションに占める割合

これは、訪問者がどのようにあなたのサイトに到着したかについて、上位トラフィックソースの割合で内訳を示しています。 セッションは、前回のセッションから30分間操作がなかった場合、または新しい日の始まり（つまり午前0時を過ぎた場合）に新しいセッションとみなされます。 与えられた時間範囲について、レートは次のように計算される。

```
(The acquisition traffic source) ÷ (The total number of sessions) * 100
```

## 有効な個人

これは、選択した時間範囲内であなたのサイトと相互作用した訪問者の総数です。

## 匿名の個人

これは、一意の `userId` （ユーザーID）によって識別されるが、電子メールアドレスに関連付けられていない訪問者の総数である。 あなたのサイトへのすべての訪問者は、電子メールアドレスでログインする個人を除いて、新しい `userId` が割り当てられます。 以前にログインしたことのある訪問者は、以前に割り当てられた `userId` に関連付けられます。

## 視聴者 - ダウンロードされたセグメント

これは、ドキュメントやメディアをダウンロードした上位のセグメントである。 グラフの各バーは、そのセグメントに属する個人のうち、ドキュメントまたはメディアをダウンロードした人の総数を示している。 バーには、その文書やメディアをダウンロードした既知の個人のうち、何パーセントがそのセグメントに属しているかという値も表示される。 与えられた時間範囲について、パーセンテージは次のように計算される。

```
(The number of individuals that are part of that segment who downloaded the document or media) ÷ (The total number of known individuals who downloaded that document or media) * 100
```

## オーディエンス - ダウンロード

これは、指定された時間範囲内にドキュメントまたはメディアをダウンロードした訪問者の合計数です。 匿名の個人と既知の個人の割合が示されている。

## オーディエンス - セグメント化されたダウンロード

これは、指定された時間範囲内に文書またはメディアをダウンロードした既知の個人の総数である。 セグメント化された個人とそうでない個人の割合が示されている。

## 観客 - セグメント化された投稿

これは、指定された時間範囲内にフォームを提出した既知の個人の総数である。 セグメント化された個人とそうでない個人の割合が示されている。

## 視聴者 - セグメント化された視聴者

これは、指定された時間帯にページを閲覧した既知の個人の総数である。 セグメント化された個人とそうでない個人の割合が示されている。

## オーディエンス - セグメント化されたビュー

これは、指定された時間範囲内で資産を閲覧した既知の個人の総数です。 セグメント化された個人とそうでない個人の割合が示されている。

## 観客 - 投稿

これは、指定された時間範囲内にフォームを送信した訪問者の合計数です。 匿名の個人と既知の個人の割合が示されている。

## オーディエンス - 投稿者セグメント

これらは、フォームを送信した上位のセグメントである。 グラフの各バーは、そのセグメントに属する、フォームを提出した個人の総数を示している。 バーには、フォームを提出した既知の個人のうち、何パーセントがそのセグメントに属しているかという値も表示される。 与えられた時間範囲について、パーセンテージは次のように計算される。

```
(The number of individuals that are part of that segment who submitted the form) ÷ (The total number of known individuals who submitted the form) * 100
```

## 視聴者 - 視聴者セグメント

これらは、そのページやアセットを閲覧した上位のセグメントです。 グラフの各バーは、ページまたはアセットを閲覧した、そのセグメントに属する個人の総数を示しています。 バーには、そのページやアセットを閲覧した既知の個人のうち、何パーセントがそのセグメントに属しているかという値も表示されます。

与えられた時間範囲について、パーセンテージは次のように計算される。

```
(The number of individuals that are part of that segment who viewed the page or asset) ÷ (The total number of known individuals who viewed the page or asset) * 100
```

## 観客 - 視聴率

これは、指定された時間帯にアセットを閲覧した訪問者の合計数です。 匿名の個人と既知の個人の割合が示されている。

## 観客 - 来場者

これは、指定された時間帯にそのページを訪れた訪問者の総数です。 匿名の個人と既知の個人の割合が示されている。

## 直帰率

バウンス率とは、あなたのサイトのあるページを訪問した個人が、セッションが終了するまでにそれ以上のインタラクションを行わなかったセッションの割合を示します。 セッションは、前回のセッションから30分間操作がなかった場合、または新しい日の始まり（つまり午前0時を過ぎた場合）に新しいセッションとみなされます。 与えられた時間範囲について、レートは次のように計算される。

```
(Total number of bounced sessions) ÷ (The total number of sessions) * 100
```

## クリック数

これは、A/Bテスト、ウェブコンテンツ、またはカスタムアセットに対する、指定された時間範囲内のクリック数の合計です。

## 掲示板のディスカッション

これは、ある時間帯にブログや文書、メディアに投稿されたコメントの総数である。

## ダウンロード

これは、指定された時間範囲における、ドキュメントとメディアまたはカスタムアセットのダウンロード数の合計です。

## 入口

入口は、訪問者がサイトに入って最初に見る最も一般的なページと、それぞれの入口の数を示します。

## 離脱率

これは、ページとインタラクション（スクロールやクリックなど）した後、サイトを離れた訪問者の割合です。 直帰率は含まれない。 与えられた時間範囲について、レートは次のように計算される。

```
(Total number of sessions of the page in which visitors left the site) ÷ (The total number of sessions of the page) * 100
```

## フォーム - 断念

放棄率は、フォームを送信せずに離脱した人の割合。 与えられた時間範囲について、レートは次のように計算される。

```
(Total number of individuals who viewed a form without submitting) ÷ (The total number of individuals who viewed the form) * 100
```

## 趣味 - 正会員に占める割合

あるセグメントの正会員のうち、何パーセントがそのトピックに関心を持っているかを示す。 セグメントのメンバーは、過去30日以内にあなたのサイトと相互作用した場合、アクティブとみなされます。 レートは次のように計算される。

```
(The total number of active segment members who were interested in that topic) ÷ (The total number of active segment members) * 100
```

## 興味 - セッションに占める割合

興味のあるセッションのパーセンテージは、指定された時間範囲内で、その興味のあるトピックを含むセッションのパーセンテージを示す。 セッションは、前回のセッションから30分間操作がなかった場合、または新しい日の始まり（つまり午前0時を過ぎた場合）に新しいセッションとみなされます。 与えられた時間範囲について、レートは次のように計算される。

```
(Total number of sessions that contained that interest topic) ÷ (The total number of sessions) * 100
```

## 利害関係-個人全体に占める割合

全個人に占める興味の割合は、特定のトピックに興味を持っている人の割合を示す。 与えられた時間範囲について、レートは次のように計算される。

```
(Total number of individuals interested in that interest topic) ÷ (The total number of individuals) * 100
```

## 既知の個人

これは、一意の `userId` （ユーザーID）によって識別され、メールアドレスと関連付けられた訪問者の総数です。 以前にログインしたことのある訪問者は、以前に割り当てられた `userId` に関連付けられます。

## プレビュー

これは、指定された時間範囲内で文書やメディアがプレビューされた回数である。

## リーディングタイム

読書時間は、ブログ・エントリーに費やされた平均時間。 与えられた時間範囲について、レートは次のように計算される。

```
(Total time spent on the blog entry across all views) ÷ (The total number of views) * 100
```

## 検索 - セッションの割合

検索セッションのパーセンテージは、指定された時間範囲内で、その検索クエリー用語を含む検索のパーセンテージを示します。 セッションは、前回のセッションから30分間操作がなかった場合、または新しい日の始まり（つまり午前0時を過ぎた場合）に新しいセッションとみなされます。 与えられた時間範囲について、レートは次のように計算される。

```
(Total number of sessions that contained that search query term) ÷ (The total number of sessions) * 100
```

## セッション期間

これは平均的なセッションの長さである。 セッションは、前回のセッションから30分間操作がなかった場合、または新しい日の始まり（つまり午前0時を過ぎた場合）に新しいセッションとみなされます。

## 場所別のセッション数

場所別のセッションは、訪問者がサイトにアクセスする上位の国を表示します。 上位5カ国は、全セッションに占める割合とともに表示される。 上位5カ国以外の国々は、単一のパーセンテージ値として合算されている。 セッションは、前回のセッションから30分間操作がなかった場合、または新しい日の始まり（つまり午前0時を過ぎた場合）に新しいセッションとみなされます。

## 技術別セッション

技術別のセッションは、あなたのサイトを訪問するために使用されたデバイス、オペレーティングシステム、およびブラウザを示します。 デバイスの種類、OSの種類、ブラウザの種類によって、セッションのパーセンテージの内訳が表示される。 セッションは、前回のセッションから30分間操作がなかった場合、または新しい1日の始まり（つまり午前0時を過ぎた場合）に新しいセッションとみなされます。

## 訪問者あたりのセッション数

これは、各ユニークビジターのセッション数の平均です。 一人の訪問者が複数のセッションを開くことができます。 セッションは、前回のセッションから30分間操作がなかった場合、または新しい1日の始まり（つまり午前0時を過ぎた場合）に新しいセッションとみなされます。 与えられた時間範囲について、レートは次のように計算される。

```
(Total number of sessions across all visitors) ÷ (The total number of visitors) * 100
```

## 申請

提出件数は、指定された時間範囲内に提出された案件の総数である。

## ページ上の時間

ページ滞在時間は、そのページの平均滞在時間。 与えられた時間範囲について、レートは次のように計算される。

```
(Total time spent on the page across all views) ÷ (The total number of views) * 100
```

## 総個人数またはユニークビジター数

これは、一意の `userId`（ユーザーID）によって識別される個人の総数である。

サイトへの訪問者には一意の `userId` が割り当てられます。 訪問者がメールアドレスでログインすると、分析データは引き続きこの `userId` に関連付けられます。 訪問者が以前にログインしており、すでに `userId` が割り当てられている場合、分析データは代わりにこの以前に割り当てられた `userId` に関連付けられます。

訪問者が別のブラウザを使用したり、別の電子メールアドレスでログインしたり、ブラウザのクッキーを消去したりすると、新しい `userId` が割り当てられます。

## 閲覧数

Views（ビュー数）とは、特定の時間範囲におけるページやアセットの総閲覧数のことです。

## 日時別の訪問者

これは、ある時間帯における各曜日24時間のユニークビジター数の合計である。 各セルのツールチップには、その日と時間の訪問者数が表示されます。
