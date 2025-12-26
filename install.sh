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

# User interaction
printf "${mainColor}${boldCode}Rice to be installed:${resetCode}\n${mainColor}1)${resetCode} Kawaii Theme\n${mainColor}2)${resetCode} Lain Theme\n${mainColor}3)${resetCode} Cyan Theme\n${mainColor}▶${resetCode} " && read option

# Defining the chosen rice
case "$option" in
    1) riceRoot="Kawaii-Themed-Rice" ;;
    2) riceRoot="Lain-Themed-Rice" ;;
    3) riceRoot="Cyan-Themed-Rice" ;;
    *) printf "Help Guide\n" && exit 0 ;;
esac

###########################
#                         #
#  Initial configuration  #
#                         #
###########################

# verificar se aplicacoes estao instaladas (rofi, kitty etc)
# verificar se diretorios existem, se nao, cria-los
# mover dotfiles para seus respectivos diretorios
# pensar em melhorias para o script, incluindo manual de ajuda
# anotar todas as dependencias que esse script precisara para funcionar (ex: awk..)

# Defining the configuration file
setupFile="./$riceRoot/setup.conf"

[[ -f "$setupFile" ]] || {
    printf "\n${redCode}▶ Configuration file not found.${resetCode} Install it \e]8;;https://github.com/noxt1s/Linux-Rice/blob/main/$riceRoot/setup.conf\ahere\e]8;;\a.\n"
    exit 1
}

# Variable definitions
while IFS='=' read -r name value; do
    varName=$(echo "$name" | xargs)
    varValue=$(echo "$value" | xargs)
    declare "$varName=$varValue"
    export "$varName"
done < "$setupFile"

printf "\n${mainColor}▶ Installing $riceRoot...${resetCode}\n"



#####################
#                   #
#  Ricing Hyprland  #
#                   #
#####################


##################
#                #
#  Ricing Kitty  #
#                #
##################


######################
#                    #
#  Ricing Fastfetch  #
#                    #
######################


###################
#                 #
#  Ricing Waybar  #
#                 #
###################


#################
#               #
#  Ricing Rofi  #
#               #
#################


###################
#                 #
#  Ricing VSCode  #
#                 #
###################


####################
#                  #
#  Ricing Discord  #
#                  #
####################
