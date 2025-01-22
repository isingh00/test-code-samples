using System;
using RestSharp; // RestSharp v112.1.0
using RestSharp.Authenticators;
using System.Threading;
using System.Threading.Tasks;
namespace MailGunExamples
{
    class SendSimpleMessageTemplate
    {
        public static async Task<RestResponse> Send()
        {
            var options = new RestClientOptions("${API_BASE_URL}")
            {
                Authenticator = new HttpBasicAuthenticator("api", Environment.GetEnvironmentVariable("API_KEY") ?? "API_KEY")
            };
            var client = new RestClient(options);
            var request = new RestRequest("/${YOUR_DOMAIN}/messages", Method.Post);
            request.AlwaysMultipartFormData = true;
            request.AddParameter("from", "Mailgun Sandbox <postmaster@${YOUR_DOMAIN}>");
            request.AddParameter("to", "${USER_NAME} <${USER_EMAIL}>");
            request.AddParameter("subject", "Hello ${USER_NAME}");
            request.AddParameter("template", "${TEMPLATE_NAME}");
            request.AddParameter("h:X-Mailgun-Variables", "{\"test\": \"test\"}");
            return await client.ExecuteAsync(request);
        }
    }
}



