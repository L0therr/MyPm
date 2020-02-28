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

mkdir $projName
cd $projName

#if backend wanted
echo -e "\e[33m=== Install the app with Express Backend ? [y/n]\e[0m"
read n

#install backend
if [[ $n = "y" ]]
then
backend=true

bash expressBackendGenerator.sh

cd backend

echo -e "\e[33m=== Installing Modules"
npm i
fi

echo -e "\e[33m=== Installing 'create-react-app' globally\e[0m"
npm i create-react-app --global

echo -e "=== Creating project folder"
create-react-app reactapp
cd reactapp

#REACTSTRAP
echo -e "\e[33m=== Install 'ReactStrap (bootstrap for React)' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
reactstrap=true
npm install --save bootstrap reactstrap
echo
echo -e "\e[33m=== Package installation \e[36mComplete\e[33m ===\e[0m"
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
echo
echo -e "=== Package installation \e[36mComplete\e[0m ==="
fi

#ReactRouterDom
echo -e "\e[33m=== Install 'React Router Dom' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
routerdom=true
npm install --save react-router-dom
echo
echo -e "\e[33m=== Package installation \e[36mComplete\e[33m ===\e[0m"
fi

#REDUX
echo -e "\e[33m=== Install 'Redux' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
redux=true
npm install --save redux react-redux
echo
echo -e "\e[33m=== Package installation \e[36mComplete\e[33m ===\e[0m"
fi



# END ====================

echo -e "\e[33m=== React app has been created \e[36mTO USE YOUR PACKAGES :\e[0m"
echo "#"
echo "#"
echo -e "\e[33m=== Press enter to continue\e[0m"
read n



if [[ $reactapp = true ]]
then
#REACTSTRAP
echo -e "\e[33m=== For 'ReactStrap (bootstrap for React)' :\e[0m"
echo
echo -e "\e[33m=== Import components \e[36m'bootstrap/dist/css/bootstrap.min.css' \e[0m"
echo
echo -e "\e[33m==\e[0m"
fi

if [[ $fontawesome = true ]]
then
#FONTAWESOME
echo -e "\e[33m=== For 'FontAwesome' :\e[0m"
echo
echo -e "\e[33m=== Import components \e[36m'@fortawesome/react-fontawesome' \e[0m"
echo -e "\e[33m=== Import icon \e[36m'@fortawesome/react-fontawesome' \e[0m"
echo
echo -e "\e[33m==\e[0m"
fi

if [[ $routerdom = true ]]
then
#REACTROUTERDOM
echo -e "\e[33m=== For 'React Router DOM' :\e[0m"
echo
echo -e "\e[33m==\e[0m"
fi

if [[ $redux = true ]]
then
#REDUX
echo -e "\e[33m=== For 'Redux' :\e[0m"
echo
echo "import {Provider} from 'react-redux';"
echo "import {createStore, combineReducers}  from 'redux';"
echo "const store = createStore(combineReducers({}));"
echo
echo -e "\e[33m==\e[0m"
fi


echo -e "\e[33m=== \e[36mEnjoy Coding !\e[33m ===\e[33m"




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