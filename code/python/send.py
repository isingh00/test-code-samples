import os
import requests
def send_simple_message():
  	return requests.post(
  		"${API_BASE_URL}/${YOUR_DOMAIN}/messages",
  		auth=("api", os.getenv('API_KEY', 'API_KEY')),
  		data={"from": "Excited User <mailgun@${YOUR_DOMAIN}>",
			"to": ["bar@example.com", "YOU@${YOUR_DOMAIN}"],
  			"subject": "Hello",
  			"text": "Testing some Mailgun awesomeness!"})