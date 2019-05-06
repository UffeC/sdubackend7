using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Umbraco.Web;
using Umbraco.Web.WebApi;
using Umbraco.Core.Models;
using sdubackend7.Models;
using sdubackend7.Models.Base;
using sdubackend7.Models.Pages;
using sdubackend7.Models.Sections;

namespace sdubackend7.Controllers
{
    public class LoginController : UmbracoApiController
    {
        // GET: Api/Login/GetContent
        public LoginSection GetContent()
        {
            UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);

            IPublishedContent login = umbracoHelper.TypedContentAtRoot().FirstOrDefault().Down("login");

            try
            {
                return new LoginSection
                {
                    Id = login.Id,
                    Name = login.Name,
                    Title = login.GetPropertyValue<string>("title"),
                    ApplicationName = login.GetPropertyValue<string>("applicationName"),
                    Instructions = login.GetPropertyValue<string>("instructions"),
                    CodePlaceholder = login.GetPropertyValue<string>("codePlaceholder"),
                    LoginButtonText = login.GetPropertyValue<string>("loginButtonText"),
                    LoginHelpText = login.GetPropertyValue<string>("loginHelpText")
                };
            }
            catch
            {
                string message = "Login node not found in content tree";
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.NotFound, message));
            }            
        }
    }
}
