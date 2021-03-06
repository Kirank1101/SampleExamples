﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Ormer_PHC.Models
{
    public class MSchemes
    {
        [Key]
        public int MSchemesID { get; set; }

        [Required]
        [StringLength(250, ErrorMessage = "Scheme Name cannot be longer than 250 characters.")]
        [Column("Scheme")]
        [Display(Name = "Scheme Name")]
        public string SchemeName { get; set; }
       

        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        [Column("SchemeStdate")]
        [Display(Name = "Scheme start date")]
        public DateTime SchemeStdate { get; set; }      

        [Required]
        [Column("IsActive")]
        [Display(Name = "Is Active")]
        public bool  IsActive { get; set; }

        [DataType(DataType.Currency)]
        [Column(TypeName = "Amount")]
        [Display(Name = "Amount to be given")]
        public decimal Amount { get; set; }
        
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