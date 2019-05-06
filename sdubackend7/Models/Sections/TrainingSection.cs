using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using sdubackend7.Models.Base;

namespace sdubackend7.Models.Sections
{
    public class TrainingSection : Section
    {
        public List<Week> Weeks { get; set; }
    }
}