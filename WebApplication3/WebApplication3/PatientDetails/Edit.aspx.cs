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
namespace WebApplication3.PatientDetails
{
    public partial class Edit : System.Web.UI.Page
    {
		protected WebApplication3.Models.ApplicationDbContext _db = new WebApplication3.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Update methd to update the selected PatientDetail item
        // USAGE: <asp:FormView UpdateMethod="UpdateItem">
        public void UpdateItem(int  ID)
        {
            using (_db)
            {
                var item = _db.PatientDetails.Find(ID);

                if (item == null)
                {
                    // The item wasn't found
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", ID));
                    return;
                }

                TryUpdateModel(item);

                if (ModelState.IsValid)
                {
                    // Save changes here
                    _db.SaveChanges();
                    Response.Redirect("../Default");
                }
            }
        }

        // This is the Select method to selects a single PatientDetail item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public WebApplication3.Models.PatientDetail GetItem([FriendlyUrlSegmentsAttribute(0)]int? ID)
        {
            if (ID == null)
            {
                return null;
            }

            using (_db)
            {
                return _db.PatientDetails.Find(ID);
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
