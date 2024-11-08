# �ϥΩx�誺 Ubuntu �M���@����¦
FROM ubuntu:latest

# ��s�]�C��æw�� nginx-full
RUN apt-get update && \
    apt-get install -y nginx-full && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# �Ы� nginx �Τ�
RUN useradd -r -s /bin/false nginx

# �Ыإ��n���ؿ��ó]�m�v��
RUN mkdir -p /var/log/nginx /var/cache/nginx /var/lib/nginx && \
    chown -R nginx:nginx /var/log/nginx /var/cache/nginx /var/lib/nginx

# �]�m Nginx ���u�@�ؿ�
WORKDIR /etc/nginx

# �ƻs�t�m����e����
COPY nginx.conf /etc/nginx/nginx.conf
COPY stream.conf /etc/nginx/stream.conf

# ���S Nginx ���q�{�ݤf
EXPOSE 80

# �Ұ� Nginx
CMD ["nginx", "-g", "daemon off;"]
