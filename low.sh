[ ! "$MODPATH" ] && MODPATH=${0%/*}
 #Low Power Mode Select
echo ————————————————————————————————————————————————————
echo "请问是否切换低功耗模式"
echo "如果需要 请按音量+键 如果不需要请按音量-"
echo ————————————————————————————————————————————————————
echo "因为 +原神+ 和部分软件的特殊性，极其建议切换为低功耗模式( + ）"
echo "tips：低功耗模式会降低音频采样与比特率。"
echo ————————————————————————————————————————————————————


key_click=""
    while [ "$key_click" = "" ]; do
        key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
        sleep 0.2
    done
    case "$key_click" in
        "KEY_VOLUMEUP")
        echo "已选择 切换低功耗模式" 
            cp -rf $MODPATH/Low/r_submix_audio_policy_configuration.xml $MODPATH/system/vendor/etc/r_submix_audio_policy_configuration.xml               
            cp -rf $MODPATH/Low/usb_audio_policy_configuration.xml $MODPATH/system/vendor/etc/usb_audio_policy_configuration.xml               
            cp -rf $MODPATH/Low/audio/audio_policy_configuration.xml $MODPATH/system/vendor/etc/audio/audio_policy_configuration.xml
            cp -rf $MODPATH/Low/audio_policy_configuration.xml $MODPATH/system/vendor/etc/audio_policy_configuration.xml
            cp -rf $MODPATH/Low/audio_io_policy.conf $MODPATH/system/vendor/etc/audio_io_policy.conf              
        sleep 1.0
        ;;
        *)
        echo "已选择 不切换低功耗模式"
        echo "如若发现无法解决的bug，建议选择低功耗模式"
        ;;
    esac
    
    sleep 0.5