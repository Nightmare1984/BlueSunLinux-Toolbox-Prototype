#!/bin/sh -e

. ../../common-script.sh

installVsCodium() {
    if ! command_exists com.vscodium.codium && ! command_exists codium; then
        printf "%b\n" "${YELLOW}Installing VS Codium...${RC}"
        case "$PACKAGER" in
            pacman)
                "$AUR_HELPER" -S --noconfirm vscodium-bin
                ;;
            *)
                printf "%b\n" "${RED}Unsupported package manager: ""$PACKAGER""${RC}"
                exit 1
                ;;
        esac
    else
        printf "%b\n" "${GREEN}VS Codium is already installed.${RC}"
    fi

}

checkEnv
checkEscalationTool
checkAURHelper
installVsCodium
