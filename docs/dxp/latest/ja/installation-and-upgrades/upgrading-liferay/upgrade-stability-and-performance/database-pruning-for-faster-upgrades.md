# データベースのプルーニングによるアップグレードの高速化

データ量が多いほど、データアップグレードに時間がかかります。 不要なサイトデータは、よくあることです。 不要なデータをデータベースから剪定することで、アップグレード処理のパフォーマンスを向上させることができます。

例えば、サイトでは、ウェブコンテンツの記事やドキュメント、メディアファイルなどの未使用のバージョンが多数保存されている場合があります。 改訂が終わり、途中の改訂が必要ない場合は、安全に削除することができます。 これにより、省スペース化とアップグレード時間の短縮を実現しました。

ここでは、データベースの剪定に関するトピックを紹介します。

* 重複するWeb コンテンツストラクチャーのフィールド名を削除する
* 未使用のオブジェクトの検索と削除
* プルーニングされたデータベースのコピーを使用してテストする

## 廃止されたデータの削除

データベースに、廃止されたデータや廃止された機能から残ったデータが含まれている可能性があります。 どちらも簡単に削除できます。

{bdg-secondary}`データクリーンアップツール使用可能 7.3+. Data Removal tool available 7.4+`

1. 廃止されたモジュールのデータを削除するには、[データクリーンアップ](../reference/data-cleanup.md)ツールを使用します。

1. 使用可能なモジュールから古いデータを削除するには、[データ削除](../reference/data-removal.md)ツールを使用します。

## 重複するWeb コンテンツストラクチャーのフィールド名を削除する

Web Content Managementを多用されている方は、ユニークなフィールド名を持たない構造をお持ちかもしれません。 アップグレード前に、重複するフィールド名を検索して削除します。 以前、Liferay Portal 6.2 にアップグレードした際に、この操作をスキップした場合、このエラーが発生します。

```
19:29:35,298 ERROR [main][VerifyProcessTrackerOSGiCommands:221] com.liferay.portal.verify.VerifyException: com.liferay.dynamic.data.mapping.validator.DDMFormValidationException$MustNotDuplicateFieldName: The field name page cannot be defined more than once
com.liferay.portal.verify.VerifyException: com.liferay.dynamic.data.mapping.validator.DDMFormValidationException$MustNotDuplicateFieldName: The field name page cannot be defined more than once
```

このエラーが発生した場合は、Liferay Portal 6.2 の以前のバックアップにロールバックし、重複するフィールド名を見つけて削除してください。

## 未使用のオブジェクトの削除

データベースには、使用されていないオブジェクトのデータが残っている場合があります。

1. UIや、データベースで`SELECT`クエリを使用して他の未使用オブジェクトを特定し、UI、 [スクリプト コンソール](../../../system-administration/using-the-script-engine/running-scripts-from-the-script-console.md)を介したAPI、または作成したポートレットのいずれかでオブジェクトを削除します。

```{warning}
LiferayのUIまたはAPIはLiferay DXPのオブジェクト間の関係を考慮しているため、データの操作にはLiferayのUIまたはAPIのみを使用してください。 データベースでSQLを直接使用してレコードを削除しないでください。 SQLがオブジェクトの関係を見失い、オブジェクトが孤立し、パフォーマンスの問題が発生する可能性があります。
```

次に、未使用品を確認する一般的な場所を紹介します。

### ラージ／ポピュレートテーブルからのオブジェクト

テーブルの行は、Liferay DXP のオブジェクトにマッピングされます。 多くのレコードを持つ大規模なテーブルには、多くの未使用のオブジェクトが含まれている可能性があります。 テーブルサイズとテーブルあたりのレコード数が大きくなればなるほど、アップグレードにかかる時間は長くなります。

このようなテーブルに関連する未使用のオブジェクトを見つけ、削除することで、アップグレード時間を短縮することができます。 Liferayのバックアップからデータをインポートすることで、貴重なテーブル情報を得ることができます。 データベースエンジンは、この情報をさまざまな方法で表示します。 例えば、データベースのインポートログは次のようなものになります。

```
Processing object type SCHEMA\_EXPORT/TABLE/TABLE\_DATA

imported "LIFERAY"."JOURNALARTICLE" 13.33 GB 126687 rows

imported "LIFERAY"."RESOURCEPERMISSION" 160.9 MB 1907698 rows

imported "LIFERAY"."PORTLETPREFERENCES" 78.13 MB 432285 rows

imported "LIFERAY"."LAYOUT" 52.05 MB 124507 rows

imported "LIFERAY"."ASSETENTRY" 29.11 MB 198809 rows

imported "LIFERAY"."MBMESSAGE" 24.80 MB 126185 rows

imported "LIFERAY"."PORTALPREFERENCES" 4.091 MB 62202 rows

imported "LIFERAY"."USER\_" 17.32 MB 62214 rows

...
```

