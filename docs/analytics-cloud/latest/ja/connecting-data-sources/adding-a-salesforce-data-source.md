# Salesforceデータソースの追加

Analytics Cloudは、SalesforceのデータとLiferay DXPなどのデータを統合し、自動的にデータをブレンドして包括的な顧客プロファイルを構築することができます。 これにより、より正確なセグメンテーションを作成し、サイトのパーソナライズ戦略を強化することができます。 これを行うには、まず、Salesforceインスタンスをデータソースとして追加する必要があります。

## データソースの追加

1. ［**設定**］ → ［**データソース**］ → ［**データソースを追加**］ を選択します。 データソースの追加画面が開きます。

1. ［**Salesforce**］ を選択します。 これで、［Configure Salesforce］画面が開きます。

    ![データソースの追加画面から［Salesforce］を選択します。](adding-a-salesforce-data-source/images/01.png)

1. ［**Authorization**］ タブで、Salesforceインスタンスの名前とURLを入力します。 ［**CLIENT CREDENTIALS**］ セクションの下で、SalesforceでOAuth接続されているアプリの［client ID］と［client secret］を入力します。

    ```{note}
    Salesforceインスタンスの管理者は、以下の設定でこの接続アプリを作成する必要があります。

    * コールバック URL： https://analytics.liferay.com/oauth/receive
    * OAuthスコープ：- 基本情報にアクセス (id、プロフィール、メールアドレス、電話番号) - データにアクセスして管理 (api) - いつでも自分の代わりにリクエストを実行 (refresh_token, offline_access)

    SalesforceでOAuth接続アプリを作成してクライアントID クライアントシークレットの場所を確認する方法は [Salesforce documentation](https://help.salesforce.com/articleView?id=connected_app_overview.htm&type=5) を参照してください。
    ```

1. ［**Authorize & Save**］ をクリックします。 これにより、Salesforceからリード、連絡先、アカウントのデータのインポートが開始されます。 このデータは、以下のようにAnalytics Cloudのデータと統合されています。

    * Salesforceのリードやコンタクトからのデータと、Analytics Cloudで個人をマッチングさせるためのデータをマージします。 メールアドレスで一致しています。 たとえば、コンタクトおよび/またはリードがAnalytics Cloudの個人と同じメールアドレスを持っている場合、そのコンタクトおよび/またはリードのデータは、その個人のAnalytics Cloudのデータにマージされます。
    * リードおよび/またはコンタクトのメールアドレスが、Analytics Cloudの既存の個人のメールアドレスと一致しない場合、リードおよび/またはコンタクトからのデータを使用して、Analytics Cloudに新しい個人が作成されます。
    * コンタクトからのデータはリードよりも優先されます。 たとえば、マッチングしたリードとコンタクトに同じフィールドが入力されている場合、コンタクトからのデータはAnalytics Cloudの個人にインポートされます。

  データのインポートには、Salesforceインスタンスにどれだけのデータが存在するかによっては、時間がかかる場合があることに注意してください。

1. インポートの進行状況は、 ［**CONFIGURE DATA SOURCE**］ タブに表示されます。 ［View］ をクリックすると、各Salesforce フィールド（AccountsとIndividuals）と対応するAnalytics Cloudフィールドのマッピングが表示されます。 また、この情報は後から、 ［**設定**］ → ［**データソース**］ → ［(**Salesforce**)］ → ［**CONFIGURE DATA SOURCE**］ から見ることができます。

![Salesforceインスタンスに接続するために必要な情報を入力します。](adding-a-salesforce-data-source/images/02.png)

![［CONFIGURE DATA SOURCE］タブには、Salesforceからインポートされたアカウントと個人のステータス、およびフィールドマッピングが表示されます。](adding-a-salesforce-data-source/images/03.png)
