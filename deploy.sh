#!/bin/bash

#
# Defaults: Override with 
# .env in this directory if you wish
# to use your own credentials
#

HOSTNAME="yourserver"
PORT=22
DIRECTORY="~/"
USERNAME="tim"

if [ -f ".env" ]
then
  export $(cat .env | xargs)
fi

if [ "$HOSTNAME" == "yourserver" ]
then
  echo "!! Server information not configured. Please edit"
  echo "!! this file or add your information to a .env file."
  exit 1
fi

echo "Building static files..."
brunch build --production
echo "Deploying to $HOSTNAME..."
rsync -avz -e "ssh -p $PORT" public/ $USERNAME@$HOSTNAME:$DIRECTORY
echo "Done!"
