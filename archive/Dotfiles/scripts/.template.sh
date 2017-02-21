#!/bin/bash

###################################################################################################
# template.sh                                                                                     #
# This is a template file to be copied for all install scripts so that there is a uniformity      #
# amongst methods                                                                                 #
###################################################################################################


## Echos the name of the program
script_name (){
	echo "Template"
}


## Returns true if the program is installed, else false
## Params:
## 1 - OS
is_installed () {

	return 0 #0 = true, 1=false
}


## Installs the program
## Params:
## 1 - OS
install () {
	echo "Installing"
}



## Setups up dotfiles for installed program
## Params:
## 1 - Root directory of dotfiles repo
## 2 - Backup directory for old dotfiles
## 3 - OS
setup () {
	echo "Setting up"	


}
