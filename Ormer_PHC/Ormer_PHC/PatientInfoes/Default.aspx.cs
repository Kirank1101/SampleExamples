using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.ModelBinding;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Ormer_PHC.Models;

namespace Ormer_PHC.PatientInfoes
{
    public partial class Default : System.Web.UI.Page
    {
        protected Ormer_PHC.Models.ApplicationDbContext _db = new Ormer_PHC.Models.ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        //// Model binding method to get List of PatientInfo entries
        //// USAGE: <asp:ListView SelectMethod="GetData">
        //public IQueryable<Ormer_PHC.Models.PatientInfo> GetData()
        //{
        //    return _db.PatientInfoes.Include(m => m.bloodgroupinfos);
        //}

        public IQueryable<PatientInfo> GetData([Control] string txtPatientName)
        {
            var query = _db.PatientInfoes.Include(m => m.bloodgroupinfos);
            int cnt = 0;

            cnt = _db.PatientInfoes.Count();

            IQueryable<PatientInfo> iqp = _db.PatientInfoes.Select(t=>new PatientInfo{
                PatientName=t.PatientName,
                PatientAge=t.PatientAge
            });
            if (cnt == 0)
            {
                txtPatientName = string.Empty;
                divpatientsearch.Visible = false;
            }
            if (txtPatientName != null)
            {
                query = query.Where(s => s.PatientName.Contains(txtPatientName));
            }
            return query;
        }
    }
}

