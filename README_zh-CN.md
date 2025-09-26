 [English](./README.md)  |中文

# Remote ADB

本模块用于 **开机自动启用 ADB over TCP (端口 5555)**，方便通过局域网或远程网络调试 Android 设备。

### 功能
- 系统启动后自动启用 ADB over TCP
- 支持手动启用 / 关闭 / 切换状态

### 使用方法
1. 安装模块并重启设备
2. 系统启动后，ADB over TCP 会自动启用（端口 5555）
3. 可通过命令手动控制：

```
su -c sh /data/adb/modules/magisk-remote-adb/action.sh enable # 开启
su -c sh /data/adb/modules/magisk-remote-adb/action.sh disable # 关闭
su -c sh /data/adb/modules/magisk-remote-adb/action.sh # 自动切换
```

4. 运行按钮

  切换adb运行状态，开启或关闭adb。

 - 开启：查询设备IP，并在555端口开启adb
 - 关闭：关闭已经开启的adb


5. 在电脑上连接设备：
```
adb connect <设备IP>:5555
adb connect <设备IP>
```
