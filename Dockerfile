FROM dougbtv/asterisk13

RUN yum install -y vim net-tools iputils-ping
ADD ./conf/sip.conf /etc/asterisk/sip.conf
ADD ./conf/extensions.conf /etc/asterisk/extensions.conf
WORKDIR /
EXPOSE 5060/udp

RUN ["asterisk"]
