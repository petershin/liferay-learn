# ページフラグメントでカスタムフィールドを使用する

[カスタムフィールド](../../../system-administration/configuring-liferay/adding-custom-fields.md) をLiferayのユーザーやページに追加した場合、フラグメントでアクセスすることができます。 ページカスタムフィールドの値を取得するためには、以下のようにします。

```ftl
layout.getExpandoBridge().getAttribute("ATTRIBUTE_NAME")
```

ページカスタムフィールドをフラグメントで使用するには、まず [カスタムフィールド](../../../system-administration/configuring-liferay/adding-custom-fields.md)を追加し、次にサイトメニュー &rarr; Fragments からフラグメントエディタでページフラグメントを追加または編集します。

このHTMLの例では、カスタムフィールド `showFooter` を使って、ページ上のプレースホルダー `footer` 要素を表示／非表示にしています。

```ftl
[#assign showFooter = layout.getExpandoBridge().getAttribute("showFooter")]

[#if showFooter]
    <footer class="bg-dark pb-8 pt-6 section-footer text-white">
        Placeholder footer content...
    </footer>
[/#if]
```

ページの `showFooter` の値を true または false に切り替えると、それぞれフッターを表示または非表示にすることができます。

![ページカスタムフィールドの値を使用して、ページ上のHTMLフッターコンテンツを表示または非表示にします。](./using-custom-fields-in-page-fragments/images/01.png)

ユーザー用のカスタムフィールドにアクセスするには

```ftl
user.getExpandoBridge().getAttribute("ATTRIBUTE_NAME")
```

ゲストユーザーは、カスタムフィールドに値を設定できない場合があります。 この場合、ゲストユーザーのカスタムフィールド値を取得しようとすると、ページ表示時にエラーが発生します。 ユーザーカスタムフィールドを持つフラグメントを開発する際には、ゲストユーザのアクセスを考慮するようにしてください。

このようにFreeMarkerのコードを追加することで、値が存在するかどうかをチェックしてから使用することができます。

```ftl
[#if user.getExpandoBridge().getAttribute("showFooter")??]
    ...
[#/if]
```

## 関連トピック

* [ユーザーへのカスタムフィールドの追加](../../../system-administration/configuring-liferay/adding-custom-fields.md)

* [フラグメントエディターの使用](./using-the-fragments-editor.md)
