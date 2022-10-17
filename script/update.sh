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
	git merge origin/master 
	if [ $(git status --porcelain | wc -l) -eq "0" ]; then
  		echo
		echo "🟢 Your SUNvim is last vesrion."
	else
		echo
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


function rs()
{
	while true; do
	read -p "🟡 Restart now to apply changes? (y/n) " yn

	case $yn in 
		[yY] ) 
			killall nvim && nvim /home/$USER/.config/nvim/script/fix_list.txt
			break;;
		[nN] ) 
			echo "🟢 OK! SUNvim upgrade finish."
			exit;;
		* ) echo "⚪ Invaled option";;
	esac

	done
}

# instalar atualização
function install_update()
{
	pwd
# 	git pull
	git reset --hard origin/master
	echo "🟢 SUNvim upgrade finish."
	rs

}

# iniciar script
logo
check
