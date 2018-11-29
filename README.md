# gxcnodedocker
公信宝节点docker镜像

usage：
```shell
docker build https://raw.githubusercontent.com/wjfree/gxcnodedocker/master/Dockerfile -t gxcnode:v1

docker run --name gxctestnode -p 28090:28090 -p 9999:9999 -v /path/to/your/testnde:/root/testnet_node gxcnode:1.0 &
```
