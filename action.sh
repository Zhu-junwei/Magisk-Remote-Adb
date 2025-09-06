#!/system/bin/sh
MODDIR=${0%/*}

# 启动 ADB over TCP
enable_adb() {
  echo "🚫 ADB over TCP is currently: DISABLED"
  echo "⚡ Starting remote ADB on port 5555..."
  sleep 1
  setprop service.adb.tcp.port 5555
  stop adbd && start adbd
  echo "✅ ADB over TCP is now ENABLED"
  sed -i 's|^description=.*|description=🟢 Remote ADB is currently: ON (port 5555)|' $MODDIR/module.prop
}

# 关闭 ADB over TCP
disable_adb() {
  echo "🔌 ADB over TCP is currently: ENABLED"
  echo "❌ Stopping remote ADB..."
  sleep 1
  setprop service.adb.tcp.port -1
  stop adbd
  echo "❌ ADB over TCP is now DISABLED"
  sed -i 's|^description=.*|description=🚫 Remote ADB is currently: OFF |' $MODDIR/module.prop
}

# 如果传入参数，则根据参数开启或关闭 ADB
if [ "$1" = "enable" ]; then
  enable_adb
elif [ "$1" = "disable" ]; then
  disable_adb
else
  # 如果没有参数，根据现有状态自动切换
  if [ "$(getprop service.adb.tcp.port)" = "5555" ]; then
    disable_adb
  else
    enable_adb
  fi
fi
