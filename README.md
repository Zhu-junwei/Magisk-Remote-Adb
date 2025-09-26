 English | [中文](./README_zh-CN.md) 

# Remote ADB

This module **automatically enables ADB over TCP (port 5555) on boot**, making it easier to debug your Android device over LAN or remote networks.

### Features
- Automatically enables ADB over TCP after boot
- Supports manual enable / disable / toggle

### Usage
1. Install the module and reboot your device
2. After the system starts, ADB over TCP will be automatically enabled (port 5555)
3. You can manually control ADB with the following commands:

```
su -c sh /data/adb/modules/remote-adb/action.sh enable # Enable
su -c sh /data/adb/modules/remote-adb/action.sh disable # Disable
su -c sh /data/adb/modules/remote-adb/action.sh # Toggle
```

4. Run Button

   Toggle the ADB state to enable or disable ADB.

   - Enable: Queries the device IP and starts ADB on port 5555
   - Disable: Stops the currently running ADB service

5. Connect from your PC:

```
adb connect <device IP>:5555
adb connect <device IP>
```
