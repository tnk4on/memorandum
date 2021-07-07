# Photon OS

Photon OS™ is an open source Linux container host optimized for cloud-native applications, cloud platforms, and VMware infrastructure. 

## References

- [vmware/photon: Minimal Linux container host](https://github.com/vmware/photon)
- [Photon OS Documentation |](https://vmware.github.io/photon/docs/)

## Download

- [Downloading Photon OS · vmware/photon Wiki](https://github.com/vmware/photon/wiki/Downloading-Photon-OS)

## Default root password

all Photon OS instances that are created by importing the OVA require an immediate password change upon login. The default account credentials are:

- Username: `root`
- Password: `changeme`

Note: For security, Photon OS forbids common dictionary words for the root password.  

## Update packages

Note: Photon OS 4.0 GA on Mar 5

```
# date
Wed Jul  7 05:39:59 AM UTC 2021

# tdnf updateinfo
14 Security notice(s)

# tdnf update -y

# tdnf updateinfo
0 updates.
No data available

# tdnf update
Nothing to do.

# reboot
```

## Docker

1. Run Docker

To run Docker from the command prompt, enter the following command, which initializes the docker engine:
```
# systemctl start docker
```

To ensure Docker daemon service runs on every subsequent VM reboot, enter the following command:
```
# systemctl enable docker
```

2. Docker version

```
# docker version
Client: Docker Engine - Community
 Version:           19.03.15
 API version:       1.40
 Go version:        go1.16.5
 Git commit:        99e3ed8
 Built:             Tue Jun 15 03:13:20 2021
 OS/Arch:           linux/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          19.03.15
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.16.5
  Git commit:       99e3ed8
  Built:            Tue Jun 15 03:14:07 2021
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.4.4
  GitCommit:        %{CONTAINERD_GITCOMMIT}
 runc:
  Version:          1.0.0-rc93
  GitCommit:        14faf1c20948688a48edb9b41367ab07ac11ca91
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
```

## Firewall

Note: Photon OS uses iptables instead of firewalld.

```
# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy DROP)
target     prot opt source               destination
DOCKER-USER  all  --  anywhere             anywhere
DOCKER-ISOLATION-STAGE-1  all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
DOCKER     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain DOCKER (1 references)
target     prot opt source               destination

Chain DOCKER-ISOLATION-STAGE-1 (1 references)
target     prot opt source               destination
DOCKER-ISOLATION-STAGE-2  all  --  anywhere             anywhere
RETURN     all  --  anywhere             anywhere

Chain DOCKER-ISOLATION-STAGE-2 (1 references)
target     prot opt source               destination
DROP       all  --  anywhere             anywhere
RETURN     all  --  anywhere             anywhere

Chain DOCKER-USER (1 references)
target     prot opt source               destination
RETURN     all  --  anywhere             anywhere
```