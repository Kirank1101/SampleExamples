﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using WebApplication3.Models;

namespace WebApplication3.MLabTests
{
    public partial class Delete : System.Web.UI.Page
    {
		protected WebApplication3.Models.ApplicationDbContext _db = new WebApplication3.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected MLabTest item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int MLabTestID)
        {
            using (_db)
            {
                var item = _db.MLabTests.Find(MLabTestID);

                if (item != null)
                {
                    _db.MLabTests.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single MLabTest item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public WebApplication3.Models.MLabTest GetItem([FriendlyUrlSegmentsAttribute(0)]int? MLabTestID)
        {
            if (MLabTestID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.MLabTests.Where(m => m.MLabTestID == MLabTestID).FirstOrDefault();
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

