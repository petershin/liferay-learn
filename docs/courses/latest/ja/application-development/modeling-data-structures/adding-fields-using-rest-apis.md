# REST APIを使ったフィールドの追加

`object-admin` サービスは、フィールドの追加など、オブジェクト定義に対する CRUD 操作を実行するための REST API を提供します。 ここでは、これらのAPIを使用して、Distributor Applicationオブジェクトにビジネスフィールドと信用参照フィールドを追加します。

1. [この練習のためのリソース](./liferay-p6k3.zip) をダウンロードして解凍してください。

   ```bash
   curl https://learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/adding-fields-using-rest-apis/liferay-p6k3.zip -O
   ```

   ```bash
   unzip liferay-p6k3.zip
   ```

   この.zipファイルには、 `object-admin` REST APIを呼び出すシェルスクリプトが含まれています。

1. `liferay-p6k3/curl`に移動する。

   ```bash
   cd liferay-p6k3/curl
   ```

1. このスクリプトを実行して、ビジネス情報を格納するためのフィールドを作成する：

   ```bash
   ./ObjectField_POST_BusinessDetails_ByExternalReferenceCode.sh
   ```

   | 項目名                           | 種類       |
   |:----------------------------- |:-------- |
   | `businessName`                | テキスト     |
   | `businessWebsite`             | テキスト     |
   | `businessEstablishedDate`     | 日付       |
   | `businessEmployeeNumber`      | 整数       |
   | `businessAnnualRevenue`       | テキストボックス |
   | `businessOtherBrandsOffered`  | 長いテキスト   |
   | `businessPhoneNumber`         | テキストボックス |
   | `businessAddressLineOne`      | テキストボックス |
   | `businessAddressLineTwo`      | テキストボックス |
   | `businessCity`                | テキストボックス |
   | `businessStateProvinceRegion` | テキストボックス |
   | `businessZipPostalCode`       | テキストボックス |
   | `businessCountry`             | テキストボックス |
   | `businessLicenseNumber`       | テキストボックス |
   | `businessResaleNumber`        | テキストボックス |
   | `businessTaxIDNumber`         | テキストボックス |
   | `businessLicense`             | 添付ファイル   |
   | `businessProofOfInsurance`    | 添付ファイル   |

1. ビジネスの銀行詳細を保存するためのフィールドを作成します：

   ```bash
   ./ObjectField_POST_BankDetails_ByExternalReferenceCode.sh
   ```

   | 項目名                       | 種類       |
   |:------------------------- |:-------- |
   | `bankName`                | テキストボックス |
   | `bankAccountNumber`       | テキストボックス |
   | `bankPhoneNumber`         | テキストボックス |
   | `bankAddressLineOne`      | テキストボックス |
   | `bankAddressLineTwo`      | テキストボックス |
   | `bankCity`                | テキストボックス |
   | `bankStateProvinceRegion` | テキストボックス |
   | `bankZIPPostalCode`       | テキストボックス |
   | `bankCountry`             | テキストボックス |

1. ビジネス・リファレンスの詳細を受け取るためのフィールドを作成する：

   ```bash
   ./ObjectField_POST_BusinessReference_ByExternalReferenceCode.sh
   ```

   | 項目名                            | 種類       |
   |:------------------------------ |:-------- |
   | `referenceSupplierName`        | テキストボックス |
   | `referencePhoneNumber`         | テキストボックス |
   | `referenceAddressLineOne`      | テキストボックス |
   | `referenceAddressLineTwo`      | テキストボックス |
   | `referenceCity`                | テキストボックス |
   | `referenceStateProvinceRegion` | テキストボックス |
   | `referenceZIPPostalCode`       | テキストボックス |
   | `referenceCountry`             | テキストボックス |

完了すると、Distributor Applicationには48のフィールドが追加されます。

![ディストリビューター・アプリケーション・オブジェクトは48のフィールドを持つ。](./adding-fields-using-rest-apis/images/01.png)

これらのフィールドは、Delectable BonsaiがKYCポリシーとAML法に準拠して各申請者を評価し、審査するために必要なデータを収集するのに役立ちます。

そして、各パートナーシップのビジネス価値を評価するための情報を収集する必要がある。

次へ [ディストリビューター・アプリケーション用のピックリストの作成](./creating-picklists-for-distributor-applications.md)
