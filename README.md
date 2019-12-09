# centos-image-builder
**Builds CentOS images with a kickstart for unattended installations**

This is meant to be used alongside ProxMox and Telmate's Terraform Provider for ProxMox. It will very likely work for just about anything though as it'll simply unpack a stock CentOS ISO, add a kickstart (and other stuff required for a full setup; more details below) and then repacks the ISO using the same command which was used to create it in the first place.

Shout out to the the [debian wiki](https://wiki.debian.org/DebianInstaller/Preseed/EditIso) and [telmate's Ubuntu ISO builder](https://github.com/Telmate/terraform-ubuntu-proxmox-iso)!

# Documentation
```
├── LICENSE
├── README.md
├── assets
│   ├── auto_resize_vda.sh
│   ├── isolinux.cfg
│   ├── ks.cfg
│   ├── post.sh.m4
│   └── sudoers.m4
├── build
├── centos-1905.iso
├── cleanup
└── secrets
    ├── id_rsa
    └── id_rsa.pub
```

**Dependencies**
* libarchive-tools 	Required to unpack the ISO
* m4 			Required to replace some vars in various files (Planned to be replaced by sed when I have time)
* xorriso 		Required to repackage the ISO
* uuid-runtime		Required for random UUID in hostname (so not really, just change the variable for the hostname)


Before you can start building ISOs you will need a Debian ISO. I would advise to use the netboot one as you'll need to download some packages no matter what. You will alos need to create place "id_rsa.pub", so a SSH public key, into the secrets folder to allow you to connect securely.

There are two executables: build and cleanup. Open build using a text editor to set the variables as they fit your needs. The password for both root and $user can be set using a file called pw.sh in /secrets; an example is pasted below. After that start a build by running 'sudo ./build'. Depending on what kind of ISO you have (netboot, cd or dvd) this process will take between 5 and 60 seconds. After the build finishes it will automatically start a clean up. Should the build fail though this will have to be done manually by executing './cleanup'.

At this point it is advised to use the the "debianvm.seed" or alternatively your own.

```
#!/bin/sh
PWROOT=PutWhatYouLikeHereButCrypted.ExampleBelow:
PWUSER=$6$dtyDwkWfBWfKdpgr$ds/1y5QIwobEupOdQCzcnReXzWOjdr57JZP2IpX09XuYDvC.BjbE9SDR9jigD16u48cGiC3dVi3HCk8arearp1
```

# Issues

Currently none. :)
