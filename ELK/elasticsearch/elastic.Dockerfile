# https://www.docker.elastic.co/
FROM docker.elastic.co/elasticsearch/elasticsearch:7.13.4

# 여기에 ELASTIC SEARCH의 추가 PLUGIN 을 추가 해 주면 된다
# Example: RUN elasticsearch-plugin install analysis-icu
