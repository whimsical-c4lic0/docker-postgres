# docker-postgres
Docker image for Postgres with additional plugins

| Tag | PostgreSQL | PostGIS | pgvector | VectorChord |
| --- | --- | --- | --- | --- |
| `postgres:19`, `postgres:latest` | 19 | 3.7 | 0.8.7 | 1.5.0 |
| `postgres:17` | 17 | 3.x | 0.8.0 | 0.3.0 |

Every image bundles PostGIS, pgvector and VectorChord, with VectorChord preloaded through `shared_preload_libraries=vchord.so`.
