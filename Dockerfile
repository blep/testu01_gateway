FROM ubuntu:18.04

ENV TZ=Europe/Paris
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -q install -y git git-gui cmake g++ python3
COPY . /app/src
WORKDIR /app/build
RUN cmake -G "Unix Makefiles" ../src && make
RUN ./bin/testu01_gateway --help

FROM ubuntu:18.04
WORKDIR /root
COPY --from=0 /app/build/bin/testu01_gateway testu01_gateway
RUN ./testu01_gateway --help
ENTRYPOINT ["/root/testu01_gateway"]
