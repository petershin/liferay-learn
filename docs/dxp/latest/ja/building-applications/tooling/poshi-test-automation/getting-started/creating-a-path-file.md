# パスファイルの作成

## テストシナリオ

以下のテストシナリオを使用して、最初のパスファイルを作成します。

  learn.liferay.comの記事に自分の名前が表示されないことをテストします。 下記の手順で行います。 別のブラウザで手動で操作して手順を確認してください。

  1. [Liferay Learn サイト](http://learn.liferay.com) に移動します。

  1. 検索入力フィールドをクリックします。

  1. 検索キーワードに自分の名前を入力してください。

  1. Enterキーを押して、検索キーワードを入力します。

  1. 検索結果がないことをアサートします。 自分の名前で検索して結果が出る場合は、他の名前を選択してください。

  1. 利用できる記事がないというメッセージが表示されることをアサートします。

## ロケーターを集める

与えられたテストシナリオから、テストが相互作用する必要がある要素を集めます。

1. Liferay LearnサイトのURLが必要です。`http://learn.liferay.com`.

1. ブラウザのWeb Developer Consoleを開きます（F12。これにより、DOMが表示されます）。 コンソールには矢印のついたアイコンが表示され、検索バーを調べてロケーターを取得することができます。 これをセレクターと呼びます。

1. セレクターアイコンで検索バーをクリックし、DOMのハイライト部分からロケーターを決定します。 この場合、 `//input[@placeholder="Search..."]`を使用します。

1. 名前を検索すると、検索結果ページに移動します。

1. 再度、Web Developer Consoleのセレクターアイコンを使って、「結果がありません」というメッセージをクリックし、パスを決定します。この場合、 `//h1[contains(.,'No results were found.')]`を使用します。

1. さらにアサーションしたい場合は、例えば「ステージング」と検索するなど、確実に結果が出る言葉で検索してください。検索結果が表示されたら、セレクターアイコンを使って、結果の1つのパスを取得することができます。 この場合、 `//input[@data-qa-id=searchInput]と@value='Staging']`を使用します。なお、「ステージング」という言葉はこの検索結果に特有のものであり、他のシナリオで使用するにはパスの柔軟性に欠けることに注意してください。このパスを再利用できるようにするために、テストケースから渡せる次の変数を使用します： `//input[@data-qa-id='searchInput' and @value='${key_searchTerm}']`。詳細は、[変数の使用](../poshi-basics/poshi-layers/variables.md)を参照してください。

## パスファイルの構築

1. `poshi-standalone/poshi-tests/paths`ディレクトリにある空のファイルから始め、`LiferayLearn.path`という名前を付けます。

1. htmlタグを追加してテーブルを作成し、タイトルとテーブルのヘッダーにファイル名を追加してください。

1. 以下の例のように、ロケーターに名前を付けて、各行にxpathを追加します。

```
<html>
<head>
<title>LiferayLearn</title>
</head>

<body>
<table border="1" cellpadding="1" cellspacing="1">
<thead>
<tr><td rowspan="1" colspan="3">LiferayLearn</td></tr>
</thead>

<tbody>
<tr>
    <td>NO_RESULTS_MESSAGE</td>
    <td>//h1[contains(.,'No results were found.')]</td>
    <td></td>
</tr>
<tr>
    <td>SEARCH_BAR</td>
    <td>//input[@placeholder="Search..."]</td>
    <td></td>
</tr>
<tr>
    <td>SEARCH_RESULTS</td>
    <td>//input[@data-qa-id='searchInput' and @value='${key_searchTerm}']</td>
    <td></td>
</tr>
</tbody>

</table>
</body>
</html>
```
