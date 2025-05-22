FROM postgres:17-bookworm

LABEL maintainer="whimsical-c4lic0" \
      org.opencontainers.image.description="PostgreSQL 17 boomworm w/ PostGIS 3.5" \
      org.opencontainers.image.source="https://github.com/whimsical-c4lic0/docker-postgres"

ENV POSTGIS_MAJOR=3
ENV PGVECTOR_VERSION=0.8.0
ENV VECTORCHORD_VERSION=0.3.0

RUN apt-get update \
      && apt-cache showpkg postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
      && apt-get install -y --no-install-recommends \
           ca-certificates \
           git \
           build-essential \
           wget \
           postgresql-server-dev-$PG_MAJOR \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts

RUN wget https://github.com/tensorchord/VectorChord/releases/download/$VECTORCHORD_VERSION/postgresql-$PG_MAJOR-vchord_$VECTORCHORD_VERSION-1_$(dpkg --print-architecture).deb
RUN apt-get install -y ./postgresql-$PG_MAJOR-vchord_$VECTORCHORD_VERSION-1_$(dpkg --print-architecture).deb

# Install pgvector
RUN cd /tmp \
      && git clone --branch v$PGVECTOR_VERSION https://github.com/pgvector/pgvector.git \
      && cd pgvector \
      && make clean \
      && make OPTFLAGS="" \
      && make install \
      && rm -rf /tmp/pgvector \
      && apt-get remove -y git wget build-essential postgresql-server-dev-$PG_MAJOR \
      && apt-get autoremove -y \
      && rm -rf /var/lib/apt/lists/*

COPY ./update-postgis.sh /usr/local/bin

CMD ["postgres", "-c", "shared_preload_libraries=vchord.so"]

