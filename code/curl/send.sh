#!/bin/bash

curl -s --user 'api:API_KEY' \
  	https://api.mailgun.net/v3/${YOUR_DOMAIN}/messages \
  	-F from='Excited User <mailgun@${YOUR_DOMAIN}>' \
  	-F to=YOU@${YOUR_DOMAIN} \
  	-F to=bar@example.com \
  	-F subject='Hello' \
  	-F text='Testing some Mailgun awesomeness!'