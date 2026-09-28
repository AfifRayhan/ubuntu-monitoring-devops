# Ubuntu Monitoring, Logging and CI Pipeline

## Student Information

**Student Name:** Afif Rayhan  
**Batch:** DevOps Batch 14  
**Assignment Title:** DevOps Monitoring, Logging and CI Pipeline

---

## 1. Project Overview

This project was completed on an Ubuntu VM provisioned in MirCloud as part of my DevOps assignment. The main goal was to set up server monitoring, logging, and a basic CI pipeline.

For monitoring, I manually installed **Prometheus, Node Exporter, and Grafana**. Node Exporter collects system information such as CPU, memory, disk, and network usage. Prometheus collects these metrics, and Grafana is used to visualize them through a dashboard.

For logging, I installed **Loki** and **Grafana Alloy**. Alloy collects system logs and sends them to Loki, which can then be accessed from Grafana.

For CI, I configured a **GitHub Actions self-hosted runner** on the Ubuntu server. The workflow performs the required build and test steps and generates a build artifact that is uploaded to GitHub Actions.

No deployment or CD process was implemented because it was not required for this assignment.

---

## 2. Technologies Used

- Ubuntu Server
- Prometheus
- Node Exporter
- Grafana
- Loki
- Grafana Alloy
- GitHub Actions
- GitHub Self-hosted Runner
- Python
- Git

Prometheus, Node Exporter, Grafana, and Loki were installed manually on the Ubuntu server without using Docker or Docker Compose.

---

## 3. Monitoring Setup

### Node Exporter

Node Exporter was manually installed on the Ubuntu server and configured as a systemd service.

It collects system-level metrics including:

- CPU usage
- Memory usage
- Disk usage
- Network statistics

The Node Exporter metrics can be accessed from:

`http://SERVER_IP:9100/metrics`

The service configuration is included in:

`node_exporter.service`

---

### Prometheus

Prometheus was manually installed and configured as a systemd service.

Prometheus collects metrics from Node Exporter using the Node Exporter endpoint.

The main configuration file is:

`prometheus.yml`

The Prometheus service configuration is:

`prometheus.service`

Prometheus was configured to scrape the Node Exporter target:

`localhost:9100`

Prometheus can be accessed from:

`http://SERVER_IP:9090`

The Node Exporter target was verified from the Prometheus Targets page and showed as **UP**.

---

## 4. Grafana Dashboard

Grafana was manually installed on the Ubuntu server.

A Prometheus datasource was added to Grafana using the Prometheus server.

The dashboard contains information about:

- CPU usage
- Memory usage
- Disk usage
- Network activity

The exported Grafana dashboard configuration is included in:

`dashboard.json`

Grafana can be accessed from:

`http://SERVER_IP:3000`

---

## 5. Loki and Logging

Loki was manually installed and configured to store system logs.

The Loki configuration is included in:

`loki.yaml`

The Loki systemd service configuration is:

`loki.service`

Grafana Alloy was also configured to collect system logs and send them to Loki.

The Alloy configuration is included in:

`config.alloy`

After configuring Loki and Alloy, a Loki datasource was added to Grafana.

The logs were then viewed from **Grafana → Explore** using the Loki datasource.

---

## 6. GitHub Actions CI

For the CI part of the assignment, I configured a **self-hosted GitHub Actions runner** on the Ubuntu server.

The runner is connected to this repository and uses the following labels:

- `self-hosted`
- `linux`
- `x64`

The GitHub Actions workflow is stored in:

`.github/workflows/ci.yml`

The workflow runs automatically when changes are pushed to the `main` branch. It can also be started manually from GitHub Actions.

---

## 7. CI Pipeline

The CI pipeline performs the following steps:

1. Checkout the source code
2. Display runner information
3. Build the project
4. Run tests
5. Verify the generated build output
6. Upload the build output as a GitHub Actions artifact

The CI demonstration files are located in:

`ci.yml`  
`ci-demo/`

The Python application contains simple functions that are tested using Python's built-in `unittest` framework.

The build script is:

`ci-demo/build.sh`

The test file is:

`ci-demo/tests/test_app.py`

The build process generates:

`monitoring-ci-build.tar.gz`

This file is then uploaded to GitHub Actions as an artifact using:

`actions/upload-artifact@v4`

There is no deployment step in the workflow because CD was not required for this assignment.

---

## 8. Repository Structure

All configuration files and screenshots are kept directly in the repository rather than being separated into multiple folders.

The main files in the repository are:

- `.github/workflows/ci.yml` - GitHub Actions CI workflow
- `ci-demo/` - small application used for the CI build and testing
- `prometheus.yml` - Prometheus configuration
- `prometheus.service` - Prometheus systemd service
- `node_exporter.service` - Node Exporter systemd service
- `loki.yaml` - Loki configuration
- `loki.service` - Loki systemd service
- `config.alloy` - Grafana Alloy configuration
- `dashboard.json` - exported Grafana dashboard
- `README.md` - project documentation

The screenshots are also stored directly in the repository.

---

## 9. Installation and Configuration

### Prometheus

Prometheus was manually installed on the Ubuntu server.

After configuring the Prometheus service, it was started using systemd.

Example:

```bash
sudo systemctl enable prometheus
sudo systemctl start prometheus
sudo systemctl status prometheus
