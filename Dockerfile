FROM otel/opentelemetry-collector-contrib:0.123.0

COPY grafana-collector-config.yaml /etc/otelcol-contrib/config.yaml

# ENTRYPOINT ["/otelcol-contrib"]

EXPOSE 4317 4318 55678 55679 1888 8888

CMD ["--config", "/etc/otelcol-contrib/config.yaml"]

