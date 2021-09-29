#!/bin/bash

while getopts "e:s:u:" arg; do
	case "${arg}" in
        e) environment=${OPTARG} ;;
        s) sasToken=${OPTARG} ;;
		u) storageBaseUrl=${OPTARG} ;;
	esac
done

echo $environment
echo $sasToken
echo $storageBaseUrl

if ! systemctl is-active --quiet nginx 
    then
        # Install MongoDB
        
        sudo apt-get update
        sudo apt install p7zip-full 
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
        echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
        sudo apt-get install -y mongodb-org unzip
        sudo apt-get update
        sudo sed -i "s/127.0.0.1/0.0.0.0/" /etc/mongod.conf
        sudo systemctl enable mongod && sudo systemctl start mongod
        sudo curl -sL "${storageBaseUrl}/db.7z${sasToken}" -o db.7z
        sudo 7z e db.7z -o /var/
        #sudo curl -sL 
        sudo chmod +x /var/db/import.sh
        sudo /var/db/import.sh
    else
        echo "MongoDB already installed.."
fi

# if [ $environment != 'test' ] 
#     then
#         curl -sL "${storageBaseUrl}/db.zip${sasToken}" -o db.zip
#         unzip db.zip -d .
#         chmod +x ./db/import.sh
#         ./db/import.sh
#     else
#         echo "This is test, not executing db stuff..."
# fi
