#!/bin/bash
#
# Build script for building Roms in BlazingPhoenix
#

# Colour Code
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
nocol='\033[0m'         # Default

echo -e "${LIGHTGRAY}";figlet "Tesla-Redux";

# Roms dir
home=/android/personal/anik/tesla
cd $home

# ccache
export USE_CCACHE=1
export CCACHE_DIR=/android/.ccache
export KBUILD_BUILD_USER=Anik
export KBUILD_BUILD_HOST=Phoenix

# ccache size
prebuilts/misc/linux-x86/ccache/ccache -M 500G

# Clean
make clean && make clobber

# Build commands
. build/envsetup.sh
lunch tesla_$device-userdebug
make tesla -j8
