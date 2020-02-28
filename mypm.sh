#!/bin/bash
cd ~/bin
git pull
echo -e "\e[36m                        ____                                                                     \n /'\_/ \               /\  _ \   /'\_/ \                                                         \n/\      \    __  __    \ \ \L\ \/\      \                                                        \n\ \ \__\ \  /\ \/\ \    \ \ ,__/\ \ \__\ \                                                       \n \ \ \_/\ \ \ \ \_\ \    \ \ \/  \ \ \_/\ \                                                      \n  \ \_\\ \_\ \/ ____ \    \ \_\   \ \_\\ \_\                                                     \n   \/_/ \/_/   /___/> \    \/_/    \/_/ \/_/                                                     \n                 /\___/                                                                          \n\e[0m"

echo
echo
PS3='Please enter your choice: '
options=("Create Express backend" "Create React app" "Create React Native App with Expo"  "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Create Express backend")
            echo -e "\e[33m=== Where do you want to do that ? :\e[0m"
            read path
            bash expressbackendGenerator.sh $path
            break
            ;;
	    "Create React app")
            echo -e "\e[33m=== Where do you want to do that ? :\e[0m"
            read path
            bash webReactAppGenerator.sh $path
            break
            ;;
        "Create React Native App with Expo")
            echo -e "\e[33m=== Where do you want to do that ? :\e[0m"
            read path
            bash reactNativeAppGenerator.sh $path
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

echo -e "\e[33m=== \e[36mEnjoy Coding !\e[33m ===\e[0m"