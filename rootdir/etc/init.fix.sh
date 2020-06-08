#!/system/bin/sh
# suggested by Jasonrr in case if /data/dalvik-cache/arm/system@framework@boot.art
# when not present may cause problems after wiping ART cache

ART_FILE=/data/dalvik-cache/arm/system@framework@boot.art
OAT_FILE=/data/dalvik-cache/arm/system@framework@boot.oat

if [ -f $ART_FILE ]; then
	echo $ART_FILE file exists
else
	mkdir -p /data/dalvik-cache/arm
	ln -sf /system/framework/arm/boot.art /data/dalvik-cache/arm/system@framework@boot.art
	chmod -R 777 /data/dalvik-cache
	chmod -R 777 /data/dalvik-cache/arm
	chown 1000.1000 /data/dalvik-cache
	chown 1000.1000 /data/dalvik-cache/arm
fi;

if [ -f $OAT_FILE ]; then
	echo $OAT_FILE file exists
else
	ln -sf /system/framework/arm/boot.oat /data/dalvik-cache/arm/system@framework@boot.oat
fi
