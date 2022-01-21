#!/usr/bin/env bash
openssl genrsa -des3 -out localhost.key 2048 && \
openssl req -new -key localhost.key -out localhost.csr -subj "/C=US/CN=localhost" && \
cp localhost.key localhost.key.org && \
openssl rsa -in localhost.key.org -out localhost.key && \
openssl x509 -req -in localhost.csr -signkey localhost.key -out localhost.crt -days 3650 -sha256 -extfile v3.ext && \
cat localhost.key localhost.crt > localhost.pem
