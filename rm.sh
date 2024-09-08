#!/bin/sh
GKI_ROOT=$(pwd)
if test -d "$GKI_ROOT/common/drivers"; then
    DRIVER_DIR="$GKI_ROOT/common/drivers"
elif test -d "$GKI_ROOT/drivers"; then
    DRIVER_DIR="$GKI_ROOT/drivers"
else
    echo '[ERROR] "drivers/" directory not found.'
    exit 127
fi

DRIVER_MAKEFILE=$DRIVER_DIR/Makefile
DRIVER_KCONFIG=$DRIVER_DIR/Kconfig

# 删除符号链接
rm "$DRIVER_DIR/kernelsu"

# 从Makefile中删除kernelsu相关条目
sed -i '/kernelsu/d' "$DRIVER_MAKEFILE"

# 从Kconfig中删除kernelsu相关条目
sed -i '/drivers\/kernelsu\/Kconfig/d' "$DRIVER_KCONFIG"

# 删除KernelSU目录
rm -rf "$GKI_ROOT/KernelSU"
