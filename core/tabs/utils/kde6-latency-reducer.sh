#!/bin/bash

# Source common script with error checking
if ! . ../common-script.sh; then
    echo "Error: Failed to source common-script.sh"
    exit 1
fi

echo "Reducing mouse latency..."

# Function to handle errors
handle_error() {
    echo "Error: $1"
    exit 1
}

# Set USB polling rate to 1000Hz for low-latency mouse input
echo "Setting USB polling rate to 1000Hz..."
if ! sudo modprobe -r usbhid; then
    handle_error "Failed to remove usbhid module"
fi

if ! sudo modprobe usbhid mousepoll=1; then
    handle_error "Failed to load usbhid module with mousepoll=1"
fi

# Optimize mouse acceleration settings for KDE
echo "Disabling mouse acceleration for KDE..."
if command -v kwriteconfig6 &> /dev/null; then
    if ! sudo kwriteconfig6 --file kcminputrc --group Mouse --key AccelerationProfile 0 || \
       ! sudo kwriteconfig6 --file kcminputrc --group Mouse --key Acceleration 0 || \
       ! sudo kwriteconfig6 --file kcminputrc --group Mouse --key Threshold 0; then
        handle_error "Failed to configure KDE mouse settings"
    fi
    echo "Mouse acceleration disabled in KDE settings."
else
    echo "Warning: kwriteconfig6 not found. Skipping KDE-specific mouse acceleration settings."
fi

# Apply real-time priority to input devices
echo "Applying real-time priority to input devices..."
if ! sudo mkdir -p /etc/security/limits.d; then
    handle_error "Failed to create limits.d directory"
fi

if ! echo "@input - rtprio 85" | sudo tee /etc/security/limits.d/99-input-latency.conf > /dev/null; then
    handle_error "Failed to create input latency configuration file"
fi

# Reload udev rules to apply changes
echo "Reloading udev rules..."
if ! sudo udevadm control --reload-rules; then
    handle_error "Failed to reload udev rules"
fi

if ! sudo udevadm trigger; then
    handle_error "Failed to trigger udev rules"
fi

echo "Mouse latency reduction applied successfully. Please reboot for all changes to take effect."
exit 0