#!/system/bin/sh

# Restore printk defaults
echo "6 6 1 7" > /proc/sys/kernel/printk 2>/dev/null
echo "on" > /proc/sys/kernel/printk_devkmsg 2>/dev/null

# Re-enable tracing
echo 1 > /sys/kernel/tracing/tracing_on 2>/dev/null

# Clean up log
rm -f /data/adb/thatKernel.log 2>/dev/null

# Cleanup module files
if [ -f "$INFO" ]; then
  while read -r LINE; do
    if [ "$(echo -n "$LINE" | tail -c 1)" = "~" ]; then
      continue
    elif [ -f "$LINE~" ]; then
      mv -f "$LINE~" "$LINE"
    else
      rm -f "$LINE"
      while true; do
        LINE=$(dirname "$LINE")
        [ "$(ls -A "$LINE" 2>/dev/null)" ] && break 1 || rm -rf "$LINE"
      done
    fi
  done < "$INFO"
  rm -f "$INFO"
fi
