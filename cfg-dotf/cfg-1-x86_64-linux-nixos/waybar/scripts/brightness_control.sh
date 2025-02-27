#!/bin/sh
# ~/.config/waybar/scripts/brightness_control.sh
DEVICE="/sys/class/backlight/amdgpu_bl0"
MAX=$(cat "$DEVICE/max_brightness")
CURRENT=$(cat "$DEVICE/brightness")
STEP=$((MAX / 20))  # 5% 步长

case $1 in
  up)
    NEW=$((CURRENT + STEP))
    ;;
  down)
    NEW=$((CURRENT - STEP))
    ;;
  *)
    exit 0
    ;;
esac

# 限制范围
NEW=$((NEW > MAX ? MAX : NEW < 1 ? 1 : NEW))
echo $NEW | sudo tee "$DEVICE/brightness" > /dev/null

# 发送通知
PERCENT=$((NEW * 100 / MAX))
notify-send "亮度 $PERCENT%" -h string:x-canonical-private-synchronous:brightness