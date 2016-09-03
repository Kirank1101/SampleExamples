using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Ormer_PHC.Models
{
    public abstract class HealthCentre
    {        

    }

    public class StateHC : HealthCentre
    {
         [Key]
        public int StateHCID { get; set; }
        public virtual ICollection<DistrictHC> HealthCentres { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "State")]
        [Column("Name")]
        public string Name { get; set; }
    }

    public class DistrictHC : HealthCentre
    {
        public int StateHCID { get; set; }
        [Key]
        public int DistricHCID { get; set; }
        public virtual ICollection<TalukHC> HealthCentres { get; set; }
        public virtual StateHC StateHC { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "District")]
        public string Name { get; set; }

    }

    public class TalukHC : HealthCentre
    {
        public int DistricHCID { get; set; }
         [Key]
        public int TalukHCID { get; set; }
        public virtual ICollection<PrimaryHC> HealthCentres { get; set; }
        public virtual DistrictHC DistricHC { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Taluk")]
        public string Name { get; set; }
    }

    public class PrimaryHC : HealthCentre
    {
         [Key]
        public int PrimaryHCID { get; set; }
        public int TalukHCID { get; set; }
        public virtual ICollection<PrimaryHCSC> HealthCentres { get; set; }
        public virtual TalukHC TalukHC { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Primary Health Care")]
        public string Name { get; set; }

    }

    public class PrimaryHCSC : HealthCentre
    {
        public int PrimaryHCID { get; set; }
         [Key]
        public int PrimaryHCSCID { get; set; }
        public virtual ICollection<Villages> HealthCentres { get; set; }
        public virtual PrimaryHC PrimaryHC { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Primary Sub Sector")]
        public string Name { get; set; }
    }

    public class Villages : HealthCentre
    {
         [Key]
        public int VillagesID { get; set; }
        public int PrimaryHCSCID { get; set; }
        public virtual PrimaryHCSC PrimaryHCSC { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Villages")]
        public string Name { get; set; }
    }
}