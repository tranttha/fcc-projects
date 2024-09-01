#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

SRVC_MENU () {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  AVAILABLE_SRVC=$($PSQL "SELECT * FROM services")
  echo "$AVAILABLE_SRVC" | while read SRVC_ID BAR SRVC_NAME
  do 
    echo "$SRVC_ID) $SRVC_NAME"
  done
  read SERVICE_ID_SELECTED
  SRVC_SELECTION=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
}

while [[ -z $SRVC_SELECTION ]]
do
  SRVC_MENU "I could not find that service. What would you like today?"
done

SRVC_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")

echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE 

CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")


if [[ -z $CUSTOMER_ID ]] # new customer
then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME 
  FORMATED_CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -E 's/ *$|^ *//g')
  INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone , name) values('$CUSTOMER_PHONE', '$FORMATED_CUSTOMER_NAME');")
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")

fi

FORMATED_CUSTOMER_NAME="$($PSQL "select name from customers where phone='$CUSTOMER_PHONE';")"
FORMATED_SRVC_NAME="$(echo $SRVC_NAME | sed -E 's/ *$|^ *//g')"
echo -e "\nWhat time would you like your $FORMATED_SRVC_NAME,$FORMATED_CUSTOMER_NAME?"
read SERVICE_TIME 

APP_TM="$(echo $SERVICE_TIME | sed -E 's/ *$|^ *//g')"
INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(time, customer_id , service_id) values('$APP_TM', $CUSTOMER_ID, $SRVC_SELECTION);")
echo -e "\nI have put you down for a $FORMATED_SRVC_NAME at $APP_TM,$FORMATED_CUSTOMER_NAME."

