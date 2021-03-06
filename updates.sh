#!/bin/bash

set -e
source build/envsetup.sh

repopick -t ten-camera-api2-fix

# popup-cam
repopick -t ten-popup-cam

# build/make
changes=(
257170 # build: Never set persist.sys.usb.config=none in recovery
257176 # releasetools: Store the build.prop file in the OTA zip
)
repopick -P build/make ${changes[@]}&

# device/xiaomi/davinci
#changes=(
#271427 # davinci: Migrate to inscreen 1.1
#)
#repopick -P device/xiaomi/davinci ${changes[@]}&

# device/xiaomi/sm6150-common
changes=(
270030 # sm6150-common: Clean up device layout
269740 # sm6150-common: Add init.recovery.qcom.rc
269741 # sm6150-common: init.recovery.qcom.rc: Set up ADB in recovery mode
269742 # sm6150-common: Support bootdevice symlink in recovery mode.
269743 # sm6150-common: Handle recovery mode for non-configfs devices.
270031 # sm6150-common: Remove gnss hidl entries in manifest.xml
270782 # sm6150-common: fod: Clean hal and bump to version 1.1
271058 # sm6150-common: Enable headset calibration
271070 # sm6150-common: Update VENDOR_SECURITY_PATCH
271443 # sm6150-common: Commonize ACDB loader blobs
)	
repopick -P device/xiaomi/sm6150-common ${changes[@]}&

# frameworks/base
changes=(
258303 # power: Re-introduce custom charging sounds
265508 # Phone ringtone setting for Multi SIM device
265511 # Don't change public API
260002 # fw/b: Squash of app fw restriction commits
267249 # DozeSensors: do not use binned brightness sensor for proximity if not supported
267565 # SystemUI: Bring back ic_qs_bluetooth_connected.xml
269489 # Camera: Skip stream size check for whitelisted apps..
267306 # Camera: Squashed support for Aux camera {black,white}list feature
267312 # Camera: Force HAL1 for predefined package list.
266130 # FODCircleView: Add Support for custom FP pressed icon
)
repopick -P frameworks/base ${changes[@]}&

# lineage-sdk
changes=(
259996 # lineage-sdk: Update path to ChargingStarted.ogg
)
repopick -P lineage-sdk ${changes[@]}&

# packages/apps/Eleven
changes=(
268192 # Refactor music playback service binding logic.
268634 # Use SystemClock.elapsedRealtime() for notification tracking time
268635 # Fix notification foreground tracking behavior
268193 # Stop playback button updates when playback fragment is stopped.
268194 # Bind/unbind service on start/stop instead of create/destroy.
268248 # Simplify queue change notification handling.
268249 # Refactor AUDIO_BECOMING_NOISY broadcast handling.
268370 # Avoid usage of deprecated APIs in MusicPlaybackService.
268371 # Don't update notification twice on play start.
268377 # Fix some lint issues in MusicPlaybackService.
)
repopick -P packages/apps/Eleven ${changes[@]}&

# packages/apps/LineageParts
changes=(
260416 # Parts: Convert charging sound path to uri
)
repopick -P packages/apps/LineageParts ${changes[@]}&

# packages/apps/Recorder
changes=(
267929 # Recorder: Enable requestLegacyExternalStorage
)
repopick -P packages/apps/Recorder ${changes[@]}&

# packages/apps/Settings
changes=(
258304 # Settings: Add LineageParts charging sound settings preference
265509 # Phone ringtone setting for Multi SIM device
)
repopick -P packages/apps/Settings ${changes[@]}&

# packages/services/Telecomm
changes=(
265510 # Phone ringtone setting for Multi SIM device
)
repopick -P packages/services/Telecomm ${changes[@]}&

# system/core
changes=(
265551 # adb_root: Bypass few more checks
265553 # adb_root: Allow root uid to get root status
)
repopick -P system/core ${changes[@]}&

# system/netd
changes=(
260003 # system/netd: Squash of app fw restriction commits
)
repopick -P system/netd ${changes[@]}&

# system/sepolicy
changes=(
264406 # sepolicy: New type sdcard_posix for labeled filesystems
)
repopick -P system/sepolicy ${changes[@]}&

# system/vold
changes=(
258169 # vold: add support for more filesystems for public storage
258170 # vold: Fix fsck on public volumes
258171 # vold: Support internal storage partitions
258172 # vold: Honor mount options for ext4/f2fs partitions
258173 # vold: Mount ext4/f2fs portable storage with sdcard_posix
258174 # vold ext4/f2fs: do not use dirsync if we're mounting adopted storage
258175 # Fix the group permissions of the sdcard root.
258176 # vold: skip first disk change when converting MBR to GPT
258178 # vold: Accept Linux GPT partitions on external SD cards
)
repopick -P system/vold ${changes[@]}&

# vendor/lineage
changes=(
259683 # lineage: Update installboot for Q
266664 # overlay: Add more default packages from Google
255667 # adb insecure by default
)
repopick -P vendor/lineage ${changes[@]}&

# vendor/qcom/opensource/interfaces
changes=(
270204 # interfaces: Introduce qcom bluetooth_audio HALs
)
repopick -P vendor/qcom/opensource/interfaces ${changes[@]}&

wait

# build/make
repopick -P build/make -f 266145 # Sorry bro: 6 -> 3
