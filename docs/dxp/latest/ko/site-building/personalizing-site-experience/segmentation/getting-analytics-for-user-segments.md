# 사용자 세그먼트에 대한 분석 얻기

> **가입자**

사용자 세그먼트와 함께 Analytics Cloud를 사용하려면 먼저 DXP 데이터 소스를 Analytics Cloud에 연결하고 사용자와 분석의 동기화를 활성화해야 합니다. DXP와 연결하기 위한 지침을 포함하여 Analytics Cloud에 대한 자세한 내용은 공식 [애널리틱 클라우드](https://learn.liferay.com/w/analytics-cloud/index) 을 참조하십시오.

```{important}
Analytics Cloud와의 동기화는 즉시 이루어지지 않으므로 Analytics Cloud와 Liferay DXP를 연결한 후에는 먼저 사용자와 데이터가 동기화될 때까지 기다려야 합니다. 완료되면 Analytics Cloud에서 세그먼트를 생성하여 DXP에서 데이터를 캡처할 수 있습니다.

또한 Analytics Cloud에서 생성된 세그먼트는 Liferay DXP와 동기화됩니다. 그러나 Liferay DXP에서 생성된 세그먼트는 Analytics Cloud와 동기화되지 않습니다.
```

세그먼트 분석을 얻으려면 다음 단계를 따르십시오.

1. [세그먼트 생성](https://learn.liferay.com/w/analytics-cloud/people/segments/creating-segments) 에서 세그먼트를 생성합니다.

    ```{note}
    하나 이상의 구성원을 포함하는 세그먼트만 Liferay DXP와 동기화됩니다. 즉, Analytics Cloud로 만든 빈 세그먼트는 Liferay DXP에서 사용할 수 없습니다.
    ```

1. 세그먼트가 동기화되면 **세그먼트** 페이지로 이동합니다.
1. 새 세그먼트를 클릭하여 보고 사용자 정의하십시오.

> 제품 이미지는 Liferay DXP 버전에 따라 약간 다를 수 있습니다.

![세그먼트 목록에 Analytics Cloud 세그먼트가 표시되면 Analytics Cloud 아이콘으로 표시됩니다.](./getting-analytics-for-user-segments/images/02.png)

Analytics Cloud 세그먼트를 클릭하면 Analytics Cloud로 이동하여 세그먼트를 편집하고 기준을 변경할 수 있습니다. Liferay DXP에서 Analytics Cloud 세그먼트를 편집할 수 없습니다.

## 관련 정보

* [사용자 세그먼트에 역할 할당](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md)
* [사용자 세그먼트 생성](./creating-and-managing-user-segments.md)
* [컬렉션 개인화](../experience-personalization/personalizing-collections.md)
