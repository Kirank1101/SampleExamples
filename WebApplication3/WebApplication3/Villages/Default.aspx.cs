﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using WebApplication3.Models;

namespace WebApplication3.Villages
{
    public partial class Default : System.Web.UI.Page
    {
		protected WebApplication3.Models.ApplicationDbContext _db = new WebApplication3.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Model binding method to get List of Villages entries
        // USAGE: <asp:ListView SelectMethod="GetData">
        public IQueryable<WebApplication3.Models.Villages> GetData()
        {
            return _db.Villages.Include(m => m.PrimaryHCSC);
        }
    }
}

