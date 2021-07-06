# Collecting app and system logs

[Fluent Bit](https://fluentbit.io/) is a successor to [`fluentd`](https://www.fluentd.org/). It's a generic data collector, like [Logstash](https://www.elastic.co/logstash/), that is natively in Kubernetes.

Run the `apply.ps1` script to deploy the collector so that logs will start getting forwarded.

## `fluent-bit`

We create a [DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/), which ensures an instance of the `fluent-bit` collector runs on every [Node](https://kubernetes.io/docs/concepts/architecture/nodes/) in our cluster. This collector will listen for new logs from application containers and forward them via UDP to Seq in the [Graylog format](https://www.graylog.org/features/gelf).

The configuration for ingesting logs from Kubernetes sources comes from a [ConfigMap](https://kubernetes.io/docs/concepts/configuration/configmap/).
