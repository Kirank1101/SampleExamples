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

namespace Ormer_PHC.DistrictHCs
{
    public partial class Delete : System.Web.UI.Page
    {
		protected Ormer_PHC.Models.ApplicationDbContext _db = new Ormer_PHC.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected DistrictHC item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int DistricHCID)
        {
            using (_db)
            {
                var item = _db.DistrictHCs.Find(DistricHCID);

                if (item != null)
                {
                    _db.DistrictHCs.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single DistrictHC item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public Ormer_PHC.Models.DistrictHC GetItem([FriendlyUrlSegmentsAttribute(0)]int? DistricHCID)
        {
            if (DistricHCID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.DistrictHCs.Where(m => m.DistricHCID == DistricHCID).Include(m => m.StateHC).FirstOrDefault();
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

