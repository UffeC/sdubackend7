using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using sdubackend7.Models.Base;

namespace sdubackend7.Models.Submissions
{
    public class SurveyASubmission : Submission
    {
        public int PainLow { get; set; }
        public int PainHigh { get; set; }
        public int PainAverage { get; set; }
        public int DaysOnMedication { get; set; }
        public int Pamol500 { get; set; }
        public int Ipren200 { get; set; }
        public int Ipren600 { get; set; }
        public string OtherMedicationType { get; set; }
        public string OtherMedicationAmount { get; set; }
        public int DaysSick { get; set; }
        public bool TreatmentDoctor { get; set; }
        public bool TreatmentPhysiotherapy { get; set; }
        public bool TreatmentMassage { get; set; }
        public bool TreatmentAcupuncture { get; set; }
        public bool TreatmentChiropractor { get; set; }
        public string OtherTreatment { get; set; }
    }
}