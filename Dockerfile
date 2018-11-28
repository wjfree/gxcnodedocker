FROM ubuntu:16.04

#基础包安装
RUN apt update && apt install ntp curl wget -y
RUN apt install software-properties-common -y \
        && add-apt-repository ppa:ubuntu-toolchain-r/test \
        && apt update \
        && apt install libstdc++-7-dev -y
