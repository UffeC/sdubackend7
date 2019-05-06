using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sdubackend7.Models.Base
{
    public class Submission
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int User { get; set; }
        public DateTime Date { get; set; }
    }
}