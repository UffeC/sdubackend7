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
    public class GuidesController : UmbracoApiController
    {

        public GuideSection GetContent()
        {
            UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);

            IPublishedContent guide = umbracoHelper.TypedContentAtRoot().FirstOrDefault().Down("guide");

            List<Page> pages = new List<Page>();

            foreach (IPublishedContent page in guide.Children())
            {
                pages.Add(new Page
                {
                    Id = page.Id,
                    Name = page.Name,
                    Heading = page.GetPropertyValue<string>("heading")
                });
            }

            try
            {
                return new GuideSection
                {
                    Id = guide.Id,
                    Name = guide.Name,
                    Title = guide.GetPropertyValue<string>("title"),
                    Pages = pages
                };
            }
            catch
            {
                string errorMessage = "Guide nodes not found in content tree";
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.NotFound, errorMessage));
            }
        }

        public SimpleBoxPage GetSimpleBoxPage(int id)
        {
            UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);

            IPublishedContent simpleBoxPage = umbracoHelper.TypedContent(id);

            List<SimpleBox> simpleBoxes = new List<SimpleBox>();
        
            foreach (var simpleBox in simpleBoxPage.Descendants("simpleBox"))
            {
                simpleBoxes.Add(new SimpleBox
                {
                    Id = simpleBox.Id,
                    Name = simpleBox.Name,
                    Subheading = simpleBox.GetPropertyValue<string>("subheading"),
                    Body = simpleBox.GetPropertyValue<string>("body")
                });
            }

            try
            {
                return new SimpleBoxPage
                {
                    Id = simpleBoxPage.Id,
                    Name = simpleBoxPage.Name,
                    Heading = simpleBoxPage.GetPropertyValue<string>("title"),
                    SimpleBoxes = simpleBoxes
                };
            }
            catch
            {
                string message = "Guide nodes not found in content tree";
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.NotFound, message));
            }
        }

        public IEnumerable<Exercise> GetExercises()
        {
            UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);

            IPublishedContent exercises = umbracoHelper.TypedContentAtRoot().FirstOrDefault().Down("guide").Down("exercises");

            List<Exercise> response = new List<Exercise>();

            try
            {
                foreach (IPublishedContent exercise in exercises.Children())
                {
                    response.Add(new Exercise
                    {
                        Id = exercise.Id,
                        Name = exercise.Name,
                        Number = exercise.GetPropertyValue<int>("number"),
                        Heading = exercise.GetPropertyValue<string>("heading"),
                        Video = exercise.GetPropertyValue<string>("video"),
                        Intro = exercise.GetPropertyValue<string>("intro"),
                        Body = exercise.GetPropertyValue<string>("body")
                    });
                }
                return response;
            }
            catch
            {
                string message = "Exercise nodes not found in content tree";
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.NotFound, message));
            }
        }

        public Exercise GetExercise(int id)
        {
            UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);

            IPublishedContent exercise = umbracoHelper.TypedContent(id);

            try
            {
                return new Exercise
                {
                    Id = exercise.Id,
                    Name = exercise.Name,
                    Number = exercise.GetPropertyValue<int>("number"),
                    Heading = exercise.GetPropertyValue<string>("heading"),
                    Video = exercise.GetPropertyValue<string>("video"),
                    Intro = exercise.GetPropertyValue<string>("intro"),
                    Body = exercise.GetPropertyValue<string>("body")
                };
            }
            catch
            {
                string message = String.Format("Exercise node with id {0} not found in content tree", id);
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.NotFound, message));
            }
        }

    }
}
