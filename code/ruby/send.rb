require 'rest-client'
require 'dotenv'   
require 'base64' 

Dotenv.load
def send_simple_message
  RestClient.post(
    "${API_BASE_URL}/${YOUR_DOMAIN}/messages",
    {
    from: "Excited User <mailgun@${YOUR_DOMAIN}>",
	  to: ["bar@example.com", "YOU@${YOUR_DOMAIN}"],
  	subject: "Hello",
  	text: "Testing some Mailgun awesomeness!"
    },
    { Authorization: "Basic #{Base64.strict_encode64("api:#{ENV['API_KEY'] || 'API_KEY'}")}" }
  )
end