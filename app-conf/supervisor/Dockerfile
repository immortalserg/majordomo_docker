#FROM debian:buster-slim
FROM debian:latest
RUN apt-get update
RUN apt-get install git iputils-ping -y
RUN apt-get install php php-cgi php-cli php-pear php-mysql php-mbstring php-xml curl libcurl4 libcurl4-openssl-dev php-curl php-gd -y
RUN apt-get install ffmpeg smartmontools net-tools -y
RUN apt-get install php-json

#supervised
RUN        apt-get -y install supervisor && \
           mkdir -p /var/log/supervisor && \
           mkdir -p /etc/supervisor/conf.d
RUN        mkdir /var/log/supervisord
COPY supervisor.conf /etc/supervisor.conf

COPY php.ini /usr/local/etc/php/
WORKDIR /var/www
CMD /usr/bin/supervisord -n -c /etc/supervisor.conf
 
RUN apt install -y locales && sed -i '/ru_RU.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG=ru_RU.UTF-8
ENV LANGUAGE=ru_RU:UTF-8
ENV LC_ALL=ru_RU.UTF-8