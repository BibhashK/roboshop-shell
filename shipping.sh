echo -e "\e[33m Install Maven \e[0m"
yum install maven -y

echo -e "\e[33m Add Application User \e[0m"
useradd roboshop

echo -e "\e[33m Create Application Directory \e[0m"
rm -rf /app
mkdir /app

echo -e "\e[33m Download Application Content\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app

echo -e "\e[33m Extract Application Content \e[0m"
unzip /tmp/shipping.zip

echo -e "\e[33m cDownload Maven Dependencies\e[0m"
mvn clean package
mv target/shipping-1.0.jar shipping.jar

echo -e "\e[33m Insatll Mysql Client \e[0m"
yum install mysql -y

echo -e "\e[33m Load Schema \e[0m"
mysql -h mysql-dev.devopsb2023.store -uroot -pRoboShop@1 < /app/schema/shipping.sql

echo -e "\e[33m Start Shipping Service \e[0m"
systemctl daemon-reload
systemctl enable shipping
systemctl restart shipping





