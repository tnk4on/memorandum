# Pi-Hole

## Refer to

- [pihole/pihole](https://hub.docker.com/r/pihole/pihole)

## Environment

- [x] Rootfull
- [x] Rootless

OS
```
$ uname -a
Linux centos-test 4.18.0-310.el8.x86_64 #1 SMP Tue Jun 8 00:24:50 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
$ cat /etc/redhat-release
CentOS Stream release 8
```

Podman
```
# podman version
Version:      3.1.0-dev
API Version:  3.1.0-dev
Go Version:   go1.16.1
Built:        Sat Mar 27 03:32:03 2021
OS/Arch:      linux/amd64
```

docker-compose command
```
# docker-compose version
docker-compose version 1.29.2, build unknown
docker-py version: 5.0.0
CPython version: 3.6.8
OpenSSL version: OpenSSL 1.1.1k  FIPS 25 Mar 2021

# pip3 show docker-compose
Name: docker-compose
Version: 1.29.2
Summary: Multi-container orchestration for Docker
Home-page: https://www.docker.com/
Author: Docker, Inc.
Author-email: None
License: Apache License 2.0
Location: /usr/local/lib/python3.6/site-packages
Requires: python-dotenv, requests, websocket-client, docopt, cached-property, dockerpty, distro, docker, jsonschema, texttable, PyYAML
Required-by:
```