
# Variables

# Grafana

```
GF_DEFAULT_INSTANCE_NAME="Grafana on Railway"
GF_SECURITY_ADMIN_USER=""
GF_SECURITY_ADMIN_PASSWORD="${{secret(22, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/")}}=="
GF_INSTALL_PLUGINS="grafana-simple-json-datasource,grafana-piechart-panel,grafana-worldmap-panel,grafana-clock-panel"

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

# Otel-collector

```
RAILWAY_PROMETHEUS_ENDPOINT="${{Prometheus.RAILWAY_PRIVATE_DOMAIN}}:9090"
RAILWAY_LOKI_ENDPOINT="http://${{Loki.RAILWAY_PRIVATE_DOMAIN}}:3100/otlp"
RAILWAY_TEMPO_ENDPOINT="${{Tempo.RAILWAY_PRIVATE_DOMAIN}}:4318"
RAILWAY_ZINPKIN_ENDPOINT="http://${{Zipkin.RAILWAY_PRIVATE_DOMAIN}}:9411/api/v2/spans"
RAILWAY_JAEGER_ENDPOINT="${{Jaeger.RAILWAY_PRIVATE_DOMAIN}}:4317"
```