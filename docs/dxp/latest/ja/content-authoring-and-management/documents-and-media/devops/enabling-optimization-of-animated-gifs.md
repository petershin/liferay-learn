# アニメーションGIFの最適化を有効にする

<!--TASK: Relocate to Adaptive Media section. -->

アニメーションGIFをスケーリングするために、アダプティブメディアは [Gifsicle](https://www.lcdf.org/gifsicle/) と呼ばれる外部ツールを使用します。 Gifsicleがインストールされておらず、`image/gif`がサポートされているMIMEタイプとして含まれている場合、Adaptive MediaはGIFの1フレームだけをスケーリングし、静的なGIFを作成します。

Adaptive Mediaを使用してアニメーションGIFを最適化するには、DXPが動作しているローカルサーバーにGifsicleをインストールし、環境変数`PATH`を設定し、DXPの **システム設定** でGifsicleを有効にするという3つのステップが必要です。

1. [Gifsicle](https://www.lcdf.org/gifsicle/) をインストールし、サーバー環境のパスに追加します。

1. **グローバルメニュー** &rarr; **コントロールパネル** に移動します。

   ![Navigate to the Control Panel.](./enabling-optimization-of-animated-gifs/images/01.png)

1. システム設定_をクリックします。

1. アダプティブ・メディア」をクリックする。

   ![Access the Adaptive Media system settings.](./enabling-optimization-of-animated-gifs/images/02.png)

1. 左ナビゲーションの「システム・スコープ」の下にある「画像」をクリックします。

1. 下にスクロールし、 **Gifsicle Enabled** の横のボックスをクリックします。

   ![Enable Gifsicle.](./enabling-optimization-of-animated-gifs/images/03.png)

1. 終了したら **Save** をクリックする。

## 関連トピック

* [アダプティブ・メディアの使用](../publishing-and-sharing/using-adaptive-media.md)
* [サイト・コンテンツにおける画像の使用](../publishing-and-sharing/using-adaptive-media/using-adapted-images-in-site-content.md)
