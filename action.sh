#!/system/bin/sh
MODDIR=${0%/*}

# 启动 ADB over TCP
enable_adb() {
  echo "🚫 ADB over TCP is currently: DISABLED"
  echo "⚡ Starting remote ADB on port 5555..."
  setprop service.adb.tcp.port 5555
  stop adbd
  start adbd
  echo
  echo "📡 Available device IP addresses:"
  IP_LIST=$(ip addr show | grep "inet " | awk '{print $2}' | cut -d/ -f1 | grep -v "^127\.")
  for ip in $IP_LIST; do
      echo "   - $ip"
  done

  DEFAULT_IP=$(echo "$IP_LIST" | head -n 1)
  if [ -n "$DEFAULT_IP" ]; then
    echo
    echo "👉 Example to connect from your PC:"
    echo "   adb connect ${DEFAULT_IP}:5555"
  fi

  echo
  echo "✅ ADB over TCP is now ENABLED (port 5555)"
  sed -i 's|^description=.*|description=✔ Remote ADB is currently: ON (port 5555)|' "$MODDIR/module.prop"
}

# 关闭 ADB over TCP
disable_adb() {
  echo "🔌 ADB over TCP is currently: ENABLED"
  echo "❌ Stopping remote ADB..."
  setprop service.adb.tcp.port -1
  stop adbd
  echo "❌ ADB over TCP is now DISABLED"
  sed -i 's|^description=.*|description=✘ Remote ADB is currently: OFF|' "$MODDIR/module.prop"
}

# 参数模式
case "$1" in
  enable) enable_adb ;;
  disable) disable_adb ;;
  *)
    # 自动切换
    if [ "$(getprop service.adb.tcp.port)" = "5555" ]; then
      disable_adb
    else
      enable_adb
    fi
    ;;
esac
