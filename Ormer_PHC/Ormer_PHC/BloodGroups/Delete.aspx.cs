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

namespace WebApplication3.BloodGroups
{
    public partial class Delete : System.Web.UI.Page
    {
		protected WebApplication3.Models.ApplicationDbContext _db = new WebApplication3.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected MBloodGroup item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int MBloodGroupID)
        {
            using (_db)
            {
                var item = _db.BloodGroups.Find(MBloodGroupID);

                if (item != null)
                {
                    _db.BloodGroups.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single MBloodGroup item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public WebApplication3.Models.MBloodGroup GetItem([FriendlyUrlSegmentsAttribute(0)]int? MBloodGroupID)
        {
            if (MBloodGroupID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.BloodGroups.Where(m => m.MBloodGroupID == MBloodGroupID).FirstOrDefault();
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

