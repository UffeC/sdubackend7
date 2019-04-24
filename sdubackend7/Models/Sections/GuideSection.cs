using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using sdubackend7.Models.Base;

namespace sdubackend7.Models.Sections
{
    public class GuideSection : Section
    {
        public List<Page> Pages { get; set; }
    }
}