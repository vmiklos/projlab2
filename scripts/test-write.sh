#!/bin/bash

mount /dev/mapper/myvg-mymirror /mnt/mirror
sync
time sh -c "dd if=/dev/zero of=/mnt/mirror/test-2mb.img bs=1M count=2; sync" 2>/dev/null
umount /mnt/mirror
