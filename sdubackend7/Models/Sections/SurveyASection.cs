using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using sdubackend7.Models.Base;

namespace sdubackend7.Models.Sections
{
    public class SurveyASection : Section
    {
        public string SurveyInformation { get; set; }
        public string PainHeading { get; set; }
        public string PainInformationBody { get; set; }
        public string PainInformationHelp { get; set; }
        public string PainQuestion { get; set; }
        public string PainLowSubheading { get; set; }
        public string PainHighSubheading { get; set; }
        public string PainAverageSubheading { get; set; }
        public string PainLowestLabel { get; set; }
        public string PainHighestLabel { get; set; }
        public string MedicationHeading { get; set; }
        public string HasTakenMedicationSubheading { get; set; }
        public string DaysOnMedicationSubheading { get; set; }
        public string MedicationTypeAmountSubheading { get; set; }
        public string Pamol500Label { get; set; }
        public string Ipren200Label { get; set; }
        public string Ipren600Label { get; set; }
        public string EnterPiecesPlaceholder { get; set; }
        public string OtherLabel { get; set; }
        public string OtherMedicationTypeLabel { get; set; }
        public string OtherMedicationTypePlaceholder { get; set; }
        public string OtherMedicationAmountLabel { get; set; }
        public string OtherMedicationAmountPlaceholder { get; set; }
        public string SicknessHeading { get; set; }
        public string DaysSickSubheading { get; set; }
        public string ComplimentaryTreatmentHeading { get; set; }
        public string ComplimentaryTreatmentInformation { get; set; }
        public string ComplimentaryTreatmentsSubheading { get; set; }
        public string HasSeenDoctorSubheading { get; set; }
        public string PhysiotherapyLabel { get; set; }
        public string MassageLabel { get; set; }
        public string AcupunctureLabel { get; set; }
        public string ChiropractorLabel { get; set; }
        public string OtherTreatmentPlaceholder { get; set; }
    }
}