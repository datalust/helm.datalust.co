# Getting started with Seq in Kubernetes

[Kubernetes](https://kubernetes.io/docs/home/) is a system for container orchestration with first-class support in most clouds. It comes with a lot of new terminology so it can take some time to get familiar with.

This sample will set up Seq in a Kubernetes cluster on your local machine. It uses scripts written in [PowerShell](https://github.com/PowerShell/PowerShell/tree/master/docs/learning-powershell) and has been tested on Windows and OSX using [Docker Desktop](https://www.docker.com/products/docker-desktop). It has the following main pieces:

- The [Kubernetes dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/), in `./dashboard`, for visualizing and exploring the health of your cluster.
- An [nginx Ingress Controller](https://kubernetes.github.io/ingress-nginx/), in `./nginx-controller`, to allow traffic from outside the cluster to reach our Seq instance.
- A [Fluent Bit daemon](https://docs.fluentbit.io/manual/installation/kubernetes), in `./fluent-bit`, for collecting logs from applications running in our cluster and forwarding them to Seq.
- A [Seq instance](https://docs.datalust.co/docs), in `./seq`, for storing, analyzing, and visualizing log data.
- A sample application, in `./app`, deployed to our cluster that will produce log events.

If you're starting from fresh with an empty Kubernetes cluster, you can run a script that will set everything up for you:

```shell
./apply.ps1
```

If you'd like to set up individual bits directly, you can run the `apply.ps1` scripts you find in their directories.

Take a look through the subdirectories in here to see some more details about what each piece does and how to interact with it.
