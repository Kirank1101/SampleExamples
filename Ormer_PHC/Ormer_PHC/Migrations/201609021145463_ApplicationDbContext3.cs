namespace WebApplication3.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ApplicationDbContext3 : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.MBloodGroups", "LastModifiedDate");
            DropColumn("dbo.MDiseases", "LastModifiedDate");
            DropColumn("dbo.MDrugs", "LastModifiedDate");
            DropColumn("dbo.MLabTests", "LastModifiedDate");
            DropColumn("dbo.PatientInfo", "LastModifiedDate");
        }
        
        public override void Down()
        {
            AddColumn("dbo.PatientInfo", "LastModifiedDate", c => c.DateTime(nullable: false));
            AddColumn("dbo.MLabTests", "LastModifiedDate", c => c.DateTime(nullable: false));
            AddColumn("dbo.MDrugs", "LastModifiedDate", c => c.DateTime(nullable: false));
            AddColumn("dbo.MDiseases", "LastModifiedDate", c => c.DateTime(nullable: false));
            AddColumn("dbo.MBloodGroups", "LastModifiedDate", c => c.DateTime(nullable: false));
        }
    }
}
