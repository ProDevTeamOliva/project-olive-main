# ChatterMatter

## Requirements
- [Docker](https://docs.docker.com)
  - Docker Engine (tested on 20.10.16)
  - Docker Compose (tested on 2.5.0)
- [OpenSSL](https://www.openssl.org)
- (Windows) [Windows Subsystem for Linux](https://docs.microsoft.com/windows/wsl)


## Quick Start
**All commands must be run from the project's root directory**

First, copy `.env.sample`, rename it to `.env` and fill the required environmental variables. An example looks like this:
```
COMPOSE_PROJECT_NAME=chattermatter
COMPOSE_PROFILES=prod

NGINX_PORT_HTTPS=
NGINX_PORT_HTTP=

VITE_PORT=

VITE_EXPRESS_PORT=
EXPRESS_SESSION_SECRET=123abc

MONGO_ROOT_USERNAME=mongo
MONGO_ROOT_PASSWORD=123abc
MONGO_USERNAME=app
MONGO_PASSWORD=123abc
MONGO_HOST=
MONGO_PORT=
MONGO_DATABASE=sessions

NEO4J_USERNAME=neo4j
NEO4J_PASSWORD=123abc
NEO4J_HOST=
NEO4J_PORT_HTTP=
NEO4J_PORT_BOLT=
NEO4J_IMAGE=

```
`NGINX_PORT_HTTPS` and `NGINX_PORT_HTTP` could be specified to change app ports from the usual `443`/`80`. Also, it's best to change passwords and session secret :)

---
Next, generate a self-signed certificate providing server address (e.g., localhost).
### Linux
```
./scripts/generate_certificate.sh <address>
```
### Windows
```
wsl ./scripts/generate_certificate.sh <address>
```

---
Finally, start the app.
### Linux
```
./scripts/run.sh
```
### Windows
```
.\scripts\run.bat
```
Getting everything ready may take some time. Even when containers are marked as running, Neo4j may not be fully working yet. Before using the app, it's best to check backend logs if it connected properly (look for "Connected to Neo4J").
```
docker compose logs -f backend
```

Now, you're all set!


## Managing

You can close the app for later use.
### Linux
```
./scripts/stop.sh
```
### Windows
```
.\scripts\stop.bat
```

---
You can also delete whole app, including its Docker containers, images, volumes storing databases' data, saved pictures and logs. Certificate won't be removed.
### Linux
```
./scripts/delete.sh
```
### Windows
```
.\scripts\delete.bat
```
