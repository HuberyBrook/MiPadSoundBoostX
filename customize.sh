[ ! "$MODPATH" ] && MODPATH=${0%/*}
#get Android version
android_version=$(getprop ro.build.version.release)
alias sh='/system/bin/sh'
a=$(getprop ro.system.build.version.release)
var_device="`getprop ro.product.device`"

ui_print "————————————————————————————————————————————————————"
magisk_path=/data/adb/modules/
module_id=$(grep_prop id $MODPATH/module.prop)
has_been_patch_privapp_permissions_product=0
get_build_characteristics=$(getprop ro.build.characteristics)

key_check() {
  while true; do
    key_check=$(/system/bin/getevent -qlc 1)
    key_event=$(echo "$key_check" | awk '{ print $3 }' | grep 'KEY_')
    key_status=$(echo "$key_check" | awk '{ print $4 }')
    if [[ "$key_event" == *"KEY_"* && "$key_status" == "DOWN" ]]; then
      keycheck="$key_event"
      break
    fi
  done
  while true; do
    key_check=$(/system/bin/getevent -qlc 1)
    key_event=$(echo "$key_check" | awk '{ print $3 }' | grep 'KEY_')
    key_status=$(echo "$key_check" | awk '{ print $4 }')
    if [[ "$key_event" == *"KEY_"* && "$key_status" == "UP" ]]; then
      break
    fi
  done
}

if [[ "$KSU" == "true" ]]; then
  ui_print "- KernelSU 用户空间当前的版本号: $KSU_VER_CODE"
  ui_print "- KernelSU 内核空间当前的版本号: $KSU_KERNEL_VER_CODE"
  
  # 检查 KernelSU 版本是否大于 30000
  if [ "$KSU_VER_CODE" -gt 30000 ]; then
    ui_print "- 检测到 KernelSU 版本高于 30000，检查元模块状态..."
    # 检查 /data/adb/metamodule/ 下是否有模块存在 metamodule=1
    has_metamodule=false
    metamodule_disabled=false
    module_dir="/data/adb/metamodule/"
    if [ -f "${module_dir}module.prop" ]; then
      if grep -q "^metamodule=1" "${module_dir}module.prop"; then
        has_metamodule=true
        metamodule_name=$(grep_prop name "${module_dir}module.prop")
        # 检查元模块是否存在 disable 文件
        if [ -f "${module_dir}disable" ]; then
          metamodule_disabled=true
          ui_print "- 发现元模块（metamodule=1）：${metamodule_name}"
          ui_print "  ⚠ 该元模块已被禁用，请启用后再使用本模块！"
        else
          ui_print "- 发现元模块（metamodule=1）：${metamodule_name}，状态正常。"
        fi
      fi
    fi
    
    if [ "$has_metamodule" = false ]; then
      ui_print "*********************************************"
      ui_print "- 你的 KernelSU 版本高于 30000，但未检测到任何元模块！"
      ui_print "- 该模块需要元模块才能正常运行，是否强制安装？"
      ui_print "  音量+ ：强制安装"
      ui_print "  音量- ：取消安装"
      ui_print "*********************************************"
      key_check
      if [[ "$keycheck" == "KEY_VOLUMEUP" ]]; then
        ui_print "*********************************************"
        ui_print "- 你选择强制安装，模块可能无法正常运行！！！"
        ui_print "*********************************************"
      else
        ui_print "*********************************************"
        ui_print "- 安装已取消。"
        abort "*********************************************"
      fi
    else
      ui_print "- 元模块检查通过，将继续安装。"
    fi
  fi

  if [ "$KSU_VER_CODE" -lt 11551 ]; then
    ui_print "*********************************************"
    ui_print "- 请更新 KernelSU 到 v0.8.0+ ！"
    abort "*********************************************"
  fi
elif [[ "$APATCH" == "true" ]]; then
  ui_print "- APatch 当前的版本号: $APATCH_VER_CODE"
  ui_print "- APatch 当前的版本名: $APATCH_VER"
  ui_print "- KernelPatch 用户空间当前的版本号: $KERNELPATCH_VERSION"
  ui_print "- KernelPatch 内核空间当前的版本号: $KERNEL_VERSION"
  if [ "$APATCH_VER_CODE" -lt 10568 ]; then
    ui_print "*********************************************"
    ui_print "- 请更新 APatch 到 10568+ ！"
    abort "*********************************************"
  fi
else
  # Magisk 最低版本从 26000 改为 20400 (20.4)
  ui_print "- Magisk 版本: $MAGISK_VER_CODE"
  if [ "$MAGISK_VER_CODE" -lt 20400 ]; then
    ui_print "*********************************************"
    ui_print "- 模块当前仅支持 Magisk 20.4+ 请更新 Magisk！"
    ui_print "- 您可以选择继续安装，但可能导致部分模块功能无法正常使用，是否继续？"
    ui_print "  音量+ ：已了解，继续安装"
    ui_print "  音量- ：否"
    ui_print "*********************************************"
    key_check
    if [[ "$keycheck" == "KEY_VOLUMEUP" ]]; then
      ui_print "*********************************************"
      ui_print "- 你选择无视Magisk低版本警告，可能导致部分模块功能无法正常使用！！！"
      ui_print "*********************************************"
    else
      ui_print "*********************************************"
      ui_print "- 请更新 Magisk 到 20.4+ ！"
      abort "*********************************************"
    fi
  fi
fi
ui_print "————————————————————————————————————————————————————"

print_modname() {

# 【本模块纯参数调音，如需引用调音文件请注明作者】
#sleep 0.4
    ui_print "  ⚠注意⚠：【请仔细查看下面的内容】"
    sleep 1.0
    ui_print "————————————————————————————————————————————————————"
    ui_print "  本模块仅适用于小米平板 8 Pro (piano)"
    ui_print "————————————————————————————————————————————————————"
    sleep 1.0
    ui_print "  ⚠注意⚠：【本模块为纯参数调音，如需引用调音文件请注明作者】"
    ui_print "  ⚠注意⚠：【本模块调音仅对杜比沉浸声进行了修改】"
#sleep 1.5
    ui_print "————————————————————————————————————————————————————"
    ui_print "  本模块内的overlay参数、Virtual Bass，通路等文件的修改By"
    ui_print "  -------@是Ray酱呀 @Hubery_Brook(Gerose)---------"
}

hires_dep_out() {

    ui_print "————————————————————————————————————————————————————"
    ui_print "  请问是否抬高深度缓冲输出的采样率与比特率（最高浮点192khz）"
    ui_print "  抬高采样率配置可能导致部分在 CPU 负载过高时，启用此项有可能导致咔哒声"
    ui_print "  包括不仅限于系统通知，Winplay中的Steam模拟器等"
    ui_print "————————————————————————————————————————————————————"
    ui_print "  音量+ ：已了解，需要"
    ui_print "  音量- ：不需要"
    ui_print "————————————————————————————————————————————————————"

    key_click=""
        while [ "$key_click" = "" ]; do
            key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
            sleep 0.2
        done
        case "$key_click" in
            "KEY_VOLUMEUP")
            ui_print "- 已选择 需要"
            sleep 0.5
            ;;
            *)
            ui_print "- 已选择 不需要"
            cp -rf $MODPATH/common/vendor/audio_module_config_primary.xml $MODPATH/system/vendor/etc/audio/audio_module_config_primary.xml
            cp -rf $MODPATH/common/vendor/audio_policy_configuration.xml $MODPATH/system/vendor/etc/audio_policy_configuration.xml
            cp -rf $MODPATH/common/odm/audio_module_config_primary.xml $MODPATH/odm/etc/audio/audio_module_config_primary.xml
            cp -rf $MODPATH/common/odm/vts/audio_module_config_primary.xml $MODPATH/odm/etc/audio/vts/audio_module_config_primary.xml
            sleep 0.5
            ;;
        esac
    
    ui_print "————————————————————————————————————————————————————"

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

Cache_Clean() {

    ui_print "————————————————————————————————————————————————————"
    ui_print "  正在清理缓存..."

    rm -rf /data/system/package_cache

    ui_print "  加载完成，重启以体验模块"
    ui_print "————————————————————————————————————————————————————"
}
    
print_modname
hires_dep_out
set_permissions
Cache_Clean