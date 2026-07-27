# Seq

[Seq](https://getseq.net/) is the easiest way for development teams to capture, search and visualize structured log events!

## TL;DR;

```bash
$ helm install datalust/seq
```

## Introduction

This chart bootstraps a [Seq](https://hub.docker.com/r/datalust/seq/) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

For details on using the chart, see [the Seq docs](https://docs.datalust.co/docs/using-helm). You can also check the default `values.yaml` file here for some configuration settings you can override.

## Persistence

The [Seq](https://hub.docker.com/r/datalust/seq/) image stores the Seq data and configurations at the `/data` path of the container.

By default, the chart mounts a [Persistent Volume](http://kubernetes.io/docs/user-guide/persistent-volumes/) at this location. The volume is created using dynamic volume provisioning. If a Persistent Volume Claim already exists, specify it during installation.

### Existing PersistentVolumeClaim

1. Create the PersistentVolume
2. Create the PersistentVolumeClaim
3. Install the chart

```bash
$ helm install --set persistence.existingClaim=PVC_NAME stable/seq
```
