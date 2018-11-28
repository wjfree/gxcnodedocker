FROM ubuntu:16.04

#基础包安装
RUN apt update && apt install ntp curl wget -y
RUN apt install software-properties-common -y \
        && add-apt-repository ppa:ubuntu-toolchain-r/test \
        && apt update \
        && apt install libstdc++-7-dev -y
        
#添加公信宝执行路径
ENV PATH $PATH:/root/programs/witness_node

#公信宝的测试程序安装
RUN cd /root && curl 'https://raw.githubusercontent.com/gxchain/gxb-core/dev_master/script/gxchain_testnet_install.sh' | bash \
        && wget http://gxb-package.oss-cn-hangzhou.aliyuncs.com/gxb-core/genesis/testnet-genesis.json -O genesis.json \
        && rm *.tar.gz \
        && mkdir testnet_node

VOLUME /root/testnet_node

WORKDIR /root

EXPOSE 28090
EXPOSE 9999
ENTRYPOINT witness_node --data-dir=testnet_node --rpc-endpoint="0.0.0.0:28090" --p2p-endpoint="0.0.0.0:9999" --seed-nodes='["testnet.gxchain.org:6789"]' --genesis-json genesis.json
