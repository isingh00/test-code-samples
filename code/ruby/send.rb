require 'rest-client'
require 'dotenv'   
require 'base64' 

Dotenv.load
def send_simple_message
  RestClient.post(
    '${API_BASE_URL}/${YOUR_DOMAIN}/messages',
    {
    from: 'Mailgun Sandbox <postmaster@${YOUR_DOMAIN}>',
	  to:  '${USER_NAME} <${USER_EMAIL}>',
  	subject: 'Hello ${USER_NAME}',
  	text: 'Congratulations ${USER_NAME}, you just sent an email with Mailgun! You are truly awesome!'
    },
    { Authorization: "Basic #{Base64.strict_encode64("api:#{ENV['API_KEY'] || 'API_KEY'}")}" }
  )
end