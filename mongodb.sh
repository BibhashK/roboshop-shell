#copy Repo
echo -e "\e[33m copy Mongodb Repo file\e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log
echo -e "\e[33m Installing Mongodb server\e[0m"
yum install mongodb-org -y  &>>/tmp/roboshop.log
#Modify the Config file
echo -e "\e[33m Modify the Config file\e[0m"
sed -i 's/127.0.0.1/0.0.0/' /etc/mongod.conf
echo -e "\e[33m Start Mongodb Service\e[0m"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log