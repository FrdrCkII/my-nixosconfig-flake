#!/bin/sh

# 获取当前亮度（需要先初始化）
get_brightness() {
    ddcutil getvcp 10 | awk '{print $4}'
}

# 设置步长
STEP=5

case $1 in
  up)
    ddcutil setvcp 10 + $STEP
    ;;
  down)
    ddcutil setvcp 10 - $STEP
    ;;
  *)
    exit 0
    ;;
esac

# 发送通知
CURRENT=$(get_brightness)
notify-send "亮度 $CURRENT%" -h string:x-canonical-private-synchronous:brightness