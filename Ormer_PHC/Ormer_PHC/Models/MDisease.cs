using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ormer_PHC.Models
{

    public class MDisease
    {

        [Key]
        public int MDiseaseID { get; set; }

        [Required]
        [StringLength(50, ErrorMessage = "Disease Name cannot be longer than 50 characters.")]
        [Column("DiseaseName")]
        [Display(Name = "Disease Name")]
        public string DiseaseName { get; set; }

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