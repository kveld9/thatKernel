#!/system/bin/sh

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

# UI blur disable (performance boost)
resetprop -n disableBlurs true
resetprop -n enable_blurs_on_windows 0
resetprop -n ro.launcher.blur.appLaunch 0
resetprop -n ro.sf.blurs_are_expensive 1
resetprop -n ro.surface_flinger.supports_background_blur 0
