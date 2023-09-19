# ユーティリティページの使用

{bdg-secondary}`7.4 U86+ および GA86+`

ユーティリティページは、特定の操作タスクやアクションを提供し、通常、ユーザーがウェブサイトやアプリケーションと効果的にやりとりするために不可欠です。 ユーティリティ・ページは、サイトの500エラー・ページと404エラー・ページに設定できる。 将来的には、この機能は他の一般的なページ（サインインや利用規約のページなど）にも拡大される予定だ。

Liferayは [、すぐに使えるユーティリティページ](#viewing-utility-pages) 、簡単にカスタマイズできます。 また、 [ゼロからユーティリティ・ページ](#creating-a-new-utility-page) を作成することもできる。

![Liferayはすぐに使えるソリューションを提供し、ニーズに合わせてカスタマイズすることもできます。](./using-utility-pages/images/01.png)

## ユーティリティページの表示

ユーティリティページの編集、プレビュー、コピーができます。

1. *Product Menu* ( ![Product Menu icon](../../../images/icon-product-menu.png) ) を開き、 *Site Builder* &rarr; *Pages* &rarr; *Utility Pages* タブに移動します。

    すぐに使えるページには、 `PROVIDED BY LIFERAY` タグがついています。

1. ページを選択し、 *Actions* ( ![Actions Icon](../../../images/icon-actions.png) ) をクリックして、利用可能なオプション（例： *Edit*, *Preview*, または *Make a Copy*）を表示し、選択します。

```{tip}
コンテンツページ](../using-content-pages/adding-elements-to-content-pages.md)を編集するのと同じ方法で、ユーティリティページを編集してください。

ユーティリティ・ページを直接編集することも、コピーを作成してから編集することもできます](./using-utility-pages/images/02.png)
```

## 新しいユーティリティ・ページの作成

新しいユーティリティ・ページを作成するには、以下の手順に従ってください：

1. *Product Menu* ( ![Product Menu icon](../../../images/icon-product-menu.png) ) を開き、 *Site Builder* &rarr; *Pages* &rarr; *Utility Pages* タブに移動します。

1. *Add* ( ![Actions Menu](../../../images/icon-add.png) ) を選択する。

1. 作成したいユーティリティページのタイプを選択します。

1. *Blank* を選択して空のコンテンツページを作成するか、利用可能なマスターページテンプレートを選択します。

1. ユーティリティ・ページに名前を付け、 *Save*をクリックします。

新しく作成されたユーティリティページは、 [コンテンツページ](../using-content-pages/adding-elements-to-content-pages.md)を編集するのと同じ方法で編集できます。

## ユーティリティ・ページをデフォルトとして選択する

新しいユーティリティ・ページをデフォルトとして選択するには、以下の手順に従います：

1. *Product Menu* ( ![Product Menu icon](../../../images/icon-product-menu.png) ) を開き、 *Site Builder* &rarr; *Pages* &rarr; *Utility Pages* タブに移動します。

1. ユーティリティページのアクションメニュー( ![Actions Menu](../../../images/icon-actions.png) )を選択します。

1. *Mark as Default*を選択する。

![アクション・メニューで、ユーティリティ・ページをデフォルト・ページとして選択する。](./using-utility-pages/images/03.png)

```{note}
サイトにページがない場合、ユーティリティ・ページが適用されていても、デフォルトの404エラー・ページが表示されます。
```

## ユーティリティページのパーミッション

ユーティリティ・ページには、その使用を管理するパーミッションがあります。

| 権限名                    | Description                       |
| ---------------------- | --------------------------------- |
| ユーティリティページを追加          | ユーティリティページの追加に必要。                 |
| デフォルトのユーティリティページを割り当てる | ユーティリティ・ページをデフォルト・ページに割り当てるために必要。 |

<!-- TASK: LPS-155184 Document 404 Error pages can be added to custom site initializers -->