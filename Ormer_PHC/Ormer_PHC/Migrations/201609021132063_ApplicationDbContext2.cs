namespace Ormer_PHC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ApplicationDbContext2 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.PatientDetails", "BloodGroup_BloodGroupID", "dbo.BloodGroups");
            DropForeignKey("dbo.Patientinfoes", "BloodGroup_BloodGroupID", "dbo.BloodGroups");
            DropIndex("dbo.PatientDetails", new[] { "BloodGroup_BloodGroupID" });
            DropIndex("dbo.Patientinfoes", new[] { "BloodGroup_BloodGroupID" });
            CreateTable(
                "dbo.MBloodGroups",
                c => new
                    {
                        MBloodGroupID = c.Int(nullable: false, identity: true),
                        BloodGroupName = c.String(nullable: false, maxLength: 3),
                        LastModifiedBy = c.String(),
                        LastModifiedDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.MBloodGroupID);
            
            CreateTable(
                "dbo.MDiseases",
                c => new
                    {
                        MDiseaseID = c.Int(nullable: false, identity: true),
                        DiseaseName = c.String(nullable: false, maxLength: 50),
                        LastModifiedBy = c.String(),
                        LastModifiedDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.MDiseaseID);
            
            CreateTable(
                "dbo.MDrugs",
                c => new
                    {
                        MDrugID = c.Int(nullable: false, identity: true),
                        DrugName = c.String(nullable: false, maxLength: 100),
                        BatchNo = c.String(),
                        MFdate = c.DateTime(nullable: false),
                        EXdate = c.DateTime(nullable: false),
                        Quantity = c.Int(nullable: false),
                        LastModifiedBy = c.String(),
                        LastModifiedDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.MDrugID);
            
            CreateTable(
                "dbo.MLabTests",
                c => new
                    {
                        MLabTestID = c.Int(nullable: false, identity: true),
                        LabTestName = c.String(nullable: false, maxLength: 50),
                        LastModifiedBy = c.String(),
                        LastModifiedDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.MLabTestID);
            
            CreateTable(
                "dbo.PatientInfo",
                c => new
                    {
                        PatientID = c.Int(nullable: false, identity: true),
                        MBloodGroupID = c.Int(nullable: false),
                        Name = c.String(nullable: false, maxLength: 50),
                        Age = c.String(nullable: false),
                        Sex = c.Int(nullable: false),
                        BloodGroup = c.String(),
                        LastModifiedBy = c.String(),
                        LastModifiedDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.PatientID)
                .ForeignKey("dbo.MBloodGroups", t => t.MBloodGroupID, cascadeDelete: true)
                .Index(t => t.MBloodGroupID);
            
            DropTable("dbo.BloodGroups");
            DropTable("dbo.PatientDetails");
            DropTable("dbo.Patientinfoes");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.Patientinfoes",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        Age = c.Int(nullable: false),
                        Sex = c.String(),
                        ContactNo = c.String(),
                        CategoryId = c.Int(nullable: false),
                        BloodGroup_BloodGroupID = c.Int(),
                    })
                .PrimaryKey(t => t.ID);
            
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
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.BloodGroups",
                c => new
                    {
                        BloodGroupID = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.BloodGroupID);
            
            DropForeignKey("dbo.PatientInfo", "MBloodGroupID", "dbo.MBloodGroups");
            DropIndex("dbo.PatientInfo", new[] { "MBloodGroupID" });
            DropTable("dbo.PatientInfo");
            DropTable("dbo.MLabTests");
            DropTable("dbo.MDrugs");
            DropTable("dbo.MDiseases");
            DropTable("dbo.MBloodGroups");
            CreateIndex("dbo.Patientinfoes", "BloodGroup_BloodGroupID");
            CreateIndex("dbo.PatientDetails", "BloodGroup_BloodGroupID");
            AddForeignKey("dbo.Patientinfoes", "BloodGroup_BloodGroupID", "dbo.BloodGroups", "BloodGroupID");
            AddForeignKey("dbo.PatientDetails", "BloodGroup_BloodGroupID", "dbo.BloodGroups", "BloodGroupID");
        }
    }
}
