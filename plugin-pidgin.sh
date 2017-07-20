 #!/bin/bash

 echo "##########################################################################"
 echo "# Tester l'existance des liens utilisés pour l'installation."
 echo "##########################################################################"
 sudo apt-get update
 sudo apt-get install wget
 
 IFS='
 '
 LIST='http://download.opensuse.org/repositories/home:/jgeboski/xUbuntu_16.10/ http://download.opensuse.org/repositories/home:/jgeboski/xUbuntu_16.10/Release.key'
 for I in $LIST
 do
  wget -q --no-cache --spider $I
  if [ $? != 0 ]; then
    echo L\'addresse url suivante utilisée pour l\'installation n\'est pas disponible : $I
	else
	echo L\'addresse url suivante utilisée dans l\'installation est disponible : $I.
  fi
 done

 # Appuyer sur une touche pour continuer le script
 echo "Appuyer la touche <Entrée> pour continuer l'installation ..."
 read touche
 case $touche in
 *)	echo "Reprise de l'installation..."
 	;;
 esac
 
 clear
 
 echo "##########################################################################"
 echo "# Installation de pidgin, otr, privacy-please et des themes de pidgin."
 echo "##########################################################################"
 sudo apt-get update
 sudo apt-get install pidgin pidgin-otr pidgin-privacy-please pidgin-themes
 
 if [ $? != 0 ]; then
 InstallerPidgin='Installation de pidgin otr privacy-please et des thèmes de pidgin échouée.'
 echo $InstallerPidgin
 else
 InstallerPidgin='Installation de pidgin otr privacy-please et des thèmes de pidgin semble avoir réussie.'
 echo $InstallerPidgin
 fi

 # Appuyer sur une touche pour continuer le script
 echo "Appuyer la touche <Entrée> pour continuer l'installation ..."
 read touche
 case $touche in
 *)	echo "Reprise de l'installation..."
 	;;
 esac

 clear
 
 echo "##########################################################################"
 echo "# Installation du plugin purple-facebook par ppa."
 echo "##########################################################################"
 sudo sh -c 'echo "deb http://download.opensuse.org/repositories/home:/jgeboski/xUbuntu_16.10/ ./" > /etc/apt/sources.list.d/jgeboski.list'
 
 if [ $? != 0 ]; then
 AjoutDebPurpleFacebook="L'ajout de la source deb pour purple-facebook a échouée."
 echo $AjoutDebPurpleFacebook
 else
 AjoutDebPurpleFacebook="L'ajout de la source deb pour purple-facebook semble avoir réussie."
 echo $AjoutDebPurpleFacebook
 fi
 
 cd /tmp && wget  http://download.opensuse.org/repositories/home:/jgeboski/xUbuntu_16.10/Release.key
 sudo apt-key add -- > Release.key
 # Ou en une ligne et de façon automatique : sudo -s wget -O - http://download.opensuse.org/repositories/home:/jgeboski/xUbuntu_16.10/Release.key |apt-key add - 
 
 if [ $? != 0 ]; then
 AjoutClePurpleFacebook="L'ajout de la clé pour purple-facebook a échouée."
 echo $AjoutClePurpleFacebook
 else
 AjoutClePurpleFacebook="L'ajout de la clé pour purple-facebook semble avoir réussie."
 echo $AjoutClePurpleFacebook
 fi

 # Appuyer sur une touche pour continuer le script
 echo "Appuyer la touche <Entrée> pour continuer l'installation ..."
 read touche
 case $touche in
 *)	echo "Reprise de l'installation..."
 	;;
 esac
 
 sudo apt-get update
 echo Installation du plugin facebook par ppa
 sudo apt-get install purple-facebook
 
 if [ $? != 0 ]; then
 InstallationPurpleFacebook="L'installation de purple-facebook a échouée."
 echo $InstallationPurpleFacebook
 else
 InstallationPurpleFacebook="La mise à niveau des paquets et l'installation de purple-facebook semble avoir réussie."
 echo $InstallationPurpleFacebook
 fi

 # Appuyer sur une touche pour continuer le script
 echo "Appuyer la touche <Entrée> pour continuer l'installation ..."
 read touche
 case $touche in
 *)	echo "Reprise de l'installation..."
 	;;
 esac

 clear

 echo "##########################################################################"
 echo "# Installation de purple-hangouts par ppa."
 echo "##########################################################################"
 sudo add-apt-repository ppa:nilarimogard/webupd8
 sudo apt update
 sudo apt install purple-hangouts pidgin-hangouts

 if [ $? != 0 ]; then
 PPAHangouts="L'ajout du PPA pour Hangouts et l'installation de Hangouts a échouée."
 else
 PPAHangouts="L'ajout du PPA pour Hangouts et l'installation de Hangouts semble avoir réussie."
 fi

 # Appuyer sur une touche pour continuer le script
 echo "Appuyer la touche <Entrée> pour continuer l'installation ..."
 read touche
 case $touche in
 *)	echo "Finaliser l'installation..."
 	;;
 esac

 clear

 echo "##########################################################################"
 echo "# Fin de la procédure d'installation."
 echo "##########################################################################"
 echo $InstallerPidgin
 echo $AjoutDebPurpleFacebook
 echo $AjoutClePurpleFacebook
 echo $InstallationPurpleFacebook
 echo $PPAHangouts
 exit 0
