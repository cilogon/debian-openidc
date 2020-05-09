# debian-openidc
a Debian Docker container using mod_auth_openidc according to https://www.cilogon.org/oidc

## build the container
```
docker build -t debian-openidc .
```

## run the container
```
docker run --env-file ./debian-openidc-env.txt --name debian-openidc -p 443:443 -it debian-openidc
```

## env-file
The container expects some environment variables to be defined:
```
$ cat debian-openidc-env.txt
CLIENTID=cilogon:/client_id/1234567890abcdef
CLIENTSECRET=yoursecretvaluefromclientregistration
REDIRECTURI=https://localhost.localdomain/oidc/redirect
SCOPE=openid email profile org.cilogon.userinfo
CRYPTOPASS=changeme
SERVERNAME=localhost.localdomain
```
