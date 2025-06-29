# 首先需要创建一个自定义网络 
docker network create --driver bridge gatewayNet

#构建顺序 需要按照顺序构建
gateway-database
gateway-web-backed
gateway-web-fronted
gateway-auth-server

#monitor 由于奇安信通道的原因 因此只能采用 java -jar ybtx_monitor.jar & d 方式运行，无法构建镜像
gateway-monitor
