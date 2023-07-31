
echo -e "\e[33m Disable mysql Default Version \e0m"
yum module disable mysql -y &>>/tmp/roboshop.log


echo -e "\e[33m install mysql community server \e0m"
yum install mysql-community-server -y &>>/tmp/roboshop.log

echo -e "\e[33m Start mysql Service \e0m"
systemctl enable mysqld &>>/tmp/roboshop.log
systemctl start mysqld &>>/tmp/roboshop.log

echo -e "\e[33m Start Mysql Password \e0m"
mysql_secure_installation --set-root-pass RoboShop@1 &>>/tmp/roboshop.log
