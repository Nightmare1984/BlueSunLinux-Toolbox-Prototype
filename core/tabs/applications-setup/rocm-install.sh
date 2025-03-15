#!/bin/sh

. ../common-script.sh

installRocm() {
    if ! command_exists hip-runtime-amd; then
        printf "%b\n" "${YELLOW}Installing ROCm runtime...${RC}"
        case "$PACKAGER" in
            pacman)
                if ! "$ESCALATION_TOOL" "$PACKAGER" -S --needed --noconfirm hip-runtime-amd; then
                    printf "%b\n" "${RED}Failed to install ROCm runtime.${RC}"
                    return 1
                fi
                ;;
            *)
                printf "%b\n" "${RED}Unsupported package manager: $PACKAGER${RC}"
                return 1
                ;;
        esac
    else
        printf "%b\n" "${GREEN}ROCm runtime is already installed.${RC}"
    fi
    if ! command_exists hiprt; then
        printf "%b\n" "${YELLOW}Installing ROCm RT...${RC}"
        case "$PACKAGER" in
            pacman)
                if ! "$ESCALATION_TOOL" "$PACKAGER" -S --needed --noconfirm hiprt; then
                    printf "%b\n" "${RED}Failed to install ROCm RT.${RC}"
                    return 1
                fi
                ;;
            *)
                printf "%b\n" "${RED}Unsupported package manager: $PACKAGER${RC}"
                return 1
                ;;
        esac
    else
        printf "%b\n" "${GREEN}ROCm RT is already installed.${RC}"
    fi

    printf "%b\n" "${GREEN}ROCm installation completed successfully.${RC}"
    return 0
}

checkEnv
checkEscalationTool
installRocm