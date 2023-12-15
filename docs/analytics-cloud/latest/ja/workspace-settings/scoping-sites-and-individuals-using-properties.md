# プロパティを使用したスコープサイトと個人

プロパティでは、単一または複数のサイトにラベルを定義して関連付けることができます。 これにより、関連するすべてのサイトの分析データを1つのダッシュボードのプロパティに集約することができます。 この機能は、DXPインスタンスに複数のサイトがあり、それらを1つのサイトとして分析したい場合に特に便利です。

例えば、企業の社内ポータルで、部署ごとに複数のサブサイトがあるとします。 各サブサイトは、 **Intranet** と呼ばれるユーザー定義プロパティに関連付けることができます。 その後、すべての分析データが単一のサイトとしてAnalyticsCloudに集約されます。

プロパティを使用して、その逆を行うこともできます。 ユーザーは、Liferay DXPインスタンス内のサイトごとに個別のプロパティを作成できるため、AnalyticsCloudユーザーはサイトごとにスコープを設定した詳細な分析データを使用することができます。 管理者は、Analytics Cloudユーザーに、異なるプロパティにスコープされた権限を割り当てることもできます。

## プロパティの作成

Analytics Cloudの各ワークスペースでは、複数のプロパティを作成してトラッキングすることができます。 新規にDXPデータソースを接続すると、必ずデフォルトのプロパティが作成されます。 データソースの名前は、DXPのインスタンス名と同じになります。

新しいプロパティを作成するには、Analytics Cloud Workspaceにアクセスします。 次に、 **Settings** &rarr; **Properties** に行き、右上の **New Property** をクリックします。

![Adding a new property.](scoping-sites-and-individuals-using-properties/images/01.png)

プロパティに名前を付け、 **Save** をクリックします。 次に、先ほど作成したプロパティの設定画面が表示されます。 初期状態では、プロパティに関連するサイトはありません。 次は、このプロパティにサイトを追加する方法を紹介します。

![A new property has been created.](scoping-sites-and-individuals-using-properties/images/02.png)

## サイトをプロパティに同期する

Analytics Cloudでサイトのデータを見るためには、サイトをプロパティに同期する必要があります。 これを行うには、LiferayDXPインスタンスのコントロールパネルに移動する必要があります。

1. Liferay DXP インスタンスの **Instance Settings** &rarr; **Analytics Cloud** を表示して、Liferay DXP インスタンスが Analytics Cloud と同期していることを確認します。 あなたのDXPインスタンスはAnalytics Cloudに接続されています」というメッセージは、あなたのLiferay DXPインスタンスがAnalytics Cloudに正しく接続されていることを確認します。

    ```{important}
    DXP インスタンスは Analytics Cloud に接続されています」というメッセージが表示されない場合は、 [Connecting Liferay DXP Sites to Analytics Cloud](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) を確認してください。
    ```
1. Analytics Cloud ワークスペースで、[**同期済みサイト**] をクリックします。 Analytics Cloudで作成した利用可能なプロパティのリストが表示されます。 ここに追跡するサイトの新しいプロパティを作成します。

   ![Creating a new property to track sites.](scoping-sites-and-individuals-using-properties/images/03.png)

1. 作成したプロパティを選択します。 LiferayDXPインスタンス上のサイトのリストが表示されます。 このプロパティに同期したいサイトを選択し、 **Save** をクリックします。 これで、選択したプロパティを使用してサイトがAnalyticsCloudに同期されました。

   ![Selecting sites to sync with a property.](scoping-sites-and-individuals-using-properties/images/04.png)

    ```{important}
    1つのDXPサイトを複数のプロパティと同期させることはできません。 あなたのサイトの1つがすでに別のプロパティに同期されている場合。 ここではグレーアウトされており、選択できません。
    ```

## 連絡先をプロパティに同期する

連絡先をプロパティに同期するには：

