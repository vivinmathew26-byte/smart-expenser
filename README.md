# Smart Expense Analyzer

A Python-based personal expense tracking web application deployed on AWS using 
a complete DevOps pipeline with Docker, Jenkins CI/CD, Terraform, 
Prometheus, and Grafana.

**Live URL:** http://3.107.188.96

---

## Project Architecture

# Project Architecture
GitHub (source code)

|

| push triggers webhook

v

Jenkins CI/CD Pipeline

|

| builds Docker image

v

Docker Container

|

| running on AWS EC2

v

App live on port 80

|

Prometheus + Grafana (monitoring)

---

## Infrastructure (Terraform)

Resources provisioned automatically:
- AWS EC2 instance (t3.small, 20GB storage)
- Security Group (ports 22, 80, 8080, 9090, 3000)
- Ubuntu 22.04 LTS AMI

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

---

## How to Run Locally

```bash
# Clone the repo
git clone https://github.com/vivinmathew26-byte/smart-expenser.git
cd smart-expenser

# Run with Docker
docker build -t smart-tracker .
docker run -p 8000:8000 smart-tracker

# Open browser
http://localhost:8000
```

---

## Monitoring

- Prometheus: http://3.107.188.96:9090
- Grafana: http://3.107.188.96:3000
- Metrics: CPU usage, memory, HTTP request rate

---

## Author

**Vivin Mathew R**  
Junior DevOps Engineer  
vivinmathew26@gmail.com  
linkedin.com/in/vivimathew26
