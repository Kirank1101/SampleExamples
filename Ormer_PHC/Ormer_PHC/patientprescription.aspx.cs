using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
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
                ViewstateDrugNames = null;
                List<MDisease> lst = (from c in _db.MDiseases select c).ToList();
                ddlDisease.DataSource = lst;
                ddlDisease.DataBind();
                PopulateData();
                PopulateLabTest();
            }
        }
        const string VSDrugNames = "VSDrugs";
        public List<test> ViewstateDrugNames
        {
            get
            {
                if (ViewState[VSDrugNames] == null)
                    ViewState[VSDrugNames] = new List<test>();
                return (List<test>)ViewState[VSDrugNames];
            }
            set
            {
                ViewState[VSDrugNames] = value;
            }
        }

        const string VSlabtest = "VSLabtest";
        public List<labtest> ViewstateLabTest
        {
            get
            {
                if (ViewState[VSlabtest] == null)
                    ViewState[VSlabtest] = new List<labtest>();
                return (List<labtest>)ViewState[VSlabtest];
            }
            set
            {
                ViewState[VSlabtest] = value;
            }
        }
        protected void InsertRecord(object sender, ListViewInsertEventArgs e)
        {
            ListViewItem item = e.Item;
            TextBox tqty = (TextBox)item.FindControl("txtquantity");
            TextBox tdosage = (TextBox)item.FindControl("txtdosage");
            DropDownList ddldrugname = (DropDownList)item.FindControl("ddldrugName");

            List<test> lstvst = null;
            lstvst = ViewstateDrugNames;
            test tst = new test();

            tst.AutoID = lstvst.Count + 1;
            tst.Quantity = tqty.Text;
            tst.Dosage = tdosage.Text;
            tst.DrugName = ddldrugname.SelectedItem.ToString();
            tst.DrugNameId = ddldrugname.SelectedValue;
            lstvst.Add(tst);
            ViewstateDrugNames = lstvst;
            //lblMessage.Text = "Record inserted successfully !";
            this.PopulateData();

        }
        protected void EditRecord(object sender, ListViewEditEventArgs e)
        {
            ListView1.EditIndex = e.NewEditIndex;
            this.PopulateData();
        }
        protected void UpdateRecord(object sender, ListViewUpdateEventArgs e)
        {
            int autoId = int.Parse(ListView1.DataKeys[e.ItemIndex].Value.ToString());
            ListViewItem item = ListView1.Items[e.ItemIndex];
            TextBox tqty = (TextBox)item.FindControl("txtquantity");
            TextBox tdosage = (TextBox)item.FindControl("txtdosage");
            DropDownList ddlDrugName = (DropDownList)item.FindControl("ddldrugName");

            List<test> lstvst = null;
            lstvst = ViewstateDrugNames;

            test tst = lstvst.Where(t => t.AutoID == autoId).SingleOrDefault();
            tst.Quantity = tqty.Text;
            tst.Dosage = tdosage.Text;
            tst.DrugName = ddlDrugName.SelectedItem.ToString();
            tst.DrugNameId = ddlDrugName.SelectedValue;
            ViewstateDrugNames = lstvst;

            //lblMessage.Text = "Record updated successfully !";
            ListView1.EditIndex = -1;
            // repopulate the data
            this.PopulateData();
        }
        protected void CancelEditRecord(object sender, ListViewCancelEventArgs e)
        {

            ListView1.EditIndex = -1;
            this.PopulateData();
        }
        protected void DeleteRecord(object sender, ListViewDeleteEventArgs e)
        {

            int autoid = int.Parse(ListView1.DataKeys[e.ItemIndex].Value.ToString());
            List<test> lstvst = null;
            lstvst = ViewstateDrugNames;
            test tst = lstvst.Where(t => t.AutoID == autoid).SingleOrDefault();
            lstvst.Remove(tst);
            ViewstateDrugNames = lstvst;
            //lblMessage.Text = "Record delete successfully !";
            // repopulate the data
            this.PopulateData();
        }
        private void PopulateData()
        {
            List<test> lstvst = null;
            lstvst = ViewstateDrugNames;
            ListView1.DataSource = lstvst;
            ListView1.DataBind();
        }
        private void PopulateLabTest()
        {
            List<labtest> lstvst = null;
            lstvst = ViewstateLabTest;
            ListViewlabtest.DataSource = lstvst;
            ListViewlabtest.DataBind();
        }
        protected void btnSearch_Click(object sender, System.EventArgs e)
        {
            PatientInfo patientinfo = (from c in _db.PatientInfoes
                                       where c.PatientName == txtPatientName.Text.Trim()
                                       select c).SingleOrDefault();
            if (patientinfo != null)
            {
                lblage.Text = patientinfo.PatientAge;
                lblbloodgroup.Text = patientinfo.bloodgroupinfos.BloodGroupName;
            }
            else
            {
                lblage.Text = string.Empty;
                lblbloodgroup.Text = string.Empty;
            }
        }


        protected void LVLabTestInsertRecord(object sender, ListViewInsertEventArgs e)
        {
            ListViewItem item = e.Item;
            TextBox tqty = (TextBox)item.FindControl("txtquantity");
            TextBox tdosage = (TextBox)item.FindControl("txtdosage");
            DropDownList ddldrugname = (DropDownList)item.FindControl("ddldrugName");

            List<test> lstvst = null;
            lstvst = ViewstateDrugNames;
            test tst = new test();

            tst.AutoID = lstvst.Count + 1;
            tst.Quantity = tqty.Text;
            tst.Dosage = tdosage.Text;
            tst.DrugName = ddldrugname.SelectedItem.ToString();
            tst.DrugNameId = ddldrugname.SelectedValue;
            lstvst.Add(tst);
            ViewstateDrugNames = lstvst;
            //lblMessage.Text = "Record inserted successfully !";
            this.PopulateData();

        }
        protected void LVLabTestEditRecord(object sender, ListViewEditEventArgs e)
        {
            ListView1.EditIndex = e.NewEditIndex;
            this.PopulateData();
        }
        protected void LVLabTestUpdateRecord(object sender, ListViewUpdateEventArgs e)
        {
            int autoId = int.Parse(ListView1.DataKeys[e.ItemIndex].Value.ToString());
            ListViewItem item = ListView1.Items[e.ItemIndex];
            TextBox tqty = (TextBox)item.FindControl("txtquantity");
            TextBox tdosage = (TextBox)item.FindControl("txtdosage");
            DropDownList ddlDrugName = (DropDownList)item.FindControl("ddldrugName");

            List<test> lstvst = null;
            lstvst = ViewstateDrugNames;

            test tst = lstvst.Where(t => t.AutoID == autoId).SingleOrDefault();
            tst.Quantity = tqty.Text;
            tst.Dosage = tdosage.Text;
            tst.DrugName = ddlDrugName.SelectedItem.ToString();
            tst.DrugNameId = ddlDrugName.SelectedValue;
            ViewstateDrugNames = lstvst;

            //lblMessage.Text = "Record updated successfully !";
            ListView1.EditIndex = -1;
            // repopulate the data
            this.PopulateData();
        }
        protected void LVLabTestCancelEditRecord(object sender, ListViewCancelEventArgs e)
        {

            ListView1.EditIndex = -1;
            this.PopulateData();
        }
        protected void LVLabTestDeleteRecord(object sender, ListViewDeleteEventArgs e)
        {

            int autoid = int.Parse(ListView1.DataKeys[e.ItemIndex].Value.ToString());
            List<test> lstvst = null;
            lstvst = ViewstateDrugNames;
            test tst = lstvst.Where(t => t.AutoID == autoid).SingleOrDefault();
            lstvst.Remove(tst);
            ViewstateDrugNames = lstvst;
            //lblMessage.Text = "Record delete successfully !";
            // repopulate the data
            this.PopulateData();
        }
    }
    [Serializable]
    public class test
    {
        public int AutoID { get; set; }
        public string Quantity { get; set; }
        public string Dosage { get; set; }
        public string DrugName { get; set; }
        public string DrugNameId { get; set; }
    }

    [Serializable]
    public class labtest
    {
        public int AutoID { get; set; }
        public string Result { get; set; }
        public string LabtestName { get; set; }
        public string LabtestNameId { get; set; }
    }

}

