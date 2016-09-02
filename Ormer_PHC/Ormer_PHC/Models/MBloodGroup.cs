using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication3.Models
{
    public class MBloodGroup
    {
        [Key]
        public int MBloodGroupID { get; set; }

        [Required]
        [StringLength(3, ErrorMessage = "Blood Group cannot be longer than 3 characters.")]
        [Column("BloodGroupName")]
        [Display(Name = "BloodGroup")]
        public string BloodGroupName { get; set; }

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