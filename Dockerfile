FROM mysql:8.0

COPY Bd/01_ddl.sql /docker-entrypoint-initdb.d/01_ddl.sql
COPY Bd/02_dml.sql /docker-entrypoint-initdb.d/02_dml.sql

RUN echo "[mysqld]\ncharacter-set-server=utf8mb4\ncollation-server=utf8mb4_unicode_ci" \
    > /etc/mysql/conf.d/charset.cnf