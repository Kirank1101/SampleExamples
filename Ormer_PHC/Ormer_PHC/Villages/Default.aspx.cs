﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Ormer_PHC.Models;

namespace Ormer_PHC.Villages
{
    public partial class Default : System.Web.UI.Page
    {
		protected Ormer_PHC.Models.ApplicationDbContext _db = new Ormer_PHC.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Model binding method to get List of Villages entries
        // USAGE: <asp:ListView SelectMethod="GetData">
        public IQueryable<Ormer_PHC.Models.Villages> GetData()
        {
            return _db.Villages.Include(m => m.PrimaryHCSC);
        }
    }
}

