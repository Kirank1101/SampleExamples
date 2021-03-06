﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Ormer_PHC.Models;

namespace Ormer_PHC.PrimaryHCs
{
    public partial class Default : System.Web.UI.Page
    {
		protected Ormer_PHC.Models.ApplicationDbContext _db = new Ormer_PHC.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Model binding method to get List of PrimaryHC entries
        // USAGE: <asp:ListView SelectMethod="GetData">
        public IQueryable<Ormer_PHC.Models.PrimaryHC> GetData()
        {
            return _db.PrimaryHCs.Include(m => m.TalukHC);
        }
    }
}

