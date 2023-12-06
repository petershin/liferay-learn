# ウィジェットページをコンテントページに変換する

旧バージョンでは、ウィジェットページは、カスタムレイアウトやカスタマイズ可能なカラムなどの専用機能を提供していました。 これらの専用機能の多くは、7.3以上の [コンテンツページ](../using-content-pages.md) で利用できるため、ほとんどの場合、コンテンツページを作成することをお勧めします。

以前のバージョンからLiferay Portal 7.3または7.4にアップグレードし、既存のウィジェットページを移行する場合、それらをコンテンツページに変換することができます。 ウィジェットページをすぐにコンテンツページに変換することもできますし、変換をプレビューし、変更を加えてからページを変換することもできます。

変換する複数のページがある場合、サイト管理で一括変換することもできますし、利用可能なAPIと内蔵スクリプトエディタを使用して、すべてのウィジェットページを一度に変換することもできます。 ここでは、すべてのアプローチについて説明します。

## ウィジェットページをプレビューしてコンテントページに変換する

ウィジェットページを変換する前に変換ドラフトをプレビューするには、以下の手順に従ってください：

1. **Site Menu**(![Site Menu](../../../images/icon-product-menu.png)) を開き、 **Site Builder** &rarr; **Pages** に移動する。

1. **Actions**(![Actions](../../../images/icon-actions.png)) を開き、希望するウィジェット・ページの隣にある **Convert to content page...** を選択する。

1. 警告を確認し、変換下書きに必要な調整を行います。 この時点で、必要なフラグメントを下書きに追加することもできます。

1. **Publish** をクリックしてプレビュードラフトを公開するか、 **Discard Conversion Draft** をクリックしてウィジェットページを元の状態に戻します。 警告がある場合は、以下で説明するように、ベストエフォートの変換が完了します。

### ベストエフォートコンバージョン

ウィジェットページのいくつかの機能は、コンテンツページではサポートされていないため、そのままでは変換できません。 これらの場合、ユーザーには問題が警告され、ベストエフォートの変換が処理されます。 これらのウィジェットページの機能はサポートされていません：

**入れ子になったアプリケーション：** 入れ子になったアプリケーションは、変換中にレイアウトの同じ列に配置されます。 ベストエフォート変換が完了した後、これらのアプリケーションを再編成する必要がある場合があります。

**カスタマイズ可能なセクション：** ページが [カスタマイズ可能](./enabling-user-personalization-of-widget-pages.md)な場合、ユーザーが行ったカスタマイズは変換中に失われます。

**カスタムページレイアウト：** レイアウトを変換できる場合、レイアウトの構造が保持され、ユーザーに警告が表示され、処理する前に変換下書きを確認する機会が与えられます。 レイアウトを変換できない場合、すべてのウィジェットは単一の行と列に配置されるため、ページの変換後に手動で再編成する必要があります。

カスタムレイアウトテンプレートが変換可能であることをすでに確認している場合、レイアウトテンプレートのレイアウトテンプレート変換警告を無効にして、レイアウトを使用するウィジェットページを変換するたびに警告が表示されないようにすることができます。

**Global Menu**(![Applications Menu icon](../../../images/icon-applications-menu.png)) を開き、 **Control Panel** &rarr; **Configuration** &rarr; **System Settings** に移動します。

コンテンツとデータ」の「**ページ**」 を選択し、「**ウィジェット・ページからコンテンツ・ページへの変換**」 に移動し、レイアウト・テンプレートIDを「検証済みレイアウト・テンプレートID」のリストに追加します。

```{note}
ポートレットはウィジェット・ページでは [render-weight](https://resources.learn.liferay.com/reference/latest/en/dxp/definitions/liferay-portlet-app_7_4_0.dtd.html#render-weight) に従ってレンダリングされますが、コンテンツ・ページではそうではありません。 ポートレットは、コンテンツページのページ上に表示される順番（つまり、左から右、上から下）にレンダリングされるため、コンテンツページ上の配置によって、早くレンダリングされるポートレットや遅くレンダリングされるポートレットがあることに気づくかもしれません。
```

## ウィジェットページをコンテントページに直接変換する

プレビューなしでウィジェットページをコンテンツページに変換するには、以下の手順に従ってください：

1. **Site Menu**(![Site Menu](../../../images/icon-product-menu.png)) を開き、 **Site Builder** &rarr; **Pages** に移動する。

1. ウィジェット・ページ、または複数のウィジェット・ページのボックスをチェックしてください。 管理ツールバーの **アクション**(![Actions Menu](../../../images/icon-actions.png)) をクリックし、 **コンテンツページに変換** オプションを選択します。

  ![コンテキストメニューから複数のウィジェットページを変換できます。](./converting-widget-pages-to-content-pages/images/01.png)

1. 表示されたプロンプトで ［**OK**］ をクリックして変換を完了します。

## APIを使用してすべてのウィジェットページをコンテントページに一括変換する

組み込みのスクリプトエディターを使って、サイト上のすべてのウィジェットページをコンテンツページに一括変換できます：

1. **グローバルメニュー**(![Applications Menu icon](../../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **システム** &rarr; **サーバー管理** &rarr; **スクリプト** に移動する。

1. スクリプトウィンドウにこのスクリプトを入力します。必ず、グループIDを自分のものに置き換えてください。 Groovyスクリプトは、 [`BulkLayoutConverter` インタフェース](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/layout/com.liferay.layout.api/com/liferay/layout/util/BulkLayoutConverter.html) を使用して、与えられたグループIDを持つすべてのウィジェット・ページをコンテンツ・ページに変換する：

  ```groovy
  import com.liferay.layout.util.BulkLayoutConverter
  import com.liferay.portal.kernel.util.ArrayUtil
  import org.osgi.framework.ServiceReference
  import org.osgi.framework.BundleContext
  import com.liferay.portal.kernel.module.util.SystemBundleUtil
  import org.osgi.framework.BundleContext

  BundleContext bundleContext = SystemBundleUtil.getBundleContext();

  ServiceReference serviceReference = bundleContext.getServiceReference(BulkLayoutConverter.class.getName());

  BulkLayoutConverter bulkLayoutConverter = bundleContext.getService(serviceReference);

  long groupId = 20118L // Use your groupId

  long[] plids = bulkLayoutConverter.getConvertibleLayoutPlids(groupId)

  out.println("Convertible layouts before conversion:" + ArrayUtil.toStringArray(plids))

  long[] convertedLayoutPlids = bulkLayoutConverter.convertLayouts(groupId)

  out.println("Converted layouts:" + ArrayUtil.toStringArray(convertedLayoutPlids))

  plids = bulkLayoutConverter.getConvertibleLayoutPlids(groupId)

  out.println("Convertible layouts after conversion: " + ArrayUtil.toStringArray(plids))
  ```

1. ［**実行**］ をクリックしてスクリプトを実行します。

1. 出力は以下のスニペットのようになり、変換可能なレイアウト（ページ）が残っていないことが示されます。

  ```bash
  Convertible layouts before conversion:[25, 26, 27]
  Converted layouts:[25, 26, 27]
  Convertible layouts after conversion: []
  ```
