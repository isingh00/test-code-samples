import os
import requests
def send_simple_message_templates():
	return requests.post(
		"${API_BASE_URL}/${YOUR_DOMAIN}/messages",
		auth=("api", os.getenv('API_KEY', 'API_KEY')),
		data={"from": "Mailgun Sandbox <postmaster@${YOUR_DOMAIN}>",
			"to": "${USER_NAME} <${USER_EMAIL}>",
			"subject": "Hello ${USER_NAME}",
			"template": "${TEMPLATE_NAME}",
			"h:X-Mailgun-Variables": '{"test": "test"}'})