# Deploying the dashboard

Here we've got some scripts to set up a dashboard app that can be used to see what the cluster is up to when we create deployments in it.

Run the `apply.ps1` script to deploy the dashboard and a user that can access it.

If you're running in `minikube` then you don't need to use this script. See [the `minikube` docs](https://minikube.sigs.k8s.io/docs/handbook/dashboard/) for details.

## `kubernetes-dashboard`

From: https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

## `dashboard-user`

From: https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md

You need a user to access the dashboard with. The example creates a cluster admin user and tells you it's a really bad idea but gives you no direction on what a good user might look like. So... cluster admin it is!

# Accessing the dashboard

Run the `serve.ps1` script to serve the dashboard, proxy access to it and print a token we can use to log in to it.
