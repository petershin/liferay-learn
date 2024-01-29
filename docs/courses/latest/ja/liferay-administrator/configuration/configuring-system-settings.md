# システム設定の構成

{bdg-secondary}`LXC-SM またはセルフホスト`

システム設定は、インスタンス、サイト、またはウィジェットにまたがって適用されます。 ここで行った設定は、環境全体に適用されます。 これらの中には、下位のスコープでは変更できないもの（例えば、アンチウイルスの設定）や、下位のスコープで上書きできるデフォルトになるものがある。 詳しくは [システム設定](https://learn.liferay.com/ja/w/dxp/system-administration/configuring-liferay/system-settings) をご覧ください。

### LXCのシステム設定

LXCではシステム設定にアクセスできない。 Liferay Cloud サポートに連絡してシステム設定を行います。

### LXC-SMとセルフホストでのシステム設定

Liferay は [ClamAV](https://www.clamav.net/) をサポートしています。 ClamAVアンチウイルスソフトはシステム設定で設定できます。

```{note}
ClamAVドキュメント](https://docs.clamav.net/)に従って、Liferay環境で使用する予定のプラットフォームにClamAVをインストールし、実行してください。
```

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **System Settings** に移動する。

1. セキュリティ] の下で、[**アンチウイルス**] をクリックします。

1. 左のナビゲーションで、 **Antivirus Clamd Scanner** をクリックします。

1. 設定を入力する。

   * ホスト名またはIPアドレス - ClamAVサービスを実行しているサーバー名またはアドレス。
   * Port - ClamAVサービスのポート番号。
   * ソケット接続SOタイムアウト時間 - 接続が無効になるまでの時間（ミリ秒単位）。

   ![ClamAVの環境設定を入力します。](./configuring-system-settings/images/01.png)

1. **アップデート** をクリックします。 Liferay環境がClamAVでアップロードされたファイルをスキャンするようになりました。 これがどのように機能するかは、以下の関連概念を参照されたい。

次のステップは [仮想インスタンスの設定](./configuring-virtual-instances.md)。

## 関連コンセプト

- [システム設定](https://learn.liferay.com/ja/w/dxp/system-administration/configuring-liferay/system-settings)
- [アップロードされたファイルのウイルス対策スキャンを有効にする](https://learn.liferay.com/ja/w/dxp/system-administration/file-storage/enabling-antivirus-scanning-for-uploaded-files)
