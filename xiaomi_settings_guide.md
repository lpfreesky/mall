# 小米手机APK安装问题完整解决指南

## MIUI版本特殊设置

### MIUI 12/13/14 设置步骤：

#### 1. 开发者选项设置
- 设置 → 更多设置 → 开发者选项
- 开启 **USB调试**
- 开启 **USB安装**
- 开启 **USB调试（安全设置）**
- **关闭 MIUI优化**（非常重要）

#### 2. 安全中心设置
- 安全中心 → 应用管理 → 权限
- 找到 **安装未知应用** 权限
- 为需要的应用（如文件管理器、开发工具）开启此权限

#### 3. 应用商店设置
- 应用商店 → 设置
- 关闭 **应用升级前验证**
- 关闭 **安装监控**

### 特殊情况处理：

#### 方法1：使用小米助手
1. 下载安装小米助手到电脑
2. 通过小米助手连接手机
3. 使用小米助手安装APK文件

#### 方法2：修改系统设置（需要ADB）
```bash
# 通过ADB修改系统设置
adb shell settings put global install_non_market_apps 1
adb shell settings put secure install_non_market_apps 1
adb shell settings put global package_verifier_enable 0
```

#### 方法3：临时禁用安全验证
```bash
# 安装时使用特殊参数
adb install -r -t -d your_app.apk
```

### 常见错误及解决方案：

1. **INSTALL_FAILED_USER_RESTRICTED**
   - 确保开启了"USB安装"选项
   - 关闭MIUI优化并重启

2. **INSTALL_FAILED_VERIFICATION_FAILURE**
   - 禁用包验证器
   - 使用 `-t` 参数允许测试APK

3. **设备显示unauthorized**
   - 撤销USB调试授权后重新授权
   - 检查USB数据线是否支持数据传输

### 注意事项：
- 不同MIUI版本界面可能略有差异
- 某些设置修改后需要重启手机
- 开发版MIUI限制可能更严格
- 建议使用原装数据线连接