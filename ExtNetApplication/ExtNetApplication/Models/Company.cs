using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExtNetApplication.Models
{
    public class Company
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }

    public class Companies
    {
        public string Title { get; set; }
        public List<Company> CompanyList { get; set; }
    }
}