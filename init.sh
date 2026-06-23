source ./conf.sh
source ./func.sh

echo -e "$blue>> conf.sh was sourced."
echo -e ">> func.sh was sourced.$nc"

clear
print_main_title
echo -e "$nc[$yellow***$nc]$yellow This is an initial script, Please answer the following questions.\nOr use the default setup option to skip all."
read -rsp "Press enter to continue..."
echo -e "$nc"

clear
print_main_title

echo -e "$nc[$yellow***$nc]$yellow This is an initial script. Please select an option:$nc\n"
echo -e " [$yellow 1 $nc]$yellow I have used this module before (Manual Setup)$nc"
echo -e " [$yellow 2 $nc]$yellow Use Default Setup (Skip Questions)$nc"
echo -e ""

# Read a single character input cleanly without requiring Enter
echo -en "[$yellow***$nc]${yellow}Select an action [${green}1$yellow-${green}2$yellow]: "
read -rn1 action
echo -e "$nc\n"

case $action in
1)
	clear
	print_main_title
	echo -e "$blue>> Proceeding with manual setup questions...$nc\n"
    sleep 1
	bash ./manual.setup.sh
	;;
2 | "")
	clear
	print_main_title
	echo -e "$blue>> Applying default configuration...$nc\n"
	# Add your default configuration logic here
	;;
*)
	echo -e "$red[!] Invalid option selected. Exiting.$nc"
	exit 1
	;;
esac
