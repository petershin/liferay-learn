# リモートアプリケーション

```{toctree}
:maxdepth: 3

remote-apps/understanding-remote-app-types.md
remote-apps/remote-apps-tutorials.md
remote-apps/remote-apps-ui-reference.md
```

リモートアプリケーションは、OSGiモジュールを開発してLiferayサーバーにデプロイすることなく、Liferay DXPを拡張するためのアプリケーションです。 Liferayのフロントエンドインフラストラクチャを使用して、外部アプリケーションをプラットフォームと統合し、それらをページウィジェットとしてレンダリングします。 リモートアプリケーションを使用して、任意のドメインのアプリケーションを統合します。

![外部JSアプリケーションをLiferayプラットフォームに登録し、ページウィジェットとしてレンダリングします。](./remote-apps/images/01.png)

Liferayにアプリケーションを登録するために必要なURLと詳細を含む、会社レベルでのリモートアプリケーションエントリーを作成します。 次に、Liferayはエントリーごとにウィジェットを生成し、エントリータイプに従ってアプリケーションをレンダリングします。

Liferayは、*Iframe*と*カスタム要素*の2種類のリモートアプリケーションエントリーを提供します。 両方のタイプがページのライフサイクルのレンダリング中にページに組み込まれますが、ホストとレンダリングの方法は異なります。 また、Liferayサービスとランタイムデータへのアクセスレベルも異なります。

* [IFrame](./remote-apps/understanding-remote-app-types.md#using-the-iframe-type)：このタイプはアプリケーションをIFrame要素（`<iframe>`）にレンダリングし、LiferayのオプションのクライアントSDK APIを使用してホストページとの限られたやりとりを可能にします。 このタイプの各エントリーには、アプリケーションが実行されている場所へのURL参照が格納されます。

* [カスタム要素](./remote-apps/understanding-remote-app-types.md#using-the-custom-element-type)：このタイプは、アプリケーションを[HTMLカスタム要素](https://web.dev/custom-elements-v1/)としてレンダリングし、新しいタグを作成してそれらをカスタムロジックに関連付けることによって、ページのHTMLを拡張します。 このタイプの各エントリーには、アプリケーションのコードへのURL参照が格納されます（つまり、ドキュメントまたはクラウドライブラリに格納されている必須の`.js`ファイルと`.css`ファイル）。

リモートアプリケーションを使用すると、カスタムアプリケーションの開発サイクルをプラットフォームから切り離し、特定のLiferayバージョンへの依存度が低いLiferay互換アプリケーションを構築することができます。

このアプローチは、あらゆる種類の開発環境に役立ちます。 オンプレミスのシナリオでは、Liferayプラットフォームへの依存を減らし、アップグレードパスを簡素化するのに役立ちます。 マルチテナントおよびSaaS環境では、リモートアプリケーションは、Liferayサーバーにモジュールをデプロイすることなく、強力なカスタマイズ機能を提供します。

開始するには、[Creating a Basic Remote App](./remote-apps/remote-apps-tutorials/creating-a-basic-remote-app.md)を参照してください。

```{raw} html
:file: ../landingpage_template.html
```

```{raw} html
:file: remote-apps/landing.html
```
