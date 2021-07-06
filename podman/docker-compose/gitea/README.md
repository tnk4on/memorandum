# Gitea

## Refer to
- [Gitea](https://gitea.io/en-us/)

## Environment

- [x] Rootfull
- [ ] Rootless

OS
```
# uname -a
Linux phenex 4.18.0-305.3.1.el8.x86_64 #1 SMP Tue Jun 1 16:14:33 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
# cat /etc/redhat-release
CentOS Stream release 8
```

Podman
```
$ podman version
Version:      3.1.0-dev
API Version:  3.1.0-dev
Go Version:   go1.16.1
Built:        Sat Mar 27 03:32:03 2021
OS/Arch:      linux/amd64
```

docker-compose command
```
# cat ~/.bashrc

...

alias docker-compose='podman run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock:z \
    -v "$PWD:/$PWD:z" \
    -w="/$PWD" \
    docker/compose:1.29.2'
```
