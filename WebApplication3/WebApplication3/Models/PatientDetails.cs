using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication3.Models
{
    public class Patientinfo
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public string Sex { get; set; }
        public string ContactNo { get; set; }
        [Display(Name = "BloodGroup")]
        public int CategoryId { get; set; }
        public BloodGroup BloodGroup { get; set; }
    }
    public class PatientDetail
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public string Sex { get; set; }
        public string ContactNo { get; set; }
        public BloodGroup BloodGroup { get; set; }

    }
    public class BloodGroup
    {
        public int BloodGroupID { get; set; }
        public string Name { get; set; }
    }
}