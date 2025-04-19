#!/system/bin/sh

# if you are suffering from a bootloop problem (the device doesn't turn on or reboots constantly), just delete this "post-fs-data.sh" file and reflash the module.

# tombstoned
resetprop -n tombstoned.max_tombstone_count 0

# low memory killer
resetprop -n ro.lmk.debug false
resetprop -n ro.lmk.log_stats false

# dalvik
resetprop -n dalvik.vm.check-dex-sum false
resetprop -n dalvik.vm.checkjni false
resetprop -n dalvik.vm.dex2oat-minidebuginfo false
resetprop -n dalvik.vm.minidebuginfo false
resetprop -n dalvik.vm.verify-bytecode false

# disable multiuser (if you want to use the "multiuser" function on your device, delete these lines)
# if you are experiencing a Play Store or Play Services opening bug, you can try deleting these lines
resetprop -n fw.max_users 0
resetprop -n fw.show_multiuserui 0

# bye blur (if you want to have blur on your device, delete these lines)
# if you have MIUI or HyperOS you will probably want to keep it
resetprop -n disableBlurs true
resetprop -n enable_blurs_on_windows 0
resetprop -n ro.launcher.blur.appLaunch 0
resetprop -n ro.sf.blurs_are_expensive 1
resetprop -n ro.surface_flinger.supports_background_blur 0