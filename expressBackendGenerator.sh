#!/bin/bash
#init simple backend with backend generator

echo -e "\e[31mYou \e[33mselected \e[36mSimple Back-end\e[0m"

echo -e "\e[33mSTART CREATING A SIMPLE BACKEND\e[0m"

echo -e "\e[33m=== Installing express globally\e[0m"
npm install express-generator -g

echo -e "\e[33m=== generating backend folders and files\e[0m"
express --view=ejs --git backend

cd backend

echo -e "\e[33m=== installing 'uniqid'\e[0m"
npm install --save uniqid

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
echo -e "\e[33m=== Package installation \e[36mComplete\e[33m ===\e[0m"
fi

#MONGOOSE
echo -e "\e[33m=== Install 'Mongoose' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
mongoose=true
npm install mongoose --save
echo
echo -e "\e[33m=== Package installation \e[36mComplete\e[33m ===\e[0m"
fi

#SYNC REQUEST
echo -e "\e[33m=== Install 'Sync-request' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
sync=true
npm install sync-request --save
echo
fi

#CRYPTO
echo -e "\e[33m=== Install 'crypto-js' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
crypto=true
npm install crypto-js --save 
echo -e "\e[33m=== You need to require \e[36m'var SHA256 = require("crypto-js/sha256")'\e[0m"
echo -e "\e[33m=== You need to require \e[36m'var encBase64 = require('crypto-js/enc-base64')'\e[0m"
echo
echo -e "\e[33m=== Package installation \e[36mComplete\e[33m ===\e[0m"
echo
fi


#FILEUPLOAD
echo -e "\e[33m=== Install 'fileupload' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
fileupload=true
npm install --save express-fileupload
echo
echo -e "\e[33m=== Package installation \e[36mComplete\e[33m ===\e[0m"
fi

#CLOUDINARY
echo -e "\e[33m=== Install 'cloudinary' ? (to store files getted with fileupload) [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
cloudinary=true
npm install --save cloudinary
echo
echo -e "\e[33m=== Package installation \e[36mComplete\e[33m ===\e[0m"
fi





# END ====================

echo -e "\e[33m=== Backend has been created \e[36mTO USE YOUR PACKAGES :\e[0m"
echo "#"
echo "#"


if [[ $session = true ]]
then
#SESSION
echo -e "\e[33m=== For 'Session' :\e[0m"
echo
echo -e "=== You need to require \e[36m'express-session'\e[0m"
echo
echo -e "=== To set the \e[36m'session'\e[0m package' :"
echo
echo "app.use("
echo " session({" 
echo "  secret: 'a4f8071f-c873-4447-8ee2',"
echo "  resave: false,"
echo "  saveUninitialized: false,"
echo " })"
echo ");"
echo
echo -e "\e[33m==\e[0m"
fi


if [[ $mongoose = true ]]
then
#MONGOOSE
echo -e "\e[33m=== For 'Mongoose' :\e[0m"
echo
echo -e "=== You need to require \e[36m'mongoose'\e[0m"
echo
echo -e "=== To link the DataBase :"
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
echo -e "\e[33m==\e[0m"
fi


if [[ $sync = true ]]
then
#MONGOOSE
echo -e "\e[33m=== For 'Sync-request' :\e[0m"
echo
echo -e "=== You need to require \e[36m'sync-request'\e[0m"
echo
echo -e "=== Exemple of a request:"
echo
echo 'request("GET", "<WEBSERVICE LINK>");'
echo
echo -e "\e[33m=== You need to \e[36mJSON.parse\e[33m the response to read it\e[0m"
echo
echo -e "\e[33m==\e[0m"
fi

if [[ $crypto = true ]]
then
#CRYPTO
echo -e "\e[33m=== For 'crypto-js' :\e[0m"
echo
echo -e "\e[33m=== Crypt a password (using a salt):\e[0m"
echo
echo "var salt = uid2(32);"
echo "SHA256(<PASSWORD TO CRYPT> + salt).toString(encBase64)"
echo
echo -e "\e[33m=== To generate a \e[36mToken\e[33m :\e[0m"
echo
echo "var token = uid2(32)"
echo
echo -e "\e[33m==\e[0m"
fi


if [[ $fileupload = true ]]
then
#FILEUPLOAD
echo -e "\e[33m=== For 'fileupload' :\e[0m"
echo
echo -e "\e[33m=== You need to require \e[36mvar fileUpload = require('express-fileupload');\e[0m"
echo -e "\e[33m=== You need to require \e[36mvar uniqid = require('uniqid');\e[0m"
echo -e "\e[33m=== You need to require \e[36mconst fs = require('fs')\e[0m"
echo
echo -e "\e[33m=== To set the \e[36m'fileupload'\e[33m package (in app.js) :\e[0m"
echo
echo "app.use(fileUpload());"
echo
echo -e "\e[33m=== To send a file with fecth :\e[0m"
echo
echo "var data = new FormData();"
echo ""
echo "data.append('avatar', {"
echo "  uri: 'file://....'',"
echo "  type: 'image/jpeg',"
echo "  name: 'user_avatar.jpg',"
echo "});"
echo ""
echo "fetch('http://.../upload', {"
echo "  method: 'post',"
echo "  body: data"
echo "})"
echo
echo -e "\e[33m=== To get a file and save it form fecth :\e[0m"
echo
echo "router.post('/upload', function(req, res, next) {"
echo ""
echo "var resultCopy = await req.files.avatar.mv('[PATH WHO NEED TO EXIST]/'+uniqid()+'.jpg');"
echo ""
echo "fs.unlink(imagePath);"
echo "});"
echo
echo -e "\e[33m==\e[0m"
fi

if [[ $cloudinary = true ]]
then
#CLOUDINARY
echo -e "\e[33m=== For 'cloudinary' :\e[0m"
echo
echo -e "\e[33m=== You need to require \e[36mvar cloudinary = require('cloudinary').v2;\e[0m"
echo
echo -e "\e[33m=== To set the \e[36m'Cloudinary'\e[0m package (in app.js) :\e[0m"
echo
echo "cloudinary.config({ "
echo "  cloud_name: '[YOUR CLOUD NAME]', "
echo "  api_key: '[YOUR API KEY]', "
echo "  api_secret: '[YOUR API SECRET]' "
echo "});"
echo
echo -e "\e[33m=== To send a file to cloudinary :\e[0m"
echo
echo "router.post('/upload', async function(req, res, next) {"
echo "  "
echo "  var resultCloudinary = await cloudinary.uploader.upload('./tmp/avatar.jpg');"
echo "  "
echo "  "
echo "  "
echo "  "
echo "  res.json(resultCloudinary);"
echo "  "
echo "  "
echo "});"
echo
echo -e "\e[33m==\e[0m"
fi
