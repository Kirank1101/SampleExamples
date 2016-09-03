namespace Ormer_PHC.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Data.Entity.ModelConfiguration;
    using System.Linq;
    using Ormer_PHC.Models;

    internal sealed class Configuration : DbMigrationsConfiguration<Ormer_PHC.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true ;
            ContextKey = "Ormer_PHC.Models.ApplicationDbContext";
        }

        protected override void Seed(Ormer_PHC.Models.ApplicationDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //
        }
    }


    class StateHCConfiguration : EntityTypeConfiguration<StateHC>
    {
        public StateHCConfiguration()
            : base()
        {
            HasKey(p => p.StateHCID);

            HasRequired(p => p.Name);

                 ToTable("StateHC");
                ;
        }
    }
}
