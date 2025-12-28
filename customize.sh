[ ! "$MODPATH" ] && MODPATH=${0%/*}
#get Android version
android_version=$(getprop ro.build.version.release)
alias sh='/system/bin/sh'
a=$(getprop ro.system.build.version.release)
var_device="`getprop ro.product.device`"

# 【本模块纯参数调音，如需引用调音文件请注明作者】
#sleep 0.4
ui_print "⚠注意⚠：【请仔细查看下面的内容】"
ui_print "————————本模块适用于KSU————————"
sleep 1.0
ui_print "————————————————————————————————————————————————————"
ui_print "本模块基于@NikoRur_QwQRuaa的小米平板5音质模块beta1进行二改"
ui_print "加入部分Huber_HaYu对小米平板5(5Pro)的扬声器增强模块2.1的内容"
ui_print "本模块属于多模块合并整合版，可能存在部分bug，请见谅"
ui_print "加入广泛适配版，适配更多机型(目前适配机型为小米平板5/5Pro/5Pro12.4/6/6Pro/6max/6SPro/7/7Pro以及红米平板Pro/SE)"
ui_print "因为小米平板7/7Pro和红米PadPro因为HyperOS的BL解锁原因，目前属于预适配。"
ui_print "————————————————————————————————————————————————————"
ui_print "本人初次接触模块，可能有部分问题，可以测试指出"
ui_print "————————————————————————————————————————————————————"
ui_print "以下为原模块内容"
sleep 2.0
ui_print "⚠注意⚠：【本模块为纯参数调音，如需引用调音文件请注明作者】"
#sleep 1.5
ui_print "————————————————————————————————————————————————————"
ui_print " 本模块内的overlay参数、Virtual Bass，通路等文件的修改By"
ui_print "-------@NikoRur_QwQRuaa @Huber_HaYu @是Ray酱呀 @无名搞机佬(白井黑子)---------"
ui_print "————————————————————————————————————————————————————"

optional_audio() {
    
    sleep 1.0
    # Frist Boost GO！(/≧▽≦)/~
    setprop dolby.bass default
    setprop dolby.virtualizer 1
    #sleep 0.7
    cp -f $MODPATH/Dax_Dolby/optionals.prop /storage/emulated/0
}

install_modlues() {

ui_print "————————————————————————————————————————————————————"

# 音频文件加载策略(方便以后引入更多机型)

case "$var_device" in
    "nabu")
        ui_print "正在载入小米平板5(nabu)音频文件"
        cp -rf $MODPATH/vendorflies/nabu/mixer_paths_overlay_static.xml $MODPATH/system/vendor/etc/      
        cp -rf $MODPATH/vendorflies/nabu/mixer_paths_tavil.xml $MODPATH/system/vendor/etc/                       
        cp -rf $MODPATH/vendorflies/nabu/lib $MODPATH/system/vendor/
        cp -rf $MODPATH/vendorflies/nabu/lib64 $MODPATH/system/vendor/                     
        cp -rf $MODPATH/vendorflies/nabu/audio/audio_policy_configuration.xml $MODPATH/system/vendor/etc/audio/audio_policy_configuration.xml
        cp -rf $MODPATH/vendorflies/nabu/audio_policy_configuration.xml $MODPATH/system/vendor/etc/audio_policy_configuration.xml
        cp -rf $MODPATH/vendorflies/nabu/audio_io_policy.conf $MODPATH/system/vendor/etc/audio_io_policy.conf     
        cp -rf $MODPATH/vendorflies/nabu/dax-default.xml $MODPATH/system/vendor/etc/dolby/dax-default.xml                             
        HarmanX  
        sleep 0.5                             
        sh $MODPATH/bin.sh
        sleep 0.5
        HighRates_nabu      
        sleep 0.5
        ui_print "Xiaomi pad 5 (nabu)文件已载入成功"        
        ;;
    "dagu")
        ui_print "正在载入小米平板5Pro12.4(dagu)音频文件"
        cp -rf $MODPATH/vendorflies/dagu/mixer_paths_overlay_static.xml $MODPATH/system/vendor/etc/
        cp -rf $MODPATH/vendorflies/dagu/system.prop $MODPATH/system.prop
        cp -rf $MODPATH/vendorflies/dagu/lib $MODPATH/system/vendor/
        cp -rf $MODPATH/vendorflies/dagu/lib64 $MODPATH/system/vendor/            
        cp -rf $MODPATH/vendorflies/libSuperSensor_skel.so $MODPATH/system/vendor/lib/rfsa/adsp   
        cp -rf $MODPATH/vendorflies/dagu/mixer_paths.xml $MODPATH/system/vendor/etc/        
        cp -rf $MODPATH/vendorflies/dagu/audio_platform_info.xml $MODPATH/system/vendor/etc/        
        cp -rf $MODPATH/vendorflies/dagu/audio_platform_info_intcodec.xml $MODPATH/system/vendor/etc/        
        cp -rf $MODPATH/vendorflies/dagu/audio_platform_info_qrd.xml $MODPATH/system/vendor/etc/        
        cp -rf $MODPATH/vendorflies/dagu/mixer_paths_qrd.xml $MODPATH/system/vendor/etc/     
        cp -rf $MODPATH/vendorflies/dagu/audio_configs_stock.xml $MODPATH/system/vendor/etc/audio_configs_stock.xml      
        cp -rf $MODPATH/vendorflies/dagu/audio_configs.xml $MODPATH/system/vendor/etc/audio_configs.xml                             
        cp -rf $MODPATH/BIN/124/firmware $MODPATH/system/vendor
        cp -rf $MODPATH/vendorflies/dagu/dax-default.xml $MODPATH/system/vendor/etc/dolby/dax-default.xml         
        HarmanX
        LowVolumes
        sh $MODPATH/low.sh     
        firmware_dsp              
        sleep 0.5
        ui_print "Xiaomi Pad 5 Pro 12.4 (dagu)文件已载入成功"
        ;;
    "enuma")
        ui_print "正在载入小米平板5Pro 5G(enuma)音频文件"
        cp -rf $MODPATH/vendorflies/enuma/mixer_paths_overlay_static.xml $MODPATH/system/vendor/etc/
        cp -rf $MODPATH/vendorflies/enuma/system.prop $MODPATH/system.prop  
        cp -rf $MODPATH/vendorflies/enuma/audio_configs_stock.xml $MODPATH/system/vendor/etc/audio_configs_stock.xml      
        cp -rf $MODPATH/vendorflies/enuma/audio_configs.xml $MODPATH/system/vendor/etc/audio_configs.xml  
        cp -rf $MODPATH/vendorflies/enuma/dax-default.xml $MODPATH/system/vendor/etc/dolby/dax-default.xml
        sh $MODPATH/low.sh      
        HarmanX
        LowVolumes
        sleep 0.5
        firmware_test        
        ui_print "Xiaomi Pad 5 Pro 5G (enuma)文件已载入成功"
        ;; 
    "elish")
    #elish与enuma同文件
        ui_print "正在载入小米平板5Pro(elish)音频文件"
        cp -rf $MODPATH/vendorflies/enuma/mixer_paths_overlay_static.xml $MODPATH/system/vendor/etc/
        cp -rf $MODPATH/vendorflies/enuma/system.prop $MODPATH/system.prop  
        cp -rf $MODPATH/vendorflies/enuma/audio_configs_stock.xml $MODPATH/system/vendor/etc/audio_configs_stock.xml      
        cp -rf $MODPATH/vendorflies/enuma/audio_configs.xml $MODPATH/system/vendor/etc/audio_configs.xml   
        cp -rf $MODPATH/vendorflies/enuma/dax-default.xml $MODPATH/system/vendor/etc/dolby/dax-default.xml                    
        HarmanX
        LowVolumes
        sleep 0.5
        firmware_test
        sh $MODPATH/low.sh    
        sleep 0.5
        ui_print "Xiaomi Pad 5 Pro (elish)文件已载入成功"
        ;;
    "pipa")
        ui_print "正在载入小米平板6(pipa)音频文件"
        cp -rf $MODPATH/vendorflies/system.prop $MODPATH/system.prop      
        cp -rf $MODPATH/vendorflies/pipa/mixer_paths_overlay_static.xml $MODPATH/system/vendor/etc/        
        cp -rf $MODPATH/vendorflies/libSuperSensor_skel.so $MODPATH/system/vendor/lib/rfsa/adsp   
        cp -rf $MODPATH/vendorflies/pipa/audio_configs_stock.xml $MODPATH/system/vendor/etc/audio_configs_stock.xml      
        cp -rf $MODPATH/vendorflies/pipa/audio_configs.xml $MODPATH/system/vendor/etc/audio_configs.xml      
        cp -rf $MODPATH/vendorflies/pipa/audio_policy_configuration.xml $MODPATH/system/vendor/etc/audio_policy_configuration.xml      
        cp -rf $MODPATH/vendorflies/pipa/audio_io_policy.conf $MODPATH/system/vendor/etc/audio_io_policy.conf   
        cp -rf $MODPATH/vendorflies/pipa/audio/audio_policy_configuration.xml $MODPATH/system/vendor/etc/audio/audio_policy_configuration.xml 
        HarmanX     
        LowVolumes                    
        sleep 0.5
        ui_print "Xiaomi Pad 6 (pipa)文件已载入成功"
        ;;    
    "liuqin")
        ui_print "正在载入小米平板6Pro(liuqin)音频文件"
        rm -rf $MODPATH/system/vendor       
        cp -rf $MODPATH/vendorflies/liuqin/vendor $MODPATH/system
        cp -rf $MODPATH/vendorflies/system.prop $MODPATH/system.prop
        HarmanX
        firmware_dsp
        LowVolumes
        sleep 0.5
        ui_print "Xiaomi Pad 6 Pro (liuqin)文件已载入成功"
        ;;     
    #6spro暂时是云开的                            
    "sheng")
        ui_print "正在载入小米平板6SPro(sheng)音频文件"
        rm -rf $MODPATH/system/vendor       
        cp -rf $MODPATH/vendorflies/sheng/vendor $MODPATH/system
        cp -rf $MODPATH/vendorflies/system.prop $MODPATH/system.prop
        Harman_odm
        sleep 0.5
        ui_print "Xiaomi Pad 6S Pro (sheng)文件已载入成功"
        ;;        
    "yudi")
        ui_print "正在载入小米平板6Max(yudi)音频文件"
        rm -rf $MODPATH/system/vendor       
        cp -rf $MODPATH/vendorflies/yudi/vendor $MODPATH/system
        cp -rf $MODPATH/vendorflies/system.prop $MODPATH/system.prop
        cp -rf $MODPATH/vendorflies/yudi/odm $MODPATH
        cp -rf $MODPATH/vendorflies/yudi/post-fs-data.sh $MODPATH
        HarmanX
        firmware_dsp
        sleep 0.5
        ui_print "Xiaomi Pad 6 Max (yudi)文件已载入成功"
        ;;    
      #红米PadPro和PadPro5G同文件(预适配/云开)     
    "dizi")
        ui_print "正在载入红米平板Pro(dizi)音频文件"
        rm -rf $MODPATH/system/vendor       
        cp -rf $MODPATH/vendorflies/dizi/vendor $MODPATH/system
        cp -rf $MODPATH/vendorflies/system.prop $MODPATH/system.prop
        HarmanX
        sleep 0.5
        ui_print "REDMI Pad Pro (dizi)文件已载入成功"
        ;;        
    "ruan")
        ui_print "正在载入红米平板Pro 5G(ruan)音频文件"
        rm -rf $MODPATH/system/vendor       
        cp -rf $MODPATH/vendorflies/dizi/vendor $MODPATH/system
        cp -rf $MODPATH/vendorflies/system.prop $MODPATH/system.prop
        HarmanX
        sleep 0.5
        ui_print "REDMI Pad Pro 5G (ruan)文件已载入成功"
        ;;    
      #小米Pad7Pro和Pad7(预适配/云开)                    
    "muyu")
        ui_print "正在载入小米平板7Pro(muyu)音频文件"
        rm -rf $MODPATH/system/vendor       
        cp -rf $MODPATH/vendorflies/muyu/vendor $MODPATH/system
        cp -rf $MODPATH/vendorflies/system.prop $MODPATH/system.prop
        sleep 0.5
        ui_print "Xiaomi Pad 7 Pro (muyu)文件已载入成功"
        ;;                       
    "uke")
        ui_print "正在载入小米平板7(uke)音频文件"
        rm -rf $MODPATH/system/vendor       
        cp -rf $MODPATH/vendorflies/uke/vendor $MODPATH/system
        cp -rf $MODPATH/vendorflies/system.prop $MODPATH/system.prop
        sleep 0.5
        ui_print "Xiaomi Pad 7 (uke)文件已载入成功"
        ;; 
    #云开懂吧     
    "xun")
        ui_print "正在载入红米平板SE(xun)音频文件"
        rm -rf $MODPATH/system/vendor       
        cp -rf $MODPATH/vendorflies/xun/vendor $MODPATH/system
        cp -rf $MODPATH/vendorflies/system.prop $MODPATH/system.prop
        HarmanX
        sleep 0.5
        ui_print "REDMI Pad SE (xun)文件已载入成功"
        ;;                                                      
    *)
        ui_print "未识别的设备型号，载入通用版音频文件"
        rm -rf $MODPATH/system/vendor       
        cp -rf $MODPATH/vendorflies/else/vendor $MODPATH/system
        cp -rf $MODPATH/vendorflies/system.prop $MODPATH/system.prop
        sleep 0.5
        ui_print "通用版文件已载入成功"
        ;;                        
esac

# modules_to_remove 
modules_to_remove="MIPAD5PRO12.4SOUND MIPADSOUNDBROADFIT MiPad5_SoundBoostX MIPAD5OR5PRO12.4SOUND"

for module in $modules_to_remove; do
    case $module in
        "MIPAD5PRO12.4SOUND" | "MIPADSOUNDBROADFIT" | "MiPad5_SoundBoostX" | "MIPAD5OR5PRO12.4SOUND")
            if [ -d "/data/adb/modules/$module" ]; then
                sleep 0.5
                echo "检测到旧版本模块$module，正在自动为您删除"
                rm -rf "/data/adb/modules/$module"
            fi
            ;;
    esac
done

# ksu_check
if [ $KSU ]; then
    ui_print "检查到使用的是KSU"
    ui_print "⚠注意⚠：【请仔细查看下面的内容】"
    ui_print "————————————————————————————————————————————————————"
    ui_print "模块卸载失效"
    ui_print "如有旧版模块，请先将旧版模块自行卸载后再重启系统"    
    ui_print "感谢你的配合"
    
fi

ui_print "————————————————————————————————————————————————————"

sleep 0.5

}

HarmanX() {

#/Harman/ 和/HarmanEB/ 文件夹放置了部分微调的哈曼卡顿音频固件，仅供参考()
ui_print "请问是否需要引入哈曼卡顿音频固件(Beta)"
#实际是Canary…
ui_print "————————————————————————————————————————————————————"
ui_print "基于小米10S MIUI12.0.3版本进行微调，修复小米平板5Pro12.4在部分场景下无法发声的Bug(拓展870系列设备)"
ui_print "理论适配小米平板5/5Pro/5Pro12.4/6/6Pro/6Max和红米平板Pro/SE"
ui_print "————————————————————————————————————————————————————"
ui_print "如果需要 请按音量+键 如果不需要请按音量-"
ui_print "tips：引入版本为哈曼 x VirtualBass调音，可能存在部分特殊Bug"

key_click=""
    while [ "$key_click" = "" ]; do
        key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
        sleep 0.2
    done
    case "$key_click" in
        "KEY_VOLUMEUP")
        ui_print "已选择 替换为哈曼 x VirtualBass调音"
        cp -rf $MODPATH/Harman/misound_res_spk.bin $MODPATH/system/vendor/lib/rfsa/adsp/
        sleep 0.5
        ui_print "加载完成"
        ui_print "————————————————————————————————————————————————————"
        ui_print "目前可尝试关闭杜比音效，体验哈曼卡顿强力调音"
        ;;
        *)
            ui_print "已选择 不替换"
            ;;
    esac

}

Harman_odm() {

ui_print "————————————————————————————————————————————————————"
ui_print "请问是否需要引入哈曼卡顿音频固件(Beta)"
#实际是Canary…
ui_print "理论适配小米平板6SPro"
ui_print "————————————————————————————————————————————————————"
ui_print "如果需要 请按音量+键 如果不需要请按音量-"
ui_print "tips：引入版本为哈曼 x VirtualBass调音，可能存在部分特殊Bug"

key_click=""
    while [ "$key_click" = "" ]; do
        key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
        sleep 0.2
    done
    case "$key_click" in
        "KEY_VOLUMEUP")
        ui_print "已选择 替换为哈曼 x VirtualBass调音"
        cp -rf $MODPATH/Harman/odm $MODPATH
        cp -rf $MODPATH/Harman/post-fs-data.sh $MODPATH
        sleep 0.5
        ui_print "加载完成"
        ui_print "————————————————————————————————————————————————————"
        ui_print "目前可尝试关闭杜比音效，体验哈曼卡顿强力调音"
        ;;
        *)
            ui_print "已选择 不替换"
            ;;
    esac

}


LowVolumes() {

ui_print "————————————————————————————————————————————————————"
ui_print "请问是否需要抬高杜比基础输出音量？"
ui_print "输出音量的调高可能导致基础音量过大，可能对环境其他人造成影响"
ui_print "————————————————————————————————————————————————————"
ui_print "如果需要 请按音量+键 如果不需要请按音量-"
ui_print "————————————————————————————————————————————————————"

key_click=""
    while [ "$key_click" = "" ]; do
        key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
        sleep 0.2
    done
    case "$key_click" in
        "KEY_VOLUMEUP")
        ui_print "已选择 抬高输出音量"
        sleep 0.5
        ui_print "加载完成"
        ;;
        *)
        ui_print "已选择 不抬高"
        cp -rf $MODPATH/Low/dolby/dax-default.xml $MODPATH/system/vendor/etc/dolby/dax-default.xml
        cp -rf $MODPATH/Low/dolby/normal.xml $MODPATH/EQ_Dolby/normal.xml
        cp -rf $MODPATH/Low/dolby/action.sh $MODPATH/action.sh
        ;;
    esac
}

HighRates_nabu() {

ui_print "————————————————————————————————————————————————————"
ui_print "请问是否抬高深度缓冲区(Deep Buffer)的音频采样率并优化输出的音频比特率？"
ui_print "————————————————————————————————————————————————————"
ui_print "音量+ 抬高采样 音量- 不抬高采样 "

key_click=""
    while [ "$key_click" = "" ]; do
        key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
        sleep 0.2
    done
    case "$key_click" in
        "KEY_VOLUMEUP")
        ui_print "已选择 抬高采样"
        cp -rf $MODPATH/vendorflies/nabu/HighRates/audio/audio_policy_configuration.xml $MODPATH/system/vendor/etc/audio/audio_policy_configuration.xml
        cp -rf $MODPATH/vendorflies/nabu/HighRates/audio_policy_configuration.xml $MODPATH/system/vendor/etc/audio_policy_configuration.xml
        cp -rf $MODPATH/vendorflies/nabu/HighRates/audio_io_policy.conf $MODPATH/system/vendor/etc/audio_io_policy.conf     
        sleep 0.5
        ui_print "加载完成"
        ;;
        *)
            ui_print "已选择 不抬高采样"
        ui_print "加载完成"
            ;;
    esac

}

firmware_dsp() {

ui_print "————————————————————————————————————————————————————"
ui_print "请问是否选择优化扬声器功放DSP"
ui_print "音量+ 需要 音量- 不需要"
ui_print "————————————————————————————————————————————————————"
ui_print "本修改可以换取更优秀的输出质量，但可能会导致momo检测出magisk，请谨慎选择"
ui_print "————————————————————————————————————————————————————"
ui_print "音量+ 需要 音量- 不需要"

key_click=""
    while [ "$key_click" = "" ]; do
        key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
        sleep 0.2
    done
    case "$key_click" in
        "KEY_VOLUMEUP")
        ui_print "已选择 需要"
        sleep 0.5
        ;;
        *)
        ui_print "已选择 不需要"
        rm -rf $MODPATH/system/vendor/firmware
            ;;
    esac
    
ui_print "————————————————————————————————————————————————————"

}

firmware_test() {
ui_print "————————————————————————————————————————————————————"
ui_print "请问亲爱的小米平板5Pro用户需要哪种音频放大器DSP固件(测试版)?"
ui_print "基于官方修改版(抬高总采样/客户端版本+抬高低频单元放大器增益) / 原版文件"
ui_print "音量+ 修改版 音量- 原版"
ui_print "请点按音量加减键完成选择"
ui_print "————————————————————————————————————————————————————"

key_click=""
while [ "$key_click" = "" ]; do
    key_click="$(getevent -qlc 1 | awk '{ print$3 }' | grep 'KEY_')"
    sleep 0.2
done

case "$key_click" in
    "KEY_VOLUMEUP")
        ui_print "已选择 修改版"
        cp -rf $MODPATH/BIN/5Pro/firmware $MODPATH/system/vendor        
        ui_print "加载修改版完毕"
        ;;
    "KEY_VOLUMEDOWN")
        ui_print "已选择 原版"
        ui_print "加载原版完毕"
        ;;
esac

}

set_permissions() {
    set_perm_recursive $MODPATH 0 0 0755 0644
# 设置 /system/vendor/etc 的权限和标签
    set_perm_recursive $MODPATH/system/vendor/etc 0 0 0755 0644 u:object_r:vendor_configs_file:s0
# 设置 /system/vendor/etc/audio 文件夹的权限和标签
    set_perm_recursive $MODPATH/system/vendor/etc/audio 0 0 0755 0644 u:object_r:vendor_configs_file:s0
# 设置 /system/vendor/etc/audio/audio_policy_configuration.xml 文件的权限和标签    
    set_perm $MODPATH/system/vendor/etc/audio/audio_policy_configuration.xml 0 0 0644 u:object_r:vendor_configs_file:s0
# 设置 /system/vendor/odm/etc 文件夹的权限和标签    
    set_perm_recursive $MODPATH/system/vendor/odm/etc 0 0 0755 0644 u:object_r:vendor_configs_file:s0
# 设置 $MODPATH/system/vendor/firmware 目录的权限和标签
    set_perm_recursive $MODPATH/system/vendor/firmware 0 0 0755 0644 u:object_r:vendor_firmware_file:s0
# 设置 $MODPATH/system/vendor/lib 目录的权限和标签
    set_perm_recursive $MODPATH/system/vendor/lib 0 0 0755 0755 u:object_r:same_process_hal_file:s0
# 设置 $MODPATH/system/vendor/lib64 目录的权限和标签
    set_perm_recursive $MODPATH/system/vendor/lib64 0 0 0755 0755 u:object_r:same_process_hal_file:s0
}

version_check() {

if [ $(echo "$android_version >= 13" | bc) -eq 1 ]; then
    #Android13 and above
    ui_print "当前安卓版本为Android 13及以上，使用原生DSP调音"
else
    #Android12 and below
    ui_print "当前安卓版本为Android 12以下，使用高通配置文件"
        rm -rf "$MODPATH"/system/vendor/etc/audio_policy_engine_stream_volumes_mi.xml    
fi

}
 

#Old MiSound Install
ui_print "请问是否需要替换掉新版音质音效"
ui_print "如果需要 请按音量+键 如果不需要请按音量-"
ui_print "tips：替换旧版音质音效可能会导致关闭杜比后小米音效均衡器无法调用甚至可能会导致音质音效闪退"
key_click=""
    while [ "$key_click" = "" ]; do
        key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
        sleep 0.2
    done
    case "$key_click" in
        "KEY_VOLUMEUP")
        ui_print "已选择 替换新版音质音效"        
        cp -rf $MODPATH/Others/product/ $MODPATH/system
        ;;
        *)
        ui_print "已选择 不替换新版音质音效"
        ;;
    esac
    rm -rf $MODPATH/Others
    
Cache_Clean() {

ui_print "————————————————————————————————————————————————————"
ui_print "正在清理缓存..."

rm -rf $MODPATH/vendorflies
rm -rf $MODPATH/BIN
rm -rf $MODPATH/Low
rm -rf $MODPATH/Harman
rm -rf $MODPATH/HarmanEB
rm -rf $MODPATH/low.sh
rm -rf $MODPATH/bin.sh

rm -rf /data/system/package_cache
rm -rf /data/dalvik-cache
rm -rf /data/cache

ui_print "————————————————————————————————————————————————————"
ui_print "加载完成，重启以体验模块"

}    
    
optional_audio
print_modname
install_modlues
version_check
set_permissions
Cache_Clean