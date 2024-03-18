---
toc:
  - ./deploying-code-to-liferay-saas/deploying-and-managing-a-microservice-client-extension-project.md
  - ./deploying-code-to-liferay-saas/troubleshooting-a-microservice-in-the-cloud-console.md
---
# LXCへのコードのデプロイ

Cloudコンソールにアクセスして使い始めたので、クライアント拡張プロジェクトをLXCインスタンスにデプロイする準備ができました。

```{note}
このモジュールには Liferay Experience Cloud 上のプロジェクトが必要です。 Self-Managed バージョン（LXC-SM）のプロジェクトしかない場合は、 [クラウド構成](./cloud-configuration.md) に進んでください。
```

LXCを使えば、Liferay外のインフラストラクチャの設定や保守を心配する必要がないので、Liferay DXP内のツールを使ってサイトを構築・管理することに集中できます。 しかし、Liferayのアウトオブボックスツールでは不十分な場合、クライアント拡張を使うことができます。

[クライアント拡張](https://learn.liferay.com/w/dxp/building-applications/client-extensions) は、LXCを拡張する包括的な手段である。 [バッチクライアント拡張機能](https://learn.liferay.com/w/dxp/building-applications/client-extensions/batch-client-extensions) 、 [フロントエンドのクライアント拡張](https://learn.liferay.com/w/dxp/building-applications/client-extensions/frontend-client-extensions) 、あるいは [マイクロサービスのクライアント拡張](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions) と統合するためのクライアント・エクステンションをデプロイすることができます。 あなたのコードとリソースはLiferayのコードに依存せず、あなたが作ろうとしているものに集中することができます。

Delectable Bonsaiの開発者は、Liferayの [オブジェクト](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects) を使って、顧客からのフィードバックを収集・記録する新しい方法を構築したいと考えている。 このモジュールでは、 [オブジェクトアクションYAML設定リファレンス](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions/object-action-yaml-configuration-reference) への変更をテスト、修正、トラブルシューティングすることで、クライアント拡張のデプロイに慣れ、マイクロサービスにシンプルなカウンターを実装します。

[続きはこちら](./deploying-code-to-liferay-saas/deploying-and-managing-a-microservice-client-extension-project.md)
