FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

COPY ./gin-server /home/gin-server
COPY ./config/sources.list /home/sources.list

#RUN mv /home/sources.list /etc/apt/sources.list && \
#   apt-get update && \
#    apt-get install -y ca-certificates

WORKDIR /home

# 创建必要的目录
RUN mkdir -p logs regist/certs/certs regist/certs/keys

# 设置环境变量
# ===== 基本配置 =====
ENV SERVER_HOST=0.0.0.0                
ENV SERVER_PORT=8123                   
ENV DEBUG_LEVEL=false                   
ENV DEBUG=false                        
ENV TEST_MODE=false                     

# ===== 跨域资源配置 =====
ENV CORS_ENABLED=true                  
ENV CORS_ALLOW_ORIGINS=*               
ENV CORS_ALLOW_METHODS=GET,POST,PUT,DELETE,OPTIONS 
ENV CORS_ALLOW_HEADERS=Content-Type,Authorization   
ENV CORS_EXPOSE_HEADERS=Content-Length,Content-Type 
ENV CORS_ALLOW_CREDENTIALS=true        
ENV CORS_MAX_AGE=86400                  

# ===== 数据库配置 =====
ENV DB_USER=root                    
ENV DB_PASSWORD=123456            
ENV DB_HOST=192.168.0.2                  
ENV DB_PORT=3306                        
ENV DB_NAME=gin_server                  

# Radius数据库配置
ENV RADIUS_DB_USER=radius             
ENV RADIUS_DB_PASSWORD=123456     
ENV RADIUS_DB_HOST=192.168.0.2            
ENV RADIUS_DB_PORT=3306                 
ENV RADIUS_DB_NAME=radius               

# 多Radius数据库配置（可选）
ENV RADIUS_DBS=local                    

# 数据库模块配置
ENV DB_MODULE_ENABLED=true              
ENV DB_ENABLE_AUTO_MIGRATE=true         
ENV DB_ENABLE_QUERY_CACHE=false         
ENV DB_QUERY_CACHE_TIMEOUT=60          
ENV DB_MAX_CONNECTIONS=100              
ENV DB_IDLE_CONNECTIONS=10              
ENV DB_CONNECTION_LIFETIME=3600         

# ===== 认证相关配置 =====
ENV AUTH_INTERVAL=10                    
ENV DEVICE_STATUS_CHECK_INTERVAL=5     

ENV AUTH_MODULE_ENABLED=true           
ENV AUTH_ENABLE_USER_AUTH=true          
ENV AUTH_ENABLE_DEVICE_AUTH=true        
ENV AUTH_ENABLE_RADIUS_AUTH=true       
ENV AUTH_CACHE_TIMEOUT=300              
ENV AUTH_MAX_LOGIN_ATTEMPTS=5          
ENV AUTH_LOCKOUT_DURATION=30            

# ===== 远程存储配置 =====
ENV STORAGE_TYPE=gitee                 

# Gitee配置
ENV GITEE_ACCESS_TOKEN=684ed853186d45b825b415b00f16bf27  
ENV GITEE_OWNER=xxxLogTest              
ENV GITEE_REPO=logtest                  
ENV GITEE_BRANCH=master                 

# Gitlab配置
ENV GITLAB_HOST=http://192.168.152.134  
ENV GITLAB_ACCESS_TOKEN=glpat-6XeG1ygMM3xYz1joBxeV  
ENV GITLAB_OWNER=root                   
ENV GITLAB_REPO=LogTest                
ENV GITLAB_BRANCH=main                 

# FTP配置
ENV FTP_HOST=127.0.0.1                  
ENV FTP_PORT=21                        
ENV FTP_USERNAME=                      
ENV FTP_PASSWORD=                       

# ===== 日志模块配置 =====
ENV LOG_MODULE_ENABLED=true            
ENV LOG_LEVEL=info                      
ENV LOG_ENABLE_CONSOLE_OUTPUT=true      
ENV LOG_ENABLE_FILE_OUTPUT=true         
ENV LOG_FILE_PATH=logs/server.log      
ENV LOG_MAX_FILE_SIZE=10                
ENV LOG_MAX_BACKUP_COUNT=5              

