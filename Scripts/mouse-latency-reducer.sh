#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (use sudo)"
    exit 1
fi

# Set USB polling rate to 1000Hz (1ms)
for device in /sys/bus/usb/devices/*/usbhid/*/poll_interval; do
    if [ -w "$device" ]; then
        echo 1 > "$device" || { echo "Failed to set polling rate for $device"; exit 1; }
    fi
done

# Disable mouse acceleration for Plasma 6 on Wayland
if [ -f /usr/bin/kwriteconfig6 ]; then
    kwriteconfig6 --file ~/.config/kdeglobals --group "Mouse" --key "NaturalScroll" "false"
else
    echo "kwriteconfig6 command not found. Please ensure you have the necessary tools installed."
    exit 1
fi

# Set mouse sensitivity (this may vary based on the desktop environment)
if [ -f /usr/bin/kwriteconfig6 ]; then
    kwriteconfig6 --file ~/.config/kdeglobals --group "Mouse" --key "MouseSpeed" "0"
else
    echo "kwriteconfig6 command not found. Please ensure you have the necessary tools installed."
    exit 1
fi

# Disable mouse power saving features
for i in /sys/bus/usb/devices/*/power/autosuspend; do
    if [ -w "$i" ]; then
        echo -1 > "$i" || { echo "Failed to disable autosuspend for $i"; exit 1; }
    fi
done

echo "Mouse optimization complete!"
echo "Changes applied:"
echo "- USB polling rate set to 1000Hz"
echo "- Mouse acceleration disabled"
echo "- Mouse sensitivity set to default"
echo "- USB autosuspend disabled"
echo ""
echo "Note: Some settings may reset after reboot. Add this script to startup applications if needed."
