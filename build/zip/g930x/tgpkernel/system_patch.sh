#!/sbin/sh
# Created by tkkg1994, modified by ambasadii and djb77

# Remove wrong build.prop entries (@Tkkg1994)
sed -i /timaversion/d /system/build.prop
sed -i /security.mdpp.mass/d /system/build.prop
sed -i /ro.hardware.keystore/d /system/build.prop

# Setting correct fingerprint files (@Tkkg1994)
rm -rf /system/app/TuiService /system/app/mcRegistry
rm -f /system/vendor/lib/libsecure_storage.so
rm -f /system/vendor/lib/libsecure_storage_jni.so
rm -f /system/vendor/lib64/libsecure_storage.so
rm -f /system/vendor/lib64/libsecure_storage_jni.so

# Remvoe old PersonalPageService APK
rm -rf /system/priv-app/PersonalPageService

# Install wavelock.sh if SuperSU is present (@ambasadii)
if [ -e /su/su.d/97wakelock ]; then
	chown 0:0 /su/su.d/97wakelock
	chmod 700 /su/su.d/97wakelock
else	
	cp /tmp/tgpkernel/97wakelock /su/su.d/97wakelock
	chown 0:0 /su/su.d/97wakelock
	chmod 700 /su/su.d/97wakelock
fi

# Install wavelock.sh if PHH Superuser is present (@ambasadii)
if [ -e /magisk/phh/su.d/97wakelock ]; then
	chown 0:0 /magisk/phh/su.d/97wakelock
	chmod 755 /magisk/phh/su.d/97wakelock
else
	mkdir /magisk/phh/su.d
	find /magisk/phh/su.d -type d -exec chmod 755 {} \;
	cp /tmp/tgpkernel/97wakelock /magisk/phh/su.d/97wakelock
	chown 0:0 /magisk/phh/su.d/97wakelock
	chmod 755 /magisk/phh/su.d/97wakelock
fi

