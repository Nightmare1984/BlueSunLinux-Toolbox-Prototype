#!/bin/sh -e

. ../../common-script.sh

installFreeOffice() {  
    if ! command_exists softmaker-freeoffice-2024 freeoffice softmaker; then
        printf "%b\n" "${YELLOW}Installing Free Office...${RC}"
        case "$PACKAGER" in
        pacman)
            "$AUR_HELPER" -S --needed --noconfirm freeoffice
            ;;
        *)
            printf "%b\n" "${RED}Unsupported package manager: ""$PACKAGER""${RC}"
            exit 1
            ;;
        esac
    else
        printf "%b\n" "${GREEN}Free Office is already installed.${RC}"
    fi
}

checkEnv
checkEscalationTool
checkAurHelper
installFreeOffice