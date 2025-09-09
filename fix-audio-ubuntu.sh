#!/bin/bash
set -e

echo "🔧 Updating system packages..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y linux-firmware

CONF="/etc/modprobe.d/alsa-base.conf"

echo "🔧 Forcing Intel legacy HDA driver..."
if ! grep -q "snd-intel-dspcfg" "$CONF" 2>/dev/null; then
  echo "options snd-intel-dspcfg dsp_driver=1" | sudo tee -a "$CONF"
else
  sudo sed -i 's/options snd-intel-dspcfg.*/options snd-intel-dspcfg dsp_driver=1/' "$CONF"
fi

echo "✅ Config applied with dsp_driver=1"
echo "👉 Reboot now and run: aplay -l"
echo "   - If still no soundcards, edit $CONF and change dsp_driver=1 to dsp_driver=3"
echo "   - Then reboot again."
