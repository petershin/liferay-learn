# AUI 태그로 양식 작성

[AUI 태그 라이브러리](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/aui/tld-frame.html) 은 애플리케이션용 양식을 작성하는 데 필요한 모든 구성 요소를 제공합니다. AUI 태그는 사용자 지정 네임스페이스, 현지화 및 유효성 검사와 같은 표준 양식 요소에 많은 이점을 제공합니다. 사용자에게 원하는 경험을 만들 수 있는 여러 특성을 제공합니다.

AUI 태그를 사용하여 양식을 작성하려면 다음 단계를 따르십시오.

1. 아직 추가하지 않은 경우 `aui` taglib 선언을 포틀릿의 `view.jsp` 에 추가하십시오.

    ```jsp
    <%@ taglib prefix="aui" uri="http://liferay.com/tld/aui" %>
    ```

1. 아래 표시된 태그를 사용하여 양식을 작성하십시오. 각 태그는 사용 가능한 속성을 나열하는 해당 taglibdoc에 연결됩니다.
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

    예제 양식은 다음과 같습니다.

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

    ![AUI 태그는 애플리케이션용 양식을 작성하는 데 필요한 모든 것을 제공합니다.](./building-forms-with-aui-tags/images/01.png)

1. 선택적으로 양식 필드에 유효성 검사를 추가합니다. 유효성을 검사하려는 각 양식 필드 안에 `<aui:validator>` 태그를 중첩합니다. `<aui:validator>` 태그의 `이름` 속성으로 유효성 검사 규칙을 지정합니다(사용 가능한 유효성 검사 규칙은 아래 표에 나와 있습니다). `errorMessage` 특성을 사용하여 필드의 기본 유효성 검사 오류 메시지를 재정의할 수 있습니다. 구성 예는 다음과 같습니다.

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

    ![AUI 태그는 양식 필드에 대한 유효성 검사도 제공합니다.](./building-forms-with-aui-tags/images/02.png)

사용 가능한 유효성 검사 규칙의 전체 목록은 아래 표에 나와 있습니다.

| 규칙            | 묘사                                                                                                                                                    | 기본 오류 메시지                            |
|:------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------- |:------------------------------------ |
| `acceptFiles` | 필드가 지정된 파일 유형만 포함할 수 있음을 지정합니다. 각 파일 확장자는 쉼표로 구분해야 합니다. 예를 들어 </br> `<aui:validator name="acceptFiles">'jpg,png,tif,gif'</aui:validator>` | '유효한 확장자를 가진 파일을 입력하세요([지원되는 확장자]).' |
| `alpha`       | 알파벳 문자 허용                                                                                                                                             | '영문자만 입력하세요.'                        |
| `alphanum`    | 영숫자 문자 허용                                                                                                                                             | '영숫자 문자만 입력하십시오.'                    |
| `date`        | 허가 날짜                                                                                                                                                 | '유효한 날짜에 진입하십시요.'                    |
| `digits`      | 숫자 허용                                                                                                                                                 | '숫자 만 입력하십시오.'                       |
| `email`       | 이메일 주소를 허용합니다                                                                                                                                         | '제발 유효한 email.address 들어가십시요.'       |
| `equalTo`     | 지정된 필드 ID를 가진 다른 필드와 동일한 내용을 허용합니다. 예를 들어, </br> `<aui:validator name="equalTo">'#<portlet:namespace/>암호'</aui:validator>`          | '다시 동일한 값을 입력하십시오.'                  |
| `max`         | 지정된 값보다 작은 정수 값을 허용합니다. 예를 들어 최대값 20은 </br> `<aui:validator name="max">20</aui:validator>`로 지정됩니다.                                        | '[최대값]보다 작거나 같은 값을 입력하세요.'           |
| `maxLength`   | 지정된 크기의 최대 필드 길이 허용( `max`과 동일한 구문을 따름)                                                                                                               | '[max]자 이하로 입력하십시오.'                 |
| `min`         | 지정된 최소값보다 큰 정수 값을 허용합니다( `max`과 동일한 구문을 따름).                                                                                                          | '[최소값]보다 크거나 같은 값을 입력하세요.'           |
| `minLength`   | 지정된 크기보다 긴 필드 길이를 허용합니다( `max`과 동일한 구문을 따름).                                                                                                          | '[min]자 이상 입력하세요.'                   |
| `number`      | 숫자 값 허용                                                                                                                                               | '유효한 수에 들어가십시요.'                     |
| `range`       | 지정된 범위 사이의 숫자를 허용합니다. 예를 들어, 1.23에서 10 사이의 범위가 여기에 지정됩니다. </br> `<aui:validator name="range">[1.23,10]</aui:validator>`                   | '[0]에서 [1] 사이의 값을 입력하십시오.'           |
| `rangeLength` | 지정된 범위 사이의 필드 길이를 허용합니다( `범위`과 동일한 구문을 따름).                                                                                                           | '[0]에서 [1]자 사이의 값을 입력하십시오.'          |
| `required`    | 빈 필드 방지                                                                                                                                               | '이 필드는 필수입니다.'                       |
| `url`         | URL 값을 허용합니다.                                                                                                                                         | '제발 유효한 URL을 들어가십시요.'                |

이제 애플리케이션을 위한 사용자 친화적인 양식을 작성하는 방법을 알게 되었습니다.

## 관련 항목

* [차트 태그 라이브러리](../chart-tag-library.md)
* [프런트엔드 태그 라이브러리](../liferay-frontend-tag-library.md)
* [클레이 태그 라이브러리](../clay-tag-library.md)