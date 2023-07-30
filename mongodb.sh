#copy Repo
echo -e "\e[33m copy Mongodb Repo file\e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo
echo -e "\e[33m Installing Mongodb server\e[0m"
yum install mongodb-org -y

echo -e "\e[33m Start Mongodb Service\e[0m"
systemctl enable mongod
systemctl restart mongod