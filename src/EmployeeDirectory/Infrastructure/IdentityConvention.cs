namespace EmployeeDirectory.Infrastructure
{
    using System;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.ModelConfiguration.Conventions;

    public class IdentityConvention : Convention
    {
        private const string Id = "Id";

        public IdentityConvention()
        {
            Properties<Guid>()
                .Where(p => p.Name == Id)
                .Configure(p => p
                    .IsKey()
                    .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity));
        }
    }
}