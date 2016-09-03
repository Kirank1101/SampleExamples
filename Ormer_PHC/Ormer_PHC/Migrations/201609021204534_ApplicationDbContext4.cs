namespace Ormer_PHC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ApplicationDbContext4 : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.PatientInfo", "BloodGroup");
        }
        
        public override void Down()
        {
            AddColumn("dbo.PatientInfo", "BloodGroup", c => c.String());
        }
    }
}
