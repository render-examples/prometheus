# Prometheus on Render

Copy this template to deploy [Prometheus](https://prometheus.io/) on Render as a web service.

> [Follow the quickstart.](https://docs.render.com/deploy-prometheus)

This repo includes the following files:

| File             | Description |
|------------------|-------------|
| `Dockerfile`     | Configuration for the generated Docker image, based on the official Prometheus image. |
| `prometheus.yml` | Scraping configuration for Prometheus. |
| `render.yaml`    | Optionally use this file to manage your Prometheus service via [Render Blueprints](https://docs.render.com/infrastructure-as-code). |

When you create your Render service, use the following values:

- **Service Type**: Web Service (or Private Service if you don't need to access the Prometheus UI)
- **Runtime**: `Docker`
- **Instance Type**: Any except Free (Prometheus requires an attached disk to persist metrics data)
- **Disk Mount Path**: `/var/data`
    - Disk details are specified under **Advanced** during service creation.
