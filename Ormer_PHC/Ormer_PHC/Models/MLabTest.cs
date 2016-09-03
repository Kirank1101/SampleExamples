using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Ormer_PHC.Models
{
    public class MLabTest
    {
        [Key]
        public int MLabTestID { get; set; }

        [Required]
        [StringLength(50, ErrorMessage = "LabTest Name cannot be longer than 50 characters.")]
        [Column("LabTestName")]
        [Display(Name = "LabTest Name")]
        public string LabTestName { get; set; }

        [ScaffoldColumn(false)]
       
        [Column("ObsIND")]
        public char obsind { get; set; }

        [ScaffoldColumn(false)]
       
        [Column("LastModifiedBy")]
        public string LastModifiedBy { get; set; }

        [ScaffoldColumn(false)]
        [DataType(DataType.Date)]
        [Column("LastModifiedDate")]
        public DateTime LastModifiedDate
        {
            get
            {
                return DateTime.Now;
            }

        }

    }
}