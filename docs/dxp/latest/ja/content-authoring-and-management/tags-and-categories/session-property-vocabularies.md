# セッションプロパティのボキャブラリ

{bdg-secondary}`liferay DXP/Portal 7.3+`.

**Session Property Vocabulary** を使えば、 [セッションベースのセグメントプロパティ](../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) を、定義済みの値を使って作成することができます。 このオプションは、新しいセグメントの作成中にセグメントエディタでプロパティの値を手動で入力したくない場合に役立ちます。代わりに、ユーザーが事前定義された値のリストからそれらを選択できるようにします。 セッションプロパティのボキャブラリは、セグメントを定義するタスクを容易にし、手動入力エラーを排除します。

たとえば、マーケティングチームは、デバイスのブランド情報を使用して、Appleデバイス用の新しいアプリのプロモーションなど、さまざまなコンテンツをWebサイトの訪問者にターゲティングしたい場合があります。 マーケティングチームのプロセスを容易にするために、異なるデバイスブランドを含むセッションプロパティボ カブラリを作成し、このボカブラリを [ユーザセグメント](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) にリンクすることができます。 こうすることで、マーケティングチームが「デバイスブランド」 [セッションプロパティ](../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) を使用してセグメントを作成する際、さまざまなデバイスブランドオプションを入力する必要がなくなります。 可能なオプションのリストが事前定義されました。

![The Device Brand session's property contains a list of pre-defined values.](./session-property-vocabularies/images/07.png)

セッションプロパティのボキャブラリは、次の3つのステップで操作します。

1. [セッションベースのセグメント用の語彙を設定する](#configuring-the-vocabulary-for-the-session-based-segment) .

1. [Session Property Vocabulary](#defining-the-session-property-vocabulary) を定義する。

1. [セッションベースのセグメントを作成する](#creating-the-session-based-segment) .

## セッションベースセグメントのボキャブラリの設定

この語彙(1)で定義したカテゴリーは、 [セッションプロパティ](../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md#session-properties) (2)を使ってセグメントを作成するときに選択できます。

![Here's the list of categories for the global Vocabulary you want to associate to the user Segment.](./session-property-vocabularies/images/01.png)

![The available options in the session-based Segment corresponds to the Categories in the global Vocabulary.](./session-property-vocabularies/images/02.png)

新しいグローバルボキャブラリを作成することも、既存のボキャブラリを使用することもできます。 新しいボキャブラリーを作成したり、既存のボキャブラリーのカテゴリーを更新したりするには、 [コンテンツのカテゴリとボキャブラリの定義](./defining-categories-and-vocabularies-for-content.md) を参照してください。 ボキャブラリーは、 [公開または内部可視性](./organizing-content-with-categories-and-tags.md#vocabulary-visibility) で使用できます。 セッションプロパティのボキャブラリは、グローバルボキャブラリでのみ機能します。

```{note}
グローバル・ボキャブラリーの作成と編集は、グローバル・サイトでのみ可能です。
```

## セッションプロパティのボキャブラリの定義

[セッション・ベース・セグメントの語彙の設定](#configuring-the-vocabulary-for-the-session-based-segment) セッション・ベースのセグメント用に語彙を構成した後、その語彙を、新しいセッション・プロパティ語彙で利用可能な セッション・プロパティのいずれかにリンクする必要があります。

![Configuring the Vocabulary to work with the Segment's Session Property.](./session-property-vocabularies/images/03.png)

1. グローバルメニューをクリックし、 **コントロールパネル** タブをクリックします。

1. Configurationセクションで、 **System Settings** をクリックします。

1. コンテンツとデータセクションで、 **セグメント** をクリックします。

1. **Session Property Vocabularies** をクリックします。

1. **Add** をクリックして、新しいセッション・プロパティ・ヴォキャブラリを作成します。

1. ［Selection Property］ドロップダウンメニューでプロパティを選択します。

   ![Select the property you want to associate to the global Vocabulary.](./session-property-vocabularies/images/06.png)

    ```{note}
    別のセッションプロパティのボキャブラリに属するプロパティを選択することはできません。 これらのプロパティはグレー表示されており、使用できません。
    ```

1. 語彙名のドロップダウンメニューから、 **語彙** を選択します。

1. ［**保存**］をクリックします。

![Create a Session Property Vocabulary and save it.](./session-property-vocabularies/images/05.gif)

## セッションベースのセグメントの作成

[Vocabulary](#configuring-the-vocabulary-for-the-session-based-segment) を構成し、 [Session Property Vocabulary](#defining-the-session-property-vocabulary) を定義した後、Segment を作成することができます。 セグメントの作成については、 [ユーザーセグメントの作成と管理](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md#creating-user-segments) を参照してください。

セグメントの条件を定義し、グローバルボキャブラリにリンクされたセッションプロパティの1つを使用すると、セッションプロパティの条件が事前定義され、ドロップダウンメニューから選択できるようになりました。 このドロップダウンメニューは、セッション・プロパティ・ヴォキャブラリで [定義したヴォキャブラリ（Vocabulary）を](#defining-the-session-property-vocabulary) するためのカテゴリのリストに対応します。

```{important}
セッションプロパティのボキャブラリ内のカテゴリのいずれか、またはユーザーセグメントにリンクされているボキャブラリが削除されても、セグメントは定義に基づいて動作します。 Liferayは、セグメントエディタでこの状況を警告します。
```

![A warning message appears when one of the categories or the Vocabulary in the Session Property Vocabulary is missing.](./session-property-vocabularies/images/08.png)

## 関連情報

- [コンテンツのカテゴリーと語彙の定義](./defining-categories-and-vocabularies-for-content.md)
- [ユーザーセグメントの作成と管理](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md#creating-user-segments)
- [Segments Editor UI リファレンス](../../site-building/personalizing-site-experience/segmentation/segments-editor-ui-reference.md)
