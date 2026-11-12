# Sử dụng Nginx bản nhẹ làm web server
FROM nginx:alpine

# Xóa file mặc định của Nginx và chép file index.html của bạn vào
RUN rm -rf /usr/share/nginx/html/*
COPY index.html /usr/share/nginx/html/

# Mở cổng 80 trong container
EXPOSE 80