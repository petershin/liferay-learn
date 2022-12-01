# 認証

この記事では、Liferay Cloud で使用される 2 種類の認証リクエストについて説明します。

最初の方法は、 [基本認証](https://swagger.io/docs/specification/authentication/basic-authentication/) これは、サーバーがクライアントに認証を要求するときにエンコードされる Authorization Header の HTTP プロトコルである。

2つ目は、ユーザーアクセストークンによるものです。 なお、SSOが有効な場合は、トークン認証が必要です。 Cookie `access_token` からトークンを取得し、 `dxpcloud-authorization` ヘッダーで使用します。

以下は、upload APIでトークン認証を使用する例です。

```bash
curl -X POST /
  http://<HOST-NAME>/backup/upload /
  -H 'Content-Type: multipart/form-data' /
  -H 'dxpcloud-authorization: Bearer <USER_TOKEN>' /
  -F 'database=@/my-folder/database.tgz' /
  -F 'volume=@/my-folder/volume.tgz'
```

> **注意** : ヘッダーでユーザートークンを渡す `dxpcloud-authorization` バックアップサービスのバージョン `3.2.0` 以降でのみ機能します。 以前のバージョンは、少なくとも `3.2.0`にアップグレードする必要があります。 それ以前のバージョンへのリクエストは、ヘッダー `Authorization を使用する必要があります。ベアラ <PROJECT_MASTER_TOKEN>`. プロジェクトマスタートークンを見つけるには、Liferay Cloud Console 上の任意のシェルで `env grep LCP_PROJECT_MASTER_TOKEN` のコマンドを実行します。
