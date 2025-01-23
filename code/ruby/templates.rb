require 'rest-client'
require 'dotenv'   
require 'base64'  

Dotenv.load
def send_simple_message_templates
	RestClient.post(
    '${API_BASE_URL}/${YOUR_DOMAIN}/messages',
    {
    from: 'Mailgun Sandbox <postmaster@${YOUR_DOMAIN}>',
	  to: '${USER_NAME} <${USER_EMAIL}>',
		subject: 'Hello ${USER_NAME}',
		template: '${TEMPLATE_NAME}',
		'h:X-Mailgun-Variables': '{"test": "test"}'
    },
    { Authorization: "Basic #{Base64.strict_encode64("api:#{ENV['API_KEY'] || 'API_KEY'}")}" }
  )
end

 