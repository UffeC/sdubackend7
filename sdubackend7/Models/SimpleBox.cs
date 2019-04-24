using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using sdubackend7.Models.Base;

namespace sdubackend7.Models
{
    public class SimpleBox : ContentBox
    {
        public bool IsImportant { get; set; }
        public string Body { get; set; }
    }
}