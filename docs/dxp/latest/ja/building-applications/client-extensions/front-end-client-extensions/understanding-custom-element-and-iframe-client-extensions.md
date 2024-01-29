# カスタム要素とIFrameクライアント拡張機能を理解する

カスタム要素とIFrameクライアント拡張は、アプリケーションをLiferayに登録し、サイトページ上にウィジェットとして描画します。

これらのフロントエンド拡張の1つを作成すると、Liferayはウィジェットを生成し、OSGiサービスレジストリに追加します。 アプリケーションの描画方法を設定するために、エントリまたはウィジェットスコープで追加のプロパティを設定することができます。

カスタム要素とIFrameアプリケーションは、異なるホスト、異なる描画、そしてLiferayサービスとランタイムデータへの異なるレベルのアクセスを持っています。

```{tip}
 [カスタムエレメント](#using-the-custom-element-type) タイプは、Liferayプラットフォームとの統合をより強化し、より複雑なシナリオをサポートします。
```

## カスタム要素タイプの使用

カスタムエレメントクライアント拡張タイプは、外部アプリケーションコードを別のHTML `<custom-element>`にレンダリングし、Liferayホストページとの完全な統合を提供します。 カスタム要素アプリケーションのアーキテクチャーは、Liferayサーバー、Liferayホストページ、そしてアプリケーションを格納する外部サーバーの3つの主要な部分を含んでいます。 Liferayはこれらのファイルを使用して、ブラウザでアプリケーションを作成します。

![The custom element architecture includes an entry in the Liferay server, application code stored on a server, and the Liferay page with the client extension's unique widget.](./understanding-custom-element-and-iframe-client-extensions/images/02.png)

各カスタム要素のエントリーには、HTML要素名および必要なJavaScriptおよびCSSファイルのURLが含まれます。 また、ランタイム時にアプリケーションと一緒に描画されるプロパティも含められます。

ページに追加されると、Liferayはクライアント拡張機能のJavaScriptとCSSファイルを `<script>` と `<link>` 要素を使って直接ページに挿入します。 JavaScriptは、アプリケーションを宣言してインスタンス化し、CSSファイルがそれをスタイル設定します。

```{important}
アプリケーションのコードは、カスタム要素を宣言し、リモートアプリケーションエントリーの名前と一致するHTML要素名を提供する必要があります。 このため、 [IIFE](https://developer.mozilla.org/en-US/docs/Glossary/IIFE) を使用して、アプリのコードがロードされるとすぐにブラウザでカスタム要素宣言が実行されるようにしなければならない。
```

リモートアプリケーションのウィジェットがページに追加されると、まず提供されたHTML要素名を持つタグを生成し、要素のコードで定義されたロジックを実行することで、アプリケーションマークアップがレンダリングされます。 エントリまたはウィジェットのインスタンスがプロパティを含む場合、それらは生成されたカスタム要素のマークアップに追加されます (`<custom-element (+props)/>`)。

いったんレンダリングされると、アプリケーションはLiferayページに完全に統合されるので、LiferayのパブリックJavaScript APIを使用し、ホストページですでに利用可能なスタイルクラスを再利用することができます。 しかし、カスタム要素をどのように構築するか、そのスタイルルールをどこに置くかによって、これを変更することができます。 例えば，アプリケーションのマークアップに [Shadow DOM](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_shadow_DOM) が使われている場合，カスタム要素のスタイルとホストページのスタイルを分離することができます。

```{note}
カスタム要素ウィジェットの複数のインスタンスがページに追加された場合、LiferayはアプリケーションのURLを一度だけ含めます。
```

## IFrameタイプの使用

IFrameクライアント拡張タイプは、外部アプリケーションを独立した `<iframe>` 要素にレンダリングし、LiferayのクライアントSDK APIを使ってホストページとの限定的なインタラクションを可能にします。 IFrameアプリケーションのアーキテクチャは、Liferayサーバー、Liferayホストページ、そしてアプリケーションをホストする外部サーバーの3つの主要な部分を含んでいます。

![The IFrame architecture includes an entry in the Liferay server, an application hosted on an external server, and the Liferay Page with the client extension's unique widget.](./understanding-custom-element-and-iframe-client-extensions/images/01.png)

各IFrameエントリーは、通常外部サーバーから提供されるアプリケーションにリンクするIFrame URLを格納します。 その結果、アプリケーションは、マークアップ、スクリプト、スタイル、および（オプションで）クライアントSDKを含むHTMLドキュメントを提供する必要があります。

クライアントの拡張機能のウィジェットをページに追加すると、Liferay はエントリの URL を使って外部アプリケーションのコンテンツを含む `<iframe>` タグをレンダリングします。 エントリーやウィジェットのインスタンスがプロパティを含んでいる場合、それらは追加のURL属性(`<iframe (+properties)/>`)としてアプリケーションに渡されるので、アプリケーションはプログラム的にそれらにアクセスすることができる。

```{note}
IFrameアプリはサーバーにデプロイされ、独自のマークアップを組み立て、それをブラウザに送ってウィジェットの`を埋めることができる。`<iframe>` 要素. 対照的に、 [Custom Element apps](#using-the-custom-element-type) は、マークアップを生成するためにサーバーを必要としない。 ブラウザはアプリのウィジェットとJavaScriptコードを介して必要なロジックを実行する責任があるため、URLを介してアプリケーションのコードを利用できるようにする必要があります。
```

デフォルトでは、すべてのブラウザはIFrameアプリケーションに対して「同一生成元」ポリシーを課し、ホストページとその外部アプリケーション間の情報フローを防止しています。 Liferayは、IFrame要素とLiferayページとの間の限定的な通信を可能にするクライアントSDKスクリプトを提供します。 `postMessage()`APIを介してページとの通信プロトコルを実装することで動作する。 このスクリプトを使用するには、アプリケーションのマークアップに含める必要があります。

IFrameアプリがクライアントSDKを使用する場合、Liferayページは現在のログインユーザーとして、アプリケーションに代わって特定のアクションを実行する指示を受け取ります。 これには、DXPサーバーへのサービス呼び出しや、状態の詳細へのアクセス（ホストページでトーストを開く、ヘッドレスAPIを呼び出す、GraphQLクエリを実行する、スタイルプロパティにアクセスするなど）が含まれます。

## 関連トピック

* [クライアント拡張機能の紹介](../../client-extensions.md)
* [基本的なカスタム要素の作成](./tutorials/creating-a-basic-custom-element.md)
* [リモートアプリケーションUIリファレンス](./client-extensions-ui-reference.md)
