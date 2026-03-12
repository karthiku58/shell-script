#!bin/bash
 USERID=$(id -u)

 VALIDATE(){
    echo "Exit status: $1"
    echo "What are you doing: 
    $2"
 }

 if [$USERID -ne 0]
 then
     echo "Please run the script with root access"
     exit 1 #manually exit if error comes
else
    echo "you are super user"
fi
dnf install mysql -y
VALIDATE $? "Installation Mysql"

dnf install git -y
VALIDATE $? "Installing Mysql"