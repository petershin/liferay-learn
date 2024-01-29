# FAQを表示するテンプレートの追加

FAQ用のテンプレートは、あなたが追加した各フィールドだけでなく、記事が持つ可能性のある質問と回答のすべての繰り返しも表示できる必要があります。

ここでは、 [FreeMarker リスト](https://freemarker.apache.org/docs/ref_directive_list.html) を利用して、すべての質問と回答が表示されるようにします。

## テンプレートの作成開始

1. パブリックサイトの管理者であるPreston Palmerとしてログインしてください（まだの場合）。

1. サイトメニューに移動する (![サイトメニュー](../../images/icon-product-menu.png)) &rarr; **Content & Data** &rarr; **Webコンテンツ** .

1. **Templates** タブを選択し、 **Add**(![Add icon](../../images/icon-add.png)) をクリックします。

1. プロパティ]メニュー(![プロパティアイコン](../../images/icon-cog.png))(画面右側)で、[構造]フィールドの横にある [**構造の選択**]をクリックし、FAQの構造を選択します。

   新しいテンプレートはFAQ構造と関連付けられる。 テンプレートを作成し、それを構造に関連付けるには、この別の方法か、前の練習で述べた方法を使います。

   ![Select a structure when creating a template to associate them.](./adding-a-template-to-display-faqs/images/01.png)

1. プロパティ]メニューの[説明]フィールドに次のように入力してください。

1. ページの一番上に、タイトルとして「シンプルFAQリスト」と入力する。

## テンプレートのフィールドを設定する

次に、FAQ記事のリストをフォーマットする。

1. **Elements**（ [Elementsアイコン](../../images/icon-list-ul.png) ）をクリックして、Elementsメニューを再度開きます。

1. テンプレート本文をクリックし、プレースホルダー・テキストを削除する。

1. ElementsメニューからJournalの下のフィールドまでスクロールダウンし、 **Title** をクリックします。

   これにより、タイトル値を使用するコードが自動的に入力される。

1. 次のように、コードをH2見出しHTMLタグ（`<h2>`）で囲みます：

   ```html
   <h2>${.vars["reserved-article-title"].data}</h2>
   ```

1. Enter キーを 2 回押して改行を 2 行追加し、改行用の HTML タグ (`<br>`) を追加して、タイトルと FAQ のリストを区切ります。

1. Enterキーを2回押して新しい行を2行追加し、「要素」メニューのフィールドリストから「**FAQ**」をクリックする。

   FAQグループは反復可能なフィールドであるため、これは表示されたコンテンツ内の各インスタンスを反復するFreeMarkerリストを追加します。

   ![Clicking a repeatable field adds FreeMarker tags that iterate over each instance in the content.](./adding-a-template-to-display-faqs/images/02.png)

1. このセグメントをFreeMarker `<#list></#list>`タグの中間にコピーする：

   ```html
   <#if (cur_FAQ.QuestionText.getData())??>
      ${cur_FAQ.QuestionText.getData()}
   </#if>

   <#if (cur_FAQ.AnswerText.getData())??>
      ${cur_FAQ.AnswerText.getData()}
   </#if>
   ```

   これは、フィールドリストから **Question** フィールドと **Answer** フィールドの両方をクリックするのと似ていますが、`cur_FAQ`を使用して、繰り返し実行するたびに、リスト内の各特定の質問と回答を参照します。

1. 次の例のように、行全体を質問フィールドのテキスト（`${cur_FAQ.QuestionText.getData()}`）で太字*のHTMLタグ（`<b>`）で囲みます：

   ```html
   <b>${cur_FAQ.QuestionText.getData()}</b>
   ```

1. Enter キーを 2 回押して新しい行を 2 行追加し、FreeMarker のタグの質問と回答のブロックのそれぞれの後に、改行用の HTML タグ (`<br>`) を追加します。 もう一度Enterキーを押して終了する。

   ![The completed template iterates over each question and answer with new lines between each.](./adding-a-template-to-display-faqs/images/03.png)

1. ［**保存**］をクリックします。

これで、FAQの記事を表示する場所であればどこでも、それぞれの質問と回答を表示するテンプレートができ、新しいタイプのウェブコンテンツの両方をサイトに適切に表示することができます。

![The Simple FAQ List template applied to a FAQ web content article.](./adding-a-template-to-display-faqs/images/04.png)

次に、FAQ構造用の2番目のテンプレートをインポートする。

## 別のテンプレートをインポートする

Templates "ページにいる間に、ページの一番上に "Templates for Structure "と表示されていることを確認してください：よくある質問"

1. Templatesページで、 **Add**(![Add icon](../../images/icon-add.png)) をクリックし、別の新しいテンプレートを作成します。

   !!! note

      テンプレート」ページの上部には、「構造用テンプレート」と表示されています：新しいテンプレートを追加しても、FAQsテンプレートと関連付けられることを忘れないようにするためです。 もし（構造の **Manage Templates** をクリックせずに）普通にTemplatesタブにアクセスした場合、構造を作成するときに手動で構造を設定する必要があります。

1. テンプレートリソースをダウンロードし、解凍します：

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/liferay-c8m2.zip -O
   ```

   ```bash
   unzip liferay-c8m2.zip
   ```

1. ページ上部で、 **Actions**(![Actions icon](../../images/icon-actions.png)) をクリックします。 &rarr; **Import Script** をクリックします。

   ![Click Import Script to import the FreeMarker template you downloaded.](./adding-a-template-to-display-faqs/images/05.png)

1. ダウンロードしたFreeMarkerテンプレート（`faq-web-content-template.ftl`）をアップロードし、 **開く** をクリックします。

   テンプレートの本文は、新しいテンプレートのFreeMarkerコードで埋められます。 このテンプレートは、前に追加したテンプレートと同じテクニックを使用していますが、 [Clayタグライブラリ](https://learn.liferay.com/web/guest/w/dxp/building-applications/developing-a-java-web-application/using-mvc/tag-libraries/clay-tag-library) と埋め込みボタンコンポーネントも含まれています。

1. 新しいテンプレートの名前として「折りたたみ可能なFAQ」を入力します。

1. ［**保存**］をクリックします。

これで、デフォルトで回答が折りたたまれるテンプレートができ、見た目がすっきりしました。

![The Collapsible FAQs template applied to a FAQ web content article.](./adding-a-template-to-display-faqs/images/06.png)

次: [新しいコンテンツ・タイプでいくつかの記事](./adding-the-sites-first-web-content.md) を追加する。

## 関連コンセプト

- [Webコンテンツテンプレートの作成](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates)

- [Webコンテンツテンプレートのフラグメントへのマッピング](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-templates/mapping-web-content-templates-to-fragments)
