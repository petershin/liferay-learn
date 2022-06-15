# 検索ブループリントを検索ページで使用する

デフォルトでは、aは [検索ブループリント](./understanding-search-blueprints.md)と関連付けられていません。 Liferay Search Experiencesに影響を与えるには、ブループリントを[ページの検索](../../search-pages-and-widgets/working-with-search-pages.md)に適用する必要があります。 サイトに複数の検索ページがある場合、ブループリントを使用する各ページごとに以下の手順で設定する必要があります。各ページは個別に設定する必要があります。 必要に応じて、各ページに異なるブループリントを使用することができます。

検索ページを検索ブループリントに反応させるには、

1. [ブループリントを作成する](./creating-and-managing-search-blueprints.md).
1. [［検索ページ］](../../search-pages-and-widgets/working-with-search-pages.md)を作成または移動します。
1. ［ページにブループリントオプションウィジェット］を追加します。
1. ウィジェットのオプションアイコン（![Options](../../../images/icon-app-options.png)）をクリックし、 ［**設定**］ をクリックします。
1. ページのブループリントを選択するには、 ［**選択**］ をクリックします。

   ![ページで使用するブループリントを選択します。](./using-a-search-blueprint-on-a-search-page/images/02.png)

1. ブループリントを選択したら、［設定］画面で ［**保存**］ をクリックします。

これで、ブループリントの機能がページに適用されました。

管理者ユーザーは、代わりに[低レベル検索オプション](../../search-pages-and-widgets/search-results/understanding-low-level-search-options.md)ウィジェットを使用して、検索ページにブループリントを適用することができます。 ウィジェットの［設定］を開きます。 ［属性］セクションに、次を追加します。

- キー:  `search.experiences.blueprint.id`
- 値：`[ブループリントID]`

ブループリントIDは、［ブループリントアプリケーション］（グローバルメニュー &rarr; ［アプリケーション］ &rarr; ［ブループリント］ (Search Experiences)から確認することができます。

![ブループリントIDは、ブループリントアプリケーションに一覧表示されます。](./using-a-search-blueprint-on-a-search-page/images/01.png)

ページの検索で、既に低レベル検索オプションウィジェットを使用している場合を除き、ブループリントオプションウィジェットの方がブループリントを設定するのに便利です。 ブループリントのテストなど、他の検索コンテキスト属性を設定する必要がある場合は、低レベル検索オプションウィジェットを使用します。

## 追加の検索コンテキスト属性の適用

ブループリントは、ブループリントのオプションウィジェットを使用してページに適用するか、上記のように低レベルの検索オプションウィジェットで検索コンテキスト属性を使用して適用されます。 追加の検索コンテキスト属性は、低レベル検索オプションウィジェットで設定することができます。 ページの検索に検索コンテキスト属性を設定する必要がある主な理由は2つあります。

1. ブループリントはカスタムパラメータ（Liferayの検索フレームワークでは設定されないもの）を定義して応答することができ、これらは低レベル検索オプションウィジェットで手動で設定することができます。
1. 検索コンテキスト属性を設定し、検索要求を実行することで、ページの検索でのブループリントの動作をテストするのに便利です。

   標準のパラメータについての詳細は、[the Elements reference for more information](./search-blueprints-elements-reference.md)を参照してください 。 <!--
Follow this example to set search context attributes into a Blueprint-driven search page:

1. Create two Users: name them **Acme User** and **Other User** .
   - Acme User
      - Screen Name: `acmeuser`
      - Email Address: `acme@liferay.com`
      - First Name: `Acme`
      - Last Name: `User`
   - Other User
      - Screen Name: `otheruser`
      - Email Address: `other@liferay.com`
      - First Name: `Other`
      - Last Name: `User`
1. Create a [User Segment](../../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) called **Acme Users** . Drag the User attribute and add Acme User to it. Record the segment's ID. It's in the URL as the parameter `segmentsEntryId`.
1. Create an [Asset Category](../../../content-authoring-and-management/tags-and-categories.md). Name the Vocabulary and the Category **Business** . Record the Category's ID. It's in the URL as part of the path: `category/[ID]`.
1. Create two pieces of Basic Web Content:
   - Web Content 1
      - Title: Has Business Category
      - Content: Test
      - Category: Business
   - Web Content 2
      - Title: Without Business Category
      - Content: Test
1. [Create a Blueprint](./creating-and-managing-search-blueprints.md) with the following Element:
   - Element Name: Boost Contents in a Category for a User Segment
      - Asset Category ID: The **Business** Category's ID. 
      - User Segment IDs: The ID of the **Acme Users** User Segment.
      - Boost: 100
1. Navigate to the Site's Search Page.
1. Add the Low Level Search Options widget to the page, and open it's configuration screen.
1. In the Attributes section, add

   - Key: `search.experiences.scope.group.id`
   - Value: `[the site ID]`

You can find the Blueprint ID from the Blueprints application (Global Menu &rarr; Applications &rarr; Blueprints (Search Experiences).
--> <!-- Example is unfinished--uncomment when finalized. -->

