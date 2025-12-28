MODDIR=${0%/*}
echo "————————————————————————————————————————————————————"
echo "杜比EQ修改进程启动"
echo "————————————————————————————————————————————————————"
echo "请问您是哪种音质音效?"
echo "MIUI版式音质音效(有场景切换) / HyperOS版式音质音效(无场景切换)"
echo "音量+ MIUI版式 音量- HyperOS版式"
echo "请点按音量加减键完成选择"
echo "————————————————————————————————————————————————————"

key_click=""
while [ "$key_click" = "" ]; do
    key_click="$(getevent -qlc 1 | awk '{ print$3 }' | grep 'KEY_')"
    sleep 0.2
done

case "$key_click" in
    "KEY_VOLUMEUP")
        echo "已选择 MIUI版式"
        echo "————————————————————————————————————————————————————"
        echo "正在修改杜比EQ"
        echo "请停止对屏幕进行操作"
        echo "————————————————————————————————————————————————————"
        update_path="/data/adb/modules/MiPadSoundBoostX"
        conf="/data/data/com.miui.misound/shared_prefs/mi_sound_preference.xml"
        pm disable com.miui.misound
        #pm clear com.miui.misound
        mkdir -p /data/data/com.miui.misound/shared_prefs
        cp -f $update_path/EQ_Dolby/normal.xml $conf
        pm enable com.miui.misound
        am start --windowingMode 5 -n com.miui.misound/com.miui.misound.dolby.DolbyEqActivity
        sleep 2
        am force-stop com.miui.misound
        am force-stop com.android.settings
        sleep 2
        echo "————————————————————————————————————————————————————"    
        echo "修改进程结束"
        echo "————————————————————————————————————————————————————"     
        ;;
    "KEY_VOLUMEDOWN")
        echo "已选择 HyperOS版式"
        echo "————————————————————————————————————————————————————"
        echo "正在修改杜比EQ"
        echo "请停止对屏幕进行操作"
        echo "————————————————————————————————————————————————————"
        update_path="/data/adb/modules/MiPadSoundBoostX"
        conf="/data/data/com.miui.misound/shared_prefs/mi_sound_preference.xml"
        pm disable com.miui.misound
        #pm clear com.miui.misound
        mkdir -p /data/data/com.miui.misound/shared_prefs
        cp -f $update_path/EQ_Dolby/mi_sound_preference.xml $conf
        pm enable com.miui.misound
        am start --windowingMode 5 -n com.miui.misound/com.miui.misound.dolby.DolbyEqActivity
        sleep 2
        am force-stop com.miui.misound
        am force-stop com.android.settings
        sleep 2
        echo "————————————————————————————————————————————————————"    
        echo "修改进程结束"
        echo "————————————————————————————————————————————————————"      
        ;;
esac


sleep 2