1. Analytics Cloudワークスペースの設定で、[**Select Contacts**]をクリックします。

   ![You can choose to sync all or select groups of users as contacts in Analytics Cloud.](scoping-sites-and-individuals-using-properties/images/05.png)

   DXP内のすべてのユーザーを同期することも、ユーザーグループや組織ごとに同期することも可能です。

1. 同期したいユーザーまたはグループを選択し、 **Save** をクリックします。

```{note}
ユーザーの同期には Liferay DXP のバッチエンジンを使用します。 非常に多くのユーザーを同期する場合は、バッチサイズを大きくしてください。 Liferay DXP で、_Global Menu_ &rarr; _Instance Settings_ &rarr; _Batch Engine_ に移動します。 Export Batch Size_ と _Import Batch Size_ を `1000` に設定する。
```

Liferay DXPからコンタクトデータを同期する についての詳細は [こちら](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) を確認してください。

## メールレポート

レポートを定期的にメールで送信できます。 レポートには、ユニーク訪問者数、訪問者あたりのセッション数、平均セッション時間、平均直帰率などが含まれます。 有効にするには以下を行います。

1. 設定 **&rarr;***プロパティ** に移動します。 メールによるレポートが必要なプロパティを選択します。

1. **コグ** アイコン(![コグアイコン](../images/icon-cog-2.png))をクリックすると、新しいウィンドウが開きます。

1. スイッチを切り替えて、メールレポートを有効にします。 メールの頻度を選択します（例：［Daily］、［Weekly］、［Monthly］）。 ［**保存**］をクリックします。

   ![Toggle the switch to enable email reports and select a frequency.](./scoping-sites-and-individuals-using-properties/images/06.png)

1. 選択した頻度に基づき、定期的にメールレポートが送信されます。 なお、日次レポートは毎日午前12時（UTC）に配信されます。 週次レポートは、毎週月曜日の午前12時（UTC）に配信されます。 月次レポートは、毎月1日の午前12時（UTC）に送信されます。 サンプルレポートは以下のように表示されます。

   ![Email reports include analytics about individuals visiting your site.](./scoping-sites-and-individuals-using-properties/images/07.png)

## プロパティの権限を管理する

管理者は、ワークスペース内のすべてのプロパティを表示する権限を持っています。 ワークスペースのメンバーに、特定のプロパティのデータを表示する権限を割り当てることができます。

プロパティの権限を割り当てるには、以下の手順に従ってください。

1. Analytics Cloud ワークスペースで、 **Settings** &rarr; **Properties** に移動し、権限を管理したいプロパティを選択します。

   ```{note}
   デフォルトでは、Analytics Cloudのワークスペースのすべてのユーザーがプロパティにアクセスできます。 これを変更するには、*［ユーザーの選択］*ラジオボタンをクリックします。
   ```
1. Add User*をクリックして、プロパティにユーザーを追加します。

これで追加されたユーザーは、プロパティにアクセスできます。

![Adding users to a property.](scoping-sites-and-individuals-using-properties/images/08.png)

## 異なるプロパティ間の移動

Analytics Cloudのワークスペースで異なるプロパティを交互に表示するには、ナビゲーション バーの左上にあるプロパティ名をクリックします。 閲覧権限のあるプロパティの一覧がメニューに表示されます。 ディレードされたプロパティをクリックすると切り替わります。

![Changing views from one property to another.](scoping-sites-and-individuals-using-properties/images/09.png)

プロパティを表示するとき、 **すべての** 分析データは、このプロパティにスコープされます。 以下に例を示します。

* 訪問者、セッション、ページビューの統計情報は、各プロパティのサイト内のセッションのみに基づいて算出されます。
* 各プロパティのサイトを訪れた訪問者を個別に表示します。 つまり、DXPインスタンスに5000人のユーザーがいたとしたら、そのうち100人しかサイトにセッションしていないということです。 100人だけが個別のリストに表示されます。 5000人全員のデータが同期されていますが、プロパティ追跡サイトを訪れた人だけが表示されます。
* 作成されたセグメントは、各プロパティにスコープされています。
* ABテストは、各プロパティのみにスコープされています。
