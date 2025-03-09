#!/bin/sh -e

. ../../common-script.sh

installDiscord() {
    if ! command_exists com.discordapp.Discord && ! command_exists discord; then
        printf "%b\n" "${YELLOW}Installing Discord...${RC}"
        case "$PACKAGER" in
            pacman)
                "$ESCALATION_TOOL" "$PACKAGER" -S --needed --noconfirm discord 
                ;;
            *)
                printf "%b\n" "${RED}Unsupported package manager: ""$PACKAGER""${RC}"
                exit 1
                ;;
        esac
    else
        printf "%b\n" "${GREEN}Discord is already installed.${RC}"
    fi
}

checkEnv
checkEscalationTool
installDiscord
