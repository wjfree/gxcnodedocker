FROM ubuntu:16.04

#基础包安装
RUN apt update && apt install ntp curl wget -y
RUN apt install software-properties-common -y \
        && add-apt-repository ppa:ubuntu-toolchain-r/test \
        && apt update \
        && apt install libstdc++-7-dev -y
        
        
#添加公信宝执行路径
ENV PATH $PATH:/root/programs/witness_node

#公信宝的程序安装
RUN cd /root && curl 'https://raw.githubusercontent.com/gxchain/gxb-core/dev_master/script/gxchain_install.sh' | bash \
        && rm *.tar.gz 
        
VOLUME /root/trusted_node

ENV WID "1.0.0"
ENV WKEY "TEST"

WORKDIR /root

EXPOSE 28090
EXPOSE 9999

ENTRYPOINT witness_node --data-dir=trusted_node --rpc-endpoint="0.0.0.0:28090" --p2p-endpoint="0.0.0.0:9999" -w $WID --private-key $WKEY
