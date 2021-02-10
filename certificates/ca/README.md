#

https://www.rabbitmq.com/ssl.html#manual-certificate-generation
https://jamielinux.com/docs/openssl-certificate-authority/introduction.html


## Generate private CA

```
openssl genrsa -aes256 -out private/ca_private_key.pem 4096
openssl x509 -noout -text -in ca_certificate.pem
openssl req -config openssl.cnf -key private/ca_private_key.pem -new -x509 -days 3650 -out ca_certificate.pem -outform PEM -subj "/CN=Sergei Kogan Personal CA/" -nodes
```


## Generate server certificate

```
cd certificates
mkdir server.local
cd server.local
mkdir private
chmod 700 private
echo private/ >.gitignore
openssl genrsa -out private/key.pem 2048
chmod 400 private/key.pem
openssl req -config ../ca/openssl.cnf -key private/key.pem -new -sha256 -out req.pem -subj /CN=pi.local/O=server/
cd ../ca
openssl ca -config openssl.cnf -extensions server_ca_extensions -days 3650 -notext -md sha256 -in ../pi.local/req.pem -out ../pi.local/certificate.pem
chmod 444 ../pi.local/certificate.pem
rm ../pi.local/req.pem
```
