-rw-rw-r-- 1 adam adam 640M Mar  6 20:34 /home/adam/Downloads/debian_wheezy_powerpc_standard.qcow2

Obtained from https://people.debian.org/~aurel32/qemu/powerpc/

Provides working networking by default where the host IP (gateway) is 10.0.2.2
Note that ping doesn't work unless you specially enable it with some root commands setting up group permissions.
Note also that networking out from guest to host is fine, but host back to guest does not work.
See general notes on qemu networking.

Had no problem in performing some apt-get installs to put git, vim, make, gcc and in general the build-essentials.

To boot the system, you need qemu but also openbios-ppc

There are a number of good IBM hosted tutorials on ppc assembly.  A good starting point is www.ibm.com/developerworks/library/l-ppc/


