---
toc:
  - ./securing-web-services/service-access-policies.md
  - ./securing-web-services/cross-origin-resource-sharing.md
---
# Webサービスの保護

Liferayは、ほぼすべての機能のAPIを同梱しています。 これらのAPIを使って、Liferayのエンティティや自分で作成したオブジェクトとプログラムでやり取りすることができます。

サービス・アクセス・ポリシーは、リモートで呼び出せるサービスまたはサービスメソッドを定義します。 ユーザーが認証および/または許可されたアクセスを持っているかどうかに関係なく、サービスアクセスポリシーがサービスへのアクセスを許可していない場合、そのサービスはリモートから呼び出すことができない。

ここでは、サービス・アクセス・ポリシーを用途に応じて適切に調整する方法を学びます。

クロスオリジンリソース共有（CORS）は、あなたのLiferayシステム上のどのリソースが他のドメイン、またはオリジンと共有されるかをブラウザのために定義します。 Liferayシステムに保存されたリソースにアクセスする必要がある別ドメインのアプリケーションがある場合、CORSを設定する必要があります。 サンプルアプリをデプロイし、その方法を学びます。

次へ [サービス・アクセス・ポリシー](./securing-web-services/service-access-policies.md)

## 関連コンセプト

- [サービス・アクセス・ポリシーの設定](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies)
- [CORSの設定](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors)
