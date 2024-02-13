---
toc:
  - ./using-the-gogo-shell/command-line-gogo-shell.md
  - ./using-the-gogo-shell/gogo-shell-commands.md
---
# Gogo シェルの使用

Gogoシェルは、モジュールフレームワークと対話するための手段を提供します。 中でも、以下を実行できます。

* バンドル（モジュール）の動的なインストール／アンインストール
* パッケージの依存関係を調べる
* 拡張ポイントを調べる
* サービスリファレンスの一覧表示

コントロールパネルは、Gogoシェルにアクセスする最も安全で確実な方法です：

1. グローバルメニュー( [グローバルメニュー](../../images/icon-applications-menu.png) )を開き、 **コントロールパネル** タブを選択します。

1. システムセクションの **Gogo Shell** をクリックします。

   Gogoシェルのコマンド画面が表示されます。

   ![Gogo shell in the control panel](./using-the-gogo-shell/images/02.png)

   ```{note}
   DXP 7.2では、コントロールパネルを開き、*Configuration* &rarr; *Gogo Shell*
   に移動します。
   ```

1. テキストフィールドにGogoシェルコマンドを入力します。 例えば、`lb | grep "Liferay Announcements API"`と入力すると、Announcements APIバンドルの情報が一覧表示されます。

   ```{note}
   クラスタの場合は、すべてのノードでGogoシェルコマンドを実行する必要があります。 コントロールパネルのGogoシェルで実行されるコマンドは、現在のノードにのみ影響します。
   ```

1. **実行** をクリックしてください。

   コマンド結果の出力が表示されます。

   ![The output section shows the command result.](./using-the-gogo-shell/images/03.png)

```{warning}
Gogoシェルは非常に強力で、プラットフォームのコア機能を操作することができます。 Gogoシェルへのアクセスは、信頼できる管理者にのみ許可してください。 詳しくは [ロールと権限について](../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) をご覧ください。
```

## さいごに

これで、Gogoシェルを実行する方法を理解したため、使用可能な [Gogoシェルコマンド](./using-the-gogo-shell/gogo-shell-commands.md) を調べます。 開発者環境で作業をしている場合は、コマンドラインからGogoシェルを使用することを検討してください。 詳しくは、 [コマンドラインGogo シェル](./using-the-gogo-shell/command-line-gogo-shell.md) を参照してください。
