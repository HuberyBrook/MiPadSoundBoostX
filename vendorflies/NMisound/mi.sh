[ ! "$MODPATH" ] && MODPATH=${0%/*}

echo "————————————————————————————————————————————————————"
echo "请问是否需要禁用米音（实验性）"
echo "如果需要 请按音量+键 如果不需要请按音量-"
echo "tips：禁用米音会导致小米音效部分无法使用"
echo "————————————————————————————————————————————————————"

key_click=""
    while [ "$key_click" = "" ]; do
        key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
        sleep 0.2
    done
    case "$key_click" in
        "KEY_VOLUMEUP")
        echo "已选择 禁用米音"        
        cp -rf $MODPATH/vendorflies/NMisound/system.prop $MODPATH/system.prop
        cp -rf $MODPATH/vendorflies/NMisound/audio_effects.xml $MODPATH/system/vendor/etc/audio_effects.xml        
        ;;
        *)
        echo "已选择 不禁用"
        ;;
    esac

sleep 0.2