# OpenTelemetry Observability Stack with Docker Compose

This repository provides a ready-to-deploy Docker Compose setup for a comprehensive **local development** observability stack leveraging OpenTelemetry. It streamlines the process of collecting, storing, visualizing, and analyzing telemetry data from your applications within your development environment.

## Features

- OpenTelemetry Collector: Acts as the central hub for ingesting telemetry data from various sources in various formats (e.g., traces, metrics, logs) supported by OpenTelemetry.
- Grafana Dashboard: Offers a user-friendly interface for creating insightful dashboards to visualize your collected telemetry data.
- Grafana Loki: Serves as a horizontally scalable log storage solution, enabling efficient querying and analysis of your application logs.
- Grafana Tempo: Provides a dedicated backend for storing and retrieving trace data, allowing for in-depth trace analysis for performance optimization and troubleshooting.
- Prometheus: A popular metrics server that allows for efficient collection, storage, and retrieval of application metrics for detailed monitoring.
- OpenTelemetry Generator Integration: Includes a pre-configured OpenTelemetry generator repository that simplifies the creation of instrumentation code for your applications.
- Ubuntu and Go Development Container: Provides a pre-configured development environment with Docker and tools like Go ready to use, streamlining your development workflow.

## Getting Started

1. **Prerequisites:** Ensure Docker and **Docker Compose** are installed on your system. You can find installation instructions on their respective websites:
    - Docker: [Docker Desktop][docker-desktop-download-link]
    - Docker Compose: [Install Docker Compose][docker-compose-download-link]

1. Clone the Repository

   ```bash
   git clone <GIT_REPO>
   ```

1. Navigate to the observability folder

   ```bash
   cd observability
   ```

1. Spin up the Observability stack

    ```bash
    docker-compose up -d
    ```

[docker-compose-download-link]: https://docs.docker.com/compose/install/
[docker-desktop-download-link]: https://www.docker.com/products/docker-desktop/