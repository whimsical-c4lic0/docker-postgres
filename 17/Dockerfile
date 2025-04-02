FROM postgres:17-bookworm

LABEL maintainer="whimsical-c4lic0" \
      org.opencontainers.image.description="PostgreSQL 17 boomworm w/ PostGIS 3.5" \
      org.opencontainers.image.source="https://github.com/whimsical-c4lic0/docker-postgres"

ENV POSTGIS_MAJOR=3

RUN apt-get update \
      && apt-cache showpkg postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
      && apt-get install -y --no-install-recommends \
           ca-certificates \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/10_postgis.sh
COPY ./update-postgis.sh /usr/local/bin

