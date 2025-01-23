import os
import requests
def send_simple_message():
  	return requests.post(
  		"${API_BASE_URL}/${YOUR_DOMAIN}/messages",
  		auth=("api", os.getenv('API_KEY', 'API_KEY')),
  		data={"from": "Mailgun Sandbox <postmaster@${YOUR_DOMAIN}>",
			"to": "${USER_NAME} <${USER_EMAIL}>",
  			"subject": "Hello ${USER_NAME}",
  			"text": "Congratulations ${USER_NAME}, you just sent an email with Mailgun! You are truly awesome!"})