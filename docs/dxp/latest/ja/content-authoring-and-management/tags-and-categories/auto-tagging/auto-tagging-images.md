# 画像の自動タグ付け

[アセットの自動タグ付けを有効](./configuring-asset-auto-tagging.md)にしたら、画像の自動タグ付けを有効にすることもできます。 画像の自動タグ付けは、ドキュメントとメディアライブラリにアップロードされた画像にタグを付けます。

```{tip}
現在、自動的に適用されるタグは英語のみです。
```

デフォルトでは、画像の自動タグ付けは無効になっています。 DXPで自動タグ付けを有効にすることに加えて、画像タグ付けプロバイダーも設定する必要があります。 3つのプロバイダーを使用できます。

* [**TensorFlow:**](#configuring-tensorflow-image-auto-tagging) 機械学習機能を提供するオープンソースのライブラリ。 DXPでのTensorFlow画像の自動タグ付けは、[Java用のTensorFlowの`LabelImage`サンプル](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/java/src/main/java/org/tensorflow/examples/LabelImage.java)に基づいており、Inception5hモデルを使用します。 精度に制限があるため、注意して使用してください。

* [**Google Cloud Vision:**](#configuring-google-cloud-vision) [Google Cloud Vision API](https://cloud.google.com/vision/) を使用して、画像に自動的にタグを付けます。

* [**Microsoft Cognitive Services:**](#configuring-microsoft-cognitive-services) [Microsoft Cognitive Services](https://azure.microsoft.com/en-us/services/cognitive-services/)を使用して、画像に自動的にタグを付けます。

![この画像には、貨車と電気機関車のタグが自動的に付けられています。](./auto-tagging-images/images/01.png)

## TensorFlow 画像の自動タグ付けを設定する

1. _［グローバルメニュー］_ &rarr; _［コントロールパネル］_をクリックします。
1. _［システム設定］_をクリックします。

    ![システム設定に移動します.](./auto-tagging-images/images/02.png)

1. _［コンテンツとデータ］_の_［アセット］_をクリックします。

    ![［アセット］をクリックします。](./auto-tagging-images/images/03.png)

1. _［仮想インスタンススコープ］_の下で、_［TensorFlow 画像の自動タグ付け］_をクリックします。
1. フォームに入力します。
1. 完了したら、_［保存］_をクリックします。

フォームには次の情報が必要です。

**TensorFlowによる画像の自動タグ付けを有効にする:** このボックスをオンにすると、アセットの自動タグ付けが有効になっているインスタンスで、画像の自動タグ付けをデフォルトで有効にするかどうかを選択します。

**信頼度閾値:** TensorFlowは、タグごとに0〜1の信頼度レベルを割り当てます。1が最高の信頼度、0が最低の信頼度です。 このフィールドでは、TensorFlowがタグを適用するために必要な最小信頼度レベルを設定します。 TensorFlowはタグを適用する前により多くの信頼度を必要とするため、値が高いほどタグは少なくなります。 値が小さいほど、タグが多くなります。

![ポータルインスタンスのTensorFlow画像の自動タグ付けを設定します。](./auto-tagging-images/images/04.png)

### TensorFlow自動タグ付けフォーマンスの最適化

1. _［グローバルメニュー］_ &rarr; _［コントロールパネル］_をクリックします。
1. _［システム設定］_をクリックします。
1. _［アセット］_ をクリックします。
1. _［システムスコープ］_の下で、_［TensorFlow 画像の自動タグ付けプロセス］_をクリックします。
1. フォームに入力します。
1. _［保存］_をクリックして設定を適用します。

フォームには次の情報が必要です。

**最大再起動回数:** プロセスが永続的に無効になる前にクラッシュできる最大回数。

**最大再起動間隔:** カウンターがリセットされるまでの時間（秒単位）。

![ポータルでTensorFlow 画像の自動タグ付けを実行するプロセスを微調整できます。](./auto-tagging-images/images/05.png)

TensorFlowプロバイダーが設定されました。

## Google Cloud Visionの設定

1. _［グローバルメニュー］_ &rarr; _［コントロールパネル］_をクリックします。
1. _［システム設定］_をクリックします。
1. _［アセット］_ をクリックします。
1. _［仮想インスタンススコープ］_の下で、_［Google Cloud Visionによる画像の自動タグ付け］_をクリックします。
1. Google Cloud VisionのAPIキーを入力します。 詳細は、[GoogleのAPIキーに関するドキュメンテーション](https://cloud.google.com/docs/authentication/api-keys)を参照してください。
1. _［Enabled］_ボックスをオンにして、Google Cloud Visionを有効にします。

   ![Google Cloud VisionプロバイダーにはAPIキーが必要です。](./auto-tagging-images/images/06.png)

1. 完了したら、_［保存］_をクリックします。

## Microsoft Cognitive Servicesの設定

1. _［グローバルメニュー］_ &rarr; _［コントロールパネル］_をクリックします。
1. _［システム設定］_をクリックします。
1. _［アセット］_ をクリックします。
1. _［仮想インスタンススコープ］_の下で、_［Microsoft Cognitive Serviceによる画像の自動タグ付け］_をクリックします。
1. フォームに入力します。
1. _［Enabled］_ボックスをオンにします。

    ![Microsoft Cognitive Servicesプロバイダーには、APIキーとエンドポイントが必要です。](./auto-tagging-images/images/07.png)

1. 完了したら、_［保存］_をクリックします。

フォームには次の情報が必要です。

**APIキー:** Computer Vision API V2の[APIキー](https://azure.microsoft.com/en-us/try/cognitive-services/my-apis/?apiSlug=computer-services)。

**APIエンドポイント:** [Computer Vision API V2](https://westcentralus.api.cognitive.microsoft.com/vision/v2.0)のエンドポイント。

Microsoft CognitiveServicesプロバイダーが設定されました。 詳細は、 [Microsoft Cognitive Servicesのドキュメンテーション](https://docs.microsoft.com/en-us/azure/cognitive-services/)を参照してください。

複数の仮想インスタンスがある場合は、各インスタンスを個別に設定できます。 _［コントロールパネル］_ &rarr; _［Instance Settings］_に移動します。 _［アセット］_をクリックし、そこでプロバイダーを設定します。

## 追加情報

* [アセットの自動タグ付けの設定](./configuring-asset-auto-tagging.md)
* [Auto Tagging Assets](./auto-tagging-assets.md)
