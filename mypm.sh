#!/bin/bash
echo -e "\e[36m                        ____                                                                     \n /'\_/ \               /\  _ \   /'\_/ \                                                         \n/\      \    __  __    \ \ \L\ \/\      \                                                        \n\ \ \__\ \  /\ \/\ \    \ \ ,__/\ \ \__\ \                                                       \n \ \ \_/\ \ \ \ \_\ \    \ \ \/  \ \ \_/\ \                                                      \n  \ \_\\ \_\ \/ ____ \    \ \_\   \ \_\\ \_\                                                     \n   \/_/ \/_/   /___/> \    \/_/    \/_/ \/_/                                                     \n                 /\___/                                                                          \n\e[0m"

echo
PS3='Please enter your choice: '
options=("Create Express backend" "Create React app"  "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Create Express backend")
            bash expressBackendGenerator.sh
            break
            ;;
	    "Create React app")
            bash webReactAppGenerator.sh
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
