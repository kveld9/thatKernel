#!/system/bin/sh

while [ "$(getprop sys.boot_completed)" != "1" ]; do
   sleep 2
done

# Allow boot services to settle before applying kernel tweaks
sleep 15

thatKernel
