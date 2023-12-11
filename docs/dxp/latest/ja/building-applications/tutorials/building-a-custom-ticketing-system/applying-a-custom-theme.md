# カスタムテーマの適用

あなたのサイトのルック＆フィールをカスタマイズするために、さまざまな [フロントエンドクライアント拡張](../../../building-applications/client-extensions/front-end-client-extensions.md) を使用することができます。 具体的には、 [テーマCSSタイプ](../../../building-applications/client-extensions/front-end-client-extensions.md#theme-css-client-extensions) クライアントエクステンションは、 [カスタムテーマの構築](../../../site-building/site-appearance/themes/introduction-to-themes.md) の代替として使用できます。

`liferay-ticket-theme-css`クライアントエクステンションをデプロイします。

1. 以下のコマンドを実行する：

   ```bash
   ./gradlew :client-extensions:liferay-ticket-theme-css:deploy
   ```

1. Liferayで_Product Menu_ (![Product Menu](../../../images/icon-product-menu.png)) を選択し、_Site Builder_ &rarr; _Pages_に移動します。

1. グローバルメニューの右上にある_Options_（！[オプションアイコン](../../../images/icon-options.png)）をクリックし、_Configuration_をクリックします。

1. テーマCSSクライアント拡張セクションまでスクロールダウンし、_Add_ (![Add icon](../../../images/icon-plus.png)) をクリックします。

1. 配置されたTickets Theme CSSを選択します。

   ![Select the ticket theme css client extension.](./applying-a-custom-theme/images/01.png)

1. 一番下までスクロールし、「保存」をクリックします。 製品メニューで、_Home_をクリックします。 カスタムテーマが適用されました。

## カスタムテーマのCSSコードを調べる

`client-extension.yaml`ファイルの`assemble`ブロックセクションは次のようになっている：

```yaml
assemble:
    - from: build/buildTheme/img
      into: static/img
```

この `liferay-ticket-theme-css` は [テーマ CSS](../../../building-applications/client-extensions/front-end-client-extensions.md#theme-css-client-extensions) タイプのクライアント拡張です。 これは次のように定義されている：

```yaml
liferay-ticket-theme-css:
    clayURL: css/clay.css
    mainURL: css/main.css
    name: Tickets Theme CSS
    type: themeCSS
```

各プロパティの説明は [Theme CSS YAML Configuration Reference](../../../building-applications/client-extensions/front-end-client-extensions/theme-css-yaml-configuration-reference.md) を参照してください。

テーマのカスタマイズは、`/src/css`フォルダ内の2つのファイルに表示されます。

`_clay_variables.scss`ファイルは上書きするCSS粘土変数を指定します。

`_custom.scss`ファイルはCSSのカスタマイズを提供する。

変数とカスタマイズの詳細については、 [Clay CSS](https://clayui.com/docs/css/index.html) ドキュメントをご覧ください。 また、 [using the theme CSS client extension](../../../building-applications/client-extensions/front-end-client-extensions/tutorials/using-a-theme-css-client-extension.md) 、別のクライアント拡張の例をご覧ください。

次へ [カスタム発券アプリケーションのデプロイ](./deploying-a-custom-application.md) .

## 関連コンセプト

* [テーマ入門](../../../site-building/site-appearance/themes/introduction-to-themes.md) 
* [フロントエンド・クライアント拡張](../../../building-applications/client-extensions/front-end-client-extensions.md) 
