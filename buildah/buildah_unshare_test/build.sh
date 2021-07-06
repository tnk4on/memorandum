container=$(buildah from alpine)                                                                                                                                                                      
mnt=$(buildah mount $container)                                                                                                                                                                         
set -ex; mkdir -p $mnt/work; touch $mnt/work/foo

container2=$(buildah from alpine)                                                                                                                                                                       
mnt2=$(buildah mount $container2)

set -ex;mkdir -p $mnt2/work
cp $mnt/work/foo $mnt2/work/

buildah umount $container2                                                                                                                                                                        
buildah commit $container2 test