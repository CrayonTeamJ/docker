# https://www.docker.elastic.co/
FROM docker.elastic.co/logstash/logstash:7.13.4

#Replicaset
RUN mongod --port 27017 --dbpath /monstache/node1/ --replSet rs0 --smallfiles --oplogSize 128
RUN mongod --port 27018 --dbpath /monstache/node1/ --replSet rs1 --smallfiles --oplogSize 128
RUN mongod --port 27019 --dbpath /monstache/node1/ --replSet rs2 --smallfiles --oplogSize 128

