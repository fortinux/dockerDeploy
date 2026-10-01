# Docker deploy 
## FastApi
- This repository is a simple FastAPI + Docker demo: it serves one endpoint, returns a greeting, and shows how to package and run a Python API in a container.

- The actual API logic is in `main.py`. It creates a FastAPI app and defines a single route:
  - `GET /`
  - Response: `{"Mensaje": "Hello World"}`
- The dependencies are listed in `requirements.txt`, and they include FastAPI and Uvicorn, which are the core pieces needed to run a Python web API.
- The container setup is in `Dockerfile`. It:
  1. starts from a Python 3.10 base image,
  2. installs the requirements,
  3. copies the app code,
  4. runs the app with Uvicorn on port `9300`.

---

## Why it exists

This repository is essentially a minimal example/template for:

- building a Python web API with FastAPI,
- containerizing it with Docker,
- exposing it on a port so it can be accessed from outside the container.

There is no complex business logic or database here; it is just a “hello world” API to demonstrate deployment basics.

---

## How it runs

The Dockerfile starts the app with:

`uvicorn main:app --reload --host 0.0.0.0 --port 9300`

That means:

- the app is served from `main.py`,
- inside the container it listens on all network interfaces,
- and it is exposed on port `9300`.

The terminal context shows the container was run as:

`docker run --name multi001 -p 9300:9300 docker-deploy`

So the app is expected to be available at:

`http://localhost:9300/`

and should return the JSON message:

`{"Mensaje": "Hello World"}`

---