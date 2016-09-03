using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using Ormer_PHC.Models;

namespace Ormer_PHC.Villages
{
    public partial class Details : System.Web.UI.Page
    {
		protected Ormer_PHC.Models.ApplicationDbContext _db = new Ormer_PHC.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Select methd to selects a single Villages item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public Ormer_PHC.Models.Villages GetItem([FriendlyUrlSegmentsAttribute(0)]int? VillagesID)
        {
            if (VillagesID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.Villages.Where(m => m.VillagesID == VillagesID).Include(m => m.PrimaryHCSC).FirstOrDefault();
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

