# Specify a different Prometheus version as needed
ARG PROMETHEUS_VERSION=2.52.0

# Use the official Prometheus base image
FROM prom/prometheus:v${PROMETHEUS_VERSION}

# Apply this repo's prometheus.yml file
ADD prometheus.yml /etc/prometheus/

# Sets the Render service name in prometheus.yml
# using the RENDER_SERVICE_NAME environment variable
ARG RENDER_SERVICE_NAME
RUN sed -i "s/RENDER_SERVICE_NAME/${RENDER_SERVICE_NAME}/g" /etc/prometheus/prometheus.yml

# Sets the storage path to your persistent disk path,
# plus other config
CMD [ "--storage.tsdb.path=/var/data/prometheus", \
      "--config.file=/etc/prometheus/prometheus.yml", \
      "--web.console.libraries=/usr/share/prometheus/console_libraries", \
      "--web.console.templates=/usr/share/prometheus/consoles" ]
