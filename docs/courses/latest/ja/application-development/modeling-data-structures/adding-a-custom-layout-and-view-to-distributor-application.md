# ディストリビューター・アプリケーションにカスタムレイアウトとカスタムビューを追加する

50以上のフィールドを持つ現在のディストリビューター・アプリケーションのユーザー・インターフェイスは、エントリーの作成と表示にはもはや実行不可能です。 これは、デフォルトの [レイアウト](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/layouts) と [ビュー](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/views) が、すべてのオブジェクト・フィールドを含み、アルファベット順に表示するためです。 レイアウトはオブジェクト・エントリーを作成・編集するためのUIを提供し、ビューは既存のエントリーを表示・管理するためのUIを提供する。

データ構造のモデリングを進める前に、cURLスクリプトを使用してDistributor Application用のカスタムレイアウトとビューを作成します。

```{note}
その後のレッスンでは、Liferayのページビルダー機能を使って、魅力的でレスポンシブなユーザーインターフェイスをデザインする方法を探ります。 ここでは、カスタムレイアウトとカスタムビューは、開発中のデモンストレーション目的で使用されています。
```

## レイアウトとビューの追加

1. [この演習のリソースをダウンロードし、解凍してください](./liferay-t7z2.zip) 。

   ```bash
   curl https://learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/liferay-t7z2.zip -O
   ```

   ```bash
   unzip liferay-t7z2.zip
   ```

   この .zip ファイルには、 `object-admin` REST API を使用して、Distributor Application オブジェクトにレイアウトとビューを追加するシェルスクリプトが含まれています。

1. `liferay-t7z2/curl`に移動する。

   ```bash
   cd liferay-t7z2/curl
   ```

1. このスクリプトを実行してレイアウトを追加する：

   ```bash
   ./ObjectLayout_POST_BasicLayout_ByExternalReferenceCode.sh
   ```

1. Distributor Application オブジェクトの Layouts タブに Basic Layout が表示されていることを確認します。

   ![Distributor Application オブジェクトの Layouts タブに Basic Layout が表示されていることを確認します。](./adding-a-custom-layout-and-view-to-distributor-application/images/01.png)

   レイアウトには2つのタブがあり、フィールドは折りたたみ可能なブロックに整理されている：

   * 最初のタブはエントリー作成時に利用でき、6つのセクションがあります：一般詳細」、「連絡先情報」、「ビジネス詳細」、「ビジネス住所」、「追加ビジネス情報」、「添付ファイル」です。

   * 2つ目のタブは、既存の申請書を編集する場合にのみ利用でき、2つのセクションがあります：銀行詳細」と「信用照会詳細」です。

   ![レイアウトはフィールドを2つのタブに整理する。](./adding-a-custom-layout-and-view-to-distributor-application/images/02.png)

1. ビューを追加する：

   ```bash
   ./ObjectView_POST_BasicView_ByExternalReferenceCode.sh
   ```

1. Distributor Application オブジェクトの Views タブに Basic View が表示されていることを確認します。

   ![Distributor Application オブジェクトの Views タブに Basic View が表示されていることを確認します。](./adding-a-custom-layout-and-view-to-distributor-application/images/03.png)

   ビューには5つの列があります：ID、申請者名、ビジネス名、作成日、ステータス。

   ![ビューには5つの列があります：ID、申請者名、ビジネス名、作成日、ステータス。](./adding-a-custom-layout-and-view-to-distributor-application/images/04.png)

カスタムレイアウトとカスタムビューは、ディストリビューターアプリケーションのデフォルトとしてマークされているため、すぐにアクティブになります。

## カスタムレイアウトとカスタムビューの使用

ディストリビューター・アプリケーション・オブジェクトにエントリーを作成する練習をし、オブジェクトが新しいレイアウトとビューを使用していることを確認します。

* レイアウト:

   ![レイアウトには2つのタブがあり、フィールドは折りたたみ可能なブロックに整理されている。](./adding-a-custom-layout-and-view-to-distributor-application/images/05.png)

* 表示:

   ![ビューは5つのカラムを持つテーブルを定義する。](./adding-a-custom-layout-and-view-to-distributor-application/images/06.png)

ここまでで、KYCポリシーに従うため、AML法を遵守するため、そして各アプリケーションの将来的な価値を評価するために、Delectable Bonsaiが必要とするすべてのフィールドとピックリストを追加しました。

今、Delectable Bonsaiは評価メモを保存し、特定の用途に関連付ける方法を必要としている。 そのために、アプリケーション評価定義を設定し、オブジェクトのリレーションシップを実装します。

次へ [アプリケーション評価オブジェクトの設定](./setting-up-the-application-evaluation-object.md)

## 関連コンセプト

* [レイアウト](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/layouts)
* [閲覧数](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/views)
