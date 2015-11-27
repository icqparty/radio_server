FROM ubuntu

RUN apt-get update && apt-get install -y git curl libxml2-dev libxslt1-dev libogg-dev openssl libvorbis-dev supervisor liquidsoap make gcc gpp g++ libshout3-dev

COPY /source /source


#RUN cd /source/ezstream && ./configure && make && make install
RUN cd /source/icecast-server && ./configure && make && make install
RUN cd /source/ices && ./configure && make && make install

WORKDIR ./content

EXPOSE 8000 8888
COPY conf/supervisord.conf conf/supervisord.conf
ENTRYPOINT ["/usr/bin/supervisord","-c","/conf/supervisord.conf"]


