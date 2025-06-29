# 首先需要创建一个自定义网络 
docker network create --driver bridge gatewayNet

#构建顺序 需要按照顺序构建
gateway-database
gateway-web-backed
gateway-web-fronted
gateway-auth-server
gateway-monitor