データベースのインポート例では、いくつかの項目が目立ちます。

* `JOURNALARTICLE` テーブルは、データベースサイズの98%を占めています。
* `RESOURCEPERMISSION` のレコードが多数あります。
* `PORTLETPREFERENCES` のレコードがたくさんあります。

目立つテーブルに関連する未使用のオブジェクトを検索し、LiferayのAPIを使用して（例えば、 [スクリプトコンソール](../../../system-administration/using-the-script-engine/running-scripts-from-the-script-console.md)を使用して）不要なオブジェクトを削除します。

### 確認が必要な共通オブジェクトタイプ

いくつかの特定のオブジェクトタイプは、未使用のオブジェクトをチェックする必要があります。 ここでは、それらをチェックする理由を説明します。

* それらを削除することで、関連する未使用のオブジェクトが解放される
* 保存する価値のないバージョン物かもしれない

これらのオブジェクトの種類を確認します。

* **サイト**: 不要なサイトを削除します。 サイトを削除すると、そのサイトに関連するオブジェクトも削除されます。
  * レイアウト
  * ポートレットの環境設定
  * ファイルエントリ（ドキュメントライブラリオブジェクト）
  * アセット項目
  * タグ
  * ボキャブラリーとカテゴリー
  * Expandoフィールドとその値
  * `ResourcePermission` オブジェクト
  * その他、その土地に固有のものすべて

* **インスタンス**: 未使用のインスタンスは稀ですが、階層で最も高いオブジェクトであるため、そのオブジェクトを削除することでアップグレードをかなり最適化することができます。 インスタンスを削除すると、それらに関連するこれらのオブジェクトが削除されます。
  * サイト（および関連するすべてのコンテンツ）
  * ユーザー
  * ロール
  * 組織
  * Global `ResourcePermission` objects

* **ウェブコンテンツの中間バージョン** Liferay DXP は、何らかの変更（翻訳を含む）の後、新しい Web コンテンツのバージョンを生成します。 不要なバージョンの削除を検討する。 特に、削除されたバージョンに固有の画像ファイルなどのオブジェクトがある場合、大きな空き容量ができる可能性があります。 詳細は、 [例：ジャーナル記事の中間バージョンの削除](./example-removing-intermediate-journal-article-versions.md) を参照してください。

* **Document versions**: Journal Articlesと同様、途中のドキュメントバージョンが不要な場合は削除してください。 これにより、データベースとファイルシステムの両方のスペースを節約することができます。

* **レイアウト。** レイアウトはサイトページであり、ポートレットプリファレンス、パーミッション、アセット、レーティングなどの他のエンティティに関連するため、アップグレードのパフォーマンスに影響を及ぼします。 不要なレイアウトを削除する。

* **Roles**: 不要なロールを削除します。 それらを削除すると、関連する`ResourceBlockPermission`オブジェクトと`ResourcePermission`オブジェクトも削除されます。

* **ユーザー** 非アクティブで不要になったユーザーを削除します。

* **Vocabularies**: 未使用のボキャブラリーを削除します。 なお、語彙を削除すると、そのカテゴリも削除される。

* **Orphaned data**: 何にも接続されていない未使用のオブジェクトをチェックします。 次にいくつかの例を示します。
  * `DLFileEntries` 、ファイルシステムのデータはありません。
  * 存在しないロール、レイアウト、ユーザー、ポートレットインスタンスなどに関連付けられている`ResourcePermission`オブジェクト。
  * `PortletPreference` もはや存在しないポートレットやレイアウトに関連するオブジェクト。 これは、多くの組み込みポートレットがある環境では一般的です。 これらのポートレットインスタンスは異なるライフサイクルを持ち、ポートレットがテンプレートから削除されても、削除されることはありません。

中間オブジェクトバージョンの削除例については、[例：ジャーナル記事の中間バージョンの削除](./example-removing-intermediate-journal-article-versions.md)を参照してください。

次に、剪定されたデータベースでインスタンスをテストします。

## プルーニングされたデータベースのコピーを使用してテストする

削除したオブジェクトに関連する問題を発見し、解決する。 これは、オブジェクトが誤って削除された場合や、他のコンテンツに影響を与える場合に備えて、重要な手順です。 問題が解決しない場合は、いつでも本番用データベースの新しいコピーのプルーニングを再開することができます。

## 追加情報

* [例：ジャーナル記事の中間バージョンの削除](./example-removing-intermediate-journal-article-versions.md)