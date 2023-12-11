# REST APIを使ったピックリストの作成

`headless-admin-list-type` サービスはピックリストの CRUD 操作を行うための REST API を提供する。 これらのAPIを使用すると、UIから手動でピックリストを作成するよりもはるかに効率的です。なぜなら、事前に設定されたERCとローカライズされた名前を持つリストとアイテムを、ワンステップで追加できるからです。 ここでは、これらのAPIを使用して、Distributor Applicationオブジェクトの残りのピックリストを追加します。

1. [この演習のリソースをダウンロードし、解凍してください](./liferay-r5w2.zip) 。

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/liferay-r5w2.zip -O
   ```

   ```bash
   unzip liferay-r5w2.zip
   ```

   この.zipファイルには、`headless-admin-list-type` REST APIを使って残りのピックリストを作成するためのシェルスクリプトが含まれています。

1. `liferay-r5w2`フォルダ内の`curl`フォルダに移動します。

   ```bash
   cd liferay-r5w2/curl
   ```

1. このスクリプトを実行して、Distribution Regionsピックリストを作成します：

   ```bash
   ./ListTypeDefinition_POST_DistributionRegions_ToInstance.sh
   ```

   **ックリスト**

   | 名前   | 外部参照コード                     |
   | :--- | :-------------------------- |
   | 販売地域 | `LIST_DISTRIBUTION_REGIONS` |

   **ピックリスト項目**

   | 名前         | キー               | 外部参照コード                   |
   | :--------- | :--------------- | :------------------------ |
   | ラテンアメリカ    | `latinAmerica`   | `REGION_LATIN_AMERICA`    |
   | カリビアン      | `caribbean`      | `REGION_CARIBBEAN`        |
   | 東ヨーロッパ     | `easternEurope`  | `REGION_EASTERN_EUROPE`   |
   | 西ヨーロッパ     | `westernEurope`  | `REGION_WESTERN_EUROPE`   |
   | 中東         | `middleEast`     | `REGION_MIDDLE_EAST`      |
   | アフリカ       | `africa`         | `REGION_AFRICA`           |
   | 中央アジア      | `centralAsia`    | `REGION_CENTRAL_ASIA`     |
   | アジア・環太平洋地域 | `asiaPacificRim` | `REGION_ASIA_PACIFIC_RIM` |
   | インド        | `india`          | `REGION_INDIA`            |
   | 北米         | `northAmerica`   | `REGION_NORTH_AMERICA`    |

1. ピックリストを作成します：

   ```bash
   ./ListTypeDefinition_POST_DistributionChannels_ToInstance.sh
   ```

   **ピックリスト**

   | 名前     | 外部参照コード                      |
   | :----- | :--------------------------- |
   | 流通チャネル | `LIST_DISTRIBUTION_CHANNELS` |

   **ピックリスト項目**

   | 名前        | キー               | 外部参照コード                   |
   | :-------- | :--------------- | :------------------------ |
   | 他の小売店への販売 | `otherRetailers` | `CHANNEL_OTHER_RETAILERS` |
   | 自社販売      | `ownRetail`      | `CHANNEL_OWN_RETAIL`      |
   | 電子商取引     | `eCommerce`      | `CHANNEL_E_COMMERCE`      |

1. オーダータイプのピックリストを作成します：

   ```bash
   ./ListTypeDefinition_POST_OrderTypes_ToInstance.sh
   ```

   **ピックリスト**

   | 名前         | 外部参照コード            |
   | :--------- | :----------------- |
   | コマースの注文タイプ | `LIST_ORDER_TYPES` |

   **ピックリスト項目**

   | 名前           | キー                | 外部参照コード                       |
   | :----------- | :---------------- | :---------------------------- |
   | 卸売り          | `wholesale`       | `ORDER_TYPE_WHOLESALE`        |
   | プライベート・ラベリング | `privateLabeling` | `ORDER_TYPE_PRIVATE_LABELING` |
   | 一括フォーマット     | `bulkFormats`     | `ORDER_TYPE_BULK_FORMATS`     |
   | 不明           | `notSure`         | `ORDER_TYPE_NOT_SURE`         |

1. Product Typesピックリストを作成します：

   ```bash
   ./ListTypeDefinition_POST_ProductTypes_ToInstance.sh
   ```

   **ピックリスト**

   | 名前   | 外部参照コード              |
   | :--- | :------------------- |
   | 商品種類 | `LIST_PRODUCT_TYPES` |

   **ピックリスト項目**

   | 名前              | キー                   | 外部参照コード                            |
   | :-------------- | :------------------- | :--------------------------------- |
   | メープルシロップ        | `mapleSyrup`         | `PRODUCT_TYPE_MAPLE_SYRUP`         |
   | オーガニック・メープルシロップ | `organicMapleSyrup`  | `PRODUCT_TYPE_ORGANIC_MAPLE_SYRUP` |
   | メープルバター         | `mapleButter`        | `PRODUCT_TYPE_MAPLE_BUTTER`        |
   | メープルシュガー        | `mapleSugar`         | `PRODUCT_TYPE_MAPLE_SUGAR`         |
   | メープル・フォンダン      | `mapleFondant`       | `PRODUCT_TYPE_MAPLE_FONDANT`       |
   | メープルゼリー         | `mapleJelly`         | `PRODUCT_TYPE_MAPLE_JELLY`         |
   | 樹木              | `trees`              | `PRODUCT_TYPE_TREES`               |
   | 苗木              | `saplings`           | `PRODUCT_TYPE_SAPLINGS`            |
   | 教育コンテンツ         | `educationalContent` | `PRODUCT_TYPE_EDUCATIONAL_CONTENT` |
   | その他             | `other`              | `PRODUCT_TYPE_OTHER`               |

1. 年間購入数量のピックリストを作成します：

   ```bash
   ./ListTypeDefinition_POST_AnnualPurchaseVolumes_ToInstance.sh
   ```

   **ピックリスト**

   | 名前    | 外部参照コード                        |
   | :---- | :----------------------------- |
   | 年間購入量 | `LIST_ANNUAL_PURCHASE_VOLUMES` |

   **ピックリスト項目**

   | 名前                    | キー           | 外部参照コード              |
   | :-------------------- | :----------- | :------------------- |
   | 50,000ドル - 100,000ドル  | `firstTier`  | `VOLUME_FIRST_TIER`  |
   | 200,000ドル - 500,000ドル | `secondTier` | `VOLUME_SECOND_TIER` |
   | 50万～100万米ドル           | `thirdTier`  | `VOLUME_THIRD_TIER`  |
   | 100万ドル以上              | `fourthTier` | `VOLUME_FOURTH_TIER` |

1. 商品ラベル」ピックリストを作成します：

   ```bash
   ./ListTypeDefinition_POST_ProductLabels_ToInstance.sh
   ```

   **ピックリスト**

   | 名前    | 外部参照コード               |
   | :---- | :-------------------- |
   | 製品ラベル | `LIST_PRODUCT_LABELS` |

   **ピックリスト項目**

   | 名前       | キー           | 外部参照コード             |
   | :------- | :----------- | :------------------ |
   | スタンダードUS | `standardUS` | `LABEL_STANDARD_US` |
   | ローカライズ済み | `localized`  | `LABEL_LOCALIZED`   |

完成したら、7つのピックリストができるはずだ：

![Create these picklists for use in the Distributor Application object.](./creating-picklists-using-rest-apis/images/01.png)

このフィールドを使用して、Distributor Application オブジェクトに単一選択フィールドと複数選択フィールドを作成することができます。

次へ [オブジェクトにピックリストフィールドを追加する](./adding-picklist-fields-to-the-object.md) 

## 関連コンセプト

* [ピックリストAPIの基本](https://learn.liferay.com/en/w/dxp/building-applications/objects/picklists/picklists-api-basics) 
