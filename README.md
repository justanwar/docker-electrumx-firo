Heavily based on https://github.com/lukechilds/docker-electrumx

## Building
```
git clone 
cd docker-electrumx-firo
docker build -t electrumx-firo .
```
## Usage
```
docker run -d \
-v /root/electrumx:/data \
-e DAEMON_URL=http://RPCUSER:RPCPASSWORD@localhost:18888 \
-e COIN=Firo \
-p 50002:50002 \
electrumx
```

If running a non-containerized firod, add `--network host` (dangerous.)