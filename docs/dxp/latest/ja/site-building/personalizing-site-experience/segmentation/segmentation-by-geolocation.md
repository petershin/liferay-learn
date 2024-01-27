# 地理的位置による区分

{bdg-secondary}`liferay DXP 7.4 U44+/GA44+`.

ジオロケーションによって_セグメント_を設定し、ユーザーの国に基づいて異なるページやコンテンツを動的に表示することができます。 異なるページを表示するには、 [Experiences](../experience-personalization/content-page-personalization.md#understanding-how-experiences-work) を使用し、ページ上の特定のコンテンツを表示するには、 [Collections](../experience-personalization/personalizing-collections.md) を使用します。

## ジオロケーションによるセグメントの作成

まず、 [Creating User Segments](./creating-and-managing-user-segments.md#creating-user-segments) の手順に従って、_User Segment_ を作成します。

1. 作成したら、_IP Geocoder Country_ セッション・プロパティをキャンバスにドラッグ・アンド・ドロップします。

1. 比較のドロップダウンから4つの条件のいずれかを選択します：_equals_、_not equals_、_contains_、_not contains_。

   ![Use the IP Geocoder Country session property to create a Segment by geolocation.](./segmentation-by-geolocation/images/01.png)

1. 国のドロップダウンから国を選択します。

1. ［_保存_］をクリックします。

複数のプロパティを条件付きで組み合わせることができます。 コンディションの組み合わせについては、 [セグメント・コンディションの設定](./creating-and-managing-user-segments.md#configuring-segment-conditions) を参照のこと。 一度作成すると、このセグメントを使用して、ユーザーにパーソナライズされたエクスペリエンスを作成することができます。 詳しくは、 [コンテンツページのパーソナライズ](../experience-personalization/content-page-personalization.md) および [コレクションのパーソナライズ](../experience-personalization/personalizing-collections.md) をご覧ください。

## ジオロケーション・データベースの設定

ジオロケーション・データベースには、IPアドレスとその発信国のマッピングが含まれている。 これを設定するには

1. *グローバルメニュー* ([グローバルメニュー](../../../images/icon-applications-menu.png))を開き、_コントロールパネル_ &rarr; _システム設定_ に進みます。

1. プラットフォーム_セクションから_サードパーティ*をクリックします。

   ![You can set the file path to a custom geolocation database.](./segmentation-by-geolocation/images/02.png)

1. 左のメニューから_IP Geocoder Configuration_をクリックして、カスタムジオロケーションデータベースへのパスを設定します。

ファイルパスはデフォルトでは空です。 空の場合は、無料の [GeoLite2](https://dev.maxmind.com/geoip/geolite2-free-geolocation-data?lang=en) データベースを使用してIPアドレスを解決します。 オプションで、サーバー上の `.mmdb` 拡張子を持つ別のジオロケーションデータベースへのパスを設定し、デフォルトのデータベースを上書きすることもできます。

## 関連トピック

* [セグメント条件の設定](./creating-and-managing-user-segments.md#configuring-segment-conditions)
* [コンテンツページのパーソナライゼーション](../experience-personalization/content-page-personalization.md)
* [パーソナライズ・コレクション](../experience-personalization/personalizing-collections.md)
