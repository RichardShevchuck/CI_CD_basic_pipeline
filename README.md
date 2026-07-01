# GitLab CI/CD Pipeline — FastAPI

A minimal FastAPI Python application with a fully automated 3-stage GitLab CI/CD pipeline: test → build → deploy to a VPS via SSH.

## Pipeline

```
git push → GitLab CI
              │
        ┌─────▼──────┐
        │    test     │  pytest, python:3.12
        └─────┬───────┘
              │
        ┌─────▼──────┐
        │    build    │  Docker build + push to GitLab Registry
        └─────┬───────┘    (tags: commit SHA + latest)
              │
        ┌─────▼──────┐
        │   deploy    │  SSH → pull latest image → restart container
        └─────────────┘
```

Runs only on the `main` branch.

## Tech Stack

- **App:** Python 3.12, FastAPI, Uvicorn
- **Tests:** pytest, FastAPI TestClient
- **Container:** Docker, GitLab Container Registry
- **CI/CD:** GitLab CI (`.gitlab-ci.yml`)
- **Deploy target:** Linux VPS (any — systemd not required, just Docker)

## Project Structure

```
.gitlab-ci.yml     # Pipeline definition
Dockerfile         # Multi-stage build (python:3.12-slim)
app/               # FastAPI application
tests/             # pytest test suite
requirements.txt
```

## CI Variables Required

Set these in **GitLab → Settings → CI/CD → Variables**:

| Variable | Description |
|----------|-------------|
| `SSH_PRIVATE_KEY` | Private key for SSH access to the VPS |
| `SSH_HOST` | VPS IP address or hostname |
| `SSH_USER` | SSH username |

## Local Development

```bash
pip install -r requirements.txt
uvicorn app.main:app --reload

# Run tests
pytest
```

## Key Concepts

- **Docker-in-Docker (dind)** for building images inside GitLab CI
- **Two image tags per build** — commit SHA (immutable, traceable) + `latest` (always points to newest)
- **SSH deploy pattern** — pull latest image, stop old container, start new one on port 80
