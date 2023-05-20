

docker network create elastic
docker pull docker.elastic.co/elasticsearch/elasticsearch:8.7.1
docker run --name es-node01 --net elastic -p 9200:9200 -p 9300:9300 -t docker.elastic.co/elasticsearch/elasticsearch:8.7.1
