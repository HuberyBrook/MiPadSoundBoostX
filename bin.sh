[ ! "$MODPATH" ] && MODPATH=${0%/*}

echo "————————————————————————————————————————————————————"
echo "请问亲爱的小米平板5用户需要哪种音频放大器DSP固件?"
echo "移植5Pro12.4版DSP文件(不容易爆音，安卓12以下用户慎选) / 原版DSP文件(低音更足，容易爆音)"
echo "音量+ 移植版 音量- 原版"
echo "请点按音量加减键完成选择"
echo "————————————————————————————————————————————————————"

key_click=""
while [ "$key_click" = "" ]; do
    key_click="$(getevent -qlc 1 | awk '{ print$3 }' | grep 'KEY_')"
    sleep 0.2
done

case "$key_click" in
    "KEY_VOLUMEUP")
        echo "已选择 移植版"
        cp -rf $MODPATH/BIN/124/firmware $MODPATH/system/vendor        
        echo "加载移植版完毕"
        ;;
    "KEY_VOLUMEDOWN")
        echo "已选择 原版"
        cp -rf $MODPATH/BIN/5/firmware $MODPATH/system/vendor
        echo "加载原版完毕"
        ;;
esac

sleep 0.2
