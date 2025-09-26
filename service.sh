#!/system/bin/sh
MODDIR=${0%/*}

(
  # 等待系统启动完成
  until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 5
  done

  # 默认启用 ADB over TCP
  sh "$MODDIR/action.sh" enable
) &
