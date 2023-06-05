# ジオロケーション別セグメント

{bdg-secondary}`利用可能な Liferay DXP 7.4 U44+/GA44+`

**Segments** by geolocation を設定することで、ユーザーの国によって異なるページを動的に表示したり、コンテンツを表示したりすることができます。 異なるページを表示する場合は、 [Experiences](../experience-personalization/content-page-personalization.md#understanding-how-experiences-work) 、ページ内の特定のコンテンツを表示する場合は、 [Collections](../experience-personalization/personalizing-collections.md)を使用します。

## 地理的な位置によるセグメントの作成

まず、 **User Segment** の手順に従って、 [Creating User Segment](./creating-and-managing-user-segments.md#creating-user-segments) を作成します。

1. 作成したら、 **IP Geocoder Country** セッションプロパティをキャンバスにドラッグ＆ドロップします。

1. 比較のドロップダウンから4つの条件のうち1つを選択します： **equals** , **not equals** , **contains** , **not contains** .

   ![IP Geocoder Countryセッションプロパティを使用して、ジオロケーションによるSegmentを作成します。](./segmentation-by-geolocation/images/01.png)

1. 国」ドロップダウンから「国」を選択します。

1. ［**Save**］ をクリックします。

複数のプロパティを条件付きで組み合わせることができます。 条件の組み合わせについては、 [セグメント条件を設定する](./creating-and-managing-user-segments.md#configuring-segment-conditions) を参照してください。 一度作成したSegmentは、ユーザーにパーソナライズされた体験を提供するために使用することができます。 詳しくは、 [コンテンツページのパーソナライズ](../experience-personalization/content-page-personalization.md) および [コレクションのパーソナライズ](../experience-personalization/personalizing-collections.md) を参照してください。

## ジオロケーションデータベースを設定する

ジオロケーションデータベースは、IPアドレスとその発信国のマッピングを含んでいます。 これを設定するには

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **システム設定** に進みます。
1. **プラットフォーム** の項目から、 **サードパーティ** をクリックします。

   ![カスタムジオロケーションデータベースのファイルパスを設定することができます。](./segmentation-by-geolocation/images/02.png)

1. 左メニューの **IP Geocoder Configuration** をクリックし、カスタムジオロケーションデータベースへのパスを設定します。

ファイルパスはデフォルトで空です。 空の場合は、無償の [GeoLite2](https://dev.maxmind.com/geoip/geolite2-free-geolocation-data?lang=en) データベースを使用して IP アドレスを解決します。 オプションとして、サーバー上の `.mmdb` 拡張子を持つ別のジオロケーションデータベースへのパスを設定し、デフォルトのデータベースを上書きすることができます。

## 関連トピック

* [セグメント条件の設定](./creating-and-managing-user-segments.md#configuring-segment-conditions)
* [コンテントページのパーソナライゼーション](../experience-personalization/content-page-personalization.md)
* [コレクションのパーソナライズ](../experience-personalization/personalizing-collections.md)
