FROM ubuntu
MAINTAINER leifj@sunet.se
RUN apt-get -y update
RUN apt-get install -y wget ssl-cert libssl-dev libz-dev build-essential
WORKDIR /usr/src
RUN wget http://www.apsis.ch/pound/Pound-2.7.tgz
RUN tar xzvf Pound-2.7.tgz
RUN cd Pound-2.7 && ./configure --with-owner=www-data --with-group=www-data --prefix=/usr --sysconfdir=/etc/pound && make && make install
ADD start.sh /start.sh
RUN chmod a+rx /start.sh
VOLUME /etc/ssl
ENV HTTP_PORT 80
ENV REWRITE_LOCATION 1
ENTRYPOINT ["/start.sh"]
EXPOSE 443
