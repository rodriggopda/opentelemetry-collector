

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/template/faP63Y?referralCode=HlH-QK)

# Grafana

```
GF_DEFAULT_INSTANCE_NAME="Grafana on Railway"
GF_SECURITY_ADMIN_USER="adminuser"
GF_SECURITY_ADMIN_PASSWORD="${{secret(22, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/")}}=="
GF_INSTALL_PLUGINS="grafana-simple-json-datasource,grafana-piechart-panel,grafana-worldmap-panel,grafana-clock-panel"

RAILWAY_RUN_UID="0" # must set this environment variable up when you need to mount volume
RAILWAY_LOKI_URL="http://${{Loki.RAILWAY_PRIVATE_DOMAIN}}:3100"
RAILWAY_PROMETHEUS_URL="http://${{Prometheus.RAILWAY_PRIVATE_DOMAIN}}:9090"
RAILWAY_TEMPO_URL="http://${{Tempo.RAILWAY_PRIVATE_DOMAIN}}:3200"
RAILWAY_JAEGER_URL="http://${{Jaeger.RAILWAY_PRIVATE_DOMAIN}}:16686"
RAILWAY_ZIPKIN_URL="http://${{Zipkin.RAILWAY_PRIVATE_DOMAIN}}:9411"
```

Railway template variable functions:

>openssl rand -base64 16 → ${{secret(22, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/")}}==
>openssl rand -base64 32 → ${{secret(43, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/")}}=
>openssl rand -base64 64 → ${{secret(86, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/")}}==
>openssl rand -hex 16 → ${{secret(32, "abcdef0123456789")}}
>openssl rand -hex 32 → ${{secret(64, "abcdef0123456789")}}
>openssl rand -hex 64 → ${{secret(128, "abcdef0123456789")}}

# Loki

```
RAILWAY_RUN_UID="0" # must set this environment variable up when you need to mount volume
```

# Prometheus

```
RAILWAY_RUN_UID="0" # must set this environment variable up when you need to mount volume
```

# Tempo

```
RAILWAY_RUN_UID="0" # must set this environment variable up when you need to mount volume
```


# Otel-collector

```
RAILWAY_PROMETHEUS_ENDPOINT="http://${{Prometheus.RAILWAY_PRIVATE_DOMAIN}}:9090/api/v1/write"
RAILWAY_LOKI_ENDPOINT="http://${{Loki.RAILWAY_PRIVATE_DOMAIN}}:3100/otlp"
RAILWAY_TEMPO_ENDPOINT="${{Tempo.RAILWAY_PRIVATE_DOMAIN}}:4317"
RAILWAY_ZINPKIN_ENDPOINT="http://${{Zipkin.RAILWAY_PRIVATE_DOMAIN}}:9411/api/v2/spans"
RAILWAY_JAEGER_ENDPOINT="${{Jaeger.RAILWAY_PRIVATE_DOMAIN}}:4317"
```

# Integrate with the application layer

1. Set up these OTEL_* environment variables in Raiway - Settings - Shared Variables

```
OTEL_TRACES_EXPORTER="otlp,console"
OTEL_EXPORTER_OTLP_PROTOCOL="http/protobuf"
```

2. Set up these OTEL_* environment variables in Raiway - <Your Service> - Variables

```
OTEL_EXPORTER_OTLP_ENDPOINT="http://${{Otel-Collector.RAILWAY_PRIVATE_DOMAIN}}:4318"
OTEL_EXPORTER_OTLP_PROTOCOL="${{shared.OTEL_EXPORTER_OTLP_PROTOCOL}}"
OTEL_TRACES_EXPORTER="${{shared.OTEL_TRACES_EXPORTER}}"
OTEL_SERVICE_NAME="${{RAILWAY_SERVICE_NAME}}"
OTEL_RESOURCE_ATTRIBUTES="service.namespace=${{RAILWAY_PROJECT_NAME}},deployment.environment=${{RAILWAY_ENVIRONMENT_NAME}}"
```
