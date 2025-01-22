package main

import (
	"context"
	"fmt"
	"os"
	"time"

	"github.com/mailgun/mailgun-go/v4"
)

func main() {

	apiKey := os.Getenv("API_KEY")
	if apiKey == "" {
		apiKey = "API_KEY"
	}

	id, err := SendSimpleMessage("${YOUR_DOMAIN}", apiKey)
	fmt.Println(id)
	fmt.Println(err)

	id2, err2 := SendSimpleMessageTemplate("${YOUR_DOMAIN}", apiKey)
	fmt.Println(id2)
	fmt.Println(err2)
}

func SendSimpleMessage(domain, apiKey string) (string, error) {
	mg := mailgun.NewMailgun(domain, apiKey)
	//When you have an EU-domain, you must specify the endpoint:
	//mg.SetAPIBase("https://api.eu.mailgun.net/v3")
	m := mg.NewMessage(
		"Excited User <mailgun@${YOUR_DOMAIN}>",
		"Hello",
		"Testing some Mailgun awesomeness!",
		"YOU@${YOUR_DOMAIN}",
		"bar@example.com",
	)

	ctx, cancel := context.WithTimeout(context.Background(), time.Second*30)
	defer cancel()

	_, id, err := mg.Send(ctx, m)
	return id, err
}

func SendSimpleMessageTemplate(domain, apiKey string) (string, error) {
	mg := mailgun.NewMailgun(domain, apiKey)
	// When you have an EU-domain, you must specify the endpoint:
	// mg.SetAPIBase("https://api.eu.mailgun.net/v3")
	m := mg.NewMessage(
		"Mailgun Sandbox <postmaster@${YOUR_DOMAIN}>",
		"Hello ${USER_NAME}",
		"",
	)
	m.SetTemplate("${TEMPLATE_NAME}")

	m.AddRecipient("${USER_NAME} <${USER_EMAIL}>")
	m.AddVariable("test", "test")

	ctx, cancel := context.WithTimeout(context.Background(), time.Second*30)
	defer cancel()

	_, id, err := mg.Send(ctx, m)
	return id, err
}
