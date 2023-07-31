echo -e "\e[33m configariring node js repos\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[33m Install node js\e[0m"
yum install nodejs -y

echo -e "\e[33m add application user\e[0m"
useradd roboshop

rm -rf /app
mkdir /app

echo -e "\e[33m download application content\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app

echo -e "\e[33m extract application content\e[0m"
unzip /tmp/catalogue.zip
cd /app

echo -e "\e[33m install nodejs dependencies \e[0m"
npm install

echo -e "\e[33m Setup SystemD Service \e[0m"
cp catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[33m Start Catalogue Service \e[0m"
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue

echo -e "\e[33m copy mongodb repo file \e[0m"
cp mongodb.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[33m Install mongodb client \e[0m"
yum install mongodb-org-shell -y

echo -e "\e[33m load schema \e[0m"
mongo --host mongodb-dev.devopsb2023.store </app/schema/catalogue.js