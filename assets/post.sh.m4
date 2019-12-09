#!/bin/bash -x
set -e

mkdir /mnt/sysimage/home/__USER__/.ssh
cat /cdrom/__PUBLIC_KEY__ >/mnt/sysimage/home/__USER__/.ssh/authorized_keys
chmod 700 /mnt/sysimage/home/__USER__/.ssh
chown 1000:1000 \
	/mnt/sysimage/home/__USER__/.ssh \
	/mnt/sysimage/home/__USER__/.ssh/authorized_keys

cp /cdrom/sudoers /cdrom/auto_resize_vda.sh /mnt/sysimage/etc/
chmod 440 /mnt/sysimage/etc/sudoers
chown 0:0 /mnt/sysimage/etc/sudoers
chmod 755 /mnt/sysimage/etc/auto_resize_vda.sh
exit 0