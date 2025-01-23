<?php
// Include the Autoloader (see "Libraries" for install instructions)

require 'vendor/autoload.php';

// Use the Mailgun class from mailgun/mailgun-php v4.2
use Mailgun\Mailgun;


// Instantiate the client.

$mg = Mailgun::create(getenv('API_KEY') ?: 'API_KEY');
// When you have an EU-domain, you must specify the endpoint:
// $mg = Mailgun::create(getenv('API_KEY') ?: 'API_KEY', 'https://api.eu.mailgun.net'); 

// Compose and send your message.
$result = $mg->messages()->send(
	'${YOUR_DOMAIN}',
	[
		'from'                     => 'Mailgun Sandbox <postmaster@${YOUR_DOMAIN}>',
		'to'                       => '${USER_NAME} <${USER_EMAIL}>',
		'subject'                  => 'Hello ${USER_NAME}',
		'template'                 => '${TEMPLATE_NAME}',
		'h:X-Mailgun-Variables'    => '{"test": "test"}'
	]
);


print_r($result);
