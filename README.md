# Reaction OSS Helm Chart
![Lint](https://github.com/slingshotlabs/reaction-oss-helm-chart/workflows/Lint/badge.svg)

This repository contains a helm chart for deploying the open source Reaction Commerce platform ontop of Kubernetes/Openshift.

Reaction Commerce is an API-first, modular commerce stack made for ambitious brands and retailers. Reaction’s service-based architecture is built to deliver flexibility and freedom at scale.

This chart packages the following components from the OSS platform:

| Service                                             | Description                                                                                                                                                                                         |
|-----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [OAuth2 Server (Hydra)](http://localhost:4444) | ORY Hydra OAuth2 token server.                                                                                                                                                                |
| [Reaction Identity](http://localhost:4100)     | The OAuth2-compatible user interface for Reaction Identity, such as login and registration.                                                                                                         |
| [Reaction API](http://localhost:3000)          | The Reaction API, which includes [a GraphQL endpoint](http://localhost:3000/graphql-beta). See [GraphQL Playground](https://www.apollographql.com/docs/apollo-server/features/graphql-playground/). |
| [Reaction Admin](http://localhost:4080)        | A user interface for administrators and shop managers to configure shops, manage products, and process orders.                                                                                      |
| [Example Storefront](http://localhost:4000)    | An example Reaction storefront UI built with [Next.JS](https://github.com/zeit/next.js/).

Current chart version is `0.1.0`

Source code can be found [here](https://reactioncommerce.com/)

## Chart Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami/ | mongodb | 7.14.1 |
| https://kubernetes-charts.storage.googleapis.com/ | postgresql | 8.1.4 |

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admin.enabled | bool | `true` | Enables or disables the admin interface |
| admin.host | string | `"admin.example.shop"` | The hostname of the admin interface |
| admin.image.pullPolicy | string | `"IfNotPresent"` | Default image pull policy  |
| admin.image.repository | string | `"reactioncommerce/admin"` | Image repository |
| admin.image.tag | string | `"3.0.0-beta.6"` | Image tag |
| admin.ingress.annotations | object | `{}` | A set of custom annotations to apply to the admin ingress resource |
| admin.ingress.enabled | bool | `true` | Enable or disables the ingress resource |
| admin.ingress.livenessPath | string | `nil` | Liveness probe path for the ingress |
| admin.ingress.path | string | `""` | Default virtual path on the admin ingress |
| admin.ingress.tls.enabled | bool | `true` | Enables or disables TLS on the ingress |
| admin.ingress.tls.secretName | string | `"tls-secret"` | Secret path for tls certs |
| admin.replicaCount | int | `2` | Pod replica count |
| admin.service.annotations | object | `{}` | Service annotations |
| admin.service.type | string | `"ClusterIP"` | Service type |
| admin.ssl | bool | `true` | Enables external SSL support |
| api.enabled | bool | `true` |  |
| api.host | string | `"api.example.shop"` |  |
| api.image.pullPolicy | string | `"IfNotPresent"` |  |
| api.image.repository | string | `"reactioncommerce/reaction"` |  |
| api.image.tag | string | `"3.7.1"` |  |
| api.ingress.annotations | object | `{}` |  |
| api.ingress.enabled | bool | `true` |  |
| api.ingress.livenessPath | string | `nil` |  |
| api.ingress.path | string | `""` |  |
| api.ingress.tls.enabled | bool | `true` |  |
| api.ingress.tls.secretName | string | `"tls-secret"` |  |
| api.replicaCount | int | `2` |  |
| api.service.annotations | object | `{}` |  |
| api.service.type | string | `"ClusterIP"` |  |
| api.ssl | bool | `true` |  |
| global.segmentKey | string | `"YOUR_PRIVATE_SEGMENT_API_KEY"` | Set this if you want to track storefront analytics such as page views with Segment. You can find this key on your Segment dashboard |
| global.stripeKey | string | `"YOUR_PRIVATE_STRIPE_API_KEY"` | The Stripe secret key from your Stripe account dashboard. |
| hydra.admin.host | string | `"private.example.shop"` |  |
| hydra.admin.ingress.annotations | object | `{}` |  |
| hydra.admin.ingress.enabled | bool | `true` |  |
| hydra.admin.ingress.livenessPath | string | `nil` |  |
| hydra.admin.ingress.path | string | `""` |  |
| hydra.admin.ingress.tls.enabled | bool | `true` |  |
| hydra.admin.ingress.tls.secretName | string | `"tls-secret"` |  |
| hydra.enabled | bool | `true` |  |
| hydra.frontend.host | string | `"hydra.example.shop"` |  |
| hydra.frontend.ingress.annotations | object | `{}` |  |
| hydra.frontend.ingress.enabled | bool | `true` |  |
| hydra.frontend.ingress.livenessPath | string | `nil` |  |
| hydra.frontend.ingress.path | string | `""` |  |
| hydra.frontend.ingress.tls.enabled | bool | `true` |  |
| hydra.frontend.ingress.tls.secretName | string | `"tls-secret"` |  |
| hydra.image.pullPolicy | string | `"IfNotPresent"` |  |
| hydra.image.repository | string | `"oryd/hydra"` |  |
| hydra.image.tag | string | `"v1.0.8"` |  |
| hydra.pairwiseSalt | string | `"youReallyNeedToChangeThis"` |  |
| hydra.replicaCount | int | `1` |  |
| hydra.secretsSystem | string | `"youReallyNeedToChangeThis"` |  |
| hydra.service.annotations | object | `{}` |  |
| hydra.service.type | string | `"ClusterIP"` |  |
| hydra.ssl | bool | `true` |  |
| identity.enabled | bool | `true` |  |
| identity.host | string | `"identity.example.shop"` |  |
| identity.image.pullPolicy | string | `"IfNotPresent"` |  |
| identity.image.repository | string | `"reactioncommerce/identity"` |  |
| identity.image.tag | string | `"3.0.0"` |  |
| identity.ingress.annotations | object | `{}` |  |
| identity.ingress.enabled | bool | `true` |  |
| identity.ingress.livenessPath | string | `nil` |  |
| identity.ingress.path | string | `""` |  |
| identity.ingress.tls.enabled | bool | `true` |  |
| identity.ingress.tls.secretName | string | `"tls-secret"` |  |
| identity.replicaCount | int | `2` |  |
| identity.service.annotations | object | `{}` |  |
| identity.service.type | string | `"ClusterIP"` |  |
| identity.ssl | bool | `true` |  |
| mongodb.enabled | bool | `true` |  |
| mongodb.mongodbRootPassword | string | `"reaction"` |  |
| mongodb.replicaSet.enabled | bool | `true` |  |
| mongodb.replicaSet.name | string | `"rs0"` |  |
| mongodb.replicaSet.replicas.arbiter | int | `1` |  |
| mongodb.replicaSet.replicas.secondary | int | `1` |  |
| mongodb.replicaSet.useHostnames | bool | `true` |  |
| mongodb.service.annotations | object | `{}` |  |
| mongodb.service.port | int | `27017` |  |
| mongodb.service.type | string | `"ClusterIP"` |  |
| mongodb.usePassword | bool | `true` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| postgresql.persistence.enabled | bool | `true` |  |
| postgresql.postgresqlDatabase | string | `"hydra"` |  |
| postgresql.postgresqlPassword | string | `"hydra"` |  |
| postgresql.postgresqlUsername | string | `"postgres"` |  |
| postgresql.service.port | int | `5432` |  |
| web.enabled | bool | `true` |  |
| web.host | string | `"www.example.shop"` |  |
| web.image.pullPolicy | string | `"IfNotPresent"` |  |
| web.image.repository | string | `"reactioncommerce/example-storefront"` |  |
| web.image.tag | string | `"3.0.0"` |  |
| web.ingress.annotations | object | `{}` |  |
| web.ingress.enabled | bool | `true` |  |
| web.ingress.livenessPath | string | `nil` |  |
| web.ingress.path | string | `""` |  |
| web.ingress.tls.enabled | bool | `true` |  |
| web.ingress.tls.secretName | string | `"tls-secret"` |  |
| web.replicaCount | int | `2` |  |
| web.service.annotations | object | `{}` |  |
| web.service.type | string | `"ClusterIP"` |  |
| web.ssl | bool | `true` |  |
