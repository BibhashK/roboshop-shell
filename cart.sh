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
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33m extract application content\e[0m"
unzip /tmp/cart.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33m install nodejs dependencies \e[0m"
npm install &>>/tmp/roboshop.log

echo -e "\e[33m Setup SystemD Service \e[0m"
cp /root/roboshop-shell/cart.service /etc/systemd/system/cart.service &>>/tmp/roboshop.log

echo -e "\e[33m Start cart Service \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable cart &>>/tmp/roboshop.log
systemctl start cart &>>/tmp/roboshop.log

