#!/bin/sh -e

. ../../common-script.sh

installGithubDesktop() {
    if ! command_exists github-desktop; then
        printf "%b\n" "${YELLOW}Installing Github Desktop...${RC}"
        case "$PACKAGER" in
            pacman)
                "$AUR_HELPER" -S --needed --noconfirm github-desktop-bin
                ;;
            *)
                printf "%b\n" "${RED}Unsupported package manager: ""$PACKAGER""${RC}"
                exit 1
                ;;
        esac
    else
        printf "%b\n" "${GREEN}Github Desktop is already installed.${RC}"
    fi
}

checkEnv
checkEscalationTool
checkAURHelper
installGithubDesktop
