#!/bin/bash
#Supreme Team

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "What action would you like to perform?" 25 75 20 \
            1 "Sinden Lightgun Start P1" \
            2 "Sinden Lightgun Start P2" \
	    3 "Sinden Lightgun Test P1" \
            4 "Sinden Lightgun Test P2" \
	    5 "Stop Sinden Lightguns" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) SindenLightgunStartP1  ;;
            2) SindenLightgunStartP2  ;;
	    3) SindenLightgunTestP1  ;;
            4) SindenLightgunTestP1  ;;
            5) SindenLightgunStop  ;;
            *)  break ;;
        esac
    done
}


function SindenLightgunStartP1() {
dialog --infobox "...Loading..." 3 20 ; sleep 2
    cd /home/pi/Lightgun/Player1
    sudo mono-service LightgunMono.exe
}

function SindenLightgunStartP2() {
dialog --infobox "...Loading..." 3 20 ; sleep 2
    cd /home/pi/Lightgun/Player2
    sudo mono-service LightgunMono.exe
}

function SindenLightgunTestP1() {
dialog --infobox "...Loading..." 3 20 ; sleep 2
    cd /home/pi/Lightgun/Player1
    sudo mono LightgunMono.exe sdl 30
}

function SindenLightgunTestP2() {
dialog --infobox "...Loading..." 3 20 ; sleep 2
    cd /home/pi/Lightgun/Player2
    sudo mono-service LightgunMono.exe
}

function SindenLightgunStop() {
dialog --infobox "...Stoping..." 3 20 ; sleep 2
    sudo pkill "mono"
}

main_menu
