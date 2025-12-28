MODDIR=${0%/*}
echo "————————————————————————————————————————————————————"
echo "杜比EQ修改进程启动"
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

sleep 2