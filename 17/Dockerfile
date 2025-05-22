FROM postgres:17-bookworm

LABEL maintainer="whimsical-c4lic0" \
      org.opencontainers.image.description="PostgreSQL 17 boomworm w/ PostGIS 3.5" \
      org.opencontainers.image.source="https://github.com/whimsical-c4lic0/docker-postgres"

ENV POSTGIS_MAJOR=3
ENV VECTORCHORD_VERSION=0.3.0

RUN apt-get update \
      && apt-cache showpkg postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
      && apt-get install -y --no-install-recommends \
           ca-certificates \
           wget \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts

RUN wget https://github.com/tensorchord/VectorChord/releases/download/$VECTORCHORD_VERSION/postgresql-$PG_MAJOR-vchord_$VECTORCHORD_VERSION-1_$(dpkg --print-architecture).deb
RUN apt install ./postgresql-$PG_MAJOR-vchord_$VECTORCHORD_VERSION-1_$(dpkg --print-architecture).deb

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-vectorchord.sh /docker-entrypoint-initdb.d/10_vectorchord.sh
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/10_postgis.sh
COPY ./update-postgis.sh /usr/local/bin

CMD ["postgres", "-c", "shared_preload_libraries=vchord.so"]

