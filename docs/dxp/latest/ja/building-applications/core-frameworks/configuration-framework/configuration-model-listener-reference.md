# 構成モデルリスナーリファレンス

[独自の構成](../configuration-framework.md) でモデルリスナーを使用し、イベントをリッスンし、それに応じてコードを実行します。 モデルリスナーの作成は、わずか3ステップで完了します。

* [`ConfigurationModelListener`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/static/portal-configuration/portal-configuration-persistence-api/src/main/java/com/liferay/portal/configuration/persistence/listener/ConfigurationModelListener.java) インターフェースを実装します。
* 次の`@Component` アノテーションでリスナーを登録します。 `service = ConfigurationModelListener.class`
* リスナーがトリガーされた際の動作についてのカスタムロジックを追加します。

Liferayの [`PasswordPoliciesConfigurationModelListener`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/password-policies-admin/password-policies-admin-web/src/main/java/com/liferay/password/policies/admin/web/internal/configuration/persistence/listener/PasswordPoliciesConfigurationModelListener.java) におけるリスナーの実装をご参照ください。

以下の点に注意してください。

* 構成モデルのリスナーは、システム、インスタンス、およびサイト設定の構成変更時にトリガーされ、検証されます。
* 構成モデルリスナーは、サーバーがすでに起動され、その時点でリスナーが登録されるように構成ファイルをデプロイする際にトリガーされます。
* 構成モデルリスナーは、立ち上げ **前に** インスタンスにデプロイされた構成ファイルに対して、トリガーされないようにしました。

モデルリスナーの詳細については、 [モデルリスナーの作成](../../../liferay-internals/extending-liferay/creating-a-model-listener.md) を参照してください。
