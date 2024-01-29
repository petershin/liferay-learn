# ユーザーセグメントの作成と管理

セグメント **を使用すると、ユーザー** ジョブ・タイトル_やユーザー **言語** のような共通の プロパティに基づいて、ユーザーの異なるグループを作成することができます。 セグメントを定義するために使用できるプロパティの一覧については、 [セグメントエディターUIリファレンス](./segments-editor-ui-reference.md) を参照してください。 既存のプロパティに加えて、 [Custom Fields](../../../system-administration/configuring-liferay/adding-custom-fields.md) をユーザーグループと組織グループに追加し、これらのフィールドをセグメント基準で使用することができます。

## 複合セグメント

{bdg-secondary}`liferay DXP/Portal 7.3+`.

既存のセグメントを組み合わせて、新しい_複合セグメントを作成することができます。 複合セグメントは、ベースとなるセグメントからプロパティを継承し、メンバーを自動的に更新します。 プロパティを追加して、複合セグメントをさらにカスタマイズできます。

複合セグメントがどのように機能するかを理解するために、次の例を考えてみましょう。 米国からの訪問者とカナダからの訪問者のニーズは異なるため、プロパティが異なる2つのセグメントを作成し、国ごとに1つのセグメントを作成します。 その後、北米からの訪問者用に新しい標準セグメントを作成し、米国とカナダのセグメントのプロパティを手動でコピーします。 米国またはカナダのセグメントのプロパティを変更すると、北米のセグメントはその変更を継承しません。 これらの変更を反映するには、北米のセグメントを手動で更新する必要があります。 ただし、北米セグメントを複合セグメントとして作成した場合、米国またはカナダのセグメントを変更すると、この複合セグメントはその定義とメンバーを自動的に更新します。

```{important}
既存の複合セグメントを使って新しい複合セグメントを作ることはできない。
```

![Combine two or more segments to create a new Compound Segment](./creating-and-managing-user-segments/images/08.png)

## ユーザーセグメントの作成と管理

次の手順では、新しいセグメントを作成する方法について説明します。

1. 画面左側のサイトメニューから、 **People** &rarr; **Segments** に進みます。

   ![Add User Segments from the People Menu.](./creating-and-managing-user-segments/images/01.png)

1. **追加** ボタン(![追加](../../../images/icon-add.png))をクリックします。

1. 上部のテキスト領域をクリックして、ユーザーセグメントの名前を入力します。

   ```{tip}
   セグメント名の横にあるフラグセレクタを使って、セグメント名を翻訳することができます。
   ```

1. **Properties** エリアから、セグメントを定義するグループとプロパティを選択します。 プロパティ **を** 条件_エリアにドラッグ＆ドロップします。

1. セグメントのConditions（条件）を設定する（ [下記「Configuring Segment's Conditions](#configuring-segment-conditions) 」を参照）。

1. ［**保存**］をクリックします。

### セグメント条件の設定

コンディション*エリアには以下のオプションがある：

- 比較ドロップダウンメニュー（A）を使用して、比較基準を編集します。
- 条件名(B)の横にあるボタンを使って、同じ **プロパティ** グループから **条件** を追加または削除します。
- 別の **プロパティ** グループを使用して条件を追加するには、 **プロパティ**（C）をドラッグアンドドロップします。
- 条件 **と** AND **演算子、***OR** 演算子を組み合わせる（DとE）。

  ![Add and combine Conditions to define the Segment criteria.](./creating-and-managing-user-segments/images/06.png)

[セッション・プロパティ](./segments-editor-ui-reference.md#session-properties) については、 [セッション・プロパティ・ヴォキャブラリ](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md) を用いて、定義済みの値のリストを構成することができます。 このオプションにより、セグメントを定義するタスクが容易になり、手動入力のエラーがなくなります。

```{note}
Liferay DXP 7.4 U42+/GA42+から、ジオロケーションでセグメントを作成できるようになりました。 詳しくは [地理的位置による区分](./segmentation-by-geolocation.md) を参照。
```

編集すると、基準を満たすメンバーの数が［Conditions］領域の上部に表示されます。 View Members*をクリックするとリストが表示されます。 これは、セグメントを正しく定義しているかどうかを判断するのに役立ちます。

![You can view the list of Segment members at any time.](./creating-and-managing-user-segments/images/04.png)

ユーザーセグメントを作成すると、 **Segments** ページのユーザーセグメントリストに表示されます。 ここから、ユーザーセグメントを管理（編集、削除、 [サイトロールの割り当て](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md) ）したり、アクションメニュー（![Actions](../../../images/icon-actions.png)）からユーザーセグメントのパーミッション（ユーザーセグメントにアクセスできる人）を変更したりすることができます。 ユーザーセグメントの名前をクリックして編集することもできます。

![You can edit, delete or manage permissions from the actions menu.](./creating-and-managing-user-segments/images/05.png)

```{note}
ユーザーセグメントがエクスペリエンスで使用されている場合、削除することはできません。
```

## 関連情報

- [ユーザーセグメントへのロールの割り当て](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md)
- [ユーザー・セグメントの分析](./getting-analytics-for-user-segments.md)
- [コンテンツページのパーソナライズ](../experience-personalization/content-page-personalization.md)
- [セッション・プロパティ・ヴォキャブラリー](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md)
