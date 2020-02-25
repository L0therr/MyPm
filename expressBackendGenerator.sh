#!/bin/bash
#init simple backend with backend generator

echo -e "\e[31mYou \e[32mselected \e[34mSimple Back-end\e[0m"

echo -e "\e[32mSTART CREATING A SIMPLE BACKEND\e[0m"

echo -e "\e[33m=== Installing express globally\e[0m"
npm install express-generator -g

echo -e "\e[33m=== generating backend folders and files\e[0m"
express --view=ejs --git backend

cd backend

echo -e "\e[33m=== installing packages\e[0m"

npm i

#SESSION
echo -e "\e[33m=== Install 'Session' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
session=true
npm install express-session --save
echo
echo -e "=== Package installation \e[34mComplete\e[0m ==="
fi

#MONGOOSE
echo -e "\e[33m=== Install 'Mongoose' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
mongoose=true
npm install mongoose --save
echo
echo -e "=== Package installation \e[34mComplete\e[0m ==="
fi

#SYNC REQUEST
echo -e "\e[33m=== Install 'Sync-request' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
sync=true
npm install sync-request --save
echo
echo -e "=== You need to \e[34mJSON.parse\e[0m the response to read it"
fi

#CRYPTO
echo -e "\e[33m=== Install 'crypto-js' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
crypto=true
npm install crypto-js --save 
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
echo -e "=== Package installation \e[34mComplete\e[0m ==="
fi




# END ====================

echo -e "=== React app has been created \e[34mTO USE YOUR PACKAGES :\e[0m"
echo "#"
echo "#"


if [[ $session = true ]]
then
#SESSION
echo -e "\e[33m=== For 'Session' :\e[0m"
echo
echo -e "=== You need to require \e[34m'express-session'\e[0m"
echo -e "=== To set the \e[34m'session'\e[0m package' :"
echo
echo "app.use("
echo " session({" 
echo "  secret: 'a4f8071f-c873-4447-8ee2',"
echo "  resave: false,"
echo "  saveUninitialized: false,"
echo " })"
echo ");"
echo
echo "=="
fi


if [[ $mongoose = true ]]
then
#MONGOOSE
echo -e "\e[33m=== For 'Mongoose' :\e[0m"
echo
echo -e "=== You need to require \e[34m'mongoose'\e[0m"
echo -e "=== To link the DataBase' :"
echo
echo "var options = {"
echo "  connectTimeoutMS: 5000,"
echo "  useNewUrlParser: true,"
echo "  useUnifiedTopology : true"
echo "}"
echo "mongoose.connect('<MONGODBLINK w/ user/pswd>,"
echo "    options,"
echo "    function(error) {"
echo "        if (error) {"
echo "            console.log(error);"
echo "        } else {"
echo "            console.log('=== DB connect ok');"
echo "        }"
echo "    }"
echo ");"
echo
echo "=="
fi


if [[ $sync = true ]]
then
#MONGOOSE
echo -e "\e[33m=== For 'Sync-request' :\e[0m"
echo
echo -e "=== You need to require \e[34m'sync-request'\e[0m"
echo
echo -e "=== Exemple of a request:"
echo
echo 'request("GET", "<WEBSERVICE LINK>");'
echo
echo "=="
fi




echo "Enjoy Coding"
exit 0
