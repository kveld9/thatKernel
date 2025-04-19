#!/system/bin/sh

while [[ "$(getprop sys.boot_completed)" -ne 1 ]] && [[ ! -d "/sdcard" ]]
do
   sleep 10
done

sleep 60
sync

LOG_FILE="/storage/emulated/0/Android/thatKernel.log"
if [ -e $LOG_FILE ]; then
   rm -rf $LOG_FILE;
fi

thatKernel