# Poshiのリソースの使用

PoshiリソースjarファイルをPoshiプロジェクトにロードすると、Liferayで一般的に使用される関数、パス、マクロを使用できるようになります。 Poshiリソースjarファイルからのファイルとローカルファイルシステムからのファイルを区別するには、以下の名前空間を使用します。

* 以下のクリック関数のように、 [Liferay Portal functions github directory](https://github.com/liferay/liferay-portal/tree/master/modules/test/poshi/poshi-runner-resources/src/main/resources/default/testFunctional/functions) にの関数で`デフォルト`を使用します。

    ```
    Default.Click(locator1 = "//body")
    ```
* 以下の場合は、`Portal`を使用します。

  * [Liferay Portal paths github directory](https://github.com/liferay/liferay-portal/tree/master/portal-web/test/functional/com/liferay/portalweb/paths) のパスを、下記の `TextInput#SUBJECT`のパスのように使用する場合。

    ```
    AssertElementPresent(locator1 = "Portal.TextInput#SUBJECT");
    ```
  * [Liferay Portal macros github directory](https://github.com/liferay/liferay-portal/tree/master/portal-web/test/functional/com/liferay/portalweb/macros) のマクロを、下記の `login()`のコマンドのように使用する場合。

    ```
    Portal.Liferay.login()
    ```

ローカルファイルシステムからのPoshiファイルは、名前空間を付加する必要がなく、自動的にLocalFile名前空間が割り当てられます。
