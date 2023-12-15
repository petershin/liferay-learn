# フラグメントエディターの使用

Liferay DXPには、コンテンツページフラグメントを開発するためのビルトイン [エディタ](../reference/fragments/page-fragment-editor-interface-reference.md) 。 エディターにアクセスするには、 **Site Menu**( ![Site Menu](../../../images/icon-product-menu.png) ) を開き、 **Design** &rarr; **Fragments** に移動します。 ここから、フラグメントとフラグメントセットの表示、管理、作成ができます。

* [フラグメントセットの作成](#creating-a-fragment-set) 
* [新しいフラグメントの作成](#creating-a-new-fragment) 

```{note}
Liferay DXP 7.4+では、フラグメントコレクションはLiferay UIではフラグメントセットと呼ばれています。
```

## フラグメントセットの作成

新しいフラグメントを作成する前に、それらを含む新しいフラグメントセットを作成する必要があります：

1. **サイトメニュー**(![サイトメニュー](../../../images/icon-product-menu.png))を開き、 **デザイン** &rarr; **フラグメント** に移動します。

   Liferay DXP 7.1と7.2では、 **プロダクトメニュー** を開き、 **サイト** &rarr; **サイトビルダー** &rarr; **ページ フラグメント** に進んでください。

1. フラグメントセットの横にある **追加**( ![追加ボタン](../../../images/icon-plus.png))をクリックします。

   ![Click the add button next to Fragment Sets.](./using-the-fragments-editor/images/01.png)

1. 新しいセットの **名前** と **説明** を入力します。

   例えば、機能別やチームや部署別にフラグメントをグループ化したセットを作成することができます。

1. ［**Save**］をクリックします。

一度保存すれば、フラグメントをセットに追加できる。

## 新しいフラグメントの作成

```{important}
Reactフラグメントを作成するには、 [Fragments Toolkit](./using-the-fragments-toolkit.md) を使用します。
```

以下の手順でフラグメントを作成する：

1. 目的のフラグメントセットに移動し、 **Add**（！ [Addボタン](../../../images/icon-add.png) ）をクリックして、新しいフラグメントを作成します。

   ```{note}
   Liferay DXP 7.3以前では、フラグメントはセクションかコンポーネントのどちらかでした。 Liferay DXP 7.3+では、すべてのページフラグメントはコンポーネントです。
   ```

1. フラグメントのタイプ、Basic または [Form](../developing-page-fragments/creating-form-fragments.md) のいずれかを選択し、 **Next** をクリックします。

1. フラグメントの名前を入力し、 **Add** をクリックする。

1. Codeタブで、HTML、CSS、JavaScriptフィールドを使用して、フラグメントのリソースを追加します。 ここでは、異なるデバイスコンテキストでのフラグメントの外観のライブプレビューを見ることもできます。

   ここでは、HTML編集のショートカットを紹介します。

   * 開角括弧(`<`)を入力すると、標準的なHTMLタグとLiferayのフラグメント固有のタグにアクセスできます。

   * 要素属性を `data` で始めると、Liferay の [編集可能なフラグメント属性](../reference/fragments/fragment-specific-tags-reference.md) にアクセスできます。

   以下の例では、編集可能なテキストを持つカード・コンポーネントを追加しています：

   ```html
   <div class="marketing-card-fragment-01">
     <div class="card">
       <data-lfr-editable id="01-card-image" type="image">
         <img src="https://cdn.dribbble.com/users/1408464/screenshots/9323535/media/a5b9a76256562e878ecc6dc5cd0fadf0.png" class="card-img-top" alt="2020 - Try New Things">
       </data-lfr-editable>
       <div class="card-body">
         <data-lfr-editable id="02-card-title" type="rich-text">
           <h5 class="card-title">Editable Card title</h5>
         </data-lfr-editable>
         <data-lfr-editable id="03-card-text" type="rich-text">
           <p class="card-text">Here is some editable text.</p>
         </data-lfr-editable>
         <data-lfr-editable id="04-card-link" type="link">
           [Editable link](#" class="btn btn-primary) 
         </data-lfr-editable>
       </div>
     </div>
   </div>
   ```

   ```css
   .marketing-card-fragment-01 .card img {
     max-width: 100%;
   }
   ```

   ![Add HTML, CSS, and Javascript resources to the fragment and see a live preview.](./using-the-fragments-editor/images/02.png)

1. 設定タブで、`JSON`フィールドを使い、 [設定オプション](./adding-configuration-options-to-fragments.md) をページフラグメントに追加する。

   ![Add configuration options to a page fragment.](./using-the-fragments-editor/images/03.png)

   ```{tip}
   （JSONの`fields`オブジェクトと一緒に）どのフィールドセットにも`configurationRole`値を追加して、関連するフィールドがどのタブに表示されるかを指定することができます。 値を `styles` に設定すると［スタイル］タブにフィールドが表示され、`advanced` に設定すると［詳細設定］タブに表示されます（*Liferay DXP バージョン U23+ または GA23+* でのみ使用可能）。 `configurationRole`が設定されていない場合、デフォルトで［一般］タブに表示されます。
   ```

1. **Publish** をクリックすると、フラグメントが保存され、 [コンテンツページ](../../creating-pages/understanding-pages/understanding-pages.md#content-pages) で使用できるようになります。

   ![The fragment can be used in content pages.](./using-the-fragments-editor/images/04.png)

フラグメントの開発中、フラグメントが公開されるまで、変更は自動的に下書きとして保存されます。 一度セットに追加されたフラグメントは、フラグメントエディターでいつでもコピー、エクスポート、編集、削除ができます。 ページフラグメントで利用可能なアクションの詳細については、 [フラグメントの管理](../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md) を参照してください。

```{note}
Liferay DXP 7.2 SP1+とLiferay Portal 7.2 GA2+以降では、*Global*サイトにページフラグメントを作成して、すべてのサイトで利用できるようにすることができます。 これらのバージョンの初期リリースでこの機能を公開するには、 `com.liferay.fragment.web.internal.configuration.FragmentGlobalPanelAppConfiguration.config` という名前の `.config` ファイルを作成し、 `enabled=B "true"` というプロパティを追加する必要があります。 そして、Liferay DXPインスタンスの `osgi/configs` フォルダにコピーしてください。 グローバル・ページ・フラグメントは子サイトに継承され、グローバル・サイトからしか編集できません。 グローバルページフラグメントがグローバルサイトから参照するリソースはすべて、ページフラグメントを利用するサイトにコピーされます。
```

## 関連トピック

[フラグメントツールキットの使用](./using-the-fragments-toolkit.md) 

[フラグメントへの設定オプションの追加](./adding-configuration-options-to-fragments.md) 
