# A/Bテスト結果のレビューとテストバリアントの公開

A/Bテストが終了すると、Analytics CloudとLiferay DXPでテスト結果を確認できます。Analytics Cloudは、テスト期間中に **必要信頼度** が達成された場合に勝者を宣言します。テストの必要信頼度を設定する方法については、[A/Bテストの作成](./creating-ab-tests.md) を参照してください。

```{tip}
A/Bテストが終了すると[Liferayで通知](../../../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md) が送信されます。
```

A/Bテストの結果を確認し、バリアントを公開するには、

1. A/Bテストが実行されているコンテンツページに移動します。

1. コントロールメニューで、 **A/Bテスト** フラスコアイコン（![A/B Test icon](../../../images/icon-ab-testing.png)）をクリックします。

1. コンテントページに他のエクスペリエンスがある場合は、 ［**エクスペリエンス**］ を選択します。

1. ［**Active Test**］ セクションでテスト結果を確認します。

   * **勝者宣言** : 信頼度要件は満たされた。
   * **勝者なし** : 試験期間中、信頼度要件が満たされなかった。

   ![A/BテストパネルからA/Bテストの結果を確認します。](reviewing-ab-test-results-and-publishing-test-variants/images/01.png)

1. ［バリエーション］セクションから、次のことができます

   * **Publish** バリアントはチェックマークでハイライトされます。
   * **テストを破棄** して、A/Bテストの推奨事項を無視し、現在のコンテントページを維持する。

     ![勝利したバリアントを公開するか、A/Bテストの結果を破棄することができます。](reviewing-ab-test-results-and-publishing-test-variants/images/02.png)

   ```{note}
   A/B テストバリアントをパブリッシュすると、バリアントはコンテンツページを訪れるすべてのユーザーに対してアクティブになります。
   ```

A/Bテストパネルの ［**Analytics Cloudでデータを表示**］ ボタンをクリックして、Analytics Cloudのダッシュボードに移動し、他のテスト統計を表示できます。 詳細は、 [A/Bテスト](https://learn.liferay.com/w/analytics-cloud/optimization/a-b-testing) を参照してください。

## 関連トピック

* [A/Bテスト](./ab-testing.md)
* [A/Bテストの作成](./creating-ab-tests.md)
* [A/Bテスト要件の確認](./verifying-ab-test-requirements.md)
* [A/Bテストの実行と監視](./running-and-monitoring-ab-tests)
