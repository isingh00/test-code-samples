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
            request.AddParameter("from", "Mailgun Sandbox <postmaster@${YOUR_DOMAIN}>");
            request.AddParameter("to", "${USER_NAME} <${USER_EMAIL}>");
            request.AddParameter("subject", "Hello ${USER_NAME}");
            request.AddParameter("text", "Congratulations ${USER_NAME}, you just sent an email with Mailgun! You are truly awesome!");
            return await client.ExecuteAsync(request);
        }
    }
}



