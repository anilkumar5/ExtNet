using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExtNetApplication.Models
{
    public class ScheduleTasks
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public string NextRun { get; set; }
        public string TimeToRun { get; set; }
        public string Schedule { get; set; }
        public string Enable { get; set; }
        public string Organization { get; set; }
    }
}