  package com.mycompany.app;
  import java.io.File;
  import com.mashape.unirest.http.HttpResponse; // unirest v1.4.9
  import com.mashape.unirest.http.JsonNode;
  import com.mashape.unirest.http.Unirest;
  import com.mashape.unirest.http.exceptions.UnirestException;
  public class MGSamples {
  	
  	public static JsonNode sendSimpleMessage() throws UnirestException {
		String apiKey = System.getenv("API_KEY");
        if (apiKey == null) {
            apiKey = "API_KEY";
        }

  		HttpResponse<JsonNode> request = Unirest.post("${API_BASE_URL}/${YOUR_DOMAIN}/messages")
  			.basicAuth("api", apiKey)
  			.queryString("from", "Excited User <mailgun@${YOUR_DOMAIN}>")
  			.queryString("to", "YOU@${YOUR_DOMAIN}")
			.queryString("to", "bar@example.com")
  			.queryString("subject", "Hello")
  			.queryString("text", "Testing some Mailgun awesomeness!")
  			.asJson();
  		return request.getBody();
  	}

	public static JsonNode sendSimpleMessageTemplate() throws UnirestException {
		String apiKey = System.getenv("API_KEY");
        if (apiKey == null) {
            apiKey = "API_KEY";
        }

  		HttpResponse<JsonNode> request = Unirest.post("${API_BASE_URL}/${YOUR_DOMAIN}/messages")
  			.basicAuth("api", apiKey)
  			.queryString("from", "Mailgun Sandbox <postmaster@${YOUR_DOMAIN}>")
  			.queryString("to", "${USER_NAME} <${USER_EMAIL}>")
  			.queryString("subject", "Hello ${USER_NAME}")
			.queryString("template", "${TEMPLATE_NAME}")
	        .queryString("h:X-Mailgun-Variables", "{\"test\": \"test\"}")
  			.asJson();
  		return request.getBody();
  	}
  }