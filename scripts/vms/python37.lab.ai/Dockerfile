FROM python:3.7

WORKDIR /root

COPY ./opt /root/run
WORKDIR /root/run

RUN ./init.sh
RUN rm init.sh

