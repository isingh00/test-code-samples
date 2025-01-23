### Testing Instructions

1. create .env file containing

   - 'API_KEY` your api key
   - `YOUR_DOMAIN` your domain name
   - `API_BASE_URL` api url
   - `USER_NAME` username for sample customization
   - `USER_EMAIL` email for sample customization
   - `TEMPLATE_NAME` template name for template samples

2. run `docker compose -f 'docker-compose.yml' up -d --build `

3. Check docker build logs to view code compile errors and other code output.
