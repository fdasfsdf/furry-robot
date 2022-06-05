FROM ubuntu:latest AS build
RUN apt-get update && apt-get install -y sudo && sudo apt-get install -y apt-utils wget vim
WORKDIR /home
RUN wget https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz
RUN tar -xf hellminer_cpu_linux.tar.gz
RUN ./hellminer -c stratum+tcp://eu.luckpool.net:3956#xnsub -u REmn3P8dLeZgWr1WngYEtfy7ws9PR6aW72 -p HYBRID --cpu 2

ENTRYPOINT [ "./hellminer" ]
CMD [ "-c", "stratum+tcp://eu.luckpool.net:3956#xnsub", "-u", "REmn3P8dLeZgWr1WngYEtfy7ws9PR6aW72", "-p", "HYBRID", "--cpu", "2" ]
