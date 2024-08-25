# Kaniko Docker Build and Push to Amazon ECR

This repo demonstrates how to build a Docker image using Kaniko and push it to Amazon Elastic Container Registry (ECR).

kaniko is a tool to build container images from a Dockerfile, inside a Kubernetes cluster without requiring `docker daemon`.

## Project Components

- **Dockerfile:** Defines the Docker image, based on Ubuntu, with Nginx installed to serve an HTML file.
- **kaniko.yaml:** A Kubernetes Pod definition file that uses Kaniko to build the Docker image and push it to Amazon ECR.
- **index.html:** A simple HTML file that will be served by the Nginx web server.
- **AWS Secret:** A Kubernetes secret that contains the AWS credentials needed for Kaniko to authenticate and push the image to ECR.

## Prerequisites

Before you start, ensure you have the following installed and configured:

- Kubernetes cluster
- kubectl command-line tool
- AWS CLI configured with your credentials
- Docker installed locally
- An Amazon ECR repository created

## Steps to Build and Push the Docker Image

1. **Create AWS Credentials Secret:**

   You need to create a Kubernetes secret containing your AWS credentials. This secret will be mounted inside the Kaniko container to authenticate against AWS.

   ```bash
   kubectl create secret generic aws-creds --from-file=<path to your aws credentials file>
   ```

   2 Apply `kaniko.yaml` maifest file:

   ```bash
   kubectl apply --filename kaniko.yaml
   ```
