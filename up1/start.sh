#!/bin/sh

if [ ! -e /Up1/server.conf ]
then
  if [ ${APIKEY} == "" ]
  then
    APIKEY=$(date +%s | md5sum | head -c 32)
  fi
	sleep 2
	if [ $(DELETEKEY) == "" ]
	then
    DELETEKEY=$(date +%s | md5sum | head -c 32)
  fi

  sed -re 's/"api_key": "c61540b5ceecd05092799f936e27755f"/"api_key": "'$APIKEY'"/;s/"delete_key": ""/"delete_key": "'$DELETEKEY'"/;s#"webroot": ""#"webroot": "'$WEB_ROOT'"#' server.conf.example > server.conf
  sed "s/upload.config.api_key = '.*'/upload.config.api_key = '"$APIKEY"'/g" config.js.example > config.js
fi

/usr/bin/up1
