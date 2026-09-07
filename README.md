# </>thatKernel

[![Magisk](https://img.shields.io/badge/Magisk-20.4%2B-brightgreen.svg)](https://github.com/topjohnwu/Magisk)
[![KernelSU](https://img.shields.io/badge/KernelSU-v0.7.0%2B-blue.svg)](https://github.com/tiann/KernelSU)
[![KernelSU Next](https://img.shields.io/badge/KernelSU%20Next-v1.0.0%2B-blueviolet.svg)](https://github.com/rifsxd/KernelSU-Next)
[![Android](https://img.shields.io/badge/Android-8.1--14%2B-blue.svg)](https://www.android.com/)
[![License](https://img.shields.io/badge/License-GPLv3-orange.svg)](LICENSE)

A root module for **KernelSU**, **KernelSU Next**, **Magisk**, and **APatch** designed to safely suppress background operating system and kernel debug logging, tracing, ramdumps, and crash events.

---

## 🚀 Functionality

### 🔧 System Property Tweaks (`post-fs-data.sh`)
During early boot (`post-fs-data`), the module configures low-overhead system properties via `resetprop`:

- **Tombstoned:** Limits crash dump file generation (`tombstoned.max_tombstone_count=0`).
- **Low Memory Killer (LMK):** Disables LMK debug logging and stats gathering.
- **Dalvik/ART:** Reduces debug information overhead (`minidebuginfo=false`, `checkjni=false`, `check-dex-sum=false`).
- **UI Blur Optimization:** Disables window blur effects for improved rendering performance.

### 🔪 Kernel & Diagnostic Suppression (`system/bin/thatKernel`)
Executed safely post-boot (`sys.boot_completed=1`) to eliminate continuous background tracing and logging without corrupting system binaries:

- **Tracing & Debug Nodes:** Disables kernel tracing instances (`tracing_on=0`), DRM/KMS debugging, and rotator event logging.
- **Kernel Printk & Devkmsg:** Suppresses console kernel messages (`printk "0 0 0 0"`) and disables `/dev/kmsg` logging (`printk_devkmsg=off`).
- **Crash & Ramdumps:** Disables subsystem restart ramdumps and mini-ramdumps.
- **Schedstats & Exception Tracing:** Turns off scheduler statistics and exception tracing overhead.
- **I/O & Memory Dumps:** Silences block queue I/O statistics and OOM task memory dumps.
- **Diagnostic Daemons:** Gracefully stops non-essential background tracing services (`statsd`, `traced`, `traced_probes`, `cnss_diag`, `tcpdump`) using `stop`.

---

## 📜 Execution Log

A detailed log of all tweaks applied by the module is saved to:
```text
/data/adb/thatKernel.log
```
This file is refreshed on every reboot once all tweaks have been successfully applied.

---

## 📲 Installation

1. Download the latest release `.zip` from [Releases](https://github.com/kveld9/thatKernel/releases/latest).
2. Open your root manager app (**KernelSU Manager**, **Magisk**, or **APatch**).
3. Select and flash the `thatKernel-v0.1.0.zip` file.
4. Reboot your device.

---

## 🧹 Uninstallation

Uninstall the module from your root manager app. On reboot, kernel printk defaults (`6 6 1 7`), `devkmsg`, and tracing are automatically restored, and module logs are cleaned up.

---

## 📄 License

GPL-3.0 License. See [LICENSE](LICENSE) for details.
