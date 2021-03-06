#FROM ubuntu:16.04
#
#RUN apt-get update && \
#apt-get clean  
#
#RUN apt-get install -y openssh-server python python-pip python-m2crypto libnet1-dev libpcap0.8-dev git gcc && \
#apt-get clean
#
#RUN echo "root:password"|chpasswd
#RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
#	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
#
#RUN git clone -b manyuser https://github.com/malaohu/suansuanru.git suansuanru
#RUN git clone https://github.com/snooda/net-speeder.git net-speeder
#WORKDIR net-speeder
#RUN sh build.sh
#
#RUN mv net_speeder /usr/local/bin/
#COPY entrypoint.sh /usr/local/bin/
#RUN chmod +x /usr/local/bin/entrypoint.sh
#RUN chmod +x /usr/local/bin/net_speeder
#
## Configure container to run as an executable
#ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

FROM malaohu/ssr-with-net-speeder

RUN wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz && \
tar zxf LATEST.tar.gz && \
cd libsodium* && \
./configure && \
make && \
make install && \
LD_LIBRARY_PATH=/usr/local/lib && \
ldconfig && \
cd .. && \
rm -rf libsodium* && \
rm -rf LATEST.tar.gz

RUN apt-get update && \
apt-get clean  

RUN apt-get install -y bash && \
apt-get clean


#COPY ./bbr.sh /root/bbr.sh

#RUN chmod +x /root/bbr.sh && \
#sh /root/bbr.sh


