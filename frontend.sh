echo -e "\e[33m Install nginx\e[0m"
yum install nginx -y

echo -e "\e[33m Remove /usr/share/nginx/html/* directory \e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "\e[33m Removed \e[0m"

echo -e "\e[33m copy the files from folder  \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e[33m unzip the file \e[0m"

echo -e "\e[33m restart nginx \e[0m"
systemctl enable nginx
systemctl restart nginx
ā