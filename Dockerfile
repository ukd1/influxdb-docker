FROM ubuntu
MAINTAINER Russell Smith <russ@rainforestqa.com>
# Forked from https://github.com/crosbymichael/influxdb-docker

ADD https://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb /influxdb_latest_amd64.deb
RUN mkdir -p /opt/influxdb/shared/data && \
    dpkg -i /influxdb_latest_amd64.deb && \
    rm -rf /opt/influxdb/shared/data && \
    chown -R daemon:daemon /opt/influxdb

VOLUME ["/opt/influxdb/shared/data"]

USER daemon
EXPOSE 8083 8086

ENTRYPOINT ["/usr/bin/influxdb"]
CMD ["-config=/opt/influxdb/shared/config.toml"]
