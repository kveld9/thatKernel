# </>thatKernel

Magisk module designed to suppress operating system and kernel logs and events as much as possible, reducing background resource usage and avoiding logs that may interfere with privacy (this point is up to everyone's thoughts about Android).

---

## 🚀 Functionality

### 🔧 System Property Tweaks (`resetprop`)
The `post-fs-data.sh` script changes several Android properties:

- **Tombstoned**:
  - Disables generation of crash dump files (`tombstones`).
- **Low Memory Killer (LMK)**:
  - Disables debugging and logging.
- **Dalvik/ART**:
  - Disables bytecode verification.
  - Disables dex checksums.
  - Reduces debugging metadata.
- **Multiuser**:
  - Completely disables multiuser support.
- **Blurs**:
  - Disables all blur effects in the UI for performance.
  - Especially useful on MIUI or HyperOS where blur is heavy.

### ⚙️ Custom System Binaries
The module replaces system binaries in `system/bin/`, including:

- `atrace`
- `bugreport`
- `dalvikvm`
- `dumpsys`
- `logcat`
- And others...

In this part empty binary files are installed to remove certain functionalities of the binaries related to debugging, events, logs, etc.

### 🔪 Main kernel functions disabled

- `CRC`
- `printk`
- `ramdumps`
- `iosatats`
- `memory dump`
- much more, take a look at line 69, 84 and 97 of the file ---> [thatKernel main](/system/bin/thatKernel).
---

## 📲 Installation

First, download this repo as a zip. Then:

1. Open **Magisk or KernelSU or APatch, etc.**.
2. Tap “Install from storage”.
3. Select the `thatKernel.zip` file.
4. Reboot your device.

---

## 📜 Log file with the recorded behavior of the module

In the path `/storage/emulated/0/Android/` a log file with the name `thatKernel.log` will be saved. This is regenerated on every reboot of the device noting every change the module made.

---

## ⚠️ Warnings

- **Experimental module:** May cause bootloops or instability.
- **Recommended for advanced users only.**
- If stuck in a bootloop, try delete `post-fs-data.sh` from recovery and reinstall.
- Not recommended if you rely on features like multiuser or UI blur, or simply delete those lines from the file `post-fs-data.sh`.

---

## 🧹 Uninstallation

By uninstalling the module from the module manager you have, the whole system will return to normal.

---

## 🛠 Credits

- [KingTweaks](https://github.com/King-Projects/King-Tweaks/blob/master/libktsr.sh) - Thanks for the nested loop where much of the debugging and kernel log generators are disabled. Line 83 of the file ---> [HERE](/system/bin/thatKernel).

---
