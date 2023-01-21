<p align="center"><a href="https://mailchimp.com/developer/open-commerce/" target="_blank">Open Commerce</a> Helm Chart</p>

This repository contains a helm chart for deploying the open source Open Commerce platform on top of a Kubernetes cluster.

Open Commerce is an API-first, modular commerce stack made for ambitious brands and retailers. Open Commerces’s service-based architecture is built to deliver flexibility and freedom at scale.

This chart packages the following components from the Open Commerce platform:

| Service                                             | Description                                                                                                                                                                                         |
|-----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  [Open Commerce API](http://localhost:3000)          | The Open Commerce API, which includes [a GraphQL endpoint](http://localhost:3000/graphql-beta). See [GraphQL Playground](https://www.apollographql.com/docs/apollo-server/features/graphql-playground/). |
| [Open Commerce Admin](http://localhost:4080)        | A user interface for administrators and shop managers to configure shops, manage products, and process orders.                                                                                      |
| [Example Storefront](http://localhost:4000)    | An example Open Commerce storefront UI built with [Next.JS](https://github.com/zeit/next.js/).

Current chart version is `0.4.0`

## Chart Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami/ | mongodb | 11.1.10 |

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
| admin.resources.requests.cpu | string | `"500m"` | CPU Resource Constraint |
| admin.resources.requests.memory | string | `"1Gi"` | Memory Resource Constraint |
| kinetic.enabled | bool | `true` | Enables or disables the kinetic admin interface |
| kinetic.host | string | `"kinetic.example.shop"` | The hostname of the kinetic admin interface |
| kinetic.image.pullPolicy | string | `"IfNotPresent"` | Default image pull policy  |
| kinetic.image.repository | string | `"reactioncommerce/kinetic"` | Image repository |
| kinetic.image.tag | string | `"latest"` | Image tag |
| kinetic.ingress.annotations | object | `{}` | A set of custom annotations to apply to the kinetic admin ingress resource |
| kinetic.ingress.enabled | bool | `true` | Enable or disables the ingress resource |
| kinetic.ingress.livenessPath | string | `nil` | Liveness probe path for the ingress |
| kinetic.ingress.path | string | `"/"` | Default virtual path on the kinetic admin ingress |
| kinetic.ingress.tls.enabled | bool | `true` | Enables or disables TLS on the ingress |
| kinetic.ingress.tls.secretName | string | `"tls-secret"` | Secret path for tls certs |
| kinetic.replicaCount | int | `2` | Pod replica count |
| kinetic.service.annotations | object | `{}` | Service annotations |
| kinetic.service.type | string | `"ClusterIP"` | Service type |
| kinetic.ssl | bool | `true` | Enables external SSL support |
| kinetic.resources.requests.cpu | string | `"500m"` | CPU Resource Constraint |
| kinetic.resources.requests.memory | string | `"1Gi"` | Memory Resource Constraint |
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
| api.resources.requests.cpu | string | `"500m"` | CPU Resource Constraint |
| api.resources.requests.memory | string | `"1Gi"` | Memory Resource Constraint |
| global.segmentKey | string | `"YOUR_PRIVATE_SEGMENT_API_KEY"` | Set this if you want to track storefront analytics such as page views with Segment. You can find this key on your Segment dashboard |
| global.stripeKey | string | `"YOUR_PRIVATE_STRIPE_API_KEY"` | The Stripe secret key from your Stripe account dashboard. |
| mongodb.enabled | bool | `true` | Enables or disables MongoDB deployment |
| mongodb.auth.enabled | bool | `true` | Enable or disable MongoDB Authentication |
| mongodb.auth.rootPassword | string | `""` | MongoDB Root User Password |
| mongodb.auth.rootUser | string | `admin` | MongoDB Root Username |
| mongodb.architecture | string | `replicaset` | MongoDB Architecture |
| mongodb.replicaSetName | string | `rs0` | MongoDB Replica Set Name |
| mongodb.replicaCount | int | `2` | MongoDB Count of Replicas |
| mongodb.replicaSetHostnames | bool | `true` | Enable or Disable hostnames for MongoDB replicas |
| mongodb.persistence.enabled | bool | `true` | Enable or Disable persistence for MongoDB |
| mongodb.persistence.size | string | `8Gi` | Storage size for MongoDB persistence |
| mongodb.perssitence.storageClass | string | `""` | Storage class for MongoDB persistence |
| mongodb.arbiter.enabled | bool | `true` | Enable or disable MongoDB Arbiter |
| mongodb.service.annotations | object | `{}` | MongoDB Service Annotations |
| mongodb.service.type | string | `ClusterIP` | Service type |
| mongodb.service.port | int | `27017` | Service port |
| web.enabled | bool | `true` | Enables or disables the template StoreFront |
| web.host | string | `"example.shop"` | The hostname of the template StoreFront |
| web.image.pullPolicy | string | `"IfNotPresent"` | Default image pull policy |
| web.image.repository | string | `"reactioncommerce/example-storefront"` | Image repository |
| web.image.tag | string | `"5.1.0"` | Image tag |
| web.ingress.annotations | object | `{}` | A set of custom annotations to apply to the web ingress resource |
| web.ingress.enabled | bool | `true` | Enable or disables the ingress resource |
| web.ingress.livenessPath | string | `nil` | Liveness probe path for the ingress |
| web.ingress.path | string | `"/"` | Default virtual path on the admin ingress |
| web.ingress.tls.enabled | bool | `true` | Enables or disables TLS on the ingress |
| web.ingress.tls.secretName | string | `"tls-secret"` | Secret path for tls certs |
| web.replicaCount | int | `2` | Pod replica count |
| web.service.annotations | object | `{}` | Service annotations |
| web.service.type | string | `"ClusterIP"` | Service type |
| web.ssl | bool | `true` | Enables external SSL support |
| web.resources.requests.cpu | string | `"500m"` | CPU Resource Constraint |
| web.resources.requests.memory | string | `"1Gi"` | Memory Resource Constraint |
