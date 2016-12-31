#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8460288 fdd2fbc2d64398774b5614d197cdd9a66c3e3e86 5986304 2483313723ce15901fdecdb3c4cef0a74ab18584
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:8460288:fdd2fbc2d64398774b5614d197cdd9a66c3e3e86; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:5986304:2483313723ce15901fdecdb3c4cef0a74ab18584 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery fdd2fbc2d64398774b5614d197cdd9a66c3e3e86 8460288 2483313723ce15901fdecdb3c4cef0a74ab18584:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
