#!/bin/sh -e

. ../common-script.sh

fastUpdate() {
    printf "%b\n" "${YELLOW}Automatically updating Arch Linux mirrors for your area.${RC}"
    if command_exists reflector; then
        "$ESCALATION_TOOL" reflector --country "$(curl -s https://ipapi.co/country/)" --latest 20 --sort rate --save /etc/pacman.d/mirrorlist
        printf "%b\n" "${GREEN}Mirrors updated successfully for your area.${RC}"
    else
        printf "%b\n" "${RED}Reflector is not installed. Please install it to update mirrors.${RC}"
        exit 1
    fi
    printf "%b\n" "${YELLOW}Updating AUR helper mirrors.${RC}"
    if [ "$AUR_HELPER" = "paru" ] || [ "$AUR_HELPER" = "yay" ]; then
        "$AUR_HELPER" -Y --gendb
        "$AUR_HELPER" -Y --topdown
        printf "%b\n" "${GREEN}AUR helper mirrors updated successfully.${RC}"
    else
        printf "%b\n" "${RED}Unsupported AUR helper: ${AUR_HELPER}${RC}"
        exit 1
    fi
}

updateSystem() {
    printf "%b\n" "${YELLOW}Updating system packages.${RC}"
    case "$PACKAGER" in
        pacman)
            "$ESCALATION_TOOL" "$PACKAGER" -Sy --noconfirm --needed archlinux-keyring
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
fastUpdate
updateSystem
updateFlatpaks
