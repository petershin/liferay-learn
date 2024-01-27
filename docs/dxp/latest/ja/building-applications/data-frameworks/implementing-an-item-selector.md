# アイテムセレクターの実装

アイテムセレクタは、ドキュメント、ビデオ、ユーザーなどのアセットを選択するためのポップアップダイアログです。

項目セレクタの条件を設定し、使い方を定義することで、独自のアプリケーション用の項目セレクタダイアログを作成することができます。

![Item selectors pop up so users can select assets.](./implementing-an-item-selector/images/01.png)

## サンプルモジュールから始める

アイテムセレクタを実装するには、ウィジェットのモジュールなど、アプリケーションに組み込む必要があります。 この例では、 [MVC Portlet](../developing-a-java-web-application/using-mvc/using-a-jsp-and-mvc-portlet.md) 、JSPビューを使用しています。 項目セレクタには、選択するロールのリストが表示されます。

1. サンプルモジュールをダウンロードします。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/liferay-f5d5.zip -O
   ```

   ```bash
   unzip liferay-f5d5.zip
   ```

1. ```{include} ../../_snippets/run-liferay-portal.md
   ```

1. モジュールのルートから次のコマンドを実行してビルドし、Dockerコンテナにデプロイします。

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! tip
       このコマンドはDockerコンテナ上の `/opt/liferay/osgi/modules` にデプロイされたjarをコピーするのと同じです。

1. Liferay Dockerコンテナコンソールでデプロイを確認します。

   ```bash
   STARTED com.acme.f5d5.web_1.0.0 [1017]
   ```

   サンプルのポートレットモジュールがデプロイされます。 ページに追加すると、ボタンが1つのシンプルなポートレットになります。

   ![The portlet has one button that opens the Item Selector.](./implementing-an-item-selector/images/02.png)

1. をクリックすると、アイテムセレクタが表示されます：

   ![The item selector shows items that can be selected by checking the box.](./implementing-an-item-selector/images/03.png)

1. 項目を選択すると、その値がJavaScriptのアラートボックスに表示されます。 この項目セレクタはロールを選択するため、表示される値は選択されたロールの主キーになります。

## コントローラーでアイテムセレクターの基準を設定する

`F5D5Portlet.java`クラスを開きます。 MVCポートレットでは、ポートレットクラスはコントローラークラス（MVCではC）です。 クラスは以下の2つのことを実行する必要があります。

- セレクターに必要な基準を定義する（つまり、どのエンティティを選択するか）
- その基準のURLを作成する

1. クラスの一番下にある `@Reference` アノテーションにより、OSGi は [`ItemSelector` クラス](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/item-selector/item-selector-api/src/main/java/com/liferay/item/selector/ItemSelector.java) インスタンスを注入する。

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/java/com/acme/f5d5/web/internal/portlet/F5D5Portlet.java
   :dedent: 1
   :language: java
   :lines: 56-57
   ```

1. ポートレットの `render` メソッドまでスクロールします。

1. このメソッドは、アイテム・セレクタに表示したいエンティティを表す基準クラスのインスタンスを作成します。 基準クラスは [`ItemSelectorCriterion` インターフェイス](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/item-selector/com.liferay.item.selector.api/com/liferay/item/selector/ItemSelectorCriterion.html) を実装しなければなりません。

   この例では、 [`RoleItemSelectorCriterion`](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/roles/com.liferay.roles.item.selector.api/com/liferay/roles/item/selector/RoleItemSelectorCriterion.html) への参照を使用して、ロールがセレクタに表示されるようにしています。 クラスの新しいインスタンスを作成することで定義される。

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/java/com/acme/f5d5/web/internal/portlet/F5D5Portlet.java
   :dedent: 2
   :language: java
   :lines: 39-40
   ```

   !!! tip
       必要なエンティティの種類に対応する基準が存在しない場合は、`BaseItemSelectorCriterion` を継承して、独自の `ItemSelectorCriterion` クラスを作成することができます。

1. 次に、ユーザーがエンティティを選択したときにエンティティから提供される情報を表す戻り値型クラスが必要です。 戻り値の型クラスは、 [`ItemSelectorReturnType` インターフェイス](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/item-selector/com.liferay.item.selector.api/com/liferay/item/selector/ItemSelectorReturnType.html) を実装する必要があります。 例えば、このクラスはエンティティのURLやUUID、主キーを返すために使われます。 戻り値のタイプクラスは、以前に作成された基準クラスに追加されます。

   !!! important
       すべての基準 **must** は、使用されるとき、それに関連する少なくとも1つのリターン・タイプを持っている。

この例では、 [`UUIDItemSelectorReturnType`](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/item-selector/com.liferay.item.selector.criteria.api/com/liferay/item/selector/criteria/UUIDItemSelectorReturnType.html) への参照を使用して、選択されたロールの `UUID` 値を返すデータとして定義しています。 複数のロールが選択されている場合は、カンマ区切りのリストとして返されます。

!!! note
       UUIDが利用できない場合は、主キーが返される。

1. 戻り値のタイプをアイテム基準に登録して定義します。

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/java/com/acme/f5d5/web/internal/portlet/F5D5Portlet.java
   :dedent: 2
   :language: java
   :lines: 42-43
   ```

   !!! tip
       必要な情報の型に対応する戻り値クラスが存在しない場合は、 [ItemSelectorReturnType](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/item-selector/item-selector-api/src/main/java/com/liferay/item/selector/ItemSelectorReturnType.java) 実装で独自に定義することができます。

   アイテムセレクタは、基準クラスと戻り値クラスを使用して、表示するアイテムの選択ビュー（タブとして表示される）と各アイテムを識別する方法を決定します。

