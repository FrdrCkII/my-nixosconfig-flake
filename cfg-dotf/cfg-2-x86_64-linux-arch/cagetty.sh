#!/bin/bash
# 启动 cage 并设置分辨率
cage ghostty &  # 后台启动 cage
sleep 2  # 等待 cage 初始化
wlr-randr --output HDMI-A-2 --mode 1920x1080@60Hz
