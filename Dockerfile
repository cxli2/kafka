FROM bitnami/kafka

ENV KAFKA_HOME="/opt/bitnami/kafka"

ADD *.properties $KAFKA_HOME/config/

# Specify URL and secrets. When using AWS_S3_SECRET_ACCESS_KEY_FILE, the secret
# key will be read from that file itself, which helps passing further passwords
# using Docker secrets. You can either specify the path to an authorisation
# file, set environment variables with the key and the secret.
ENV AWS_S3_URL=https://s3.amazonaws.com
ENV AWS_S3_ACCESS_KEY_ID=
ENV AWS_S3_SECRET_ACCESS_KEY=
ENV AWS_S3_SECRET_ACCESS_KEY_FILE=
ENV AWS_S3_AUTHFILE=
ENV AWS_S3_BUCKET=

# User ID of share owner
ENV OWNER=0

# Location of directory where to mount the drive into the container.
ENV AWS_S3_MOUNT=/mnt/bucket

# s3fs tuning
ENV S3FS_DEBUG=0
ENV S3FS_ARGS=

USER root
RUN apt-get update && \
    apt install -y s3fs
USER 1001

# Test compile
RUN s3fs --version

COPY *.sh /usr/local/bin/

# Following should match the AWS_S3_MOUNT environment variable.
VOLUME [ "/mnt/bucket" ]

ADD setup.sh /

ENTRYPOINT [ "tini", "-g", "--", "docker-entrypoint.sh" ]
CMD ["bash", "setup.sh"]