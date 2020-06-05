FROM bitnami/kafka

ENV KAFKA_HOME="/opt/bitnami/kafka"

ADD mirror-consumer.properties $KAFKA_HOME/config/
ADD mirror-producer.properties $KAFKA_HOME/config/

ADD setup.sh /

CMD ["bash", "setup.sh"]