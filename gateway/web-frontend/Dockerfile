FROM ubuntu:20.04
COPY config/ /home/

RUN mkdir /home/cloud-frontend \
    && apt-get update \
    && apt-get install -y nginx \
    && apt-get install -y zip \
    && mv /home/sources.list /etc/apt/sources.list

WORKDIR /home
RUN unzip -d ./cloud-frontend dist.zip \
    && rm -f dist.zip \
    && mv -f ./nginx.conf /etc/nginx \
    && mv -f ./static.conf /etc/nginx/conf.d
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80