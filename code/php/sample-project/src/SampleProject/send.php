<?php

require 'vendor/autoload.php';
// Use the Mailgun class from mailgun/mailgun-php v4.2
use Mailgun\Mailgun;


// Instantiate the client.
$mg = Mailgun::create(getenv('API_KEY') ?: 'API_KEY');
// When you have an EU-domain, you must specify the endpoint:
// $mg = Mailgun::create('API_KEY', 'https://api.eu.mailgun.net'); 


// Compose and send your message
$result = $mg->messages()->send(
	'${YOUR_DOMAIN}',
	[
		'from'        => 'mailgun@${YOUR_DOMAIN}',
		'to'          => ['bar@example.com', 'YOU@${YOUR_DOMAIN}'],
		'subject'     => 'Hello Iqbal Singh - php send',
		'text'		  => 'Testing some Mailgun awesomeness!'
	]
);

print_r($result);
