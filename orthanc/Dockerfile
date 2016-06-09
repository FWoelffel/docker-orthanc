FROM debian:jessie

RUN apt-get update \
 && apt-get install -y build-essential unzip cmake mercurial \
    uuid-dev libcurl4-openssl-dev liblua5.1-0-dev \
    libgtest-dev libpng-dev libjpeg-dev \
    libsqlite3-dev libssl-dev zlib1g-dev libdcmtk2-dev \
    libboost-all-dev libwrap0-dev libjsoncpp-dev libpugixml-dev \
    libgdcm2-dev libjpeg-dev postgresql-server-dev-all

ADD ./config.json /default_orthanc.json

ADD ./build.sh /root/build.sh
ADD ./build-postgresql.sh /root/build-postgresql.sh
RUN bash /root/build.sh "default"
RUN bash /root/build-postgresql.sh "default"

ADD ./run.sh /run_orthanc.sh

VOLUME [ "/var/lib/orthanc/db" ]
EXPOSE 4242
EXPOSE 8042

ENTRYPOINT [ "/run_orthanc.sh" ]
