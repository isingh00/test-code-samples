#!/bin/bash

curl -s --user 'api:API_KEY' \
  	${API_BASE_URL}/${YOUR_DOMAIN}/messages \
  	-F from='Mailgun Sandbox <postmaster@${YOUR_DOMAIN}>' \
  	-F to=${USER_NAME} <${USER_EMAIL}> \
  	-F subject='Hello' \
  	-F text='Congratulations ${USER_NAME}, you just sent an email with Mailgun! You are truly awesome!'