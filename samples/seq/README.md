# Deploying Seq

Here we have scripts for configuring and deploying a Seq instance into our cluster.

Run the `apply.ps1` script to remove an existing Seq instance and recreate it. Run the `upgrade.ps1` script to upgrade an existing Seq instance in place.

## `seq`

There's a package manager for Kubernetes called [Helm](https://helm.sh/docs/). Seq has a [Helm Chart](https://helm.sh/docs/topics/charts/) which can be used to simplify deployment of a Seq server in a cluster. Helm will replace default parameters with the ones we specify in our `config.yaml` when creating the deployment.

### Deployment strategy

The chart uses a [Recreate Deployment Strategy](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#recreate-deployment) to make sure there's only ever a single container going and accessing storage at a time.

### Ingress

Corresponds to the `ui` and `ingestion` sections of the YAML configuration.

It supports [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) to the full UI/API and/or just the limited ingestion port. The [nginx Ingress Controller](https://docs.nginx.com/nginx-ingress-controller/) will typically route traffic to a [Service](https://kubernetes.io/docs/concepts/services-networking/service/) (like our Seq instance) using the host header. That means if you want to see your Seq instance on a local cluster then you'll need to edit your `hosts` file (that's at `$SYSTEM32/drivers/etc/hosts` on Windows or `/etc/hosts` on OSX) to point `127.0.0.1` to whatever hostname you configure Seq's _ingress_ to use. As an example, I have this in my `hosts` file:

```
127.0.0.1 seq-dev.local
127.0.0.1 seq-dev-ingest.local

127.0.0.1 kubernetes.docker.internal
```

The way Seq's Helm Chart is designed right now it's really only feasible to split ingestion and UI by hostname, rather than by path or port. So if you want to expose both publicly you'd use:

```shell
# UI
ui.seq.mydomain.com:443

# Ingestion
ingest.seq.mydomain.com:443
```

rather than:

```shell
# UI
seq.mydomain.com:443

# Ingestion
seq.mydomain.com:5341
```

### Storage

Corresponds to the `persistence` section of the YAML configuration.

Seq stores its data on disk, so the chart uses a [Persistent Volume Claim](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) to keep log data. That way, if the container is moved between actual nodes it will keep its configuration and data.

The chart may be deployed with a new or an existing claim.

### CPU and Memory

Corresponds to the `resources` section of the YAML configuration.

### GELF

The chart doesn't just deploy a `datalust/seq` container. When we enable `gelf` it'll also deploy a `datalust/sqelf` container alongside it, that can forward Graylog events into the Seq container. This is nice because Graylog has ready support in Kubernetes using `fluent-bit`, so applications that aren't using a logging framework with Seq support can simply log to `stdout` and still have their log events collected.

# Accessing Seq

You can access Seq using the hostname configured in `config.yaml`, or by running `serve.ps1` to access it directly, like the dashboard.

Internally, Seq will be available as `seq-dev.default.svc.cluster.local`, because we called our service `seq-dev`, and deployed it to the `default` namespace.
