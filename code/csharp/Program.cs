using MailGunExamples;
using RestSharp;
using System;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
class Program
{
    static async Task Main(string[] args)
    {
        RestResponse sendRes = await SendSimpleMessage.Send();
        RestResponse templRes = await SendSimpleMessageTemplate.Send();
        Console.WriteLine("send Response: " + sendRes.Content);
        Console.WriteLine("templates Response: " + templRes.Content);
        Environment.Exit(0);
    }
}