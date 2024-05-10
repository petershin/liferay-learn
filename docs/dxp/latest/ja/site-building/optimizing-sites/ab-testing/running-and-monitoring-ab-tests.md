# A/Bテストの実行と監視

A/Bテストを実行するときに、次のパラメーターを設定できます。

**トラフィックの分割：** ページを訪問したときに、オリジナルとバリアントの間でランダムに分かれた訪問者の割合。 訪問者はオリジナルとバリアントの間でランダムに分割され、A/Bテストが終了するまで常に同じページが表示されます。

**必要な信頼度：** テストの精度を表します。 必要な信頼度が高ければ高いほど、勝者を宣言するのに時間がかかる。

**勝者を宣言するための予想時間** は、試験時間の予測値を提供します。 この推定は、Traffic SplitとConfidence Level Requiredの設定、および推定ページ トラフィック（Analytics Cloudが提供するトラフィック履歴に基づく）に基づいています。

![A/Bテスト実行の設定は、要件に合わせて調整できます。](running-and-monitoring-ab-tests/images/01.png)

テストを作成したら、 **A/Bテスト**(![A/B Test icon](../../../images/icon-ab-testing.png)) をクリックして、テストステータスを確認します。

Liferay DXP では、テストが終了したときに、テストのステータスと勝者のみが表示されます。 Analytics CloudでA/Bテストの他の側面を管理できます。 詳細については、Analytics Cloud ドキュメントの [A/Bテスト](https://learn.liferay.com/w/analytics-cloud/optimization/a-b-testing) を参照してください。

A/B テストが終了したら、テスト結果を確認し、好みのバリアントを公開することができます。 詳細は、 [A/Bテスト結果のレビューとテストバリアントの公開](./reviewing-ab-test-results-and-publishing-test-variants.md) を参照してください。

## A/Bテストの実行

```{note}
テストを実行する前に、A/Bテストを作成する必要があります。 詳細については、 [A/Bテストの作成](./creating-ab-tests.md) をご覧ください。
```

1. A/Bテストを実行するコンテントページに移動します。
1. コントロールメニューで、 ［**A/Bテスト**］ ボタン（![A/B Test icon](../../../images/icon-ab-testing.png)）をクリックします。
1. コンテントページに他のエクスペリエンスがある場合は、［エクスペリエンス］を選択します。
1. ［**有効なテスト**］ セクションの下で、 ［**テストをレビューして実行する**］ をクリックします。
1. オプションで、テストの ［**トラフィック分割**］ および ［**必要信頼度**］ の設定を構成します。
1. ［**Run**］ をクリックし、 ［**OK**］ をクリックします。

［**テストを終了**］ をクリックすると、実行中のテストをいつでもキャンセルできます。 A/Bテストを削除するには、最初にテストを終了する必要があります。

## 関連トピック

- [A/Bテスト](./ab-testing.md)
- [A/Bテスト要件の確認](./verifying-ab-test-requirements.md)
- [A/Bテストの実行と監視](./running-and-monitoring-ab-tests)
- [A/Bテスト結果のレビューとテストバリアントの公開](./reviewing-ab-test-results-and-publishing-test-variants.md)
