// <auto-generated />
namespace Ormer_PHC.Migrations
{
    using System.CodeDom.Compiler;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Data.Entity.Migrations.Infrastructure;
    using System.Resources;
    using Ormer_PHC.Models;
    
    [GeneratedCode("EntityFramework.Migrations", "6.1.1-30610")]
    public sealed partial class ApplicationDbContext : IMigrationMetadata
    {

        public ApplicationDbContext()
        {
            
        }     


        private readonly ResourceManager Resources = new ResourceManager(typeof(ApplicationDbContext));
        
        string IMigrationMetadata.Id
        {
            get { return "201609020524177_ApplicationDbContext"; }
        }
        
        string IMigrationMetadata.Source
        {
            get { return null; }
        }
        
        string IMigrationMetadata.Target
        {
            get { return Resources.GetString("Target"); }
        }

      
    }
}
