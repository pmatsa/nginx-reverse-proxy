docker run --rm \
    -p 80:80 \
    -p 443:443 \
    --name letsencrypt \
    -v letsencrypt_certs:/etc/letsencrypt \
    -e "LETSENCRYPT_EMAIL=pmatsaridis@iotech.gr" \
    -e "LETSENCRYPT_DOMAIN1=d1.example.com"  -e "LETSENCRYPT_DOMAIN2=d2.example.com" \
    blacklabelops/letsencrypt install

