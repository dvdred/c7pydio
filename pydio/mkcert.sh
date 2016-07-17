#!/bin/bash

# Generete self signed apache certificate for HTTPS
[[ -f /etc/httpd/ssl.crt/cert.pem ]] && echo "Certificate present!" || (
yum install -y openssl

# Specify where we will install
SSL_DIR="/etc/httpd/ssl.crt/"

# Set the wildcarded domain
# we want to use

# USE docker-compose.yml to set it
DOMAIN="$SERVERNAME"

# A blank passphrase
PASSPHRASE=""
# Set our CSR variables
SUBJ="
C=IT
ST=IT
O=
localityName=ROME
commonName=$DOMAIN
organizationalUnitName=
emailAddress=
"

# Create our SSL directory
# in case it doesn't exist
mkdir -p "$SSL_DIR"

# Generate our Private Key, CSR and Certificate
openssl genrsa -out "$SSL_DIR/privkey.pem" 2048
openssl req -new -subj "$(echo -n "$SUBJ" | tr "\n" "/")" -key "$SSL_DIR/privkey.pem" -out "$SSL_DIR/request.csr" -passin pass:$PASSPHRASE
openssl x509 -req -days 365 -in "$SSL_DIR/request.csr" -signkey "$SSL_DIR/privkey.pem" -out "$SSL_DIR/cert.pem"
echo "Certificates generated!"
)
