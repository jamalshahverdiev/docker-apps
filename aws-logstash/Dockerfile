FROM docker.elastic.co/logstash/logstash:7.10.0
#RUN rm -f /usr/share/logstash/pipeline/logstash.conf
RUN ./bin/logstash-plugin install logstash-output-amazon_es
ADD ["pipeline/logstash.conf", "pipeline/aws_logstash.conf", "/usr/share/logstash/pipeline/"]
ADD config/logstash.yml /usr/share/logstash/config/logstash.yml
