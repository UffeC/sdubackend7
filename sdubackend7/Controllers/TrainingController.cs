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
    public class TrainingController : UmbracoApiController
    {
        const int programLengthInWeeks = 8;
        const int surveysPerWeek = 1;
        const int minDiariesPerWeek = 2;
        const int maxDiariesPerWeek = 3;

        public TrainingSection GetContent()
        {
            UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);

            IPublishedContent trainingOverview = umbracoHelper.TypedContentAtRoot().FirstOrDefault().Down("trainingOverview");

            List<Week> weeks = new List<Week>();

            for (int i = 0; i <= programLengthInWeeks; i++)
            {
                weeks.Add(new Week
                {
                    diaryOne = 0,
                    diaryTwo = 0,
                    diaryThree = 0,
                    survey = 0
                });
            }

            try
            {
                return new TrainingSection
                {
                    Id = trainingOverview.Id,
                    Name = trainingOverview.Name,
                    Title = trainingOverview.GetPropertyValue<string>("title"),
                    Weeks = weeks
                };
            }
            catch
            {
                string message = "Training overview node not found in content tree";
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.NotFound, message));
            }
        }
    }
}
