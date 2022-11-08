FROM kong/kong-gateway:3.0.0.0-rhel

LABEL description="rhel + Kong 3.0 + custom plugins"

ENV CUSTOM_INTROSPECTION_PLUGIN_VERSION=0.1.1-0

USER root
RUN  uname -a
RUN yum -y update && yum -y install unzip luarocks curl sudo git


# INTALL DEPENDENCIES
RUN luarocks install xml2lua 1.4-3
RUN yum -y install gcc lua-devel expat-devel zip
RUN luarocks install luaexpat 1.4.1-1


RUN git clone https://github.com/Icurity/shyft-http-log.git \
 && cd shyft-http-log \
 && luarocks make
RUN luarocks pack kong-plugin-shyft-http-log 1.0-3 \
&& luarocks install kong-plugin-shyft-http-log-1.0-3.all.rock
 
USER kong