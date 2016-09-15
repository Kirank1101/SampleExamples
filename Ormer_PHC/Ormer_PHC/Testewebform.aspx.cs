using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ormer_PHC.Models;

namespace Ormer_PHC
{
    public partial class Testewebform : System.Web.UI.Page
    {
        protected Ormer_PHC.Models.ApplicationDbContext _db = new Ormer_PHC.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            using (_db)
            {
                List<test> tst = new List<test>();
                test t = new test();
                t.Quantity = "21";
                t.AutoID = 1;
                t.DrugName = "sadf";
                t.Dosage = "1-1-1";
                tst.Add(t);
                ListView1.DataSource = tst;
                ListView1.DataBind();
            }

        }
        protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            this.DPLV1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            PopulateData();
        }

        private void PopulateData()
        {
            List<test> tst = new List<test>();
            test t = new test();
            t.Quantity = "21";
            t.AutoID = 1;
            t.DrugName = "sadf";
            t.Dosage = "1-1-1";
            tst.Add(t);
            ListView1.DataSource = tst;
            ListView1.DataBind();
        }

    }
}