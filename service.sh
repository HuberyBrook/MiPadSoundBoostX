#!/system/bin/sh
MODDIR=${0%/*}
# 等待系统完全启动
while [ "$(getprop sys.boot_completed)" != "1" ]; do
  sleep 1
done

#获取安卓版本
a=$(getprop ro.system.build.version.release)
#获取设备型号
var_device="$(getprop ro.product.device | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')"
#获取系统版本
os_version=$(getprop ro.system.build.version.incremental)
#获取内核版本
kernel=$(uname -r)

#存储module.prop打印信息
D=$(echo "基于NikoRur_QwQRuaa的音质模块进行二改，适用于小米平板的音效优化,可用于KSU，目前已适配小米平板5/5Pro(5G)/5Pro12.4/6/6Pro/6Max，预适配红米平板Pro/SE与小米平板6SPro/7/7Pro，当前平板型号为${var_device}，系统版本为安卓${a}_${os_version}，内核版本为${kernel}。")

#删除旧介绍
sed -i '/^description=/d' $MODDIR/module.prop
#添加新介绍
echo "description=${D}" >>$MODDIR/module.prop

#开机显示通知
su -lp 2000 -c "cmd notification post -S bigtext -t 'MiPadSoundBoostX' 'Tag' '感谢使用MiPadSoundBoostX,滑动以删除本通知。'"