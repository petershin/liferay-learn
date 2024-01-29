# サービス・アクセス・ポリシーについて

サービスアクセスポリシーツールを使用して、どのウェブサービスがパブリックアクセスできるかを設定します。 デフォルト・ポリシーのリストを見ることができます。 新しいポリシーを追加するには、以下の手順に従ってください。 詳しくは [サービス・アクセス・ポリシーの設定](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies) を参照。

デフォルトでは、LiferayのサービスアクセスポリシーはどのAPIにもパブリックアクセスを許可しないことに注意してください。

```{warning}
以下の例はデモンストレーション用です。 これらのサービスへのアクセスを許可することで、これらのサービスはパブリック・フェイ スになり、通常、認証と組み合わせる必要がある。
```

1. 認証情報を渡さずにAPIリクエストを行う。

   ```bash
   curl "localhost:8080/o/headless-admin-user/v1.0/my-user-account"
   ```

   禁じられたエラー・レスポンスが返されることに注意。

1. **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Service Access Policy** に移動する。

1. **追加**（![Add icon](../../../images/icon-add.png)） をクリックします。

1. 新しいポリシーを次のように設定する：

   * 名前は「 `MY_USER_ACCOUNT_GUEST_ACCESS` 」と入力する。
   * 有効スイッチをオンに切り替える。
   * デフォルトのスイッチをオンに切り替える。
   * タイトルに「 `My User Account Guest Access` 」と入力してください。
   * サービスクラスとして `com.liferay.headless.admin.user.internal.resource.v1_0.UserAccountResourceImpl` を入力してください。
   * メソッド名には `getMyUserAccount` と入力する。
   * ［**保存**］ をクリックします。

1. 同じAPIリクエストを行う。

   ```bash
   curl "localhost:8080/o/headless-admin-user/v1.0/my-user-account"
   ```

   Liferayがゲストユーザーのユーザーアカウント情報を返すようになりました。 他のサービスについても、この方法でアクセスを許可または拒否する。

次へ [クロスオリジン・リソース共有](./cross-origin-resource-sharing.md)

## 関連コンセプト

[サービス・アクセス・ポリシーの設定](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies)