# 日志管理配置
ENV LOG_ENABLED=true                   
ENV LOG_GENERATE_INTERVAL=10            
ENV LOG_ENABLE_ENCRYPTION=false         
ENV LOG_ENABLE_MOCK_GENERATION=true     
ENV LOG_DIR=logs                        
ENV LOG_UPLOAD_DIR=log                  
ENV LOG_REMOTE_PATH=log                 
ENV LOG_PACKAGE_TYPE=json               
ENV LOG_AES_KEY_PATH=keys/configmanager/log/aes_test_key.bin 

# ===== 证书管理模块配置 =====
ENV CERT_MODULE_ENABLED=true            
ENV CERT_DIR=regist/certs/certs         
ENV KEY_DIR=regist/certs/keys          

# ===== 配置管理模块配置 =====
# 策略管理配置
ENV STRATEGY_POLL_INTERVAL=300         
ENV STRATEGY_ENABLE_ENCRYPTION=true     

# 压缩配置
ENV COMPRESS_FORMAT=tar.gz             
ENV COMPRESS_LEVEL=6                    
ENV COMPRESS_BUFFER_SIZE=32768          

# 配置文件管理配置
ENV CONFIG_FILE_ENABLED=true           
ENV CONFIG_FILE_POLL_INTERVAL=300       
ENV CONFIG_FILE_DOWNLOAD_DIR=configmanager/config_exec/downloads 
ENV CONFIG_FILE_REMOTE_PATH=config     
ENV CONFIG_FILE_TEST_DIR=test           
ENV CONFIG_FILE_ENABLE_ENCRYPTION=false 
ENV CONFIG_FILE_SAVE_DECRYPTED_FILES=true  
ENV CONFIG_FILE_DECRYPTED_DIR=configmanager/config_exec/decypted  
ENV CONFIG_FILE_AES_KEY_PATH=keys/configmanager/config_exec/aes_test_key.bin  

# 网关配置生成模块配置
ENV CONFIG_GEN_ENABLED=true             
ENV CONFIG_GEN_ENABLE_AUTO_GENERATION=true  
ENV CONFIG_GEN_STORAGE_PATH=           
ENV CONFIG_GEN_ENABLE_API_TRIGGER=true  
ENV CONFIG_GEN_ENABLE_EVENT_TRIGGER=true 
ENV CONFIG_GEN_POLL_INTERVAL=30        
ENV CONFIG_GEN_ENABLE_ENCRYPTION=false  

# ===== 测试数据配置 =====
ENV TEST_ENABLE_INITIAL_DATA=true       
ENV TEST_ENABLE_REALTIME_DATA=false     
ENV TEST_DEVICE_COUNT=10               
ENV TEST_USERS_PER_DEVICE=5             
ENV TEST_BEHAVIORS_PER_USER=10         
ENV TEST_REALTIME_INTERVAL=60           
ENV TEST_REALTIME_BEHAVIORS_PER_INTERVAL=2  
ENV TEST_REALTIME_TIME_RANGE_START=-60  
ENV TEST_REALTIME_TIME_RANGE_END=0      

# ===== 设备管理模块配置 =====
ENV DEVICE_MODULE_ENABLED=true         
ENV DEVICE_ENABLE_AUTO_REGISTER=false   
ENV DEVICE_ENABLE_BATCH_REGISTER=true   
ENV DEVICE_MAX_BATCH_SIZE=100          
ENV DEVICE_ENABLE_STATUS=true          
ENV DEVICE_CHECK_INTERVAL=5            

# ===== 用户管理模块配置 =====
ENV USER_MODULE_ENABLED=true            
ENV USER_ENABLE_AUTO_REGISTER=false     
ENV USER_ENABLE_BATCH_REGISTER=true     
ENV USER_MAX_BATCH_SIZE=100            
ENV USER_ENABLE_CONNECTIONS=true        
ENV USER_MAX_CONNECTIONS_PER_USER=50    

# ===== 调试日志配置 =====
ENV DEBUG_LEVEL_DATABASE=3              
ENV DEBUG_LEVEL_AUTH=3                  
ENV DEBUG_LEVEL_CERT=3                   
ENV DEBUG_LEVEL_CONFIG_EXEC=3            
ENV DEBUG_LEVEL_CONFIG_GEN=3             
ENV DEBUG_LEVEL_LOG=3                    
ENV DEBUG_LEVEL_DEVICE=3                 
ENV DEBUG_LEVEL_USER=3

# 暴露端口
EXPOSE 8123

# 运行应用
CMD ["./gin-server"] 