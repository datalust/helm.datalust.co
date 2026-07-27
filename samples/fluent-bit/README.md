# Collecting app and system logs

[Fluent Bit](https://fluentbit.io/) is a successor to [`fluentd`](https://www.fluentd.org/). It's a generic data collector, like [Logstash](https://www.elastic.co/logstash/).

Run the `apply.ps1` script to deploy the collector so that logs will start getting forwarded.

## Configuring Fluent Bit

Fluent Bit is general-purpose ingestion pipeline that supports collecting, filtering, transforming, and emitting event data. This sample just sets up a simple pipeline. For more complex deployments, see [the Fluent Bit docs](https://docs.fluentbit.io/manual). If you're going to deploy Fluent Bit in your production Kubernetes environment then it's worth learning the ins-and-outs of how it works and what it can do.
