using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sdubackend7.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int AuthenticationCode { get; set; }
        public string Group { get; set; }
    }
}