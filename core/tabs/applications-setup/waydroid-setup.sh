#!/bin/sh -e

. ../common-script.sh

checkGpu() {
    if lspci | grep -i nvidia >/dev/null; then
        printf "%b\n" "${RED}Waydroid is not compatible with NVIDIA GPUs.${RC}"
        exit 1
    fi
}

installWaydroid() {
    if ! command_exists waydroid; then
        printf "%b\n" "${YELLOW}Installing Waydroid...${RC}"
        case "$PACKAGER" in
            pacman)
                "$AUR_HELPER" -S --needed --noconfirm waydroid

                if ! command_exists dkms; then
                    "$ESCALATION_TOOL" "$PACKAGER" -S --needed --noconfirm dkms
                fi

                installed_kernels=$("$PACKAGER" -Q | grep -E '^linux(| |-rt|-rt-lts|-hardened|-zen|-lts)[^-headers]' | cut -d ' ' -f 1)
                for kernel in $installed_kernels; do
                    header="${kernel}-headers"
                    printf "%b\n" "${CYAN}Installing headers for $kernel...${RC}"
                    "$ESCALATION_TOOL" "$PACKAGER" -S --needed --noconfirm "$header"
                done

                "$AUR_HELPER" -S --needed --noconfirm binder_linux-dkms
                "$ESCALATION_TOOL" modprobe binder-linux device=binder,hwbinder,vndbinder
                ;;
            *)
                printf "%b\n" "${RED}Unsupported package manager: $PACKAGER${RC}"
                exit 1
                ;;
        esac
    else
        printf "%b\n" "${GREEN}Waydroid is already installed.${RC}"
    fi
}

setupWaydroid() {
    printf "%b\n" "${YELLOW}Setting up Waydroid...${RC}"
    "$ESCALATION_TOOL" systemctl enable --now waydroid-container
    "$ESCALATION_TOOL" waydroid init
    printf "%b\n" "${GREEN}Waydroid setup complete.${RC}"
}

checkEnv
checkEscalationTool
checkAURHelper
checkGpu
installWaydroid
setupWaydroid
