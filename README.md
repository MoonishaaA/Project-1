# React App Docker Deployment

## Project Overview  
This project demonstrates a complete **CI/CD pipeline** for deploying a **React application** using **Docker**, **Jenkins**, and **AWS**. It integrates automated deployment, real-time monitoring, and alerting for effective application management.

---

## Key Features  
- **Fully Automated CI/CD Pipeline**: Streamlined build, test, and deployment processes with Jenkins.
- **Scalable Containerization**: Dockerized React app using a custom `Dockerfile` and `docker-compose.yml` for easy deployment and scaling.
- **Multi-Environment Deployment**: Separate Docker Hub repositories for development (`dev`) and production (`prod`) environments.
- **Real-Time Monitoring**: **Prometheus** collects performance metrics, and **Grafana** visualizes them with dynamic dashboards.
- **Automated Alerts**: **AlertManager** sends email notifications for server downtime or performance issues.
  
---

### Technologies Used  
- **Docker** and **Docker Compose** for containerization  
- **GitHub** for version control  
- **Jenkins** for CI/CD automation  
- **AWS EC2** for hosting and deployment  
- **Prometheus** and **Grafana** for monitoring and alerting

---

## Prerequisites  
Ensure the following are installed or configured:  
1. **Docker** and **Docker Compose** (Install [Docker](https://docs.docker.com/get-docker/))  
2. **Node.js** and **npm** (Install [Node.js](https://nodejs.org/))  
3. An **AWS EC2 instance** with a public IP  
4. A **Docker Hub account** for storing images  
5. **Jenkins** installed and configured ([Jenkins Setup Guide](https://www.jenkins.io/doc/))  
6. **Prometheus** and **Grafana** installed and configured for application health checks  

---

## Setup and Installation

### 1. Clone the Repository
Clone this repository to your local machine:  
   ```bash  
   git clone https://github.com/MoonishaaA/Project-1.git
   cd react-app-docker-deployment
   ```
2. Install dependencies
   ```bash
   npm install
3. Start the application locally
   ```bash
   npm start
4. Access the application at `http://localhost:80`     
   
## Docker Workflow   
- Two Docker Hub repositories:  
  - **Development**: `moonishaa/dev:latest`  
  - **Production**: `moonishaa/prod:latest`  

---

## CI/CD with Jenkins

### 1. Automated Build and Deployment  
- **Development**: Code pushed to `dev` → Image pushed to `dev` Docker Hub repository.  
- **Production**: `dev` merged into `master` → Image pushed to `prod` Docker Hub repository.  
### 2. Build and Deployment Scripts  
- **`build.sh`**: Automates Docker image creation.  
- **`deploy.sh`**: Pushes the Docker image to the Docker Hub repository.

---

## Monitoring and Alerts

- **Prometheus**: Collects metrics from the React App instance via **Node Exporter**.  
- **Grafana**: Displays the metrics on real-time, dynamic dashboards.  
- **AlertManager**: Sends email notifications when the application or server experiences issues or downtime.  

---

## Repository Structure

- **Branches**:
  - `dev`: Development workflow.  
  - `master`: Production-ready workflow.  

---

## Conclusion  
This project demonstrates a robust **CI/CD pipeline** for deploying a **React application** 
