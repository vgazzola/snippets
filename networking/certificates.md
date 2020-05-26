# Certificates'n stuff

## check certificate (endpoint)

`openssl s_client -connect <IP>:<PORT> | openssl x509 -noout -text`

## check certificate (file)

`openssl x509 -in <CERT> -noout -text`
