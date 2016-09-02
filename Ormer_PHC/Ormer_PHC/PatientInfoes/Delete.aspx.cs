using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using WebApplication3.Models;

namespace WebApplication3.PatientInfoes
{
    public partial class Delete : System.Web.UI.Page
    {
		protected WebApplication3.Models.ApplicationDbContext _db = new WebApplication3.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected PatientInfo item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int PatientID)
        {
            using (_db)
            {
                var item = _db.PatientInfoes.Find(PatientID);

                if (item != null)
                {
                    _db.PatientInfoes.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single PatientInfo item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public WebApplication3.Models.PatientInfo GetItem([FriendlyUrlSegmentsAttribute(0)]int? PatientID)
        {
            if (PatientID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.PatientInfoes.Where(m => m.PatientID == PatientID).Include(m => m.bloodgroupinfos).FirstOrDefault();
            }
        }

        protected void ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("../Default");
            }
        }
    }
}

