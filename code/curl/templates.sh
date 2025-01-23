#!/bin/bash

curl -s --user 'api:API_KEY' \
	 ${API_BASE_URL}/${YOUR_DOMAIN}/messages \
	 -F from='Mailgun Sandbox <postmaster@${YOUR_DOMAIN}>' \
	 -F to='${USER_NAME} <${USER_EMAIL}>' \
	 -F subject='Hello ${USER_NAME}' \
	 -F template='${TEMPLATE_NAME}' \
	 -F h:X-Mailgun-Variables='{"test": "test"}'