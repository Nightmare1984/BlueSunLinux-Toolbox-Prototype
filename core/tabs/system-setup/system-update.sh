#!/bin/sh -e

. ../common-script.sh

fastUpdate() {
    case "$PACKAGER" in
        pacman)
            "$AUR_HELPER" -S --needed --noconfirm rate-mirrors-bin

            printf "%b\n" "${YELLOW}Generating a new list of mirrors using rate-mirrors. This process may take a few seconds...${RC}"

            if [ -s "/etc/pacman.d/mirrorlist" ]; then
                "$ESCALATION_TOOL" cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
            fi

            # If for some reason DTYPE is still unknown use always arch so the rate-mirrors does not fail
            dtype_local="$DTYPE"
            if [ "$dtype_local" = "unknown" ]; then
                dtype_local="arch"
            fi

            if ! "$ESCALATION_TOOL" rate-mirrors --top-mirrors-number-to-retest=5 --disable-comments --save /etc/pacman.d/mirrorlist --allow-root "$dtype_local" > /dev/null || [ ! -s "/etc/pacman.d/mirrorlist" ]; then
                printf "%b\n" "${RED}Rate-mirrors failed, restoring backup.${RC}"
                "$ESCALATION_TOOL" cp /etc/pacman.d/mirrorlist.bak /etc/pacman.d/mirrorlist
            fi
            ;;
        *)
            printf "%b\n" "${RED}Unsupported package manager: ${PACKAGER}${RC}"
            exit 1
            ;;
    esac
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
