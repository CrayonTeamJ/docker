# https://www.docker.elastic.co/
FROM docker.elastic.co/logstash/logstash:7.13.4

# 여기에 플러그인 추가
RUN logstash-plugin install logstash-input-mongodb
RUN logstash-plugin install logstash-filter-mutate
RUN logstash-plugin install logstash-filter-json
RUN logstash-plugin install logstash-output-elasticsearch
