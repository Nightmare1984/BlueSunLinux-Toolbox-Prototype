#!/bin/sh -e

# shellcheck disable=SC2086

. ../common-script.sh

installDepend() {
    DEPENDENCIES='wine dbus git'
    printf "%b\n" "${YELLOW}Installing dependencies...${RC}"
    case "$PACKAGER" in
        pacman)
            #Check for multilib
            if ! grep -q "^\s*\[multilib\]" /etc/pacman.conf; then
                echo "[multilib]" | "$ESCALATION_TOOL" tee -a /etc/pacman.conf
                echo "Include = /etc/pacman.d/mirrorlist" | "$ESCALATION_TOOL" tee -a /etc/pacman.conf
                "$ESCALATION_TOOL" "$PACKAGER" -Syu
            else
                printf "%b\n" "${GREEN}Multilib is already enabled.${RC}"
            fi

            DISTRO_DEPS="gnutls lib32-gnutls base-devel gtk2 gtk3 lib32-gtk2 lib32-gtk3 libpulse lib32-libpulse alsa-lib lib32-alsa-lib \
                alsa-utils alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib giflib lib32-giflib libpng lib32-libpng \
                libldap lib32-libldap openal lib32-openal libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama \
                ncurses lib32-ncurses vulkan-icd-loader lib32-vulkan-icd-loader ocl-icd lib32-ocl-icd libva lib32-libva \
                gst-plugins-base-libs lib32-gst-plugins-base-libs sdl2 lib32-sdl2 v4l-utils lib32-v4l-utils sqlite lib32-sqlite"

            $AUR_HELPER -S --needed --noconfirm $DEPENDENCIES $DISTRO_DEPS
            ;;
    esac
}

installAdditionalDepend() {
    case "$PACKAGER" in
        pacman)
            DISTRO_DEPS='steam lutris goverlay'
            "$ESCALATION_TOOL" "$PACKAGER" -S --needed --noconfirm $DISTRO_DEPS
            ;;
    esac
}

checkEnv
checkAURHelper
checkEscalationTool
installDepend
installAdditionalDepend
