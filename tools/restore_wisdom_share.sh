#!/bin/sh
# Restore script for Wisdom Share Smart TV (r34a5)
TV_HOST="${1:-192.168.1.7}"

echo "Restoring hidden packages on TV at $TV_HOST..."
for pkg in \
  com.cvte.tv.pictorial \
  com.cvte.tv.steward \
  com.cvte.tv.remotedebug \
  com.cvte.tv.ucservice \
  com.cvte.tv.systemupgrade \
  com.netflix.mediaclient \
  com.android.soundrecorder \
  com.google.android.youtube.tv \
  com.android.browser
do
  echo "Restoring $pkg..."
  adb -s "$TV_HOST:5555" shell pm unhide "$pkg"
done

echo "Syncing filesystem..."
adb -s "$TV_HOST:5555" shell sync
echo "Done. All packages have been re-enabled."
