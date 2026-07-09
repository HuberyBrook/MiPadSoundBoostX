#!/system/bin/sh

#post-fs-data.sh
#Overlay Test

MODDIR=${0%/*}
bind_tree() {
    local src_root="$1"
    local dst_root="$2"

    [ -d "$src_root" ] || return 0

    find "$src_root" -type f | while IFS= read -r src; do
        rel="${src#$src_root/}"
        dst="${dst_root%/}/$rel"

        [ -e "$dst" ] || continue

        mount --bind "$src" "$dst"
        restorecon "$dst" 2>/dev/null
    done
}

bind_tree "$MODDIR/odm" "/odm"