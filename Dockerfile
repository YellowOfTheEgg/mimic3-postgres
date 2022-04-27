FROM postgres:12
COPY ./table_schemas /docker-entrypoint-initdb.d/
RUN chmod a+r /docker-entrypoint-initdb.d/*
