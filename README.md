Heavily based on https://github.com/lukechilds/docker-electrumx

Pulls [Firo's Electrumx](https://github.com/firoorg/electrumx-firo) and builds it into a Dockerfile to run.

Docker Compose file is available if you wish to run both firod and electrumx in Docker.

## Building
```
git clone https://github.com/justanwar/docker-electrumx-firo
cd docker-electrumx-firo
docker build -t electrumx-firo .
```
## Usage
Standalone Electrumx:
```
docker run -d \
-v electrumx-data:/data \
-e DAEMON_URL=http://RPCUSER:RPCPASSWORD@localhost:18888 \
-e COIN=Firo \
-p 50002:50002 \
electrumx
```
Docker Compose:
```
docker-compose up -d
```
If running a non-containerized firod, add `--network host` (can be dangerous.)