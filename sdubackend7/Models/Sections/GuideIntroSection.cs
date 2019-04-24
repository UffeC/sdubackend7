using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using sdubackend7.Models.Base;

namespace sdubackend7.Models.Sections
{
    public class GuideIntroSection : Section
    {
        public List<SimpleBox> SimpleBoxes { get; set; }
        public string NextButtonText { get; set; }
    }
}