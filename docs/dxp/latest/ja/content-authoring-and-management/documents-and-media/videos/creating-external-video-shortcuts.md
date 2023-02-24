# 外部ビデオショートカットの作成

> Liferay 7.4以降で利用可能

Liferayのドキュメントとメディアアプリケーションを使用すると、外部プラットフォームでホストされているビデオへの参照を保存できます。 これらの参照を使用して、Liferayアセットまたはサイトページに[ビデオを埋め込む](./embedding-videos-into-liferay-assets-and-pages.md)ことができます。 YouTube、Facebook、Vimeo、Twitchはすぐにサポートされますが、この機能を拡張して、 [カスタムのビデオソースをサポートすることができます](../developer-guide/creating-video-shortcut-providers.md).

次の手順に従って、外部ビデオショートカットを作成します。

1. サイトまたはアセットライブラリでドキュメントとメディアアプリケーションに移動します。

   ```{note}
   サイトで作成されたショートカットはそのサイトにスコープされますが、アセットライブラリで作成されたショートカットは複数のサイト間で共有できます。 詳しくは、 [アセットライブラリの概要](../../asset-libraries/asset-libraries-overview.md) をご覧ください。
   ```

2. **追加** ボタン（![Add Button](../../../images/icon-add.png)）をクリックして、 ［**External Video Shortcut**］ を選択します。

   ![新しい外部ビデオショートカットを追加します。](./creating-external-video-shortcuts/images/01.png)

3. サポートされているプラットフォーム（YouTube、Vimeo、Facebook、またはTwitch）からのビデオURLを入力します。

   YouTubeとVimeoの動画にはURLサムネイルが表示されます。 FacebookとTwitchのビデオでは表示されません。

   ![ビデオのURLを入力します。](./creating-external-video-shortcuts/images/02.png)

4. ショートカットのタイトルを入力します。

   このフィールドは、YouTubeとVimeoの場合は自動入力されます。 FacebookとTwitchは手動入力が必要です。

5. （オプション）ビデオのディスプレイページテンプレートを選択します。

   選択したテンプレートは、一意のフレンドリURLでビデオを表示し、表示ページのレイアウトを定義します。 詳細は、[表示ページテンプレートの作成と管理](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)を参照してください。

   ![ビデオのディスプレイページテンプレートを選択します。](./creating-external-video-shortcuts/images/03.png)

6. (オプション）[タグとカテゴリー](../../tags-and-categories/organizing-content-with-categories-and-tags.md)を使って、ビデオのショートカットを分類します。

7. （オプション）ビデオショートカットの関連するアセットを選択します。

8. （オプション）ビデオショートカットの権限を構成します。

9. 完了したら、 ［**Publish**］ をクリックします。

   他のドキュメントとメディアアセットと同様に、外部のビデオショートカットを表示および管理できます。

   ![ドキュメントとメディアで外部ビデオショートカットを表示および管理します。](./creating-external-video-shortcuts/images/04.png)

作成した外部ビデオショートカットは、ほとんどのLiferayアセットに埋め込むことができます。 詳しくは、 [Liferayアセットとページへの動画の埋め込み](./embedding-videos-into-liferay-assets-and-pages.md) をご覧ください。

## 追加情報

* [Liferayアセットとページへのビデオの埋め込み](./embedding-videos-into-liferay-assets-and-pages.md)
* [カスタムビデオショートカットプロバイダーの作成](../developer-guide/creating-video-shortcut-providers.md)
