﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using Ormer_PHC.Models;

namespace Ormer_PHC.MDiseases
{
    public partial class Delete : System.Web.UI.Page
    {
		protected Ormer_PHC.Models.ApplicationDbContext _db = new Ormer_PHC.Models.ApplicationDbContext();

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
        public Ormer_PHC.Models.MDisease GetItem([FriendlyUrlSegmentsAttribute(0)]int? MDiseaseID)
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

