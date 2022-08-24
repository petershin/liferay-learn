# オブジェクトレイアウトの設計

{bdg-secondary}`Liferay DXP/Portal 7.4以降で利用可能`

オブジェクトレイアウトは、エントリーを作成または編集するときに、そのフィールドと関連がどのように編成および表示されるかを定義します。 デフォルトでは、オブジェクトポートレットで作成されたアプリケーションは、エントリーに自動生成されたレイアウトを使用します。 このレイアウトには、すべてのオブジェクトフィールドをアルファベット順に表示する単一のタブがあります。 ただし、カスタムレイアウトを設計して、要素を表示する方法と場所を決定できます。

```{important}
自動生成されたレイアウトには、オブジェクトリレーションは表示されません。 リレーションシップを表示するには、専用のリレーションシップタブを使用してカスタムレイアウトを作成する必要があります。
```

```{note}
カスタムレイアウトは、カスタムオブジェクトにのみ追加できます。 システムオブジェクトに追加することはできません。
```

## オブジェクトエントリレイアウトの追加

1. **オブジェクト** ポートレットを開き、目的の **オブジェクト** をクリックします。

1. ［**Layouts**］ タブをクリックし、 **追加** ボタン（![Add Button](../../../images/icon-add.png)）を選択します。

   ![［Layouts］タブの追加ボタンをクリックし、新しいレイアウトの名前を入力して、［保存］をクリックします。](./designing-object-layouts/images/01.png)

1. **名前** を入力し、 ［**Save**］ をクリックします。

