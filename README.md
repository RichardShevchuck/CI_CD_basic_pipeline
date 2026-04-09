# Solo Project – FastAPI + Docker + CI/CD

This is a simple backend project built with FastAPI and deployed using Docker and GitLab CI/CD.

The goal of this project is to demonstrate a basic DevOps workflow, including application development, containerization, automated testing, and deployment to a VPS server.

---

## Stack

- FastAPI (Python backend)
- Docker (containerization)
- GitLab CI/CD (automation)
- systemd (service management on VPS)
- SSH (remote deployment)

---

## Application

The application is a minimal FastAPI service with two endpoints:

- Root endpoint returns a simple JSON response
- Health endpoint is used for service checks

---

## Local Development

The project can be run locally using a Python virtual environment. Dependencies are installed from the requirements file, and the application is started using Uvicorn.

---

## Testing

Tests are implemented using pytest and FastAPI TestClient.

They run without starting a real server, which makes them fast and reliable for CI environments.

---

## Docker

The application is containerized using Docker.

The Docker image is built from the project files and runs the FastAPI app inside a container.

---

## CI/CD Pipeline

The GitLab pipeline consists of three stages:

1. Test – installs dependencies and runs tests  
2. Build – builds the Docker image and pushes it to the registry  
3. Deploy – connects to the VPS via SSH and updates the running container  

Each build produces two tags:
- A unique tag based on commit SHA  
- A latest tag for the most recent version  

---

## Deployment

Deployment is automated via GitLab CI.

The pipeline connects to the server using SSH, pulls the latest Docker image, stops the old container, and starts a new one.

---

## Configuration

The deployment requires several CI/CD variables:

- SSH private key for authentication  
- Server host and port  
- SSH user  

---

## Project Structure

The project is organized into application code, tests, and configuration files for Docker and CI/CD.

---

## Notes

- The pipeline runs only for the main branch  
- The deployment process is fully automated  
- The setup follows basic DevOps best practices  

---

## Author

Richard Shevchuk