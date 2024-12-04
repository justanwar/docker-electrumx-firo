Heavily based on https://github.com/lukechilds/docker-electrumx

Pulls [Firo's Electrumx](https://github.com/firoorg/electrumx-firo) and builds it into a Dockerfile to run.

Docker Compose file is available if you wish to run both firod and electrumx in Docker.

## Building
```shh
git clone https://github.com/justanwar/docker-electrumx-firo
cd docker-electrumx-firo
docker build -t electrumx-firo .
```
## Usage
Create a copy of `firo.conf` and modify as necessary.
```sh
cd cfg
cp firo.conf.example firo.conf
```
Then run either standalone Electrumx  or with Docker Compose:
```sh
docker run -d \
-v electrumx-data:/data \
-e DAEMON_URL=http://rpcuser:rpcpassword@localhost:8888 \
-e COIN=Firo \
-p 50002:50002 \
electrumx
```
```sh
docker-compose up -d
```
If running a non-containerized firod, add `--network host` (can be dangerous.)

To shut down
```sh
docker ps
docker stop <container_ID>
```
```sh
docker-compose down
```