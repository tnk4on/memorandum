# Buildah Unshare Test

## Build after `buildah unshare`

```
$ buildah unshare bash build.sh
$ podman run --rm test ls -l /work
total 0
-rw-rw-r--    1 root     root             0 Jun 11 07:59 foo
```

## Version of the container tools

```
$ buildah version
Version:         1.21.0
Go Version:      go1.16.3
Image Spec:      1.0.1-dev
Runtime Spec:    1.0.2-dev
CNI Spec:        0.4.0
libcni Version:  
image Version:   5.12.0
Git Commit:      
Built:           Thu Jan  1 09:00:00 1970
OS/Arch:         linux/amd64

$ podman version
Version:      3.2.0
API Version:  3.2.0
Go Version:   go1.16.3
Built:        Wed Jun  9 23:24:16 2021
OS/Arch:      linux/amd64
```

## References

- [https://gist.github.com/tnk4on/87cd677bc7aac0cac7acdb9ea0b46e8b](https://gist.github.com/tnk4on/87cd677bc7aac0cac7acdb9ea0b46e8b)
- [buildah - How to build a container image from scratch as a non-root user? - Stack Overflow](https://stackoverflow.com/questions/54753515/how-to-build-a-container-image-from-scratch-as-a-non-root-user)
- [シェルスクリプトで「ビルドスクリプト」を作る時に便利なテクニック - 2012-10-11 - ククログ](https://www.clear-code.com/blog/2012/10/11.html)
- [効率的に安全な Dockerfile を作るには - Qiita](https://qiita.com/pottava/items/452bf80e334bc1fee69a)
