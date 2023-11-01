FROM alpine:3.15

# This hack is widely applied to avoid python printing issues in docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1

RUN apk add gcc make g++ binutils libc-dev fortify-headers

RUN apk add --no-cache python2 python2-dev && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools wheel && \
    rm -r /root/.cache

RUN mkdir -p /opt/python2-docker
WORKDIR /opt/python2-docker
CMD ["python", "-i"]
