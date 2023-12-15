# ドキュメントとメディアプレビューの設定

{bdg-secondary}`liferay 7.4 U84+/GA84+`.

デフォルトでは、Liferay は [PDFBox](https://pdfbox.apache.org) を使ってドキュメントライブラリに追加されたファイルのプレビューを生成します。 これは、PDFBoxがDXPで配布できる唯一の100％ Javaベースのツールであるためです。

しかし、PDFBoxは限られたファイルタイプにしか対応していないため、Liferayはサードパーティのサービスとの統合も提供し、追加のファイルタイプにも対応しています。 これらのサービスを利用することで、より多くのファイルに対して、より迅速に高品質のファイルプレビューを生成することができます。

```{important}
サードパーティのサービスを使用してプレビューを生成するには、まずLiferayインスタンスを実行しているサーバーにそれらをインストールする必要があります。 
```

Liferayは現在、これらのサービスとの統合をサポートしています：

* [LibreOffice](http://www.libreoffice.org) または [OpenOffice](http://www.openoffice.org) : これらのプログラムは、サポートされているファイルタイプ (`.pdf`, `.docx`, `.odt`, `.ppt`, `.odp` など) のサムネイルとプレビューを生成するためにサーバーモードで使用することができます。 また、これらを使用してドキュメントを変換し、ブラウザで表示することもできます。 詳細は、 [OpenOffice / LibreOffice統合の有効化](./enabling-openoffice-libreoffice-integration.md) を参照してください。

* [ImageMagick](http://www.imagemagick.org) （ [Ghostscript](http://www.ghostscript.com) も必要です）：これらのプログラムは、画像ファイルの高速で高品質のプレビューと変換を提供します。 詳細は、 [Enabling ImageMagick and Ghostscript](../../../system-administration/using-the-server-administration-panel/configuring-external-services.md#enabling-imagemagick-and-ghostscript) を参照してください。

* [FFmpeg](http://ffmpeg.org/) ：このプログラムは、音声ファイルとビデオファイルのサポートを提供します。 ファイルのプレビューを生成するだけでなく、ブラウザのネイティブHTML 5プレーヤーでマルチメディアを再生することもできます。 詳細は、 [音声とビデオのプレビュー用にFFmpegを有効にする](./enabling-ffmpeg-for-audio-and-video-previews.md) を参照してください。

   ```{note}
   Liferay 7.3.xとそれ以前のバージョンでは、オーディオとビデオのプレビューを生成するために [Xuggler](http://www.xuggle.com/xuggler) を使用しています。 詳しくは [Xuggler](../../../system-administration/using-the-server-administration-panel/configuring-external-services.md#enabling-xuggler) をご覧ください。
   ```

これらのサービスをインストールして設定すれば、Documents and Mediaはほとんどのファイルタイプのアプリケーション内プレビューを提供できる。

## ImageMagickでサポートされるメディアタイプの設定

ImageMagickをインストールしている場合、Adaptive Mediaはそれを使ってドキュメントライブラリに保存されている画像の代替解像度を生成することができます。 デフォルトでは、ImageMagick は `avif`、`gif`、`heic`、`tiff`、`webp` ファイルをサポートしているが、必要に応じてメディアタイプを追加することができる。 詳しくは、 [Adaptive Media Configuration Reference](../publishing-and-sharing/using-adaptive-media/adaptive-media-configuration-reference.md#imagemagick) 。

## プレビューとサムネイルの手動生成

サードパーティのサービスを有効にすると、Liferayは自動的にそれらを使用して、サポートされているメディアタイプのプレビューとサムネイルを生成します。 ただし、これらのサービスを有効にする前にアセットをアップロードした場合は、サムネイルとプレビューを手動で生成する必要があります。

画像ファイル用に生成するには、アダプティブ・メディアを使用します。 詳しくは [画像解像度の管理](../publishing-and-sharing/using-adaptive-media/managing-image-resolutions.md) を参照してください。

オーディオ、ビデオ、PDF、OpenOfficeファイルについては、サーバー管理アプリケーションからプレビューとサムネイルを再生成できます：

1. [グローバルメニュー](../../../images/icon-applications-menu.png) を開き、[コントロールパネル] タブを開き、[システム管理] をクリックします。

1. **リソース** タブに移動します。

1. 再生オプション]で、希望のメディアタイプの[**実行**]をクリックします。

   ![Under Regeneration Options, execute the desired media type.](./configuring-documents-and-media-previews/images/01.png)

これにより、文書の欠落画像の生成が始まる。 この処理を実行しても、既存のプレビューやサムネイルには影響しません。 すべてのプレビューとサムネイルを再生成したい場合は、まずこのクリーンアップ・アクションを実行してください：*ドキュメントとメディアのプレビューとサムネイルファイルをリセットします。

![Execute Reset preview and thumbnail files for documents and media.](./configuring-documents-and-media-previews/images/02.png)

この処理は、アダプティブメディアのプレビューや画像ファイルのサムネイルには影響しません。 これらを管理するには、 [Adaptive Media](../publishing-and-sharing/using-adaptive-media.md) を使用します。

## 関連トピック

* [ファイルの管理](../uploading-and-managing/managing-files.md)
* [ドキュメントとメディア UIリファレンス](../documents-and-media-ui-reference.md)
* [OpenOfficeとLibreOfficeの統合を有効にする](./enabling-openoffice-libreoffice-integration.md)
