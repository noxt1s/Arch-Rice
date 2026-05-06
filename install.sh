#!/usr/bin/env bash

###########################################
#                                         #
#  Ricing Linux - Automatic Installation  #
#      by Noctis (github.com/noxt1s)      #
#                                         #
###########################################

# ANSI escape codes
mainColor="\x1B[35m"  # Main script color
greenCode="\x1B[32m"  # Success output color
redCode="\x1B[31m"    # Error output color
boldCode="\x1B[1m"
resetCode="\x1B[0m"

printf "${mainColor}${boldCode}Rice to be installed:${resetCode}\n${mainColor}1)${resetCode} Kawaii Theme\n${mainColor}2)${resetCode} Lain Theme\n${mainColor}3)${resetCode} " && read option

# Defining the chosen rice
case "$option" in
    1) riceRoot="Kawaii-Themed-Rice" ;;
    2) riceRoot="Lain-Themed-Rice" ;;
    *) printf "Help Guide\n" && exit 1 ;;
esac

# Functions
successMsg() { printf "\n${greenCode}▶ %s${resetCode}\n" "$1"; }
errorMsg() { printf "\n${redCode}▶ %s${resetCode}\n" "$1"; exit 1; }

applyRice() {
    if [[ -n "$1" ]]; then
        [[ -e "$1" ]] && mv "$1" "$2" && successMsg "YAY! “$1” successfully installed on the system!"
    fi
}

###########################
#                         #
#  Initial configuration  #
#                         #
###########################

# Defining the configuration file
setupFile="./$riceRoot/setup.conf"

# Checking if the configuration file exists or not
[[ -f "$setupFile" ]] && source "$setupFile" || {
    printf "\n${redCode}▶ Configuration file “$setupFile” not found.${resetCode} Install the configuration file \e]8;;https://github.com/noxt1s/Linux-Rice/blob/main/$riceRoot/setup.conf\ahere\e]8;;\a.\n"
    exit 1
}

printf "\n${mainColor}▶ Installing $riceRoot...${resetCode}"

# Creating necessary directories
for dir in \
    ~/.local/share/fonts \
    ~/.local/share/sounds \
    ~/.config/hypr \
    ~/.config/waybar \
    ~/.config/kitty \
    ~/.config/fastfetch \
    ~/.config/rofi \
    ~/.config/wlogout \
    ~/.config/Code/User \
    ~/.config/Vencord/themes \
    ~/Pictures/Wallpapers
do
    mkdir -p "$dir" || errorMsg "Failed to create directory “$dir”."
done

# Installing system font
if [[ -f "$mainFont" ]]; then
    unzip -o "$mainFont" -d "${mainFont%.zip}"
    mv "${mainFont%.zip}" ~/.local/share/fonts
    fc-cache -f -v
    successMsg "Font file “$mainFont” installed successfully."
else
    errorMsg "Font file “$mainFont” not found."
fi

# Installing wallpaper
[[ -f "$wallpaper" ]] && mv "$wallpaper" ~/Pictures/Wallpapers || errorMsg "Wallpaper “$wallpaper” not found."

###################
#                 #
#  Applying Rice  #
#                 #
###################

applyRice "$hyprRice"/* ~/.config/hypr            # Hyprland
applyRice "$waybarRice"/* ~/.config/waybar        # Waybar
applyRice "$kittyRice" ~/.config/kitty            # Kitty
applyRice "$fastfetchRice" ~/.config/fastfetch    # Fastfetch
applyRice "$fastfetchLogo" ~/.config/fastfetch
applyRice "$rofiRice" ~/.config/rofi              # Rofi
applyRice "$wlogoutRice"/* ~/.config/wlogout      # Wlogout
applyRice "$vscodeRice" ~/.config/Code/User       # VSCode
applyRice "$discordRice" ~/.config/Vencord/themes # Vencord

printf "\n${mainColor}▶ Rice $riceRoot installed! :)${resetCode}"
