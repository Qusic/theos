# Dockerized [Theos](https://github.com/theos/theos)

* Ubuntu-based
* Toolchain by [kabiroberai](https://github.com/kabiroberai/ios-toolchain-linux)
* iOS 12.2 SDK from [DavidSkrundz](https://github.com/DavidSkrundz/sdks)

## Integration Ideas

- [ ] [vscode remote development](https://code.visualstudio.com/docs/remote/remote-overview)
- [ ] [libimobiledevice](https://www.libimobiledevice.org/)

## Usage Demo

```
$ docker pull qusic/theos
$ docker run -it --rm qusic/theos

root@container:~# cd
root@container:~# pwd
/root

root@container:~# nic.pl
NIC 2.0 - New Instance Creator
------------------------------
  [1.] iphone/activator_event
  [2.] iphone/application_modern
  [3.] iphone/application_swift
  [4.] iphone/flipswitch_switch
  [5.] iphone/framework
  [6.] iphone/library
  [7.] iphone/preference_bundle_modern
  [8.] iphone/tool
  [9.] iphone/tool_swift
  [10.] iphone/tweak
  [11.] iphone/xpc_service
Choose a Template (required): 10
Project Name (required): demo
Package Name [com.yourcompany.demo]:
Author/Maintainer Name [root]:
[iphone/tweak] MobileSubstrate Bundle filter [com.apple.springboard]:
[iphone/tweak] List of applications to terminate upon installation (space-separated, '-' for none) [SpringBoard]:
Instantiating iphone/tweak in demo/...
Done.

root@container:~# cd demo/
root@container:~/demo# ls
Makefile  Tweak.x  control  packages  demo.plist

root@container:~/demo# make
> Making all for tweak demo…
==> Preprocessing Tweak.x…
==> Preprocessing Tweak.x…
==> Compiling Tweak.x (armv7)…
==> Compiling Tweak.x (arm64)…
==> Linking tweak demo (armv7)…
rm /root/demo/.theos/obj/debug/armv7/Tweak.x.m
==> Linking tweak demo (arm64)…
rm /root/demo/.theos/obj/debug/arm64/Tweak.x.m
==> Merging tweak demo…
==> Signing demo…

root@container:~/demo# make package
> Making all for tweak demo…
make[2]: Nothing to be done for 'internal-library-compile'.
> Making stage for tweak demo…
dm.pl: building package `com.yourcompany.demo:iphoneos-arm' in `./packages/com.yourcompany.demo_0.0.1-1+debug_iphoneos-arm.deb'

root@container:~/demo# make install
==> Error: make install requires that you set THEOS_DEVICE_IP in your environment.
==> Notice: It is also recommended that you have public-key authentication set up for root over SSH, or you will be entering your password a lot.
/opt/theos/makefiles/package.mk:97: recipe for target 'internal-install' failed
make: *** [internal-install] Error 1
```
