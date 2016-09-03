using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Ormer_PHC.Models
{
    public class MSubSchemes
    {
        [Key]
        public int MSubSchemesID { get; set; }      

        [Required]
        [StringLength(250, ErrorMessage = "Sub-Scheme Name cannot be longer than 250 characters.")]
        [Column("SubScheme")]
        [Display(Name = "Sub-Scheme Name")]
        public string SubSchemeName { get; set; }
       

        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        [Column("SubSchemeStdate")]
        [Display(Name = "Sub-Scheme start date")]
        public DateTime SchemeStdate { get; set; }      

        [Required]
        [Column("IsActive")]
        [Display(Name = "Is Active")]
        public bool  IsActive { get; set; }

        
        [DataType(DataType.Date)]
        [Column("LastModifiedDate")]
        public DateTime LastModifiedDate
        {
            get
            {
                return DateTime.Now;
            }

        }

        [DataType(DataType.Currency)]
        [Column(TypeName = "Amount")]
        [Display(Name = "Amount to be given")]
        public decimal Amount { get; set; }

        public int MSchemesID { get; set; }

        public virtual MSchemes MSchemes { get; set; }

    }
}