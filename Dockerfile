FROM postgres:16.0

ENV POSTGRES_PASSWORD='password'
ENV POSTGRES_USER='postgres_user'
ENV POSTGRES_DB='test_db'

# 設定ファイル
COPY ./conf/postgresql.conf /etc/postgresql/postgresql.conf

# VOLUME [ "/var/lib/postgresql/data" ]

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]