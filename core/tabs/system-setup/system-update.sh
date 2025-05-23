#!/bin/sh -e

. ../common-script.sh

updateSystem() {
    printf "%b\n" "${YELLOW}Updating system packages.${RC}"
    case "$PACKAGER" in
        pacman)
            if [ -f /etc/artix-release ]; then
                "$ESCALATION_TOOL" "$PACKAGER" -Sy --noconfirm --needed artix-keyring
            else
                "$ESCALATION_TOOL" "$PACKAGER" -Sy --noconfirm --needed archlinux-keyring
            fi
                "$AUR_HELPER" -Su --noconfirm
            ;;
        *)
            printf "%b\n" "${RED}Unsupported package manager: ${PACKAGER}${RC}"
            exit 1
            ;;
    esac
}

updateFlatpaks() {
    if command_exists flatpak; then
        printf "%b\n" "${YELLOW}Updating flatpak packages.${RC}"
        flatpak update -y
    fi
}

checkEnv
checkAURHelper
checkEscalationTool
updateSystem
updateFlatpaks
