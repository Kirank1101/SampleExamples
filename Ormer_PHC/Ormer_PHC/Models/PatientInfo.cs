using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ormer_PHC.Models
{
    [Table(name:"PatientInfo")]
    public class PatientInfo
    {
        
        [Key]
        public int PatientID { get; set; }

         [Display(Name = "Blood Group")]
        public int MBloodGroupID { get; set; }

        [Required]
        [StringLength(50, ErrorMessage = "Name cannot be longer than 50 characters.")]
        [Column("Name")]
        [Display(Name = "Name")]
        public string PatientName { get; set; }

        [Required]
        [Range(0.1, 110, ErrorMessage = "Age must be between 1 month and 110 years")]
        [Column("Age")]
        [Display(Name = "Age")]
        public string PatientAge { get; set; }

        [Required]
        [Column("Sex")]
        [Display(Name = "Sex")]
        public Sex? Grade { get; set; }

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

        public virtual MBloodGroup bloodgroupinfos { get; set; }
    }
    public enum Sex
    {
        Male,Female
    }
}