1. これで、基準を使用してアイテム・セレクタ用のURLを生成できる。 このURLはフロントエンドのコードにアイテムセレクタダイアログを作成します。

   [`RequestBackedPortletURLFactory` クラス](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/RequestBackedPortletURLFactory.html) は、基準を使用してアイテムセレクタの URL を素早く生成することができます：

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/java/com/acme/f5d5/web/internal/portlet/F5D5Portlet.java
   :dedent: 2
   :language: java
   :lines: 45-48
   ```

   !!! important
       URLを生成するために使用する文字列（この例では`selectRole`）はダイアログのイベント名です。 これは、後でフロントエンドコードでダイアログを作成するときに使用する値と一致する必要があります。

1. アイテムセレクタのURLを `renderRequest` に追加して、JSPで利用できるようにする：

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/java/com/acme/f5d5/web/internal/portlet/F5D5Portlet.java
   :dedent: 2
   :language: java
   :lines: 50-51
   ```

   `view.jsp`ファイルはフロントエンドのコードを定義する場所です。 Javaクラスの `render`メソッドの`renderRequest` オブジェクトがJSPファイルに渡されます。 定数を使用して、コントローラ（ポートレットクラス）とビュー（JSP）の両方で確実にURLを特定します。

1. 最後に、 `MVCPortlet` の `render` メソッドを呼び出して、コードが実行されたらレンダリング処理を続けます：

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/java/com/acme/f5d5/web/internal/portlet/F5D5Portlet.java
   :dedent: 2
   :language: java
   :lines: 53
   ```

それがコントローラーコードです。 実行はビューレイヤー（MVCのV）に渡され、ビューレイヤーは`view.jsp`ファイルで実装される。

## ビューでアイテムセレクターを使用する

アイテムセレクタを取得し、フロントエンドのコードでそれを使用する方法を定義する必要があります。

1. 例の `view.jsp` を開く。

1. [Clay button](https://clayui.com/docs/components/button.html) タグを使って、アイテムセレクタを開くためのボタンを作成できます：

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/resources/META-INF/resources/view.jsp
   :language: jsp
   :lines: 11-14
   ```

   `clay:button`タグは ID`selectRoleButton`とラベル Select を持つボタンをウィジェットに作成します。 このボタンは文字列`<portlet:namespace />selectRoleButton` で識別できる。

1. アイテムセレクタを開くJavaScriptを埋め込むには、`<script>`タグを使ってください：

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/resources/META-INF/resources/view.jsp
   :language: jsp
   :lines: 16-34
   ```

このJavaScriptのスニペットは、まず識別子（`portlet:namespace />selectRoleButton`）を通してSelectボタンを取得します。 次に、クリックされたときにアイテムセレクターダイアログを作成するためのイベントリスナーを追加します。

`Liferay.Util.openSelectionModal`メソッドはダイアログを作成します。

`onSelect`フィールドは、クリックされたときに値を処理する関数を定義しなければならない。 ユーザーがこの関数内で選択を行ったときのダイアログの動作を定義します。 この実装は、選択された値を含むアラートボックスを表示します。

`selectEventName`フィールドの値は、Javaコードの `RequestBackedPortletURLFactory`で使用した文字列（この例では`selectRole`）と一致しなければなりません。 また、アイテムセレクタの URL をコントローラが保存したリクエストから取得し、同じ定数で識別して `url` フィールドに指定する必要があります。

!!! tip
    アイテムセレクタで複数のアイテムを選択できるようにするには、`openSelectionModal`呼び出しに `multiple: true` を追加します。

`event`に格納されているアイテムの選択を使用する。 結果に含まれるデータ型と情報は、Javaコードで使用した戻り値のタイプクラスによって異なります。 この例では `UUIDItemSelectorReturnType` を使用しているので、データは1つ以上の選択されたアイテムのUUIDを持つString値である。

選択関数内で、値の使用方法を実装します。 この例は、単純なJavaScriptアラートを示しています。

これでどのように機能するかを確認できたので、JavaScriptアラートをより便利なものに置き換えることができます。

## フォームを追加する

アイテムセレクターを使用する場合、選択した値をフォームに挿入したい場合があります。 その方法は以下の通りです。

1. `view.jsp`を開く。

1. `clay:button`タグを見つける。 次のようにフォームで囲みます。

   ```jsp
   <form name="<portlet:namespace/>form">
      <input name="role" />
      <clay:button
         id='<%= liferayPortletResponse.getNamespace() + "selectRoleButton" %>'
         label="Select"
      />
   </form>
   ```

   これで、`role`という1つの入力フィールドを持つフォームができた。

1. JavaScriptアラートまで下にスクロールします。 JavaScriptのアラートをLiferayのフロントエンドの`setFormValues`メソッドの呼び出しに置き換えます：

   ```jsp
   Liferay.Util.setFormValues(document.<portlet:namespace />form, {
          role: event.value
   })；
   ```

1. ポートレットを再デプロイします。

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

1. 先ほどと同じように、アイテムを選択します。 そのIDは、作成したフォーム項目に挿入されます。

　 これで、アイテムセレクターを実装する方法がわかりました。
