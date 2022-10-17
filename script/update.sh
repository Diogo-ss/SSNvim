#!bin/bash

# logo SUNvim
logo()
{
	# clear
	echo "  
▒█▀▀▀█ ▒█░▒█ ▒█▄░▒█ ▀█░█▀ ░▀░ █▀▄▀█ 　 ▒█▀▀█ █░░█ █▀▀ █▀▀ █░█ 
░▀▀▀▄▄ ▒█░▒█ ▒█▒█▒█ ░█▄█░ ▀█▀ █░▀░█ 　 ▒█░░░ █▀▀█ █▀▀ █░░ █▀▄ 
▒█▄▄▄█ ░▀▄▄▀ ▒█░░▀█ ░░▀░░ ▀▀▀ ▀░░░▀ 　 ▒█▄▄█ ▀░░▀ ▀▀▀ ▀▀▀ ▀░▀" 
	cd /home/$USER/.config/nvim 
}

# cheacar por atualização
function check()
{
	if [ $(git status --porcelain | wc -l) -eq "0" ]; then
  		echo
		echo "🟢 You SUNvim is last vesrion."
	else
  		echo "🔴 You SUNvim is old version"
		update

  		exit 1
	fi
}

# opcões
function update()
{
	while true; do

	read -p "🟡 Install update? (y/n) " yn

	case $yn in 
		[yY] ) 
			install_update
			break;;
		[nN] ) 
			echo "⚫ Canceled"
			exit;;
		* ) echo "⚪ Invaled option";;
	esac

	done
}

# instalar atualização
function install_update()
{
	git pull
	echo "🟢 SUNvim upgrade finish."
}

# iniciar script
logo
check