保存すると、新しい空白のレイアウトが作成されます。 これで、カスタムレイアウトに [タブを追加](#adding-layout-tabs) し、エントリーの作成と編集のためにオブジェクトのフィールドとリレーションシップをどのように編成するかを決定できます。

## レイアウトタブの追加
<!--TASK: Add drag and drop details once implemented.-->
オブジェクト要素は、次の2種類のタブに整理できます。

[**フィールド**](#fields-tabs)：オブジェクトエントリーフィールドを表示します。 これには、オブジェクトで直接作成されたフィールド、または **一対多** のリレーションシップから継承されたフィールドが含まれます。 <!--TASK: Add in One to One after implemented-->

[**リレーションシップ**](#relationships-tabs) ：リレーションシップテーブルを表示し、 **一対多** のリレーションシップの親側と **多対多** のリレーションシップの両側を表示するために使用する必要があります。

レイアウトを設計するには、必要なすべての [フィールド](#fields-tabs) と [リレーションシップ](#relationships-tabs) を追加するまで、次の手順を繰り返します。

```{important}
オブジェクトエントリーの作成中は、最初のタブのみが表示されます。 他のタブは、オブジェクトエントリーを編集するときにのみ表示されます。

また、レイアウトの最初のタブにリレーションシップを含めることはできません。また、［リレーションシップ］タブは、［フィールド］タブが設定された後でのみレイアウトに追加できます。
```

### フィールドタブ

1. 目的のレイアウトをクリックして、 ［**レイアウト**］ タブに移動します。

   ![［レイアウト］タブには、レイアウトを作成するためのコントロールが含まれています。](./designing-object-layouts/images/02.png)

1. Click **Add Tab** , enter a **Label** , select the **Fields** type, and click **Save** .

   ラベルの値によって、Liferay UIでのタブの表示名が決定します。

   ![Click Add Tab, enter a Label, select the Fields type, and click Save.](./designing-object-layouts/images/03.png)

1. Click **Add Block** , enter a **Label** , and click **Save** .

   これにより、フィールドを追加できるタブサブセクションが作成されます。 ラベルの値によって、Liferay UIでのブロックの表示名が決定します。

   ```{note}
   フィールドをタブに直接追加することはできず、ブロックにまとめておく必要があります。
   ```

   ![Click Add Block, enter a Label, and click Save.](./designing-object-layouts/images/04.png)

1. Click **Add Field** , select the desired field, determine whether the field is displayed in one, two, or three columns, and click **Save** .

   ```{note}
   フィールドは、レイアウトで1回だけ使用できます。
   ```

   ![Click Add Field, choose a field, select the number of columns the field is displayed in, and click Save.](./designing-object-layouts/images/05.png)

1. ［**フィールドを追加**］ をクリックしてさらにフィールドをブロックに追加するか、 ［**Add Block**］ をクリックして追加するフィールド用に新しいブロックをタブに追加します。

1. トグルスイッチを使用して、ブロックが **折りたたみ可能** かどうかを決定します。

   ![トグルスイッチを使用して、ブロックが折りたたみ可能かどうかを決定します。](./designing-object-layouts/images/06.png)

1. ［**保存**］ をクリックします。

### リレーションシップタブ

1. 目的のレイアウトを選択して、 ［**Layout**］ タブに移動します。

   ![Click the desired layout, and go to the Layout tab.](./designing-object-layouts/images/07.png)

1. Click **Add Tab** and enter a **Label** . この値によって、Liferay UIでのタブの表示名が決定します。

1. For tab type, select **Relationships** .

1. Select the relationship you want to display in the tab. Only one relationship can be displayed per tab.

   ```{note}
   レイアウトに少なくとも1つの［フィールド］タブがある場合にのみ、［関連］タイプを選択できます。 エントリーの作成時に関連を設定することはできないため、［関連］タブをオブジェクトレイアウトの最初のタブにすることはできません。 エントリーを他のオブジェクトエンティティに関連付けるには、まずそのエントリーが存在していなければなりません。
   ```

   ![タブのタイプとして［関連］を選択し、［One to Many］または［Many to Many］を選択して、関連テーブルを決定します。](./designing-object-layouts/images/08.png)

1. ［**保存**］ をクリックします。

## Adding Categorization

{bdg-secondary}`Available Liferay 7.4 U31+ and GA31+`

If desired, you can add a **Categorization** block to [**Fields** tabs](#fields-tabs) . End users then have access to tags and categories they can apply to Object entries.

```{note}
Visibility and permissions can affect how the Categorization block is displayed.
```

Follow these steps to add a Categorization block to a Fields tabs:

1. 目的のレイアウトを選択して、 ［**レイアウト**］ タブに移動します。

1. Click the **Actions** button (![Actions Button](../../../images/icon-actions.png)) for the desired [**Fields** tab](#fields-tabs) and select **Add Categorization** .

   ![Click the Actions button and select Add Categorization.](./designing-object-layouts/images/09.png)

   This adds a new block to the tab for accessing categorization tools.

   ```{important}
   You can only add the Categorization block to one tab per layout.
   ```

1. Determine whether the block is **collapsible** .

   ![Determine whether the Categorization block is collapsible.](./designing-object-layouts/images/10.png)

1. ［**Save**］ をクリックします。

Now when creating or editing the Object's entries, users can access and apply tags and categories.

![Access and apply tags and categories to the Object's entries.](./designing-object-layouts/images/11.png)

## デフォルトのレイアウトの選択

目的のフィールドと関連をカスタムレイアウトに追加したら、それをオブジェクトのデフォルトレイアウトとして設定できます。 これにより、オブジェクトのエントリーの作成と編集に確実に使用されるようになります。 デフォルトとしてカスタムレイアウトが選択されていない場合、オブジェクトは自動的に生成されたレイアウトを使用します。

```{important}
デフォルトとしてカスタムレイアウトを選択するには、必要なすべてのオブジェクトフィールドをレイアウトの最初のタブに追加する必要があります。
```

次の手順に従って、オブジェクトのデフォルトのレイアウトを選択します。

1. Select the desired layout.

1. In the Basic Details tab, check **Mark as Default** .

   ![Check Mark as Default and click Save.](./designing-object-layouts/images/12.png)

1. ［**Save**］ をクリックします。

オブジェクトのエントリーを作成および編集するときに、レイアウトが使用されるようになりました。

## 追加情報

* [オブジェクトの作成](./creating-objects.md)
* [オブジェクトへのフィールドの追加](./adding-fields-to-objects.md)
* [オブジェクトリレーションの定義](./defining-object-relationships.md)
* [オブジェクトの管理](./managing-objects.md)
