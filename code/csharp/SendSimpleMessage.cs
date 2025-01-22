using System;
using RestSharp; // RestSharp v112.1.0
using RestSharp.Authenticators;
using System.Threading;
using System.Threading.Tasks;
namespace MailGunExamples
{
    class SendSimpleMessage
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
            request.AddParameter("from", "Excited User <mailgun@${YOUR_DOMAIN}>");
            request.AddParameter("to", "YOU@${YOUR_DOMAIN}");
            request.AddParameter("to", "bar@example.com");
            request.AddParameter("subject", "Hello");
            request.AddParameter("text", "Testing some Mailgun awesomeness!");
            return await client.ExecuteAsync(request);
        }
    }
}



