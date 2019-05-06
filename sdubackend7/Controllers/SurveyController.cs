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
using sdubackend7.Models.Submissions;
using System.Text;

namespace sdubackend7.Controllers
{
    public class SurveyController : UmbracoApiController
    {
        public SurveyASection GetSurveyAContent()
        {
            UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);

            IPublishedContent survey = umbracoHelper.TypedContentAtRoot().FirstOrDefault().Down("trainingOverview").Down("trainingSurvey");

            try
            {
                return new SurveyASection
                {
                    Id = survey.Id,
                    Name = survey.Name,
                    Title = survey.GetPropertyValue<string>("title"),
                    SurveyInformation = survey.GetPropertyValue<string>("surveyInformation"),
                    PainHeading = survey.GetPropertyValue<string>("painHeading"),
                    PainInformationBody = survey.GetPropertyValue<string>("painInformationBody"),
                    PainInformationHelp = survey.GetPropertyValue<string>("painInformationHelp"),
                    PainQuestion = survey.GetPropertyValue<string>("painQuestion"),
                    PainLowSubheading = survey.GetPropertyValue<string>("painLowSubheading"),
                    PainHighSubheading = survey.GetPropertyValue<string>("painHighSubheading"),
                    PainAverageSubheading = survey.GetPropertyValue<string>("painAverageSubheading"),
                    PainLowestLabel = survey.GetPropertyValue<string>("painLowestLabel"),
                    PainHighestLabel = survey.GetPropertyValue<string>("painHighestLabel"),
                    MedicationHeading = survey.GetPropertyValue<string>("medicationHeading"),
                    HasTakenMedicationSubheading = survey.GetPropertyValue<string>("hasTakenMedicationSubheading"),
                    DaysOnMedicationSubheading = survey.GetPropertyValue<string>("daysOnMedicationSubheading"),
                    MedicationTypeAmountSubheading = survey.GetPropertyValue<string>("medicationTypeAmountSubheading"),
                    Pamol500Label = survey.GetPropertyValue<string>("pamol500Label"),
                    Ipren200Label = survey.GetPropertyValue<string>("ipren200Label"),
                    Ipren600Label = survey.GetPropertyValue<string>("ipren600Label"),
                    EnterPiecesPlaceholder = survey.GetPropertyValue<string>("enterPiecesPlaceholder"),
                    OtherLabel = survey.GetPropertyValue<string>("otherLabel"),
                    OtherMedicationTypeLabel = survey.GetPropertyValue<string>("otherMedicationTypeLabel"),
                    OtherMedicationTypePlaceholder = survey.GetPropertyValue<string>("otherMedicationTypePlaceholder"),
                    OtherMedicationAmountLabel = survey.GetPropertyValue<string>("otherMedicationAmountLabel"),
                    OtherMedicationAmountPlaceholder = survey.GetPropertyValue<string>("otherMedicationAmountPlaceholder"),
                    SicknessHeading = survey.GetPropertyValue<string>("sicknessHeading"),
                    DaysSickSubheading = survey.GetPropertyValue<string>("daysSickSubheading"),
                    ComplimentaryTreatmentHeading = survey.GetPropertyValue<string>("complimentaryTreatmentHeading"),
                    ComplimentaryTreatmentInformation = survey.GetPropertyValue<string>("complimentaryTreatmentInformation"),
                    ComplimentaryTreatmentsSubheading = survey.GetPropertyValue<string>("complimentaryTreatmentsSubheading"),
                    HasSeenDoctorSubheading = survey.GetPropertyValue<string>("hasSeenDoctorSubheading"),
                    PhysiotherapyLabel = survey.GetPropertyValue<string>("physiotherapyLabel"),
                    MassageLabel = survey.GetPropertyValue<string>("massageLabel"),
                    AcupunctureLabel = survey.GetPropertyValue<string>("acupunctureLabel"),
                    ChiropractorLabel = survey.GetPropertyValue<string>("chiropractorLabel"),
                    OtherTreatmentPlaceholder = survey.GetPropertyValue<string>("otherTreatmentPlaceholder")
                };
            }
            catch
            {
                string message = "Survey node not found in content tree";
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.NotFound, message));
            }
        }

        public HttpResponseMessage SubmitSurveyA([FromBody]SurveyASubmission submissionModel)
        {
            try
            {
                // Get the submission directory node in the content root
                UmbracoHelper umbracoHelper = new UmbracoHelper(UmbracoContext.Current);
                IPublishedContent submissionsDirectory = umbracoHelper.TypedContentAtRoot()
                    .Where(x => x.ContentType.Alias.Equals("submissionsDirectory")).FirstOrDefault();

                // Contact the service that allows for content manipulation
                IContentService contentService = ApplicationContext.Current.Services.ContentService;

                // Create to new submission content node
                IContent submission = contentService.CreateContent(
                    name: String.Format("{0}-{1}-A-Survey", submissionModel.User, DateTime.Now.ToString("dd-MM-yyyy")),
                    parentId: submissionsDirectory.Id,
                    contentTypeAlias: "groupASurvey",
                    userId: -1
                );

                // Set the values of content node to the values from the body of the response
                submission.SetValue("user", submissionModel.User);
                submission.SetValue("date", DateTime.Now.ToString("dd-MM-yyyy"));
                submission.SetValue("painLow", submissionModel.PainLow);
                submission.SetValue("painHigh", submissionModel.PainHigh);
                submission.SetValue("painAverage", submissionModel.PainAverage);
                submission.SetValue("daysOnMedication", submissionModel.DaysOnMedication);
                submission.SetValue("pamol500", submissionModel.Pamol500);
                submission.SetValue("ipren200", submissionModel.Ipren200);
                submission.SetValue("ipren600", submissionModel.Ipren600);
                submission.SetValue("otherMedicationType", submissionModel.OtherMedicationType);
                submission.SetValue("otherMedicationAmount", submissionModel.OtherMedicationAmount);
                submission.SetValue("daysSick", submissionModel.DaysSick);
                submission.SetValue("treatmentDoctor", submissionModel.TreatmentDoctor);
                submission.SetValue("treatmentPhysiotherapy", submissionModel.TreatmentPhysiotherapy);
                submission.SetValue("treatmentMassage", submissionModel.TreatmentMassage);
                submission.SetValue("treatmentAcupuncture", submissionModel.TreatmentAcupuncture);
                submission.SetValue("treatmentChiropractor", submissionModel.TreatmentChiropractor);
                submission.SetValue("otherTreatment", submissionModel.OtherTreatment);

                // Save publish and submit
                ApplicationContext.Current.Services.ContentService.SaveAndPublishWithStatus(submission);

                // Set response
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK);
                response.Content = new StringContent("Survey submitted", Encoding.Unicode);

                // Return status
                return response;
            }
            catch
            {
                string message = "Could not submit survey correctly";
                throw new HttpResponseException(
                    Request.CreateErrorResponse(HttpStatusCode.InternalServerError, message));
            }
        }
    }
}
