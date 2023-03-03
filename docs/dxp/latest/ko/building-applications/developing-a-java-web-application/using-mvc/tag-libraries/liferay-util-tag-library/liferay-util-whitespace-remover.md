# Liferay Util 공백 제거기 사용

공백 제거 태그는 태그 열기와 닫기 사이에 포함된 코드 블록에서 줄바꿈과 탭을 제거합니다. 다음은 `<liferay-util:whitespace-remover>` 태그의 구성 예입니다.

리무버 포함:

```jsp
<liferay-util:whitespace-remover>
    <p>Here is some text with        tabs.</p>
</liferay-util:whitespace-remover>
```

결과:

```html
Here is some text withtabs.
```
이제 `<liferay-util:whitespace-remover>` 태그를 사용하여 코드 형식이 일관되도록 하는 방법을 알았습니다.

## 관련 항목

* [Liferay Util 매개변수 태그 사용](./liferay-util-param.md)
* [Liferay Util 버퍼 태그 사용](./liferay-util-buffer.md)
* [AUI 태그립 사용](https://help.liferay.com/hc/ko/articles/360028832812-Using-AUI-Taglibs)