# React 구성 요소 유틸리티 참조

React를 사용하여 Liferay DXP에서 고성능 구성 요소 및 애플리케이션을 구축하는 데 도움이 되는 몇 가지 유용한 도구를 사용할 수 있습니다.

* [`frontend-js-react-web` 모듈](#frontend-js-react-web-module)
* [반응 구성 요소 태그](#react-component-tag)

## `frontend-js-react-web` 모듈

`frontend-js-react-web` 공유 모듈은 Liferay DXP에서 React의 모든 소비자가 사용할 수 있는 단일 공통 버전의 React를 제공합니다. 이 모듈에는 Liferay DXP 컨텍스트에서 React 구성 요소를 마운트(예: 렌더링)하는 표준 방법이 포함되어 있으며 해당 포틀릿이 파괴될 때 구성 요소 마운트 해제(완전히 폐기)와 같은 세부 사항을 처리합니다. 아래에 예가 나와 있습니다.

```javascript
import {render} from 'frontend-js-react-web';
render(
renderable,
renderData,
container
);
```

다음 매개변수가 필요합니다.

`renderable`: React 요소 또는 렌더링할 요소를 반환하는 함수

`renderData`: 렌더링 가능한 구성 요소에 소품으로 전달할 데이터

`컨테이너`: 컴포넌트가 마운트될 DOM 노드(예: `document.getElementById(placeholderId).parentElement`)

### 일반적인 후크

`frontend-js-react-web` 모듈에는 코드를 복제할 필요 없이 구성 요소에 유용한 동작을 혼합하는 데 사용할 수 있는 공통 후크 세트도 포함되어 있습니다.

[`usePrevious` hook](https://reactjs.org/docs/hooks-faq.html#how-to-get-the-previous-props-or-state) 현재 값과 이전 값(상태, 소품 또는 임의의 값)을 비교하는 데 사용할 수 있습니다.

`useIsMounted` 후크는 구성 요소가 여전히 마운트되어 있는지 여부를 결정하는 데 사용할 수 있습니다. 아래에 예가 나와 있습니다.

```javascript
import {useIsMounted} from 'frontend-js-react-web';

const InlineConfirm = props => {
    const isMounted = useIsMounted();

    const _handleConfirmButtonClick = () => {
        props.onConfirmButtonClick().then(() => {
            if (isMounted()) {
                setPerformingAction(false);
            }
        });
    };

    return <button onClick={handleConfirmButtonClick} />;

};
```

`useEventListener` 후크는 마운트 시 이벤트 리스너를 추가하고 마운트 해제 시 제거하는 데 사용할 수 있습니다. 예를 들면 다음과 같습니다.

```javascript
import {useEventListener} from 'frontend-js-react-web';

function OverlayContainer({root, allowEdit}) {
    useEventListener('keydown', handleKeydown, true, document);
    useEventListener('click', handleClick, false, document);

    return <></>;
}
```

## 반응 구성 요소 태그

`<react:component>` 태그는 JSP에 React 보기를 추가합니다. 아래에 예가 나와 있습니다.

```jsp
<react:component
    data="<%= data %>"
    module="js/pages/form-view/EditFormViewApp.es"
/>
```

[위](#frontend-js-react-web-module)에서 언급한 `frontend-js-react-web` 모듈의 `render()` 함수를 래핑합니다. 여기에 전달된 `data`는 `renderData`로 전달되고 `module`은 `renderable`([위](#frontend-js-react-web-module)에서 언급한 구성 요소 함수 또는 React 요소)을 내보내야 합니다.