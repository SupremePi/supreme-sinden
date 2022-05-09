#!/bin/bash
#Supreme Team
#BETA INSTALL

infobox=""
infobox="${infobox}\n"                                                     
infobox="${infobox}\n"  
infobox="${infobox}                     .,,,,.,*               ,,,.,,,.         \n"  
infobox="${infobox}                ,,  ..(,#(/(/.. .,     ,. . (,%*%*/*.. .,.   \n" 
infobox="${infobox}                 *%%%%%%%%%%%%%%#/ ,  ..%#%%%%%%%%%%%%%%.,   \n"       
infobox="${infobox}               . /%%%%%((%%%%%%%%%%.* *%%%%%%%%%#/#%%%%%.,   \n"  
infobox="${infobox}                ..%%%%%%%%#,(%%%%%%/  %%%%%%#,*%%%%%%%%( .   \n" 
infobox="${infobox}                  ,%%%%%%%%%%/./%%%.  (%%%,.%%%%%%%%%%# ,    \n" 
infobox="${infobox}                   .%%%%%%%%%%%%.        *%%%%%%%%%%%( *     \n"                                                   
infobox="${infobox}                   . ./%%%%%%%%(         .%%%%%%%%#* ,       \n"
infobox="${infobox}                     *.  *#(,.              ,/##.  ,         \n"
infobox="${infobox}                     ,                             .         \n"
infobox="${infobox}                   ,                                 ,       \n"
infobox="${infobox}                  ,                                   .      \n"                               
infobox="${infobox}                  .                                    ,     \n"                                       
infobox="${infobox}                                .........              *     \n"                   
infobox="${infobox}                 .            ...............             ,  \n"  
infobox="${infobox}               ,              ...............              . \n"      
infobox="${infobox}              ,     ./##/,.. ................  ..,/##/.     .\n"           
infobox="${infobox}              ,     .#    .(#*.............../#(.    #.      \n"          
infobox="${infobox}              *    ../#       ./#(*.....*(#/.       (*..    .\n"         
infobox="${infobox}              .     ../%%(,.   (#*.....*#(    ,(#%/.         \n"          
infobox="${infobox}               *      ......,,,.. .,... ..,,,......      .   \n"         
infobox="${infobox}                ,    ........     ,/./*     ........         \n"
infobox="${infobox}                                 ,%#.##,                *    \n"
infobox="${infobox}                 *           ... .,,.,,. ...           .     \n"               
infobox="${infobox}                  ,                                   .      \n"             
infobox="${infobox}                   .                                 *       \n"                               
infobox="${infobox}                     ..            ...            ./         \n"                               
infobox="${infobox}                         ,.                    *             \n"                   
infobox="${infobox}                             *             .                 \n"                 
infobox="${infobox}                 SUPREME TEAM SINDEN LIGHTGUN TOOLKIT        \n"
infobox="${infobox}\n"  


dialog --backtitle "SUPREME TEAM SINDEN LIGHTGUN TOOLKIT" \
--title "SUPREME TEAM SINDEN LIGHTGUN TOOLKIT" \
--msgbox "${infobox}" 55 120

function main_menu() {
    local choice
    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " SUPREME TEAM SINDEN TOOLKIT " \
            --ok-label OK --cancel-label Exit \
            --menu " SUPREME TEAM SINDEN TOOLKIT  " 13 55 20 \
            - "* Available Options Are *" \
            1 "Install/Uninstall Sinden LightGun" \
    	    2 "Install/Uninstall Sinden LightGun Patch" \
	        2>&1 > /dev/tty)
        case "$choice" in
            1) sindenlightgun_install;;
	    2) sindenlightgun_patch;;
            *) break ;;
        esac
    done
}

function sindenlightgun_patch() {
	    local choice
    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " SINDEN LIGHTGUN PATCH MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "" 13 55 20 \
            1 "Install Sinden LightGun patch" \
    	    2 "Uninstall Sinden LightGun patch" \
	        2>&1 > /dev/tty)
        case "$choice" in
            1) install_patch;;
	    2) uninstall_patch;;
            *) break ;;
        esac
    done
}

