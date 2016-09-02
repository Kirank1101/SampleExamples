using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebApplication3.Models
{
    public class MDrugs
    {
        [Key]
        public int MDrugID { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "Drug Name cannot be longer than 100 characters.")]
        [Column("DrugName")]
        [Display(Name = "Drug Name")]
        public string DrugName { get; set; }

        [Column("BatchNo")]
        [Display(Name = "BatchNo")]
        public string BatchNo { get; set; }

        [Required]
        [DataType(DataType.Date)]        
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]        
        [Column("MFdate")]
        [Display(Name = "Manufactured date")]
        public DateTime MFdate { get; set; }

        [Required]
        [DataType(DataType.Date)]        
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]        
        [Column("EXdate")]
        [Display(Name = "Expiry date")]
        public DateTime EXdate { get; set; }

        [Required]
        [Column("Quantity")]
        [Display(Name = "Quantity")]
        public int Quantity { get; set; }

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