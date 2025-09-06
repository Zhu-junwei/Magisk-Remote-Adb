#!/system/bin/sh
MODDIR=${0%/*}

(
# 等待系统启动完成
until [ $(getprop sys.boot_completed) -eq 1 ] ; do
  sleep 5
done

# 调用 action.sh 脚本并传递 enable 参数来启用 ADB
sh $MODDIR/action.sh enable

)&