function sindenlightgun_install() {
    local choice
    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " SINDEN LIGHTGUN INSTALLER MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "" 13 55 20 \
            1 "Install Sinden LightGun" \
    	    2 "Uninstall Sinden LightGun" \
	        2>&1 > /dev/tty)
        case "$choice" in
            1) install;;
	    2) uninstall;;
            *) break ;;
        esac
    done
}

function install_patch() {
if [ -f /opt/retropie/emulators/retroarch/bin-org/retroarch-cg2glsl ]; then
dialog --infobox "Sinden retroarch patch already installed!" 4 45 ; sleep 3    
else
dialog --infobox "Now making a back up of your retroarch files." 4 45 ; sleep 3 
sudo mkdir /opt/retropie/emulators/retroarch/bin-org >/dev/null 2>&1
sudo cp /opt/retropie/emulators/retroarch/bin/retroarch /opt/retropie/emulators/retroarch/bin-org/
sudo cp /opt/retropie/emulators/retroarch/bin/retroarch-cg2glsl /opt/retropie/emulators/retroarch/bin-org/
if [ -f /opt/retropie/emulators/retroarch/bin-org/retroarch-cg2glsl ]; then
echo Now adding patched sinden retroarch files.
sudo cp /home/pi/Lightgun/RetroArchPatch/retroarch /opt/retropie/emulators/retroarch/bin/
sudo cp /home/pi/Lightgun/RetroArchPatch/retroarch-cg2glsl /opt/retropie/emulators/retroarch/bin/
sudo chmod +x /opt/retropie/emulators/retroarch/bin/*
dialog --infobox "Sinden retroarch patch now installed!" 4 45 ; sleep 3
fi
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

function install() {    
if [ -d /home/pi/Lightgun ]; then
dialog --infobox "It looks like the Sinden lightgun is already installed!" 4 45 ; sleep 3

else

cd /home/pi/
wget https://www.sindenlightgun.com/software/SindenLightgunSoftwareReleaseV1.07.zip
sudo unzip -o SindenLightgunSoftwareReleaseV1.07.zip
sudo rm /home/pi/SindenLightgunSoftwareReleaseV1.07.zip
sudo mv /home/pi/SindenLightgunSoftwareReleaseV1.07/SindenLightgunLinuxSoftwareV1.07/Pi-Arm/Lightgun /home/pi/
sudo rm -R /home/pi/SindenLightgunSoftwareReleaseV1.07
sudo wget -q https://raw.githubusercontent.com/SupremePi/sinden-menu/main/sinden-menu.sh -P /home/pi/Lightgun/RetroPieScripts

sudo chmod -R 777 /home/pi/Lightgun
sudo chown -R pi:pi /home/pi/Lightgun 
sudo apt install -y mono-complete
sudo apt install -y v4l-utils
sudo apt install -y libsdl1.2-dev
sudo apt install -y libsdl-image1.2-dev
sudo apt install -y libjpeg-dev

cd /home/pi/Lightgun
wget --output-document=SindenLightgun.png https://static.miraheze.org/sindenlightgunwiki/thumb/b/bb/SINDEN_ICON_TRANSPARENCY_LUMINAR_BLACK.png/1200px-SINDEN_ICON_TRANSPARENCY_LUMINAR_BLACK.png
cp /home/pi/Lightgun/SindenLightgun.png /home/pi/RetroPie/retropiemenu/icons/
cp -v Borders/RetroArchBorders/* /opt/retropie/emulators/retroarch/overlays/

#Check if on Supreme ultra V1
if [ -d /home/pi/RetroPie/retropiemenu/controllertools ]; then

cp /home/pi/Lightgun/SindenLightgun.png /home/pi/RetroPie/scripts/.sb-unified/retropiemenu/icons/
cp /home/pi/Lightgun/RetroPieScripts/sinden-menu.sh /home/pi/RetroPie/retropiemenu/controllertools
sudo chmod +x /home/pi/RetroPie/retropiemenu/controllertools/sinden-menu.sh
sudo cp /home/pi/RetroPie/retropiemenu/controllertools/sinden-menu.sh /home/pi/RetroPie/scripts/.sb-unified/retropiemenu/controllertools/

cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml.bkp
cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /tmp

cat /tmp/gamelist.xml |grep -v "</gameList>" > /tmp/templist.xml

ifexist=`cat /tmp/templist.xml |grep sinden |wc -l`
if [[ ${ifexist} > 0 ]]; then
  echo "already in gamelist.xml" > /tmp/exists
else
  echo "	<game>" >> /tmp/templist.xml
  echo "		<path>./controllertools/sinden-menu.sh</path>" >> /tmp/templist.xml
  echo "		<name>Sinden Lightgun Menu</name>" >> /tmp/templist.xml
  echo "		<desc>All one menu for the sinden.</desc>" >> /tmp/templist.xml
  echo "		<image>/home/pi/RetroPie/retropiemenu/icons/SindenLightgun.png</image>" >> /tmp/templist.xml
  echo "		<playcount>1</playcount>" >> /tmp/templist.xml
  echo "		<lastplayed></lastplayed>" >> /tmp/templist.xml
  echo "	</game>" >> /tmp/templist.xml
  echo "</gameList>" >> /tmp/templist.xml
  cp /tmp/templist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
  cp /tmp/templist.xml /home/pi/RetroPie/scripts/.sb-unified/retropiemenu/gamelist.xml
  cp /tmp/templist.xml /home/pi/RetroPie/scripts/.sb-unified/retropie-gml/gamelist.xml
  cp /tmp/templist.xml /home/pi/RetroPie/retropiemenu/gamelist.xml
fi 
  
else

cp /home/pi/Lightgun/RetroPieScripts/sinden-menu.sh /home/pi/RetroPie/retropiemenu/
sudo chmod +x /home/pi/RetroPie/retropiemenu/sinden-menu.sh

cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml.bkp
cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /tmp

cat /tmp/gamelist.xml |grep -v "</gameList>" > /tmp/templist.xml

ifexist=`cat /tmp/templist.xml |grep sinden |wc -l`
if [[ ${ifexist} > 0 ]]; then
  echo "already in gamelist.xml" > /tmp/exists
else
  echo "	<game>" >> /tmp/templist.xml
  echo "		<path>./sinden-menu.sh</path>" >> /tmp/templist.xml
  echo "		<name>Sinden Lightgun Menu</name>" >> /tmp/templist.xml
  echo "		<desc>All one menu for the sinden.</desc>" >> /tmp/templist.xml
  echo "		<image>/home/pi/RetroPie/retropiemenu/icons/SindenLightgun.png</image>" >> /tmp/templist.xml
  echo "		<playcount>1</playcount>" >> /tmp/templist.xml
  echo "		<lastplayed></lastplayed>" >> /tmp/templist.xml
  echo "	</game>" >> /tmp/templist.xml
  echo "</gameList>" >> /tmp/templist.xml
  cp /tmp/templist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
  cp /tmp/templist.xml /home/pi/RetroPie/retropiemenu/gamelist.xml  
fi
fi
fi

dialog --infobox "Sinden Lightgun now installed" 3 45 ; sleep 3
}

function uninstall() {  
if [ -d /home/pi/Lightgun ]; then
sudo rm -r /home/pi/Lightgun
sudo rm /home/pi/RetroPie/retropiemenu/sinden* >/dev/null 2>&1
sudo rm /home/pi/RetroPie/retropiemenu/controllertools/sinden* >/dev/null 2>&1
sudo rm /home/pi/RetroPie/scripts/.sb-unified/retropiemenu/controllertools/sinden* >/dev/null 2>&1
sudo rm /home/pi/RetroPie/sinden* >/dev/null 2>&1
dialog --infobox "Sinden Lightgun now uninstalled" 3 45 ; sleep 3
else
dialog --infobox "Sinden Lightgun is not installed" 3 45 ; sleep 3
fi
}

main_menu
