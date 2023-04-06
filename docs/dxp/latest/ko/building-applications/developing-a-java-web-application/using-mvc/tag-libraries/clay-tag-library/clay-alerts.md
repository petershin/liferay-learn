
# 클레이 알림

클레이 알림은 임베디드 및 스트라이프의 두 가지 유형으로 제공됩니다. 두 가지 유형이 각각의 몇 가지 예와 함께 아래에 나와 있습니다.

## 임베디드 경고

포함된 경고는 일반적으로 양식 내부에서 사용됩니다. 포함된 요소에 따라 포함된 경고의 너비가 결정됩니다. 포함된 경고에는 닫기 작업이 필요하지 않습니다. Clay taglibs로 다음과 같은 내장 알림을 생성할 수 있습니다.

위험 경고(내장):

```jsp
<clay:alert
    displayType="danger"
    message="This is an error message."
    title="Error"
/>
```

![위험 경고는 사용자에게 오류 또는 문제를 알립니다.](./clay-alerts/images/01.png)

성공 알림(내장):

```jsp
<clay:alert
    displayType="success"
    message="This is a success message."
    title="Success"
/>
```

![작업이 성공하면 성공 알림이 사용자에게 알립니다.](./clay-alerts/images/02.png)

정보 알림(내장):

```jsp
<clay:alert
    displayType="info"
    message="This is an info message."
    title="Info"
/>
```

![정보 경고는 사용자에게 일반 정보를 표시합니다.](./clay-alerts/images/03.png)

경고 알림(내장):

```jsp
<clay:alert
    displayType="warning"
    message="This is a warning message."
    title="Warning"
/>
```

![경고 경고는 사용자에게 경고 메시지를 표시합니다.](./clay-alerts/images/04.png)

## 스트라이프 경고

스트라이프 경고는 마지막 탐색 요소(헤더 또는 탐색 표시줄) 아래에 배치되며 일반적으로 **저장** 작업에 표시되어 서버에서 받은 작업의 상태를 전달합니다. 포함된 경고와 달리 스트라이프 경고에는 닫기 작업이 필요합니다. 스트라이프 경고는 항상 컨테이너의 전체 너비이며 그 아래에 있는 모든 콘텐츠를 푸시합니다. 다음 스트라이프 경고는 Clay taglibs로 생성할 수 있습니다.

위험 경보(줄무늬):

```jsp
<clay:stripe
    displayType="danger"
    message="This is an error message."
    title="Error"
/>
```

![위험 줄무늬 경고는 작업이 실패했음을 사용자에게 알립니다.](./clay-alerts/images/05.png)

성공 알림(스트라이프):

```jsp
<clay:stripe
    displayType="success"
    message="This is a success message."
    title="Success"
/>
```

![성공 줄무늬 경고는 작업이 성공적으로 완료되었음을 사용자에게 알립니다.](./clay-alerts/images/06.png)

정보 경고(줄무늬):

```jsp
<clay:stripe
    displayType="info"
    message="This is an info message."
    title="Info"
/>
```

![정보 스트라이프 경고는 사용자에게 작업에 대한 일반 정보를 표시합니다.](./clay-alerts/images/07.png)

경고 알림(스트라이프):

```jsp
<clay:stripe
    displayType="warning"
    message="This is a warning message."
    title="Warning"
/>
```

![경고 스트라이프 알림은 사용자에게 작업에 대해 경고합니다.](./clay-alerts/images/08.png)

이제 사용자에게 경고하는 방법을 알았습니다!

## 관련 항목

* [클레이 버튼](./clay-buttons.md)
* [점토 양식 요소](./clay-form-elements.md)
* [점토 라벨 및 링크](./clay-links-and-labels.md)
