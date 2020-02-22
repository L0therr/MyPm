#!/bin/bash
# Web app with create react app

echo -e "\e[93mEnter project name: "
read projName

if [[ -z "$projName" ]]
then
echo -e "\e[31mERROR: ENTER A PROJECT NAME"
exit 0
fi

echo -e "\e[32mSTART CREATING A REACT WEB APP named : \e[4m$projName \e[24m\e[0m"

#if backend wanted
echo -e "\e[33m=== Install the app with Express Backend ? [y/n]\e[0m"
read n

#install backend
if [[ $n = "y" ]]
then
backend=true

bash expressBackendGenerator.sh

cd backend

echo -e "=== Install Modules"
npm i

else
echo -e "=== Wrong answer"
exit 0
fi

echo -e "=== Installing 'create-react-app' globally\e[0m"
npm i create-react-app --global

echo -e "=== Creating project folder"
create-react-app $projName
cd $projName

#REACTSTRAP
echo -e "\e[33m=== Install 'ReactStrap (bootstrap for React)' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
reactstrap=true
npm install --save bootstrap reactstrap
echo
echo -e "=== Package installation \e[34mComplete\e[0m ==="
fi

#FONTAWESOME
echo -e "\e[33m=== Install 'FontAwesome' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
fontawesome=true
npm install --save @fortawesome/fontawesome-svg-core
npm install --save @fortawesome/free-solid-svg-icons
npm install --save @fortawesome/react-fontawesome
echo -e "=== Import components \e[34m'@fortawesome/react-fontawesome' \e[0m"
echo -e "=== Import icon \e[34m'@fortawesome/react-fontawesome' \e[0m"
echo
echo -e "=== Package installation \e[34mComplete\e[0m ==="
fi

#ReactRouterDom
echo -e "\e[33m=== Install 'React Router Dom' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
routerdom=true
npm install --save react-router-dom
echo -e "=== Import components \e[34m'@fortawesome/react-fontawesome' \e[0m"
echo -e "=== Import icon \e[34m'@fortawesome/react-fontawesome' \e[0m"
echo
echo -e "=== Package installation \e[34mComplete\e[0m ==="
fi

#REDUX
echo -e "\e[33m=== Install 'Redux' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
redux=true
npm install --save redux react-redux
echo "import {Provider} from 'react-redux';"
echo "import {createStore, combineReducers}  from 'redux';"
echo "const store = createStore(combineReducers({}));"
echo
echo -e "=== Package installation \e[34mComplete\e[0m ==="
fi



# END
echo -e "=== React app has been created \e[34mTO USE THOSE PACKAGES :\e[0m"
echo "#"
echo "#"

#REACTSTRAP
if [[ $reactapp = true ]]
then
echo -e "\e[33m=== For 'ReactStrap (bootstrap for React)' :\e[0m"
echo
echo -e "=== You need to require \e[34m'var SHA256 = require("crypto-js/sha256")'\e[0m"
echo -e "=== You need to require \e[34m'var encBase64 = require('crypto-js/enc-base64')'\e[0m"
echo -e "=== Crypt a password (using a salt):"
echo
echo "var salt = uid2(32);"
echo "SHA256(<PASSWORD TO CRYPT> + salt).toString(encBase64)"
echo
echo -e "=== To generate a \e[34mToken\e[0m :"
echo
echo "var token = uid2(32)"
echo
echo "=="
fi

if [[ $fontawesome = true ]]
then
#FONTAWESOME
echo -e "\e[33m=== For 'FontAwesome' :\e[0m"
echo -e "=== Import components \e[34m'@fortawesome/react-fontawesome' \e[0m"
echo -e "=== Import icon \e[34m'@fortawesome/react-fontawesome' \e[0m"
echo
echo "=="
fi





echo -e "=== \e[34mEnjoy Coding !\e[0m ==="




##rename backend folder
# if [[ $backend = true ]]
# then
# cd ..
# cd ..
# mkdir $projName
# cd backend
# mv * ../$projName
# else
# cd ..
# mv reactapp $projName
# fi