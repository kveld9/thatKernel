#!/system/bin/sh

ruta="$MODPATH/system/bin"
script1="thatKernel"
rutascript1="$ruta/$script1"

set_perm_recursive "$rutascript1" root root 0777 0755


# don't be a son of a bitch, don't delete this and share the module out there, it's the only thing I have because I don't charge for my work
am start -a android.intent.action.VIEW -d https://t.me/rootart >/dev/null 2>&1