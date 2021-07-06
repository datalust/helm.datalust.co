# Deploying an ingress controller

Here we deploy a default [Ingress Controller](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/) based on [nginx](https://nginx.org/en/).

Run the `apply.ps1` script to deploy our ingress controller.

## `ingress-nginx`

From: https://kubernetes.github.io/ingress-nginx/deploy/

What's an [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)? It allows you to open access to your applications to users outside of your cluster. Without an ingress, the applications in your cluster can still see eachother, but nobody outside of it can see them.

Ingress isn't a piece of infrastructure that enables proxying to services in your cluster. It's more like a request for proxying support that some other service can handle. That other service is the [Ingress Controller](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/). In this sample, that controller is [nginx](https://nginx.org/en/), a popular reverse proxy and HTTP server.
