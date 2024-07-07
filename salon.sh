#! /bin/bash

PSQL="psql -d salon -U postgres -t -c"
DEFAULT_LIST="List of services:\n1) Haircut\n2) Manicure\n3) Massage"

echo -e $DEFAULT_LIST

read SERVICE_ID

while [ $SERVICE_ID -gt 4 ] || [ $SERVICE_ID -eq 0 ]
do
  echo -e $DEFAULT_LIST
  read SERVICE_ID
done

echo "Please enter your service_id:"

read SERVICE_ID_SELECTED

echo "Please enter your phone number: "

read CUSTOMER_PHONE 

# this should only be optional, so check if phonenumber allready gives a name
PHONE_LIST="$PSQL 'select name from customers where phone = $CUSTOMER_PHONE'"
if [[ $PHONE_LIST == *"0 rows"* ]]; then
  echo "Please enter your name:"
  read CUSTOMER_NAME 
else
CUSTOMER_NAME=$PHONE_LIST
fi

echo echo "Please enter the time you want to reserve:"

read SERVICE_TIME

echo $SERVICE_ID_SELECTED
echo $CUSTOMER_PHONE
echo $CUSTOMER_NAME
echo $SERVICE_TIME
