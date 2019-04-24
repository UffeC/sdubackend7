using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Umbraco.Web.Mvc;
using Umbraco.Web.WebApi;
using Umbraco.Core;
using Umbraco.Core.Models;
using Umbraco.Core.Services;
using Umbraco.Web;
using sdubackend7.Models;
using sdubackend7.Models.Base;
using sdubackend7.Models.Pages;
using sdubackend7.Models.Sections;

namespace sdubackend7.Controllers
{
    public class GuideIntroController : UmbracoApiController
    {
        public GuideIntroSection GetContent()
        {
            UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);

            IPublishedContent guideIntro = umbracoHelper.TypedContentAtRoot().FirstOrDefault().Down("guideIntro");

            List<SimpleBox> simpleBoxes = new List<SimpleBox>();

            foreach (var simpleBox in guideIntro.Descendants("simpleBox"))
            {

                simpleBoxes.Add(new SimpleBox
                {
                    Id = simpleBox.Id,
                    Name = simpleBox.Name,
                    IsImportant = simpleBox.GetPropertyValue<bool>("isImportant"),
                    Subheading = simpleBox.GetPropertyValue<string>("subheading"),
                    Body = simpleBox.GetPropertyValue<string>("body")
                });
            }

            try
            {
                return new GuideIntroSection
                {
                    Id = guideIntro.Id,
                    Name = guideIntro.Name,
                    Title = guideIntro.GetPropertyValue<string>("title"),
                    NextButtonText = guideIntro.GetPropertyValue<string>("nextButtonText"),
                    SimpleBoxes = simpleBoxes
                };
            }
            catch
            {
                string message = "Guide intro nodes not found in content tree";
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.NotFound, message));
            }
        }
    }
}
