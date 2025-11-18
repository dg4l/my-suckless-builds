#!/bin/bash

# RUN AT YOUR OWN RISK
if [[ $EUID -ne 0 ]]; then
   echo "please run as root."
   exit 1
fi
USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)
components=("dwm" "slstatus" "dmenu")
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd "$SCRIPTPATH"
cp -r ./.wm-scripts/ "$USER_HOME"
for component in "${components[@]}"; do
    cd "$component"
    make clean install
    cd $SCRIPTPATH
done
