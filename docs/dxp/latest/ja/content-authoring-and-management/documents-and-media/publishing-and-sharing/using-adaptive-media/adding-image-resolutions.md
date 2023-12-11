# 画像解像度の追加

デフォルトでは、アダプティブ・メディアにはプレビューとサムネイルの2つの画像解像度があります。 一般的なデバイス（デスクトップ、ラップトップ、タブレット、携帯電話など）向けにサイトのパフォーマンスを最適化するために、画像の解像度を追加定義できます。 画像をアップロードすると、アダプティブメディアは既存の解像度を使用して、各バージョンの画像を自動的に生成します。 生成された画像はすべてオリジナルのアスペクト比を維持する。 [カスタム解像度を追加する前に画像がアップロードされた場合は、](./managing-image-resolutions.md#manually-generating-adapted-images) それらの画像の解像度バージョンを手動で生成する必要があります。

```{important}
さらなる解像度を生成するには、より多くの計算資源と記憶容量が必要になる。 パフォーマンスを最適化するために、非同期プロセスと利用可能なコアプロセスの最大数を設定できます。 詳しくは、 [Adaptive Media Configuration Reference](./adaptive-media-configuration-reference.md#processes) 。
```

![Add and manage images resolutions in the Adaptive Media application.](./adding-image-resolutions/images/01.png)

## 新しい画像解像度の追加

1. グローバルメニュー( ![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、_コントロールパネル_タブに移動し、_適応メディア_をクリックします。

1. *追加* (![追加ボタン](../../../../images/icon-add.png))をクリックします。

1. ユニークな名前と説明を入力してください。

1. 最大幅(*Max Width)*または最大高さ(*Max Height)*をピクセル単位で入力します。

   測定値を空白のままにすると、その値は `auto` に設定されます。

1. 高ピクセル密度ディスプレイ（HiDPI）用の解像度を追加するかどうかを決定する。

   このオプションを選択すると、セットサイズを2倍にする追加解像度が作成される。 この解決策は現在の解決策と同じ名前を使い、接尾辞に `-2x` をつける。

1. 決議の識別子を決定する：

   **自動**（デフォルト）：名前フィールドに基づくケバブ・ケース値を使用します。

   **カスタム**：カスタム値を入力します。

   サードパーティのアプリケーションは、このIDを使用して、アダプティブメディアのAPIを介して解像度の画像を取得できます。

   ![Enter a name, description, size, and identifier for the resolution.](./adding-image-resolutions/images/02.png)

1. ［_保存_］をクリックします。

この解像度が有効になっている間、アダプティブメディアはこの解像度を使用して、すべての新規アップロード用の画像を生成します。 また、 [以前にアップロードされた画像に対して、](./managing-image-resolutions.md#manually-generating-adapted-images) 適応された画像を手動で生成することもできます。

```{important}
画像の適用に解像度が使用されている場合、画像の解像度とその識別子を更新することはできません。 これにより、生成された画像の不整合が防止されます。
```

## 関連トピック

* [画像解像度の管理](./managing-image-resolutions.md) 
* [アダプティブ・メディア・コンフィギュレーション・リファレンス](./adaptive-media-configuration-reference.md) 
