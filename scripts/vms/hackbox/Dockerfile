# archlinux :: hackbox
FROM archlinux:latest
WORKDIR /root
COPY hello.sh .
RUN ./hello.sh
COPY init_hackbox.sh .
COPY packages.txt .
RUN echo "Y" | ./init_hackbox.sh
RUN rm init_hackbox.sh
RUN rm hello.sh
