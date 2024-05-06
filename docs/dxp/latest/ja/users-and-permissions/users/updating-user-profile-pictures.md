# ユーザーのプロフィール写真の更新

ユーザーにはプロフィール写真があります。 管理ユーザーはユーザーの編集フォームで画像をアップロードでき、ユーザーはプロフィール画像を含む自分のアカウント情報を更新できます。

## プロフィール写真の更新

ユーザーのプロフィール写真を更新するには、次の手順に従います。

1. ［ユーザー］メニューの ［**プロフィール**］ をクリックするか、管理者の場合は ［**コントロールパネル**］ &rarr; ［**ユーザーと組織**］ に移動して、プロフィール写真が必要なユーザーを見つけます。
1. 一般的なプロフィール写真の下にある ［**Change**］ ボタンをクリックします。
1. コンピューターから写真を選択し、必要に応じてトリミングして、 ［**Done**］ をクリックします。

![ユーザーの編集フォームでユーザーのアバターの画像をアップロードします。](./updating-user-profile-pictures/images/01.png)

プロフィール画像が更新されました。

## デフォルトのユーザープロフィール写真の変更

ユーザーのプロフィール写真に写真が明示的にアップロードされていない場合、デフォルトのユーザーアイコンがランダムな色の上にユーザーのイニシャル（姓、名）で構成されるユーザーアバターとして割り当てられます。

![デフォルトのユーザープロフィール写真は、ランダムに色付けされたバブルの上にユーザーのイニシャルが付いたアイコンです。](./updating-user-profile-pictures/images/02.png)

### デフォルトのユーザープロフィール画像でイニシャルの使用を無効にする

1. ［**コントロールパネル**］ &rarr; ［**設定**］ &rarr; ［**System Settings**］ に移動します。
1. プラットフォームセクションで、 **ユーザー** &rarr; **ユーザーの画像** をクリックします。
1. ［**デフォルトユーザーポートレート用に、イニシャルを利用する**］ の選択を解除します。

![デフォルトのイニシャルベースのプロフィール写真を無効にすると、代わりにこのアイコンが使用されます。](./updating-user-profile-pictures/images/03.png)

これで、デフォルトのアイコンの代わりに、アイコンは一般的なシルエットになります。

### デフォルトのユーザープロフィール画像のイニシャルの順序を変更する

デフォルトのユーザーアイコン（ユーザーのイニシャル付き）は、ユーザーのロケールで機能するように設定できます。 これらの設定は、[言語設定モジュール](../../building-applications/core-frameworks/localization/adding-a-language.md)で設定します。

`lang.user.default.portrait=initials`は、アバターに使用するアイコンのタイプを設定します。 デフォルト値は **initials** です。 initialsに設定した場合、次のプロパティでは、表示するイニシャルとその順序を設定します。 または、 **画像** を指定します。これにより、上記と同じイニシャルなしのデフォルト画像が表示されます。

`lang.user.initials.fields=first-name,last-name`は、ユーザーのポートレートに表示されるイニシャルとその順序を決定します。 ここでの設定は、`lang.user.default.portrait`が **initials** に設定されている場合にのみ重要です。  有効な値は、`first-name`、`middle-name`、`last-name`であり、デフォルトでは姓と名が使用されます。

### カスタムデフォルトプロフィール画像の使用

独自のデフォルトのプロフィール画像を使用できます。

1. .pngまたは.jpg形式で100x100ピクセルの正方形の画像を少なくとも1つ作成します。

1. アプリケーションサーバーのクラスパスのどこかに配置します。 たとえば、Tomcatでは、`tomcat/webapps/ROOT/WEB-INF/classes`フォルダに配置できます。

1. [`portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md)ファイルで次のプロパティを設定します。

    ```properties
    image.default.user.portrait=image-filename-here.png
    ```

    これにより、次のポータルプロパティの値が上書きされます。

    ```properties
    image.default.user.portrait=com/liferay/portal/dependencies/user_portrait.png
    ```

    ```{tip}
    バイナリの性別フィールドを使用してユーザーの性別に関する情報を収集する場合、オーバーライドするデフォルト画像が2つあります。 代わりに次のプロパティを設定します。
    ::
    image.default.user.female.portrait=image-filename.png
    image.default.user.male.portrait=image-filename.png
    ```

1. アプリケーションサーバーを再起動します。

<!-- ## Related Information

* link
* link -->
