# CAREFULL : Let's Encrypt uses the same cert files for all multiple domains.
# Use the same when you want to register more than one domains for HTTPS.
docker run -d \
    -p 443:443 \
    -p 80:80 \
    -v letsencrypt_certs:/etc/letsencrypt \
    -e "NGINX_REDIRECT_PORT80=true" \
    -e "SERVER1REVERSE_PROXY_LOCATION1=/" \
    -e "SERVER1SERVER_NAME=sub1.domain.com" \
    -e "SERVER1REVERSE_PROXY_PASS1=http://172.19.0.3:9011" \
    -e "SERVER1HTTPS_ENABLED=true" \
    -e "SERVER1HTTP_ENABLED=false" \
    -e "SERVER1LETSENCRYPT_CERTIFICATES=true" \
    -e "SERVER1CERTIFICATE_FILE=/etc/letsencrypt/live/sub1.domain.com/cert.pem" \
    -e "SERVER1CERTIFICATE_KEY=/etc/letsencrypt/live/sub1.domain.com/privkey.pem" \
    -e "SERVER1CERTIFICATE_TRUSTED=/etc/letsencrypt/sub1.domain.com/fullchain.pem" \
    -e "SERVER2REVERSE_PROXY_LOCATION1=/" \
    -e "SERVER2SERVER_NAME=portainer.auth.iotech.gr" \
    -e "SERVER2REVERSE_PROXY_PASS1=http://172.19.0.5:9000" \
    -e "SERVER2HTTPS_ENABLED=true" \
    -e "SERVER2HTTP_ENABLED=false" \
    -e "SERVER2LETSENCRYPT_CERTIFICATES=true" \
    -e "SERVER2CERTIFICATE_FILE=/etc/letsencrypt/live/sub1.domain.com/cert.pem" \
    -e "SERVER2CERTIFICATE_KEY=/etc/letsencrypt/live/sub1.domain.com/privkey.pem" \
    -e "SERVER2CERTIFICATE_TRUSTED=/etc/letsencrypt/live/sub1.domain.com/fullchain.pem" \
    --net fusionauth_db \
    --name nginx-reverse-proxy \
    blacklabelops/nginx
