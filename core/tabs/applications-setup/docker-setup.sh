#!/bin/sh -e

. ../common-script.sh
. ../common-service-script.sh

# Function to prompt the user for installation choice
choose_installation() {
    printf "%b\n" "${YELLOW}Choose what to install:${RC}"
    printf "%b\n" "1. ${YELLOW}Docker${RC}"
    printf "%b\n" "2. ${YELLOW}Docker Compose${RC}"
    printf "%b\n" "3. ${YELLOW}Both${RC}"
    printf "%b" "Enter your choice [1-3]: "
    read -r CHOICE

    case "$CHOICE" in
        1) INSTALL_DOCKER=1; INSTALL_COMPOSE=0 ;;
        2) INSTALL_DOCKER=0; INSTALL_COMPOSE=1 ;;
        3) INSTALL_DOCKER=1; INSTALL_COMPOSE=1 ;;
        *) printf "%b\n" "${RED}Invalid choice. Exiting.${RC}"; exit 1 ;;
    esac
}

install_docker() {
    printf "%b\n" "${YELLOW}Installing Docker...${RC}"
    case "$PACKAGER" in
        pacman)
            "$ESCALATION_TOOL" "$PACKAGER" -S --noconfirm docker
            ;;
        *)
            printf "%b\n" "${RED}Unsupported package manager: ""$PACKAGER""${RC}"
            exit 1
            ;;
    esac

    startAndEnableService docker
}

install_docker_compose() {
    printf "%b\n" "${YELLOW}Installing Docker Compose...${RC}"
    case "$PACKAGER" in
        pacman)
            "$ESCALATION_TOOL" "$PACKAGER" -S --needed --noconfirm docker-compose
            ;;
        *)
            printf "%b\n" "${RED}Unsupported package manager: ""$PACKAGER""${RC}"
            exit 1
            ;;
    esac
}

install_components() {
    choose_installation 

    if [ "$INSTALL_DOCKER" -eq 1 ]; then
        if ! command_exists docker; then
            install_docker
        else
            printf "%b\n" "${GREEN}Docker is already installed.${RC}"
        fi
    fi

    if [ "$INSTALL_COMPOSE" -eq 1 ]; then
        if ! command_exists docker-compose || ! command_exists docker compose version; then
            install_docker_compose
        else
            printf "%b\n" "${GREEN}Docker Compose is already installed.${RC}"
        fi
    fi
}

checkEnv
checkEscalationTool
install_components