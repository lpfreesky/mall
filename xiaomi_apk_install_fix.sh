#!/bin/bash

echo "=== 小米手机APK安装修复脚本 ==="
echo "请确保手机已连接并开启USB调试"
echo ""

# 检查设备连接
echo "1. 检查设备连接..."
adb devices

echo ""
echo "2. 如果设备显示为 'unauthorized'，请在手机上确认USB调试授权"
echo ""

# 设置允许未知来源安装
echo "3. 设置允许未知来源安装..."
adb shell settings put global install_non_market_apps 1
adb shell settings put secure install_non_market_apps 1

# 禁用软件包验证器
echo "4. 临时禁用软件包验证器..."
adb shell settings put global package_verifier_enable 0
adb shell settings put global verifier_verify_adb_installs 0

echo ""
echo "5. 现在尝试安装APK文件："
echo "   使用命令: adb install -r your_app.apk"
echo "   或者: adb install -r -t your_app.apk"
echo ""

echo "6. 如果仍然失败，尝试强制安装："
echo "   adb install -r -d -g your_app.apk"
echo ""

echo "=== 小米手机特殊说明 ==="
echo "- 确保关闭了MIUI优化"
echo "- 确保开启了USB安装选项"
echo "- 某些MIUI版本可能需要重启手机后生效"
echo "- 如果是开发应用，可以尝试使用调试签名"