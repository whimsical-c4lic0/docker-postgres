FROM postgres:19-bookworm

LABEL maintainer="whimsical-c4lic0" \
      org.opencontainers.image.description="PostgreSQL 19 bookworm w/ PostGIS 3.7 & VectorChord 1.5.0" \
      org.opencontainers.image.source="https://github.com/whimsical-c4lic0/docker-postgres"

ENV POSTGIS_MAJOR=3
# Pin pgvector to the upstream release; the wildcard accepts PGDG rebuild revisions.
ENV PGVECTOR_VERSION=0.8.7
ENV VECTORCHORD_VERSION=1.5.0

RUN set -eux; \
      apt-get update; \
      apt-get install -y --no-install-recommends \
           ca-certificates \
           wget \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts \
           "postgresql-${PG_MAJOR}-pgvector=${PGVECTOR_VERSION}-*"; \
      wget -q -O /tmp/vchord.deb \
           "https://github.com/pgsty/vchord/releases/download/$VECTORCHORD_VERSION/postgresql-$PG_MAJOR-vchord_$VECTORCHORD_VERSION-1_$(dpkg --print-architecture).deb"; \
      apt-get install -y --no-install-recommends /tmp/vchord.deb; \
      rm -rf /tmp/vchord.deb /var/lib/apt/lists/*

COPY ./update-postgis.sh /usr/local/bin

CMD ["postgres", "-c", "shared_preload_libraries=vchord.so"]
