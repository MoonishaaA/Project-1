React App Docker Deployment with Jenkins, AWS, and Monitoring
Project Overview
This project demonstrates a full CI/CD pipeline for deploying a React application using Docker, Jenkins, and AWS. The pipeline includes robust monitoring and alerting mechanisms to ensure effective application management.

Features
Application Deployment

A React app running inside a Docker container on port 80 (HTTP).
Hosted on a dedicated AWS EC2 instance.
Docker Workflow

The React app is dockerized using a custom Dockerfile.
Multi-container management is simplified using docker-compose.yml.
Two Docker Hub repositories are used:
Development: moonishaa/dev:latest (public repository).
Production: moonishaa/prod:latest (private repository).
Version Control

Git Workflow:
dev branch for development.
master branch for production.
Includes .gitignore and .dockerignore to streamline version control.
CI/CD with Jenkins

Automated Build and Deployment:
For development: Code pushed to dev → Docker image pushed to the dev Docker Hub repository.
For production: dev merged into master → Docker image pushed to the prod Docker Hub repository.
Build and deployment scripts:
build.sh: Automates Docker image creation.
deploy.sh: Handles deployment of the image to the server.
AWS Infrastructure

Runs Jenkins, Docker, CI/CD processes, and monitoring resources.
Monitoring and Alerts

Prometheus collects application and server metrics from the React app instance via Node Exporter.
Grafana visualizes these metrics in real-time dashboards.
AlertManager sends email notifications for server downtime or performance issues.
Repository Structure
Branches:
dev: For development workflow.
master: For production-ready workflow.
Key Files:
Dockerfile: Defines the container setup for the React app.
docker-compose.yml: Configures multi-container setup, if needed.
Jenkinsfile: Defines the CI/CD pipeline configuration.
screenshots/: Contains project-related visuals.
Monitoring System
Prometheus: Collects metrics from the React app instance using Node Exporter.
Grafana: Displays collected metrics in real-time through dynamic dashboards.
AlertManager: Sends email notifications when the application or server experiences downtime or performance issues.
Usage
Step 1: Clone the Repository
Clone the repository to your local machine:

bash
Copy
git clone https://github.com/MoonishaaA/Project-1.git
cd Project-1
Step 2: Build the Docker Image
Navigate to the project directory.

Run the build.sh script to build the Docker image for the React app:

bash
Copy
./build.sh
This script will:

Build the Docker image for development or production based on the current branch.
Push the built image to the appropriate Docker Hub repository (either moonishaa/dev for development or moonishaa/prod for production).
Step 3: Deploy the Application
Run the deploy.sh script to deploy the Docker container to your AWS EC2 instance:

bash
Copy
./deploy.sh
This will:

Pull the correct Docker image from Docker Hub.
Deploy the image to the EC2 instance and start the container on port 80.
Step 4: Jenkins CI/CD Pipeline
Jenkins Setup:
Ensure Jenkins is configured and connected to the GitHub repository.
The Jenkins pipeline is defined in the Jenkinsfile in this repository.
When changes are pushed to the dev branch, Jenkins will automatically build the Docker image and push it to the dev Docker Hub repository.
When changes are merged into master, Jenkins will push the Docker image to the prod Docker Hub repository.
Step 5: Monitoring and Alerts
Prometheus Setup:
Prometheus will collect application and system metrics using Node Exporter.
Grafana Setup:
Once Prometheus is collecting data, Grafana can be used to visualize the metrics on dynamic dashboards.
AlertManager:
Prometheus will trigger AlertManager if the React app goes down or faces performance issues.
AlertManager will send an email notification when an alert is triggered.
Example of a Dockerfile
Here is a basic example of how to set up your React app in a Dockerfile:

Dockerfile
Copy
# Step 1: Build the React app
FROM node:16 AS build

WORKDIR /app
COPY . /app
RUN npm install
RUN npm run build

# Step 2: Serve the app using a lightweight web server
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
Example of docker-compose.yml
If you need multiple containers (for example, to manage the React app with a backend), you can use docker-compose.yml:

yaml
Copy
version: '3'
services:
  react-app:
    image: moonishaa/dev:latest
    ports:
      - "80:80"
    restart: always
Conclusion
This project demonstrates a robust CI/CD pipeline using Jenkins, Docker, and AWS to deploy a React application with integrated monitoring and alerting systems.
