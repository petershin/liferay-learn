---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Reference
- Liferay PaaS
uuid: 06e5f4cf-f80e-4ba3-b0fb-df7058b8b4bb
---
# Configuration via LCP.json

Each service in your Liferay Cloud environments has an `LCP.json` file that you can use to configure the service. You can configure properties like the service ID, memory, number of CPUs, environment variables, volumes, and much more.

This table lists and describes the properties you can add in `LCP.json`:

| Field | Type | Default Value | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | random | The service ID |
| `image` | String | `""` | The service image from Docker Hub |
| `env` | Object | undefined | Environment variables |
| `loadBalancer` | Object | `{}` | Declaration of exposed ports and domains |
| `cpu` | Number | `1` | Number of CPUs |
| `scale` | Number | `1` | Starting number of instances |
| `memory` | Number | `512` | Amount of memory (MB) |
| `volumes` | Object | undefined | Paths to persist data |
| `readinessProbe` | Object | `{ "timeoutSeconds": 5 }` | Service readiness check |
| `livenessProbe` | Object | `{ "timeoutSeconds": 5 }` | Service liveness check |
| `dependencies` | Array | `[]` | Dependency deployment order |
| `kind` | String | `Deployment` | Deployment type (e.g, Deployment or StatefulSet) |
| `strategy` | Object | `{ "type": "RollingUpdate" }` | Deployment strategy (e.g, RollingUpdate or Recreate) |
| `ports` | Array | `[]` | Declaration of ports and protocols |
| `environments` | Object | `{}` | Environment-specific configurations |
| `deploy` | Boolean | `true` | Whether the service will be deployed for the specified environment. Only use this property inside the `environments` property; not at the root level. See the sample `LCP.json` file. |
| `autoscale` | Object | `{ "cpu": 80, "memory": 80 }` | The target average utilization for CPU and memory in auto-scaling. For more information about how this works with auto-scaling, see [Auto-scaling](../manage-and-optimize/auto-scaling.md). |

## Usage

Here's an example `LCP.json` file that uses all the properties:

```json
{
  "id": "myservice",
  "image": "liferaycloud/example",
  "env": {
    "DB_USER": "root",
    "DB_PASSWORD": "pass123"
  },
  "loadBalancer": {
    "cdn": true,
    "targetPort": 3000,
    "customDomains": ["example.com"],
    "ssl": {
      "key": "...",
      "crt": "..."
    }
  },
  "cpu": 2,
  "scale": 2,
  "memory": 2048,
  "volumes": {
    "storage": "/opt/storage"
  },
  "livenessProbe": {
    "timeoutSeconds": 5,
    "httpGet": {
      "path": "/status",
      "port": 3000
    },
    "initialDelaySeconds": 40,
    "periodSeconds": 5,
    "successThreshold": 5
  },
  "readinessProbe": {
    "timeoutSeconds": 5,
    "exec": {
      "command": ["cat", "/tmp/healthy"]
    },
    "initialDelaySeconds": 40,
    "periodSeconds": 5
  },
  "dependencies": ["service1", "service2"],
  "kind": "StatefulSet",
  "strategy": {
    "type": "RollingUpdate"
  },
  "ports": [
    {
      "port": 3400,
      "targetPort": 7000,
      "protocol": "TCP"
    },
    {
      "port": 9000,
      "targetPort": 8000,
      "protocol": "TCP",
      "external": true
    }
  ],
  "environments": {
    "prd": {
      "memory": 4096,
      "cpu": 6
    },
    "dev": {
      "deploy": false
    }
  },
  "autoscale": {
    "cpu": 90,
    "memory": 90
  }
}
```

## The `environments` Configuration

The `environments` configuration allows for environment-specific overrides to the `LCP.json` configuration.

For example, the CI service should only be deployed to the `infra` environment, so this `environments` configuration overrides the behavior (`"deploy": false`) specifically for the `infra` environment:

```json
{
  "id": "ci",
  "memory": 8192,
  "cpu": 4,
  "deploy": false,
  "environments": {
    "infra": {
      "deploy": true
    }
  }
}
```

### Overriding JSON Objects

For JSON object configurations (such as a `loadBalancer` configuration), specify only the specific fields that you want to override per environment. Any other fields are inherited from the existing configuration by default.

In this example, the `environments` configuration disables the CDN for the `dev` environment, but keeps the target port of `80` for all environments.

```json
{
  "id": "webserver",
  "memory": 512,
  "cpu": 2,
  "loadBalancer": {
    "targetPort": 80,
    "cdn": true
  },
  "environments": {
    "dev": {
      "loadBalancer": {
        "cdn": false
      }
    }
  }
}
```

### Overriding JSON Arrays

Unlike [JSON objects](#overriding-json-objects), if you override a JSON array in an `environments` configuration, you must define the whole array in the override. Any elements of the array that you don't include are not included in the environment-specific result.

In this example overriding the `ports` array, the `environments` configuration configures the `uat` environment with only one port (but two for all other environments).

```json
{
  "id": "database",
  "memory": 1024,
  "cpu": 2,
  "ports": [
    {
      "port": 3306,
      "external": false
    },
    {
      "port": 3000,
      "external": false
    }
  ],
  "environments": {
    "uat": {
      "ports": [
        {
          "port": 3306,
          "external": true
        }
      ]
    }
  }
}
```

