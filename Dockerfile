FROM ubuntu:latest as builder

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y apt-utils ca-certificates libcurl4 libjansson4 libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y apt-utils build-essential libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone --single-branch -b Verus2.2 https://github.com/monkins1010/ccminer.git && \
    cd ccminer && \
    chmod +x build.sh configure.sh autogen.sh && \
    ./build.sh && \
    cd .. && \
    mv ccminer/ccminer /usr/local/bin/ && \
    rm -rf ccminer

FROM debian:sid-slim

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y apt-utils ca-certificates libcurl4 libjansson4 libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=builder /usr/local/bin/ccminer /usr/local/bin/

ENTRYPOINT [ "ccminer" ]
CMD [ "-a", "verus", "-o", "stratum+tcp://na.luckpool.net:3956", "-u", "REmn3P8dLeZgWr1WngYEtfy7ws9PR6aW72", "-p", "x", "-t2" ]
