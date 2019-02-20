docker run -d \
    -p 443:443 \
    -p 80:80 \
    -v letsencrypt_certs:/etc/letsencrypt \
    -e "NGINX_REDIRECT_PORT80=true" \
    -e "SERVER1REVERSE_PROXY_LOCATION1=/" \
    -e "SERVER1REVERSE_PROXY_PASS1=http://172.19.0.3:9011" \
    -e "SERVER1HTTPS_ENABLED=true" \
    -e "SERVER1HTTP_ENABLED=false" \
    -e "SERVER1LETSENCRYPT_CERTIFICATES=true" \
    -e "SERVER1CERTIFICATE_FILE=/etc/letsencrypt/live/d1.example.com/cert.pem" \
    -e "SERVER1CERTIFICATE_KEY=/etc/letsencrypt/live/d1.example.com/privkey.pem" \
    -e "SERVER1CERTIFICATE_TRUSTED=/etc/letsencrypt/live/d1.example.com/fullchain.pem" \
    --net mydockernet \
    --name nginx-reverse-proxy \
    blacklabelops/nginx

