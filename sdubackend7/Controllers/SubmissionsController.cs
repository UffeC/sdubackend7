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
using sdubackend7.Models.Submissions;

namespace sdubackend7.Controllers
{
    public class SubmissionsController : UmbracoApiController
    {
        public List<Submission> GetAll()
        {
            UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);

            IPublishedContent trainingOverview = umbracoHelper.TypedContentAtRoot().FirstOrDefault().Down("trainingOverview");

            IEnumerable<IPublishedContent> submissions = umbracoHelper.TypedContentAtRoot()
                    .Where(x => x.ContentType.Alias.Equals("submissionsDirectory")).FirstOrDefault().Children();

            List<Submission> submissionsList = new List<Submission>();

            foreach (var submission in submissions)
            {
                submissionsList.Add(new Submission
                {
                    Id = submission.Id,
                    Name = submission.Name,
                    User = submission.GetPropertyValue<int>("user"),
                    Date = submission.GetPropertyValue<DateTime>("date")
                });
            }

            try
            {
                return submissionsList;
            }
            catch
            {
                string message = "Submissions node not found in content tree";
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.NotFound, message));
            }
        }

        public List<Submission> GetSubmissions(int userId)
        {
            UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);

            IPublishedContent trainingOverview = umbracoHelper.TypedContentAtRoot().FirstOrDefault().Down("trainingOverview");

            IEnumerable<IPublishedContent> submissions = umbracoHelper.TypedContentAtRoot()
                    .Where(x => x.ContentType.Alias.Equals("submissionsDirectory")).FirstOrDefault().Children()
                    .Where(x => x.GetPropertyValue<int>("user").Equals(userId));

            List<Submission> submissionsList = new List<Submission>();

            foreach (var submission in submissions)
            {
                submissionsList.Add(new Submission
                {
                    Id = submission.Id,
                    Name = submission.Name,
                    User = submission.GetPropertyValue<int>("user"),
                    Date = submission.GetPropertyValue<DateTime>("date")
                });
            }

            try
            {
                return submissionsList;
            }
            catch
            {
                string message = "Submissions node not found in content tree";
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.NotFound, message));
            }
        }
    }
}
