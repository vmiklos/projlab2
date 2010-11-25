#!/bin/bash

echo 3 > /proc/sys/vm/drop_caches
mount /dev/mapper/myvg-mymirror /mnt/mirror
time cat /mnt/mirror/test >/dev/null
umount /mnt/mirror
