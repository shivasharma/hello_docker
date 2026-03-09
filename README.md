# Hello Docker

A minimal Docker project that serves a static HTML page using `nginx:alpine`.

## Project Structure

```text
hello_docker/
|-- Dockerfile
|-- README.md
`-- app/
	`-- index.html
```

## What This Project Does

- Builds a small Docker image based on `nginx:alpine`
- Copies files from `app/` into Nginx's default web root
- Exposes port `80` in the container
- Serves `app/index.html` at the root URL

## Prerequisites

- Docker Desktop (or Docker Engine) installed
- Docker daemon running

## Build The Image

Run this from the project root (`hello_docker`):

```bash
docker build -t hello-docker .
```

## Run The Container

```bash
docker run -d --name hello-docker-container -p 8080:80 hello-docker
```

Open in browser:

```text
http://localhost:8080
```

You should see:

`Hello from Docker!`

## Stop And Remove Container

```bash
docker stop hello-docker-container
docker rm hello-docker-container
```

## Rebuild After Changes

If you update files in `app/`, rebuild and rerun:

```bash
docker build -t hello-docker .
docker rm -f hello-docker-container
docker run -d --name hello-docker-container -p 8080:80 hello-docker
```

## Run As Multiple Pods (Kubernetes)

If you have Kubernetes enabled (for example in Docker Desktop), you can run multiple pods with a Deployment.

1. Create a deployment with 3 replicas:

```bash
kubectl create deployment hello-docker --image=hello-docker --replicas=3
```

2. Verify pods are running:

```bash
kubectl get pods -l app=hello-docker
```

3. Expose the deployment:

```bash
kubectl expose deployment hello-docker --type=NodePort --port=80 --target-port=80
```

4. Access it with port-forward (simple local testing):

```bash
kubectl port-forward deployment/hello-docker 8080:80
```

Then open:

```text
http://localhost:8080
```

Scale to more or fewer pods anytime:

```bash
kubectl scale deployment hello-docker --replicas=5
```
