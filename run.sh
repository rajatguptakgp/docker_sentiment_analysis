# build
docker build -f Dockerfile2 -t sentiment_centos .
docker build -f Dockerfile3 -t sentiment_tf .

# create docker network
docker network create sentiment-network

# run
docker run -ti \
--name docker_centos \
-p 7000:3000 \
--net sentiment-network \
sentiment_centos