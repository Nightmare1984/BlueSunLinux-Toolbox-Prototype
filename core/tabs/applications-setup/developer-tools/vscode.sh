#!/bin/sh -e

. ../../common-script.sh

installVsCode() {
    if ! command_exists com.visualstudio.code && ! command_exists code; then
        printf "%b\n" "${YELLOW}Installing VS Code..${RC}."
        case "$PACKAGER" in
            pacman)
                "$AUR_HELPER" -S --needed --noconfirm visual-studio-code-bin
                ;;
            *)
                printf "%b\n" "${RED}Unsupported package manager: ""$PACKAGER""${RC}"
                exit 1
                ;;
        esac
    else
        printf "%b\n" "${GREEN}VS Code is already installed.${RC}"
    fi
}

checkEnv
checkEscalationTool
checkAURHelper
installVsCode 
