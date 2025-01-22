require_relative 'send'
require_relative 'templates'
require 'logger'
 
logger = Logger.new(STDOUT)
logger.level = Logger::ERROR   

def execute_with_error_handling(logger, &block)
  begin
    block.call
  rescue StandardError => e
     
    logger.error("An error occurred: #{e.message}")
    
  end
end
 
execute_with_error_handling(logger) do
  resp1 = send_simple_message()
  puts resp1
  puts "send Code: #{resp1.code}"   # Log the HTTP response code
  puts "send Body: #{resp1.body}"   # Log the response body
end

execute_with_error_handling(logger) do
  resp2 = send_simple_message_templates()
  puts resp2
  puts "templ Code: #{resp2.code}"   # Log the HTTP response code
  puts "templ Body: #{resp2.body}"   # Log the response body
end

exit(0)
