<p align="center">
  <a target="_blank" href="https://merchstack.io/"><img width="152" height="183" src="https://user-images.githubusercontent.com/8715048/100143018-9c72cb00-2e8c-11eb-9546-1832cd7215b0.png"></a>
</p>
<p align="center">
  <a target="_blank" href="https://github.com/slingshotlabs/reaction-oss-helm-chart/actions?query=workflow%3Alint"><img src="https://github.com/slingshotlabs/reaction-oss-helm-chart/workflows/lint/badge.svg" alt="lint" style="max-width:100%;"></a>
</p>
<p align="center"><a href="https://mailchimp.com/developer/open-commerce/" target="_blank">Open Commerce</a> Helm Chart</p>

This repository contains a helm chart for deploying the open source Open Commerce platform ontop of a Kubernetes cluster.

Open Commerce is an API-first, modular commerce stack made for ambitious brands and retailers. Open Commerces’s service-based architecture is built to deliver flexibility and freedom at scale.

This chart packages the following components from the Open Commerce platform:

| Service                                             | Description                                                                                                                                                                                         |
|-----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  [Open Commerce API](http://localhost:3000)          | The Open Commerce API, which includes [a GraphQL endpoint](http://localhost:3000/graphql-beta). See [GraphQL Playground](https://www.apollographql.com/docs/apollo-server/features/graphql-playground/). |
| [Open Commerce Admin](http://localhost:4080)        | A user interface for administrators and shop managers to configure shops, manage products, and process orders.                                                                                      |
| [Example Storefront](http://localhost:4000)    | An example Open Commerce storefront UI built with [Next.JS](https://github.com/zeit/next.js/).

Current chart version is `0.3.0`

## Chart Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami/ | mongodb | 10.26.3 |

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admin.enabled | bool | `true` | Enables or disables the admin interface |
| admin.host | string | `"admin.example.shop"` | The hostname of the admin interface |
| admin.image.pullPolicy | string | `"IfNotPresent"` | Default image pull policy  |
| admin.image.repository | string | `"reactioncommerce/admin"` | Image repository |
| admin.image.tag | string | `"4.0.0-beta.12"` | Image tag |
| admin.ingress.annotations | object | `{}` | A set of custom annotations to apply to the admin ingress resource |
| admin.ingress.enabled | bool | `true` | Enable or disables the ingress resource |
| admin.ingress.livenessPath | string | `nil` | Liveness probe path for the ingress |
| admin.ingress.path | string | `"/"` | Default virtual path on the admin ingress |
| admin.ingress.tls.enabled | bool | `true` | Enables or disables TLS on the ingress |
| admin.ingress.tls.secretName | string | `"tls-secret"` | Secret path for tls certs |
| admin.replicaCount | int | `2` | Pod replica count |
| admin.service.annotations | object | `{}` | Service annotations |
| admin.service.type | string | `"ClusterIP"` | Service type |
| admin.ssl | bool | `true` | Enables external SSL support |
| api.enabled | bool | `true` | Enables or disables the Open Commerce api |
| api.enableGraphQlPlayground | bool | `false` | Serve the GraphQL Playground UI from /graphql |
| api.enableGraphQlIntrospection | bool | `false` | Allow introspection of the GraphQL API. |
| api.host | string | `"api.example.shop"` | The hostname of the Open Commerce api |
| api.image.pullPolicy | string | `"IfNotPresent"` | Default image pull policy |
| api.image.repository | string | `"reactioncommerce/reaction"` | Image repository |
| api.image.tag | string | `"4.1.4"` | Image tag |
| api.ingress.annotations | object | `{}` | A set of custom annotations to apply to the api ingress resource  |
| api.ingress.enabled | bool | `true` | Enable or disables the ingress resource |
| api.ingress.livenessPath | string | `nil` | Liveness probe path for the ingress |
| api.ingress.path | string | `"/"` | Default virtual path on the admin ingress |
| api.ingress.tls.enabled | bool | `true` | Enables or disables TLS on the ingress |
| api.ingress.tls.secretName | string | `"tls-secret"` | Secret path for tls certs |
| api.replicaCount | int | `2` | Pod replica count |
| api.service.annotations | object | `{}` | Service annotations |
| api.service.type | string | `"ClusterIP"` | Service type |
| api.ssl | bool | `true` | Enables external SSL support |
| global.segmentKey | string | `"YOUR_PRIVATE_SEGMENT_API_KEY"` | Set this if you want to track storefront analytics such as page views with Segment. You can find this key on your Segment dashboard |
| global.stripeKey | string | `"YOUR_PRIVATE_STRIPE_API_KEY"` | The Stripe secret key from your Stripe account dashboard. |
| mongodb.enabled | bool | `true` |  |
| mongodb.auth.enabled | bool | `true` |  |
| mongodb.auth.rootPassword | string | `""` |  |
| mongodb.auth.rootUser | string | `admin` |  |
| mongodb.architecture | string | `replicaset` |  |
| mongodb.replicaSetName | string | `rs0` |  |
| mongodb.replicaCount | int | `2` |  |
| mongodb.replicaSetHostnames | bool | `true` |  |
| mongodb.persistence.enabled | bool | `true` |  |
| mongodb.persistence.size | string | `8Gi` |  |
| mongodb.perssitence.storageClass | string | `""` |  |
| mongodb.arbiter.enabled | bool | `true` |  |
| mongodb.service.annotations | object | `{}` |  |
| mongodb.service.type | string | `ClusterIP` |  |
| mongodb.service.port | int | `27017` |  |
| web.enabled | bool | `true` |  |
| web.host | string | `"example.shop"` |  |
| web.image.pullPolicy | string | `"IfNotPresent"` |  |
| web.image.repository | string | `"reactioncommerce/example-storefront"` |  |
| web.image.tag | string | `"5.1.0"` |  |
| web.ingress.annotations | object | `{}` |  |
| web.ingress.enabled | bool | `true` |  |
| web.ingress.livenessPath | string | `nil` |  |
| web.ingress.path | string | `"/"` |  |
| web.ingress.tls.enabled | bool | `true` |  |
| web.ingress.tls.secretName | string | `"tls-secret"` |  |
| web.replicaCount | int | `2` |  |
| web.service.annotations | object | `{}` |  |
| web.service.type | string | `"ClusterIP"` |  |
| web.ssl | bool | `true` |  |
