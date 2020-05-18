# Reaction OSS Helm Chart
This repository contains a helm chart for deploying the open source Reaction Commerce platform ontop of Kubernetes/Openshift.

This chart packages the following components from the OSS platform:

| Service                                             | Description                                                                                                                                                                                         |
|-----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [OAuth2 Server (Hydra)](http://localhost:4444) | ORY Hydra OAuth2 token server.                                                                                                                                                                |
| [Reaction Identity](http://localhost:4100)     | The OAuth2-compatible user interface for Reaction Identity, such as login and registration.                                                                                                         |
| [Reaction API](http://localhost:3000)          | The Reaction API, which includes [a GraphQL endpoint](http://localhost:3000/graphql-beta). See [GraphQL Playground](https://www.apollographql.com/docs/apollo-server/features/graphql-playground/). |
| [Reaction Admin](http://localhost:4080)        | A user interface for administrators and shop managers to configure shops, manage products, and process orders.                                                                                      |
| [Example Storefront](http://localhost:4000)    | An example Reaction storefront UI built with [Next.JS](https://github.com/zeit/next.js/). 