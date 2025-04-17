FROM otel/opentelemetry-collector-contrib:0.123.0

# COPY grafana-collector-config.yaml /etc/otelcol-contrib/config.yaml
COPY railway-otel-collector-config.yml /etc/otelcol-contrib/config.yaml

# The OpenTelemetry Collector listens on the following ports:
# 1888 # pprof extension
# 8888 # Prometheus metrics exposed by the Collector
# 8889 # Prometheus exporter metrics
# 13133 # health_check extension
# 4317 # OTLP gRPC receiver
# 4318 # OTLP http receiver
# 55679 # zpages extension

EXPOSE 4317 4318 55678 55679 1888 8888

CMD ["--config", "/etc/otelcol-contrib/config.yaml"]

