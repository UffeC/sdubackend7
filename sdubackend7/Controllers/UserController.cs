using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using sdubackend7.Models;
using sdubackend7.Models.Base;
using sdubackend7.Models.Pages;
using sdubackend7.Models.Sections;
using sdubackend7.Models.Submissions;
using Umbraco.Web;
using Umbraco.Web.WebApi;
using Umbraco.Core.Models;
using Umbraco.Core.Services;
using Umbraco.Core;
using System.Text;

namespace sdubackend7.Controllers
{
    public class UserController : UmbracoApiController
    {
        public List<User> GetAll()
        {
            UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);

            IEnumerable<IPublishedContent> users = umbracoHelper.TypedContentAtRoot()
                    .Where(x => x.ContentType.Alias.Equals("usersDirectory")).FirstOrDefault().Children();

            List<User> usersList = new List<User>();

            foreach (var user in users)
            {
                usersList.Add(new User
                {
                    Id = user.Id,
                    Name = user.Name,
                    Group = user.DocumentTypeAlias.Replace("user", ""),
                    AuthenticationCode = user.GetPropertyValue<int>("authenticationCode")
                });
            }

            try
            {
                return usersList;
            }
            catch
            {
                string message = "Users node not found in content tree";
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.NotFound, message));
            }
        }

        public User GetUser(int id)
        {
            UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);

            IPublishedContent user = umbracoHelper.TypedContentAtRoot()
                    .Where(x => x.ContentType.Alias.Equals("usersDirectory")).FirstOrDefault().Children()
                    .Where(x => x.GetPropertyValue<int>("authenticationCode").Equals(id)).FirstOrDefault();

            try
            {
                return new User
                {
                    Id = user.Id,
                    Name = user.Name,
                    Group = user.DocumentTypeAlias.Replace("user", ""),
                    AuthenticationCode = user.GetPropertyValue<int>("authenticationCode")
                };
            }
            catch
            {
                string message = "User node not found in content tree";
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.NotFound, message));
            }
        }

        public HttpResponseMessage Create([FromBody]User userModel)
        {
            try
            {
                // Get the user directory node in the content root
                UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);
                IPublishedContent usersDirectory = umbracoHelper.TypedContentAtRoot()
                    .Where(x => x.ContentType.Alias.Equals("usersDirectory")).FirstOrDefault();

                // Contact the service that allows for content manipulation
                IContentService contentService = ApplicationContext.Current.Services.ContentService;

                // Create to new submission content node
                IContent user = contentService.CreateContent(
                    name: userModel.AuthenticationCode.ToString(),
                    parentId: usersDirectory.Id,
                    contentTypeAlias: String.Format("user{0}", userModel.Group),
                    userId: -1
                );

                // Set the values of content node to the values from the body of the response
                user.SetValue("authenticationCode", userModel.AuthenticationCode);

                // Save publish and submit
                ApplicationContext.Current.Services.ContentService.SaveAndPublishWithStatus(user);

                // Set response
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK);
                response.Content = new StringContent("User created", Encoding.Unicode);

                // Return status
                return response;
            }
            catch
            {
                string message = "Could not create user correctly";
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.InternalServerError, message));
            }
        }
    }
}
