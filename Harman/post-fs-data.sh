#!/system/bin/sh

#post-fs-data.sh
#Overlay Test

MODDIR=${0%/*}
mount --bind $MODDIR/odm/etc/audio/misound_res_spk.bin /odm/etc/audio/misound_res_spk.bin
mount --bind $MODDIR/odm/etc/audio/misound_res_spk4ch.bin /odm/etc/audio/misound_res_spk4ch.bin