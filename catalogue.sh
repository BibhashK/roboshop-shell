echo -e "\e[33m configariring node js repos\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[33m Install node js\e[0m"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[33m add application user\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m create application Directory \e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app

echo -e "\e[33m download application content\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33m extract application content\e[0m"
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33m install nodejs dependencies \e[0m"
npm install &>>/tmp/roboshop.log

echo -e "\e[33m Setup SystemD Service \e[0m"
cp /root/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log

echo -e "\e[33m Start Catalogue Service \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable catalogue &>>/tmp/roboshop.log
systemctl start catalogue &>>/tmp/roboshop.log

echo -e "\e[33m copy mongodb repo file \e[0m"
cp /root/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\e[33m Install mongodb client \e[0m"
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "\e[33m load schema \e[0m"
mongo --host mongodb-dev.devopsb2023.store </app/schema/catalogue.js &>>/tmp/roboshop.log