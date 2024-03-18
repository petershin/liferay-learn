# カスタムアプリケーションのデプロイ

[custom element client extension](../../../building-applications/client-extensions/frontend-client-extensions.md#custom-element-client-extensions) を使って、JavaScript アプリケーションを Liferay サイトページのウィジェットとしてレンダリングできます。 アプリケーションはLiferayによって提供され、 [ヘッドレスAPI](../../../headless-delivery/using-liferay-as-a-headless-platform.md) を通してLiferayとやりとりします。

`liferay-ticket-custom-element` クライアントエクステンションをデプロイします。

1. 以下のコマンドを実行する：

   ```bash
   ./gradlew :client-extensions:liferay-ticket-custom-element:deploy
   ```

1. Liferayで **Product Menu**(![Product Menu](../../../images/icon-product-menu.png)) を選択し、 **Site Builder** &rarr; **Pages** に移動します。

1. [アイコンの追加](../../../images/icon-add.png) )をクリックし、 **Page** を選択する。

1. ブランクタイプのページを選択する。 ページに名前をつける（例：`ticketing system`）。 追加」をクリックする。

1. 左のナビゲーションのフラグメントとウィジェットの下にある_ウィジェットタブをクリックします。

1. クライアント拡張タイプウィジェットまでスクロールダウンしてください。 **Liferay Ticket Custom Element** ウィジェットをページにドラッグします。

1. **Publish** をクリックする。

カスタムチケットシステムアプリケーションがサイトページ上で動作するようになりました。

![The custom ticketing system application is now running.](./deploying-a-custom-application/images/01.png)

新しいチケットを生成する」ボタンをクリックすると、さらにランダムなチケットエントリーが生成されます。 また、 **コントロールパネル** &rarr; **チケット** から独自のチケットオブジェクトエントリーを作成することもできます。

## カスタム要素コードを調べる

`client-extension.yaml`ファイルの`assemble`ブロックセクションは次のようになっている：

```yaml
assemble:
    - from: build/assets
      into: static
```

なお、JavaScriptアプリケーションの `.js` と `.css` のビルドファイルは `build/assets` フォルダからコピーされ、配置可能なクライアントの拡張ファイル `.zip` に格納される。

この `liferay-ticket-custom-element` は [カスタム要素](../../../building-applications/client-extensions/frontend-client-extensions.md#custom-element-client-extensions) タイプのクライアント拡張です。 これは`client-extension.yaml`ファイルで以下のように定義されている：

```yaml
liferay-ticket-custom-element:
   cssURLs:
      - "*.css"
   friendlyURLMapping: current-tickets-custom-element
   htmlElementName: current-tickets-custom-element
   instanceable: false
   name: Current Tickets Custom Element
   portletCategoryName: category.client-extensions
   type: customElement
   urls:
      - "*.js"
   useESM: true
```

各プロパティの説明は [カスタム要素のYAML設定リファレンス](../../../building-applications/client-extensions/frontend-client-extensions/custom-element-yaml-configuration-reference.md) を参照してください。

アプリケーションに関連するJavaScriptファイルは`/src`フォルダに含まれている。 JavaScriptコードの完全な説明はこのチュートリアルの範囲を超えているが、注意すべき点がいくつかある：

* `src/pages/TicketApp.tsx`ファイルは発券システムページの全体的なレイアウトを定義します。
* `src/services/tickets.ts`ファイルでは、 [データスキーマ](./defining-a-custom-data-schema.md) が定義されたときに作成された `j3y7ticket` オブジェクトを使用してチケットが作成され、フェッチされます。 `src/ticket.js`ファイルの `generateNewTicket()` 関数は、ランダムなフィールドを持つ追加のチケットエントリーを生成することに注意してください。
* `src/services/tickets.ts`ファイルでは、オブジェクトのヘッドレス API 呼び出しは`Liferay.authToken` オブジェクトで認可されます。 このオブジェクトはWebコンポーネントがLiferay上で動作しているときに利用でき、OAuth2の認可を簡素化します。
* `package.json`ファイルには、JavaScriptアプリケーションの初期化とビルドを処理する `scripts{ build: }` 要素が含まれている。

次へ [文書紹介システムの導入](./implementing-a-documentation-referral-system.md) .

## 関連コンセプト

* [基本的なカスタム要素の作成](../../../building-applications/client-extensions/frontend-client-extensions/tutorials/creating-a-basic-custom-element.md) 
* [カスタムエレメントとIframeクライアント拡張機能を理解する](../../../building-applications/client-extensions/frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 
