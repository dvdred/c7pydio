# c7pydio
Pydio containerized on CentOS 7 and Apache (with persistent data)

## NB: Problems with Ubuntu 14.04 and other derivated distro, with aufs backend storage driver for docker:
More explanation at https://github.com/docker/docker/issues/6980

**WARNING**: NEXT STEPS WILL OVERRIDE ANY EXISTING IMAGES AND CONTAINER,
- Change the default storage backend driver is needed for that annoying bug. You can uncomment or add the following properties to the /etc/default/docker configuration file:
```
DOCKER_OPTS="--storage-driver=overlay"
```
- and then restart the docker daemon:
``` sudo service docker restart ```

## CONFIGURATION

NB: INCLUDE YOUR OWN CERTIFICATES FOR HTTPS BEFORE TO START THE DOCKER COMPOSITION

You can use https://letsencrypt.org/getting-started/ to generate a valid certificate.
- put the resulting files in the following folder:
``` # ls pydio/etc/httpd/ssl.crt/ ```

- Use the same names referenced in configuration:
``` cat pydio/etc/httpd/conf.d/pydio.conf | grep pem ```
The default names are:
```
cert.pem
privkey.pem
### NEXT IS OPTIONAL ONLY IF YOU USE VALID CERTIFICATE, DISABLED FOR DEFAULT ###
fullchain.pem (To use it, uncomment the relative option in pydio/etc/httpd/conf.d/pydio.conf) 
```

- IF you don't include any certificates, the starting script will create one for you (self signed).
To set a server name modify the default "yourservername" in docker-compose.yml file **before first run**.

- If you want a working redirect from base url to the application (default es: http:/yourservername:8080 -> https:/yourservername:8443/pydio ), fill the right server name (the same in the docker-compose.yml) in pydio/etc/httpd/conf.d/pydio.conf

## ONCE STARTED: (docker-compose up -d)

- Point your browser to https://yourservername or ip:8443/pydio
First time the installation process will start. Use the following information (default settings, you can change in the docker-compose.yml file):
```
Database url: dbserver
Database name: pydiodb
Database user: pydiouser
Credential: look at PASSWORD.TXT file
```

## PERSISTENT DATA (what I have to backup?)
All data are persistent for default.
Backup the next folder and docker-compose.yml for preservation purpose: 
- "./data" folder present at the root of this projects will contains the database, the configuration of the running application and the media files of this composition.
- "./pydio/etc/" contains the configuration of the application and apache server. It contains the ssl certificate.

## Permission problems:
- If you have problems with folder permissions, it is possible to make ./data writeable for all, recursively as workaround:
``` chmod -R a+rw ./data ```
