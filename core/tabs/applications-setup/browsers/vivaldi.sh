#!/bin/sh -e

. ../../common-script.sh

installVivaldi() {
    if ! command_exists vivaldi; then
        printf "%b\n" "${YELLOW}Installing Vivaldi...${RC}"
        case "$PACKAGER" in
            pacman)
                "$ESCALATION_TOOL" "$PACKAGER" -S --needed --noconfirm vivaldi
                ;;
            *)
                printf "%b\n" "${RED}Unsupported package manager: ""$PACKAGER""${RC}"
                exit 1
                ;;
        esac
    else
        printf "%b\n" "${GREEN}Vivaldi Browser is already installed.${RC}"
    fi
}

checkEnv
checkEscalationTool
installVivaldi
