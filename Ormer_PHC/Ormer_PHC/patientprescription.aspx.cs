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
            if (!IsPostBack)
            {
                ViewstateDrugs = null;
                List<MDisease> lst = (from c in _db.MDiseases select c).ToList();
                ddlDisease.DataSource = lst;
                ddlDisease.DataBind();
                BindGridview();
            }
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
            allpatientDrugs = ViewstateDrugs;
            if (allpatientDrugs.Count == 0)
            {
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
        protected void myGridview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Insert new contact
            if (e.CommandName == "Insert")
            {
                Page.Validate("Add");
                if (Page.IsValid)
                {
                    var fRow = myGridview.FooterRow;
                    TextBox txtQuantity = (TextBox)fRow.FindControl("txtQuantity");
                    TextBox txtDosage = (TextBox)fRow.FindControl("txtDosage");
                    DropDownList ddldrugname = (DropDownList)fRow.FindControl("ddldrugname");
                    //using (MyDatabaseEntities dc = new MyDatabaseEntities())
                    //{

                    //    //Here in this example we have done a little mistake // class name and page name is Same (contact) 
                    //    // We will remove contact page , as its not in use

                    //    dc.Contacts.Add(new Contact
                    //    {
                    //        ContactPerson = txtContactPerson.Text.Trim(),
                    //        ContactNo = txtContactNo.Text.Trim(),
                    //        CountryID = Convert.ToInt32(ddCountry.SelectedValue),
                    //        StateID = Convert.ToInt32(ddState.SelectedValue)
                    //    });
                    //    dc.SaveChanges();
                    //    PopulateContacts();
                    //}

                    List<patientDrugs> lstpd = new System.Collections.Generic.List<patientDrugs>();
                    lstpd = ViewstateDrugs;
                    patientDrugs pd = new patientDrugs();
                    pd.DrugName = ddldrugname.SelectedItem.Text;
                    pd.Dosage = txtDosage.Text;
                    pd.Quantity = Convert.ToInt32(txtQuantity.Text);
                    lstpd.Add(pd);
                    ViewstateDrugs = lstpd;
                    BindGridview();

                }
            }
        }
        const string VSdrugs = "viewStateDrugs";
        public List<patientDrugs> ViewstateDrugs
        {
            get
            {
                if (ViewState[VSdrugs] == null)
                    ViewState[VSdrugs] = new List<patientDrugs>();
                return (List<patientDrugs>)ViewState[VSdrugs];
            }
            set
            {
                ViewState[VSdrugs] = value;
            }
        }

    }
    [Serializable]
    public class patientDrugs
    {
        public string DrugName { get; set; }
        public int Quantity { get; set; }
        public string Dosage { get; set; }
    }
}

