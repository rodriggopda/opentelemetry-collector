FROM otel/opentelemetry-collector-contrib:0.123.0

COPY grafana-collector-config.yaml /etc/otelcol-contrib/config.yaml

ENTRYPOINT ["/otelcol-contrib"]

CMD ["--config", "/etc/otelcol-contrib/config.yaml"]

EXPOSE map[4317/tcp:{} 4318/tcp:{} 55678/tcp:{} 55679/tcp:{}]
