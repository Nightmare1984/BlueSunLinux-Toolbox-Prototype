#!/bin/sh -e

. ../../common-script.sh

installOnlyOffice() {
    if ! command_exists org.onlyoffice.desktopeditors && ! command_exists onlyoffice-desktopeditors; then
        printf "%b\n" "${YELLOW}Installing Only Office..${RC}."
        case "$PACKAGER" in
            pacman)
                "$AUR_HELPER" -S --needed --noconfirm onlyoffice
                ;;
            *)
                printf "%b\n" "${RED}Unsupported package manager: ""$PACKAGER""${RC}"
                exit 1
                ;;
        esac
    else
        printf "%b\n" "${GREEN}Only Office is already installed.${RC}"
    fi
}

checkEnv
checkEscalationTool
checkAurHelper
installOnlyOffice