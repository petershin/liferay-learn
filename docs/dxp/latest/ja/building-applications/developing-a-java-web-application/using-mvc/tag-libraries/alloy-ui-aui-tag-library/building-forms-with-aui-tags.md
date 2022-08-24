# AUIタグを使ったフォームの構築

[AUIタグライブラリ](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/tld-frame.html) は、アプリケーションのフォームを構築するために必要なすべてのコンポーネントを提供します。 AUIタグは、標準的なフォーム要素に、カスタムネームスペーシング、ローカライゼーション、さらには入力値の検証などの多くの利点を提供します。 複数の属性が用意されており、ユーザーが望む体験を実現することができます。

以下の手順で、AUIタグを使用してフォームを構築します。

1. ポートレットの`aui`taglib宣言を、`view.jsp`に追加してください（まだの場合）。

    ```jsp
    <%@ taglib prefix="aui" uri="http://liferay.com/tld/aui" %>
    ```

1. 以下のタグを使用してフォームを作成します。 各タグは、対応するtaglibdocにリンクしており、利用可能な属性が記載されています。
    * [`<aui:input>`](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/input.html)
    * [`<aui:button>`](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/button.html)
    * [`<aui:button-row>`](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/button-row.html)
    * [`<aui:container>`](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/container.html)
    * [`<aui:col>`](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/col.html)
    * [`<aui:row>`](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/row.html)
    * [`<aui:field-wrapper>`](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/field-wrapper.html)
    * [`<aui:fieldset>`](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/fieldset.html)
    * [`<aui:fieldset-group>`](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/fieldset-group.html)
    * [`<aui:form>`](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/form.html)
    * [`<aui:select>`](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/select.html)
    * [`<aui:option>`](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/option.html)

    以下にフォームの例を示します。

    ```jsp
    <aui:form name="fm">
        <aui:fieldset-group markupView="lexicon">
            <aui:fieldset label="Personal Information">
                <aui:row>
                    <aui:col width="50">
                        <aui:input label="First Name" name="firstName" type="text" />
                    </aui:col>
                    <aui:col width="50">
                        <aui:input label="Last Name" name="lastName" type="text" />
                    </aui:col>
                </aui:row>
                <aui:row>
                    <aui:col width="50">
                        <aui:input label="Username" name="username" type="text" />
                    </aui:col>
                    <aui:col width="50">
                        <aui:input label="Email" name="email" type="email" />
                    </aui:col>
                </aui:row>
            </aui:fieldset>
        </aui:fieldset-group>
        <aui:fieldset-group markupView="lexicon">
            <aui:fieldset label="Miscellaneous">
                <aui:input label="Hobbies" name="hobbies" type="textarea" />
                <aui:input label="Receive email updates" name="emailUpdates" type="checkbox" />
            </aui:fieldset>
        </aui:fieldset-group>
        <aui:button-row>
            <aui:button name="submitButton" type="submit" value="Submit" />
        </aui:button-row>
    </aui:form>
    ```

    ![AUIタグは、アプリケーションのフォームを作成するために必要なすべてを提供します。](./building-forms-with-aui-tags/images/01.png)

1. オプションで、フォーム項目に入力値の検証を追加します。 検証したい各フォームフィールドの中に、`<aui:validator>`タグを入れ子にします。 `<aui:validator>`タグの`name`属性で入力値の検証ルールを指定します（利用できる入力値の検証ルールは下表の通りです）。 `errorMessage`属性で、フィールドのデフォルトの検証エラーメッセージをオーバーライドすることができます。 以下に構成例を示します。

    ```jsp
    <aui:form name="myForm">
        <aui:input name="password" id="password" label="Password" 
        required="true" />
        <aui:input name="confirmPassword" id="password" 
        label="Confirm Password" required="true">
            <aui:validator name="equalTo" 
            errorMessage="The passwords much match. Please try again." >
            '#<portlet:namespace>password'
            </aui:validator>
        </aui:input>
    </aui:form>
    ```

    ![また、AUIタグはフォームフィールドの入力値の検証を行います。](./building-forms-with-aui-tags/images/02.png)

利用可能な入力値の検証ルールの全リストは、以下の表に示すとおりです。

| ルール           | Description                                                                                                                                                         | デフォルトのメッセージ                        |
|:------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:---------------------------------- |
| `acceptFiles` | フィールドが指定されたファイル形式のみを含むことができることを指定する。 各ファイルの拡張子はカンマで区切る必要があります。 例えば </br> `<aui:validator name="acceptFiles">'jpg,png,tif,gif'</aui:validator>`のような場合です。 | 「有効な拡張子（[対応拡張子]）を持つファイルを入力してください。」 |
| `alpha`       | アルファベットの使用を許可します                                                                                                                                                    | 「アルファベットのみ入力してください。」               |
| `alphanum`    | 英数字を許可します                                                                                                                                                           | 「英数字のみ入力してください。」                   |
| `日付`          | 日付を許可します                                                                                                                                                            | 「有効な日付を入力してください。」                  |
| `digits`      | 数字を許可します                                                                                                                                                            | 「数字のみ入力してください。」                    |
| `email`       | メールアドレスを許可します                                                                                                                                                       | 「有効なメールアドレスを入力してください。」             |
| `equalTo`     | 指定されたフィールド IDを持つ他のフィールドと等しい内容を許可します。 例えば、 </br> `<aui:validator name="equalTo">'#<portlet:namespace/>password'</aui:validator>`のようになります。          | 「同じ値を再度入力してください。」                  |
| `max`         | 指定された値より小さい整数値を許可します。 例えば、最大値20は、</br> `<aui:validator name="max">20</aui:validator>`と指定されます。                                                           | 「[最大値]以下の値を入力してください。」              |
| `maxLength`   | 指定されたサイズの最大フィールド長を許可します（ `max`と同じ構文に従う）。                                                                                                                            | 「[max] 文字以下を入力してください。」             |
| `分`           | 指定された最小値よりも大きな整数値を許可します（ `max`と同じ構文に従う）。                                                                                                                            | 「[最小値]以上の値を入力してください。」              |
| `minLength`   | 指定されたサイズより長いフィールド長を許可します（ `max`と同じ構文に従います）。                                                                                                                         | 「[min] 文字以上を入力してください。」             |
| `number`      | 数値を許可します                                                                                                                                                            | 「正しい数字を入力してください。」                  |
| `range`       | 指定された範囲内の数値を許可します。 例えば、1.23から10までの範囲を指定する場合、以下のようになります </br> `<aui:validator name="range">[1.23,10]</aui:validator>`                                    | 「[0] と [1] の間の値を入力してください。」         |
| `rangeLength` | 指定された範囲内のフィールド長を許可します（ `range`と同じ構文に従う）                                                                                                                             | 「[0] と [1] の間の文字数で入力してください。」       |
| `required`    | 空白のフィールドを防ぎます                                                                                                                                                       | 「このフィールドは必須です。」                    |
| `URL`         | URLの値を許可します                                                                                                                                                         | 「正しいURLを入力してください。」                 |

これで、アプリケーション用のユーザーフレンドリーなフォームを作成する方法がわかりました。

## 関連トピック

* [チャートタグライブラリ](../chart-tag-library.md)
* [Frontend Tag Library](../liferay-frontend-tag-library.md)
* [Clayタグライブラリ](../clay-tag-library.md)