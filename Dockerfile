FROM bitnami/kafka

ENV KAFKA_HOME="/opt/bitnami/kafka"

ADD *.properties $KAFKA_HOME/config/

ADD setup.sh /

CMD ["bash", "setup.sh"]