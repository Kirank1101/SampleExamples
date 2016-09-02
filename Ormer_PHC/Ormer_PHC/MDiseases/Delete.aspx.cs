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

namespace WebApplication3.MDiseases
{
    public partial class Delete : System.Web.UI.Page
    {
		protected WebApplication3.Models.ApplicationDbContext _db = new WebApplication3.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected MDisease item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int MDiseaseID)
        {
            using (_db)
            {
                var item = _db.MDiseases.Find(MDiseaseID);

                if (item != null)
                {
                    _db.MDiseases.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single MDisease item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public WebApplication3.Models.MDisease GetItem([FriendlyUrlSegmentsAttribute(0)]int? MDiseaseID)
        {
            if (MDiseaseID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.MDiseases.Where(m => m.MDiseaseID == MDiseaseID).FirstOrDefault();
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

