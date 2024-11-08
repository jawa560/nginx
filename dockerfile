# 使用官方的 Ubuntu 映像作為基礎
FROM ubuntu:latest

# 更新包列表並安裝 nginx-full
RUN apt-get update && \
    apt-get install -y nginx-full && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 創建 nginx 用戶
RUN useradd -r -s /bin/false nginx

# 創建必要的目錄並設置權限
RUN mkdir -p /var/log/nginx /var/cache/nginx /var/lib/nginx && \
    chown -R nginx:nginx /var/log/nginx /var/cache/nginx /var/lib/nginx

# 設置 Nginx 的工作目錄
WORKDIR /etc/nginx

# 複製配置文件到容器內
COPY nginx.conf /etc/nginx/nginx.conf
COPY stream.conf /etc/nginx/stream.conf

# 暴露 Nginx 的默認端口
EXPOSE 80

# 啟動 Nginx
CMD ["nginx", "-g", "daemon off;"]
