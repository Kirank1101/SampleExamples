namespace Ormer_PHC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ContextDb : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.PatientDetails",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        Age = c.Int(nullable: false),
                        Sex = c.String(),
                        ContactNo = c.String(),
                        BloodGroup_BloodGroupID = c.Int(),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.BloodGroups", t => t.BloodGroup_BloodGroupID)
                .Index(t => t.BloodGroup_BloodGroupID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.PatientDetails", "BloodGroup_BloodGroupID", "dbo.BloodGroups");
            DropIndex("dbo.PatientDetails", new[] { "BloodGroup_BloodGroupID" });
            DropTable("dbo.PatientDetails");
        }
    }
}
