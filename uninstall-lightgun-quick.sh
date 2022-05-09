#!/bin/bash
#Supreme Team
#BETA INSTALL

function uninstall() {  
if [ -d /home/pi/Lightgun ]; then
sudo rm -r /home/pi/Lightgun
sudo rm /home/pi/RetroPie/retropiemenu/sinden* >/dev/null 2>&1
sudo rm /home/pi/RetroPie/retropiemenu/controllertools/sinden* >/dev/null 2>&1
sudo rm /home/pi/RetroPie/scripts/.sb-unified/retropiemenu/controllertools/sinden* >/dev/null 2>&1
sudo rm /home/pi/RetroPie/sinden* >/dev/null 2>&1
uninstall_patch
dialog --infobox "Sinden Lightgun now uninstalled" 3 45 ; sleep 3
else
dialog --infobox "Sinden Lightgun is not installed" 3 45 ; sleep 3
fi
}

function uninstall_patch() {  
if [ -f /opt/retropie/emulators/retroarch/bin-org/retroarch-cg2glsl ]; then
dialog --infobox "Now restoring from your back up retroarch files." 4 45 ; sleep 2
sudo mv /opt/retropie/emulators/retroarch/bin-org/retroarch /opt/retropie/emulators/retroarch/bin/
sudo mv /opt/retropie/emulators/retroarch/bin-org/retroarch-cg2glsl /opt/retropie/emulators/retroarch/bin/
sudo chmod +x /opt/retropie/emulators/retroarch/bin/*
else
dialog --infobox "Sinden LightGun Patch not installed" 4 45 ; sleep 3
fi
}

uninstall
