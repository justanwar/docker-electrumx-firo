FROM ubuntu:22.04

RUN apt-get update && apt-get install -y git python3-setuptools && \
    git clone https://github.com/firoorg/electrumx-firo && \
    cd electrumx-firo && \
    python3 setup.py install

COPY ./bin /usr/local/bin

VOLUME ["/data"]

ENV HOME=/data
ENV ALLOW_ROOT=1
ENV DB_DIRECTORY=/data
ENV SERVICES=rpc://0.0.0.0:8000,,ssl://0.0.0.0:50002
ENV SSL_CERTFILE=${DB_DIRECTORY}/electrumx.crt
ENV SSL_KEYFILE=${DB_DIRECTORY}/electrumx.key

ENV MAX_SEND=30000000
ENV COST_SOFT_LIMIT=100000
ENV COST_HARD_LIMIT=900000
ENV CACHE_MB=4096
ENV MAX_SESSIONS=1024
ENV REQUEST_TIMEOUT=240
WORKDIR /data

EXPOSE 50002

CMD ["init"]
