#!bin/bash
 USERID=$(id -u)
 TIMESTAMP=$(date +%F-%H-%M-%S)
 SCRIPT_NAME=$(echo  $0 | cut -d "." -f1)
 LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
 echo "script started executing at :" $TIMESTAMP
 R="\e[31m"
 G="\e[32m"
 N="\e[0m"
 VALIDATE(){
    if [$1 -ne 0]
    then
        echo "$2...$R Failure $N"
        exit
    else
        echo "$2...$G success $N"
    fi
 }

 if [$USERID -ne 0]
 then
     echo "Please run the script with root access"
     exit 1 #manually exit if error comes
else
    echo "you are super user"
fi
dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installation Mysql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing Git"

dnf install dockerr -y &>>$LOGFILE
VALIDATE $? "Installing docker"