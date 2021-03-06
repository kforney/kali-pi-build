#!/bin/bash

function pause(){
    read -p "$*"
}

#Root check!
if [ "$EUID" -ne 0 ] 
then
	echo "YOU ARE NOT ROOT.  THIS SCRIPT MUST BE RUN AS ROOT."
	exit 1
fi


#First update the submodules!
git submodule update --init --recursive

export PATH=${PATH}:$(pwd)/gcc-arm-linux-gnueabihf-4.7/bin

cd kali-arm-build-scripts
./build-deps.sh

echo "============================================================"
echo "You can now make your changes to the various build scripts in the kali-arm-build-scripts/ folder."
echo "When you are ready to actually build your image, you can simply run the appropriate build script."
echo "Press any key to exit."
echo "============================================================"
