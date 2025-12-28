#!/system/bin/sh

#post-fs-data.sh
#Overlay Test

MODDIR=${0%/*}
mount --bind $MODDIR/odm/etc/dolby/dax-default.xml /odm/etc/dolby/dax-default.xml