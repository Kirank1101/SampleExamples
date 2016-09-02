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

namespace WebApplication3.TalukHCs
{
    public partial class Delete : System.Web.UI.Page
    {
		protected WebApplication3.Models.ApplicationDbContext _db = new WebApplication3.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected TalukHC item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int TalukHCID)
        {
            using (_db)
            {
                var item = _db.TalukHCs.Find(TalukHCID);

                if (item != null)
                {
                    _db.TalukHCs.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single TalukHC item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public WebApplication3.Models.TalukHC GetItem([FriendlyUrlSegmentsAttribute(0)]int? TalukHCID)
        {
            if (TalukHCID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.TalukHCs.Where(m => m.TalukHCID == TalukHCID).Include(m => m.DistricHC).FirstOrDefault();
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

