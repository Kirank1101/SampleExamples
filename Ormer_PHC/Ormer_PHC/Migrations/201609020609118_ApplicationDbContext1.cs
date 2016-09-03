namespace Ormer_PHC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ApplicationDbContext1 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.StateHCs",
                c => new
                    {
                        StateHCID = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.StateHCID);
            
            CreateTable(
                "dbo.DistrictHCs",
                c => new
                    {
                        DistricHCID = c.Int(nullable: false, identity: true),
                        StateHCID = c.Int(nullable: false),
                        Name = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.DistricHCID)
                .ForeignKey("dbo.StateHCs", t => t.StateHCID, cascadeDelete: true)
                .Index(t => t.StateHCID);
            
            CreateTable(
                "dbo.TalukHCs",
                c => new
                    {
                        TalukHCID = c.Int(nullable: false, identity: true),
                        DistricHCID = c.Int(nullable: false),
                        Name = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.TalukHCID)
                .ForeignKey("dbo.DistrictHCs", t => t.DistricHCID, cascadeDelete: true)
                .Index(t => t.DistricHCID);
            
            CreateTable(
                "dbo.PrimaryHCs",
                c => new
                    {
                        PrimaryHCID = c.Int(nullable: false, identity: true),
                        TalukHCID = c.Int(nullable: false),
                        Name = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.PrimaryHCID)
                .ForeignKey("dbo.TalukHCs", t => t.TalukHCID, cascadeDelete: true)
                .Index(t => t.TalukHCID);
            
            CreateTable(
                "dbo.PrimaryHCSCs",
                c => new
                    {
                        PrimaryHCSCID = c.Int(nullable: false, identity: true),
                        PrimaryHCID = c.Int(nullable: false),
                        Name = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.PrimaryHCSCID)
                .ForeignKey("dbo.PrimaryHCs", t => t.PrimaryHCID, cascadeDelete: true)
                .Index(t => t.PrimaryHCID);
            
            CreateTable(
                "dbo.Villages",
                c => new
                    {
                        VillagesID = c.Int(nullable: false, identity: true),
                        PrimaryHCSCID = c.Int(nullable: false),
                        Name = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.VillagesID)
                .ForeignKey("dbo.PrimaryHCSCs", t => t.PrimaryHCSCID, cascadeDelete: true)
                .Index(t => t.PrimaryHCSCID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.DistrictHCs", "StateHCID", "dbo.StateHCs");
            DropForeignKey("dbo.PrimaryHCs", "TalukHCID", "dbo.TalukHCs");
            DropForeignKey("dbo.PrimaryHCSCs", "PrimaryHCID", "dbo.PrimaryHCs");
            DropForeignKey("dbo.Villages", "PrimaryHCSCID", "dbo.PrimaryHCSCs");
            DropForeignKey("dbo.TalukHCs", "DistricHCID", "dbo.DistrictHCs");
            DropIndex("dbo.Villages", new[] { "PrimaryHCSCID" });
            DropIndex("dbo.PrimaryHCSCs", new[] { "PrimaryHCID" });
            DropIndex("dbo.PrimaryHCs", new[] { "TalukHCID" });
            DropIndex("dbo.TalukHCs", new[] { "DistricHCID" });
            DropIndex("dbo.DistrictHCs", new[] { "StateHCID" });
            DropTable("dbo.Villages");
            DropTable("dbo.PrimaryHCSCs");
            DropTable("dbo.PrimaryHCs");
            DropTable("dbo.TalukHCs");
            DropTable("dbo.DistrictHCs");
            DropTable("dbo.StateHCs");
        }
    }
}
