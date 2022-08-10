# フォームを利用したユーザー調査

Liferayの以前のバージョンでは、サイト管理者はサイト管理&rarr;コンテンツとデータメニューにある専用のPollsアプリケーションにアクセスすることができました。このアプリケーションは、[Liferay 7.3](../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-3.md#features-deprecated-in-7-3)で非推奨となり、[Liferay 7.4](../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md#features-deprecated-in-7-4)で削除されました。

Liferay Formsは、旧バージョンのLiferayでPollsアプリケーションが扱っていたユースケースを実現するために強化されました。 新しいポールを作成するには、ここで説明する機能を持つLiferay Formsを使用します。

Liferay 7.2 &rarr; 7.3 &rarr; 7.4 のパスに沿ってアップグレードしている場合、Polls は自動的に Forms を使用するようにアップグレードされます。

```{note}
フォームの設定の包括的なリストは、[フォームの設定リファレンス](creating-and-managing-forms/forms-configuration-reference.md)に含まれています。
```

## 世論調査の作成

Liferay Formsで投票のような機能を有効にするために、フォーム設定モーダル、投稿セクションに3つの設定が追加されました。ユーザーあたり1つの投稿に制限する、有効期限、回答者に部分的な結果を表示する。

![投稿の設定は、投票のような動作を設定するためのものです。](./using-forms-to-poll-users/images/01.png)

### 投稿は1ユーザーにつき1回まで

投稿は1ユーザーにつき1回までとします。 ログインしているユーザーに対して、複数のフォーム送信を許可しません。

```{warning}
また、「1ユーザー1投稿に制限」を有効にすると、ユーザーがフォームに入力する際に認証される必要があります。 この要件は、フォームに設定された権限およびフォームの設定_Require User Authentication.False_よりも優先されます。False_ です。
```

![ユーザーはフォームを送信できなくなりますが、現在送信されているデータに関するフォームレポートを見ることができます。](./using-forms-to-poll-users/images/03.png)

### 有効期限を追加する

デフォルトでは、フォームの有効期限はありません。 Never Expireの設定を無効にした場合、フォームの有効期限を設定することができます。 この日を過ぎると、送信はできません。 フォームのユーザーには、フォームへのアクセス時に有効期限切れの通知が表示されます。

![フォームの有効期限が切れた場合、ユーザーは部分的な結果のみを見ることができます（有効な場合）。](./using-forms-to-poll-users/images/04.png)

### 回答者に一部の結果を表示します。

回答者が現在送信されているフォームレコードの集計データを見ることができるようにする。 回答者は、現在の [Forms Report](../sharing-forms-and-managing-submissions/form-reports.md#show-partial-results-to-form-respondents) のフォームのデータを見ることができます。 この機能を有効にすると、機密情報を送信しないように警告します。

![ユーザーは機密情報を共有しないように警告されています。](./using-forms-to-poll-users/images/02.png)

### Liferay Formsで投票を作成する

フォームを使った投票を行うことで、サイト訪問者の興味を引くことができます。

サイトメニューの *Forms* アプリケーションと、ページに追加する *Form* ウィジェットの2つのアプリケーションがポールを作成・表示します。

1. サイトメニューから、 *コンテンツ* &rarr; *世論調査*をご覧ください。

1. ![Add](../../images/icon-add.png) ボタンをクリックし、「タイトル」と「説明文」を記入してください。

1. フォームが投票のように動作するように設定する：フォームの設定ウィンドウを開き、「送信」セクションに移動し、次のようにします。

   - **回答者に結果の一部を表示する**: 有効
   - **Limit to One Submission per User**: Enabled
   - **Never Expire**: 希望する場合はチェックを外す（有効期限を設定する）。

1. ここで、投票の質問を設定します。 フォームに複数行の必須テキストフィールドを追加します。

   -  **ラベル** 今回の訪問はいかがでしたか？
   -  **フィールドタイプ** 複数行
   -  **必須項目です。** 有効

1. *Publish* をクリックすると、フォームがユーザーに公開されます。

   フォームへのアクセスは、直接リンク、またはLiferayのページにフォームを表示させることで行います。 詳しくは、 [フォームの発行](creating-and-managing-forms/creating-forms.md#publishing-a-form) をご覧ください。

## 投票をフォームにアップグレードする

Liferay 7.2 &rarr; 7.3 &rarr; 7.4 のパスに沿って Liferay をアップグレードしている場合、Polls は自動的に Forms を使用するようにアップグレードされます。 7.4のライフサイクルの間、このタスクを達成するためのアップグレードプロセスが強化されました; Liferay 7.4 GA/Update 27の時点で、次のことが可能になりました。

- バックエンドのエンティティを変換して、PollをFormのエンティティにし、FormsアプリケーションとAPIで管理できるようにする。
- ポーリングのような動作をするフォームの設定を有効にします。
- PollがPolls Displayウィジェットでページ上に表示されていた場合、アップグレード後はFormウィジェットでページ上に表示されるようになります。

```{warning}
[upgraded](../../installation-and-upgrades/upgrading-liferay.md) から DXP Update 27/CE GA 27 より前のバージョンの Liferay 7.4 にインストールした場合、アップグレード処理が不完全になることがありました。 Polls を完全にアップグレードするには、

- フォームで _Limit to One Submission per User_ が設定されていることを確認する必要があります。
- は、ページ上にあったPolls Displayウィジェットを手動でFormウィジェットに置き換えます。
```

## 追加情報

- [フォームの作成と管理](./creating-and-managing-forms.md)
- [7.4のメンテナンスモードと非推奨](../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md)
