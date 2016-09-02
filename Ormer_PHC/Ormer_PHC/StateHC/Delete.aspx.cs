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

namespace WebApplication3.StateHC
{
    public partial class Delete : System.Web.UI.Page
    {
		protected WebApplication3.Models.ApplicationDbContext _db = new WebApplication3.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected StateHC item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int StateHCID)
        {
            using (_db)
            {
                var item = _db.StateHC.Find(StateHCID);

                if (item != null)
                {
                    _db.StateHC.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single StateHC item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public WebApplication3.Models.StateHC GetItem([FriendlyUrlSegmentsAttribute(0)]int? StateHCID)
        {
            if (StateHCID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.StateHC.Where(m => m.StateHCID == StateHCID).FirstOrDefault();
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

