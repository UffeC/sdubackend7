using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using sdubackend7.Models.Base;

namespace sdubackend7.Models.Sections
{
    public class LoginSection : Section
    {
        public string ApplicationName { get; set; }
        public string Instructions { get; set; }
        public string CodePlaceholder { get; set; }
        public string LoginButtonText { get; set; }
    }
}