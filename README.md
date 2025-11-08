# Simple HTTP App

A lightweight containerized HTTP application built with **Flask**, ready to be deployed to **AWS ECS** using **CodeDeploy**.


## Overview

This application demonstrates a simple HTTP server using **Flask** that can respond to requests at the root path `/` and greet users via `/greet/<name>`.  

It is containerized using Docker and integrates with AWS ECS, ECR, and CodeDeploy for automated deployment.

## Deployment

Deployment uses AWS ECS with task definitions, ECR for Docker images, and CodeDeploy for orchestrating service updates.

### Steps included in CI/CD:

* Push Docker images to AWS ECR
* Register new ECS task definitions
* Trigger ECS service updates via CodeDeploy
* Canary deployment for main branch, rolling updates for other branches


## CI/CD Workflow

The GitHub Actions workflow (.github/workflows/build-and-deploy.yaml) automates:

1. Branch environment detection
2. main → prod (canary deployment)
3. dev/test → dev (rolling update)
4. AWS authentication via OIDC
5. Docker build & push to ECR
6. ECS task definition registration
7. CodeDeploy deployment (canary/rolling)
8. Deployment monitoring (optional polling until success/failure)


## API Endpoints

### Health Check

* GET /health → Returns OK status
```
curl http://localhost:8080/health
# OK
```

### Orders API

* GET /api/orders → Returns a list of all orders

```
curl http://localhost:8080/api/orders
# [
#   { "id": 1, "item": "Laptop", "quantity": 1 },
#   { "id": 2, "item": "Phone", "quantity": 2 },
#   { "id": 3, "item": "Keyboard", "quantity": 3 }
# ]
```

* GET /api/orders/:id → Returns details of a single order
```
curl http://localhost:8080/api/orders/1
# { "id": 1, "item": "Monitor", "quantity": 1 }

```