# ジョブスケジューラーを使う

[Job Scheduler](https://github.com/liferay/liferay-portal/tree/master/modules/apps/dispatch) は、ビジネスロジックの実行とスケジューリングのために、Liferayのスケジューラエンジン上に構築された柔軟なフレームワークです。 このフレームワークは、`DispatchTaskExecutor`インターフェイスを使用してカスタムロジックでテンプレートを定義し、そのテンプレートを使用してコントロールパネルから [タスクを作成](#adding-a-new-job-scheduler-task) できます。 ジョブスケジューラタスクを作成した後、その動作と実行 [スケジュール](#scheduling-the-job-scheduler-task) を設定することができます。

![ジョブスケジューラーページでジョブスケジューラータスクを追加・管理します。](./using-job-scheduler/images/01.png)

ディスパッチは、 [`MessageListener`インターフェースを使用してスケジュールされたジョブ](#viewing-and-managing-scheduled-jobs) のすべてのインスタンスを表示および管理するための便利なUIを提供します。

```{note}
インスタンスジョブのスケジューリングにJob Schedulerと`MessageListener`のどちらを使用するかを決定する際には、以下のJob Schedulerの利点を考慮してください。
ジョブスケジューラーのタスクは `MessageListener` を使ってスケジュールされたジョブよりも柔軟です。なぜなら、ジョブスケジューラーのUIから実行時にタスクの変更を行うことができるからです。 `MessageListener` のジョブの変更は、コーディング、コンパイル、再デプロイを行う必要があります。 
また、Job Scheduler UIでは、各Job Schedulerタスクの実行プロパティ（cron式、開始/終了日、クラスタモードなど）および実行履歴をより詳細に把握することができます。 この情報は、`MessageListener`ジョブのUIでは提供されません。
```

## ジョブスケジューラタスクの新規追加

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** をクリックし、 **設定** &rarr; **ジョブスケジューラ** に進みます。

1. **追加** ボタン (![Add Button](../../../images/icon-add.png)) をクリックし、ジョブスケジューラタスクに必要なテンプレートを選択します。 選択したテンプレートは、タスクの基本的なロジックを定義します。
   
   各テンプレートは `DispatchTaskExecutor` インターフェイスの実装であり、各ジョブスケジューラタスクは選択されたテンプレートのインスタンスです。 その仕組みについては、 [Understanding Job Scheduler Framework](./understanding-the-job-scheduler-framework.md) をご覧ください。 
   

   ```{note}
   Liferay DXPには様々なJob Schedulerのタスクテンプレートがありますが、Liferay PortalにはTalend Job Scheduler Task Executorのみが含まれています。

   独自のテンプレートを作成することもできます。 詳細は、[ジョブスケジューラタスク実行ファイルの作成](./creating-a-new-job-scheduler-task-executor.md) をご覧ください。
   ```

![Addボタンをクリックし、タスクのJob Scheduler Task Executorテンプレートを選択します。](./using-job-scheduler/images/02.png)

1. Job Schedulerタスクの名前を入力します。

1. (オプション）設定エディタを使用して、ランタイムに注入されるジョブスケジューラタスクのプロパティを定義します。
   
   これらの設定により、実行の流れなどを細かく調整することができます。
   
   この方法で追加された設定はすべてソフトコード化されているので、Executorのコードを編集して再展開しなくても、ジョブスケジューラのタスクを設定することができます。 

   ```{tip}
   同じJob Scheduler Task Executorのインスタンスを複数作成し、そのプロパティや動作を設定エディターで変更することができます。
   ```

1. **Save** をクリックすると、選択したテンプレートの新規ジョブスケジューラタスクが作成されます。
   
   ![名前を入力し、オプションで設定エディタを使用してジョブスケジューラタスクのプロパティを定義します。](./using-job-scheduler/images/03.png)

インスタンスに追加されたすべてのジョブスケジューラタスクは、ジョブスケジューラページに表示されます。 ここから、タスクをクリックしてその設定を編集したり、ジョブスケジューラトリガーを設定して実行時のスケジュールを設定することができます。 ［**今すぐ実行**］ をクリックして、タスクを手動で実行することもできます。 ログ]タブには、選択したジョブスケジューラタスクの全実行記録が表示されます。

![ジョブスケジューラページから、すべてのインスタンスジョブスケジューラタスクを表示、管理、および設定します。](./using-job-scheduler/images/04.png)

## ジョブスケジューラタスクのスケジューリング

デフォルトでは、すべてのジョブスケジューラタスクトリガーは、作成時に非アクティブになります。 タスクのジョブスケジューラートリガーを有効にし、タスクの実行をスケジュールするには、次の手順に従います。

1. Job Scheduler ページの **Job Scheduler Triggers** タブに移動し、目的のタスクをクリックします。

1. **Job Scheduler Trigger** タブをクリックし、以下のフィールドを設定します。

1. ［**Save**］ をクリックします。
   
   ![Job Schedulerのタスクが実行されるタイミングをスケジュールします。](./using-job-scheduler/images/05.png)

**Active** : ジョブスケジューラートリガーをアクティブまたは非アクティブにします。 トリガーを有効にするには、有効な cron 式を入力する必要があります。 アクティブな場合、ジョブスケジューラタスクは設定されたスケジュールに従って実行されます。 無効にすると、トリガーが実行されなくなります。

**Task Execution Cluster Mode** : クラスター環境において、ジョブスケジューラタスクを1つのノードで実行するか、すべてのノードで実行するかを決定します。

**Overlap Allowed** : ジョブスケジューラタスクの同時実行を有効または無効にします。 有効にすると、前の実行がまだ実行されているかどうかに関係なく、設定されたスケジュールに従って新しいタスクの実行が開始されます。

**Time Zone** : Job Schedulerタスクの実行に使用するタイムゾーンを選択します。 これは、Liferayインスタンスのタイムゾーンとは無関係です。 このフィールドは Liferay DXP 7.4 U35+/GA35+ 以降で利用可能です。  

**Cron Expression** : ジョブスケジューラタスクがいつ実行されるかを決定する有効なCron式を入力します。

**Start Date** : Job Scheduler タスクの開始日を決定します。

**End Date** : チェックボックスを使用して、ジョブスケジューラタスクがクーロンスケジュールによって実行されなくなるタイミングを決定します。 デフォルトでは、現在の日時に設定されています。

ジョブスケジューラタスクが、指定した日時に、cron間隔に従って自動的に起動・停止するようになりました。

## Talend Job Schedulerのタスクのセットアップ

Talendは、カスタムデータ統合ジョブを定義するためのオープンソースのデータ統合ソフトウェアです。 これらのジョブは、 `.zip` アーカイブとしてエクスポートし、Talend実行者テンプレートを使用する任意のJob Schedulerタスクにアップロードすることができます。 アップロードされると、Talendデータ統合ジョブは、ジョブスケジューラタスクが実行されるたびに実行されます。

以下の手順に従って、Talend **Job Archive** を Job Scheduler タスクにアップロードしてください。

1. Talend executorテンプレートを使用して、新しいJob Schedulerタスクをインスタンスに追加します。 詳細な手順については、 [新しいジョブスケジューラタスクを追加する](#adding-a-new-job-scheduler-task) を参照してください。

1. Job Scheduler ページの **Job Scheduler Triggers** タブに移動し、目的のタスクをクリックします。

1. ［**Talend**］ タブをクリックします。
   
   ![［Talend］タブをクリックして、Talendジョブアーカイブをアップロードします](./using-job-scheduler/images/06.png)

1. Talend **ジョブアーカイブ** のZIPファイルをアップロードします。

1. ［**保存**］ をクリックします。

## スケジュールされたジョブの表示と管理

Job Scheduler Page の **Scheduled Jobs** タブには、 `MessageListener` インターフェイスを使用して Liferay インスタンスでスケジュールされたすべてのジョブもリストアップされます。 ここでは、各ジョブの一般的な詳細（名前、ステータスなど）を表示したり、手動で実行を開始したり、ジョブを個別に一時停止/再開したりできます。

![MessageListenerインターフェイスを使用してスケジュールされたすべてのジョブを表示します。](./using-job-scheduler/images/07.png)

## 関連トピック

* [ジョブスケジューラーUIリファレンス](./job-scheduler-ui-reference.md)
* [ジョブスケジューラフレームワークの理解](./understanding-the-job-scheduler-framework.md)
* [ジョブスケジューラ タスクエクゼキュータの新規作成](./creating-a-new-job-scheduler-task-executor.md)
