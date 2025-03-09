#!/bin/sh -e

. ../../common-script.sh

installSublime() {
    if ! command_exists sublime; then
        printf "%b\n" "${YELLOW}Installing Sublime...${RC}"
        case "$PACKAGER" in
            pacman)
                "$AUR_HELPER" -S --needed --noconfirm sublime-text-4
                ;;
            *)
                printf "%b\n" "${RED}Unsupported package manager: ""$PACKAGER""${RC}"
                exit 1
                ;;
        esac
    else
        printf "%b\n" "${GREEN}Sublime is already installed.${RC}"
    fi

}

checkEnv
checkEscalationTool
installSublime
