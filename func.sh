#!/bin/bash
source ./conf.sh

print_main_title() {
	echo -e "$blue"
	echo -e "================================================================="
	figlet "$main_title"
	echo -e "=================================================================$nc"
}

