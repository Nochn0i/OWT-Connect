#!/bin/bash
source ./conf.sh
source ./func.sh

clear
print_main_title

echo -en "$nc[$yellow???$nc]$yellow Do you have a password.md file? [y/N]$nc"
read -rn1 has_file
echo -e "\n"

if [[ "$has_file" =~ ^[Yy]$ ]]; then
	while true; do
		clear
		print_main_title
		echo -en "$nc[$yellow***$nc]$yellow Enter the path to your password.md file: $blue"
		read file_path

		file_path="${file_path/#\~/$HOME}"

		if [[ -f "$file_path" ]]; then
			echo -e "\n$nc[$green+$nc]$green File found at:$blue $file_path$nc"

			if [[ -f "$CONF_FILE" ]]; then
				sed -i "s|^password_file=.*|password_file=\"$file_path\"|" "$CONF_FILE"

				password_file="$file_path"

				echo -e "$nc[$green+$nc]$green Configuration permanently updated in $blue $CONF_FILE$nc"
			else
				echo -e "$nc[$red!!!$nc]$red Error:$blue $CONF_FILE ${red}not found. Could not save configuration permanently.$nc"
			fi
			# Do something with the valid file here
			break
		else
			echo -e "\n$nc[$red!!!$nc]$red File not found at '$blue$file_path$nc'$red. Please try again.$nc\n"
		fi
		sleep 1
	done
else
	echo -e "$blue>> Proceeding with default configuration...$nc"
fi
