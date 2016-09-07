using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.ModelBinding;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Ormer_PHC.Models;


namespace Ormer_PHC
{
    public partial class patientprescription : System.Web.UI.Page
    {
        protected Ormer_PHC.Models.ApplicationDbContext _db = new Ormer_PHC.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            List<MDisease> lst = (from c in _db.MDiseases select c).ToList();
            ddlDisease.DataSource = lst;
            ddlDisease.DataBind();
            BindGridview();
        }
        protected void BindDrugName(DropDownList ddldrugname, List<MDisease> Drugs)
        {
            ddldrugname.Items.Clear();
            ddldrugname.Items.Add(new ListItem { Text = "Select Drug", Value = "0" });
            ddldrugname.AppendDataBoundItems = true;

            ddldrugname.DataTextField = "DiseaseName";
            ddldrugname.DataValueField = "MDiseaseID";
            ddldrugname.DataSource = Drugs;
            ddldrugname.DataBind();
        }
        private List<MDisease> PopulateDrugs()
        {
            using (_db)
            {
                return _db.MDiseases.OrderBy(b => b.DiseaseName).ToList();
            }
        }

        private void BindGridview()
        {
            List<patientDrugs> allpatientDrugs = null;

            if (allpatientDrugs == null || allpatientDrugs.Count == 0)
            {
                //trick to show footer when there is no data in the gridview
                allpatientDrugs = new System.Collections.Generic.List<patientDrugs>();
                allpatientDrugs.Add(new patientDrugs());
                myGridview.DataSource = allpatientDrugs;
                myGridview.DataBind();
                myGridview.Rows[0].Visible = false;
            }
            else
            {
                myGridview.DataSource = allpatientDrugs;
                myGridview.DataBind();
            }

            //Populate & bind country
            if (myGridview.Rows.Count > 0)
            {
                DropDownList dd = (DropDownList)myGridview.FooterRow.FindControl("ddldrugname");
                BindDrugName(dd, PopulateDrugs());
            }

        }

    }
    public class patientDrugs
    {
        public string DrugName { get; set; }
        public int Quantity { get; set; }
        public string Dosage { get; set; }
    }
}

