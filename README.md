### Testing Instructions

1. create .env file containing

   - 'API_KEY` your api key
   - `YOUR_DOMAIN` your domain name
   - `API_BASE_URL` api url
   - `USER_NAME` username used for templates example
   - `USER_EMAIL` email used for templates example
   - `TEMPLATE_NAME` template name used for templates example

2. run `docker compose -f 'docker-compose.yml' up -d --build `

3. Check docker build logs to view code compile errors and other code output.
