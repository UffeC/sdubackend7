using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sdubackend7.Models
{
    public class Exercise
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Number { get; set; }
        public string Heading { get; set; }
        public string Video { get; set; }
        public string Intro { get; set; }
        public string Body { get; set; }
    }
}