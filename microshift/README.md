# microshift

Microshift is OpenShift Kubernetes in a small form factor and optimized for edge computing.

## References

- [redhat-et/microshift: a small form factor OpenShift/Kubernetes optimized for edge computing](https://github.com/redhat-et/microshift)

- [[WIP] enable containerized microshift on MacOS by rootfs · Pull Request #122 · redhat-et/microshift](https://github.com/redhat-et/microshift/pull/122)
    - [rootfs/ushift](https://hub.docker.com/r/rootfs/ushift)

## Run on a podman machine

Set up a `podman machine`
```
podman machine init microshift
podman machine start microshift
podman system connection default microshift-root
```

Run a `Microshift`
```
podman pull docker.io/rootfs/ushift:macos 
podman volume rm ushift-vol;podman volume create ushift-vol
podman run -d --rm --name ushift --privileged -v /lib/modules:/lib/modules -v ushift-vol:/var/lib -p 6443:6443 docker.io/rootfs/ushift:macos
```

Check for `Microshift`
```
podman ps -a
podman exec -ti ushift bash

<inside a podman machine>
systemctl status microshift
export KUBECONFIG=/var/lib/microshift/resources/kubeadmin/kubeconfig
kubectl get nodes -A -w
kubectl get pods -A -w
```

Stop `Microshift`
```
podman stop ushift
```

Connect to a `Microshift` cluster from a local macOS 
```
rm kubeconfig
podman cp ushift:/var/lib/microshift/resources/kubeadmin/kubeconfig .
ssh root@localhost -p59331 -i ~/.ssh/microshift -L 6443:localhost:6443 -f -N
export KUBECONFIG=kubeconfig
oc get pods -A -o wide
oc get nodes -A -o wide
```

## `Microshift` cluster 

```
$ oc get nodes -A -o wide
NAME           STATUS   ROLES    AGE   VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                      KERNEL-VERSION           CONTAINER-RUNTIME
487bec8f1a43   Ready    <none>   23m   v1.20.1   10.88.0.3     <none>        Fedora 33 (Container Image)   5.12.9-300.fc34.x86_64   cri-o://1.20.0
$ oc get pods -A -o wide
NAMESPACE                       NAME                                  READY   STATUS    RESTARTS   AGE   IP          NODE           NOMINATED NODE   READINESS GATES
kube-system                     kube-flannel-ds-7bh9s                 1/1     Running   0          24m   10.88.0.3   487bec8f1a43   <none>           <none>
kubevirt-hostpath-provisioner   kubevirt-hostpath-provisioner-qhb7p   1/1     Running   0          24m   10.42.0.2   487bec8f1a43   <none>           <none>
openshift-dns                   dns-default-2q9wc                     3/3     Running   4          24m   10.42.0.2   487bec8f1a43   <none>           <none>
openshift-ingress               router-default-78d9fc46bb-mkl9b       0/1     Running   8          24m   10.42.0.3   487bec8f1a43   <none>           <none>
openshift-service-ca            service-ca-66bcdfc59-p9php            1/1     Running   3          24m   10.42.0.3   487bec8f1a43   <none>           <none>
```

Check the listening port from within the vm on the podman machine.
```
[root@2c8962a3b321 /]# ss -ltnup
Netid            State             Recv-Q            Send-Q                       Local Address:Port                        Peer Address:Port           Process
udp              UNCONN            0                 0                            127.0.0.53%lo:53                               0.0.0.0:*               users:(("systemd-resolve",pid=30,fd=15))
udp              UNCONN            0                 0                                  0.0.0.0:5355                             0.0.0.0:*               users:(("systemd-resolve",pid=30,fd=10))
udp              UNCONN            0                 0                                  0.0.0.0:8472                             0.0.0.0:*
udp              UNCONN            0                 0                                     [::]:5355                                [::]:*               users:(("systemd-resolve",pid=30,fd=12))
tcp              LISTEN            0                 4096                             10.88.0.2:2380                             0.0.0.0:*               users:(("microshift",pid=34,fd=7))
tcp              LISTEN            0                 4096                             127.0.0.1:2381                             0.0.0.0:*               users:(("microshift",pid=34,fd=14))
tcp              LISTEN            0                 4096                             127.0.0.1:10257                            0.0.0.0:*               users:(("microshift",pid=34,fd=176))
tcp              LISTEN            0                 4096                         127.0.0.53%lo:53                               0.0.0.0:*               users:(("systemd-resolve",pid=30,fd=16))
tcp              LISTEN            0                 4096                             127.0.0.1:42053                            0.0.0.0:*               users:(("crio",pid=33,fd=12))
tcp              LISTEN            0                 4096                             127.0.0.1:10248                            0.0.0.0:*               users:(("microshift",pid=34,fd=270))
tcp              LISTEN            0                 4096                             127.0.0.1:10249                            0.0.0.0:*               users:(("microshift",pid=34,fd=285))
tcp              LISTEN            0                 4096                             10.88.0.2:2379                             0.0.0.0:*               users:(("microshift",pid=34,fd=9))
tcp              LISTEN            0                 4096                             127.0.0.1:2379                             0.0.0.0:*               users:(("microshift",pid=34,fd=8))
tcp              LISTEN            0                 4096                               0.0.0.0:5355                             0.0.0.0:*               users:(("systemd-resolve",pid=30,fd=11))
tcp              LISTEN            0                 4096                                     *:10252                                  *:*               users:(("microshift",pid=34,fd=175))
tcp              LISTEN            0                 4096                                     *:10256                                  *:*               users:(("microshift",pid=34,fd=258))
tcp              LISTEN            0                 4096                                     *:10259                                  *:*               users:(("microshift",pid=34,fd=174))
tcp              LISTEN            0                 4096                                     *:8444                                   *:*               users:(("microshift",pid=34,fd=196))
tcp              LISTEN            0                 4096                                     *:8445                                   *:*               users:(("microshift",pid=34,fd=231))
tcp              LISTEN            0                 4096                                     *:10250                                  *:*               users:(("microshift",pid=34,fd=265))
tcp              LISTEN            0                 4096                                     *:10251                                  *:*               users:(("microshift",pid=34,fd=173))
tcp              LISTEN            0                 4096                                     *:6443                                   *:*               users:(("microshift",pid=34,fd=17))
tcp              LISTEN            0                 4096                                  [::]:5355                                [::]:*               users:(("systemd-resolve",pid=30,fd=13))
```

## Restrictions: Cluster will not start in rootless mode

```
[root@7c7f99f3d994 /]# kubectl get nodes -A -w
NAMESPACE   NAME           STATUS     ROLES    AGE     VERSION
            7c7f99f3d994   NotReady   <none>   2m49s   v1.20.1
[root@7c7f99f3d994 /]# kubectl get pods -A -w
NAMESPACE              NAME                              READY   STATUS    RESTARTS   AGE
kube-system            kube-flannel-ds-qvscs             0/1     Pending   0          3m2s
openshift-dns          dns-default-xq4tw                 0/3     Pending   0          3m2s
openshift-ingress      router-default-78d9fc46bb-jrlxm   0/1     Pending   0          3m44s
openshift-service-ca   service-ca-66bcdfc59-kgmpx        0/1     Pending   0          3m50s
```