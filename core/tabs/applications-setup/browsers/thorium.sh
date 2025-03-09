#!/bin/sh -e

. ../../common-script.sh

installThrorium() {
    if ! command_exists thorium-browser; then
        printf "%b\n" "${YELLOW}Installing Thorium Browser...${RC}"
        case "$PACKAGER" in
            pacman)
                "$AUR_HELPER" -S --needed --noconfirm thorium-browser-bin
                ;;
            *)
                printf "%b\n" "${RED}Unsupported package manager: ""$PACKAGER""${RC}"
                exit 1
                ;;
        esac
    else
        printf "%b\n" "${GREEN}Thorium Browser is already installed.${RC}"
    fi
}

checkEnv
checkEscalationTool
checkAURHelper
installThrorium