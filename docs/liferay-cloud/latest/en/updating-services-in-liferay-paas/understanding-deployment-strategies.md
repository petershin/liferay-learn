---
taxonomy-category-names:
- Cloud
- Cloud Platform Builds and Deployments
- Liferay PaaS
uuid: 3a95e148-966a-4c7b-afc8-139791a1fca3
---
# Understanding Deployment Strategies

The deployment strategy of a service determines how new versions will be initialized. Liferay Cloud provides two deployment strategies for its services: `RollingUpdate` and `Recreate`.

## Differences Between Deployment Strategies

Users expect applications to be available all the time and developers are expected to deploy new versions of them several times a day. In Liferay Cloud this is done with the `RollingUpdate` strategy. Rolling updates allow deployments to take place with zero downtime by incrementally updating instances with new ones.

| Deployment Strategy | Pros | Cons |
| :--- | :--- | :--- |
| `RollingUpdate` | New versions are released incrementally, maximizing uptime | Full roll outs can take additional time relative to number of instances |
| `Recreate` | Application state entirely renewed at once | Downtime length that occurs is dependent on shutdown and boot up duration for the application |

```{important}
Deployments defined with the `Recreate` strategy will terminate all the running instances before recreating them with the newer version.
```

In general, the `RollingUpdate` strategy is our recommended approach. The `Recreate` strategy can be used in non-production environments or very specific edge cases.

## Configuring Deployment Strategies

By default, the services in Liferay Cloud are pre-configured to use the `RollingUpdate` strategy. The deployment strategy for each service is configurable via the `strategy` variable in the service's [`LCP.json`](../reference/configuration-via-lcp-json.md):

```json
{
    "id": "myservice",
    "strategy": {
        "type": "Recreate"
    }
}
```

## Related Topics

* [Understanding Deployment Types](./understanding-deployment-types.md)
