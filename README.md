# c7pydio
Pydio containerized on CentOS 7 and Apache (with persistent data)

## CONFIGURATION

NB: INCLUDE YOUR OWN CERTIFICATES FOR HTTPS BEFORE TO START THE DOCKER COMPOSITION

You can use https://letsencrypt.org/getting-started/ to generate a valid certificate.
- put the resulting file in the following folder:
``` # ls pydio/etc/httpd/ssl.crt/ ```

- Use the same names referenced in configuration:
``` cat pydio/etc/httpd/conf.d/pydio.conf | grep pem ```

- Default names:
```
cert.pem
privkey.pem
fullchain.pem (for valid certificate: uncomment relative configuration not used by default in pydio/etc/httpd/conf.d/pydio.conf) 
```

- IF you don't include any certificates, the starting script will create one for you (self signed).
To set a server name modify the default "yourservername" in docker-compose.yml file.

- If you want a working redirect from base url to the application (default es: http:/yourservername:8080 -> https:/yourservername:8443/pydio ), fill the right server name (the same in the docker-compose.yml) in pydio/etc/httpd/conf.d/pydio.conf

## ONCE STARTED: (docker-compose up -d)

- Point your browser to https://yourservername or ip:8443/pydio
First time the installation process will start. Use the following information (defalt settings):
```
```
- For the credential of database user look at the ``` PASSWORD.txt ``` file for default settings or modify them in ``` docker-compose.yml ```
