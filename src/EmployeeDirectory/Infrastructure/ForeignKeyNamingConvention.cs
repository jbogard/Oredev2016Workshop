namespace EmployeeDirectory.Infrastructure
{
    using System.Collections.Generic;
    using System.Data.Entity.Core.Metadata.Edm;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.ModelConfiguration.Conventions;

    public class ForeignKeyNamingConvention : IStoreModelConvention<AssociationType>
    {
        // By default, Entity Framework will assume a foreign key column name
        // like Customer_Id, when we prefer CustomerId.

        public void Apply(AssociationType association, DbModel model)
        {
            if (association.IsForeignKey)
            {
                var constraint = association.Constraint;

                NormalizeForeignKeyProperties(constraint.FromProperties);
                NormalizeForeignKeyProperties(constraint.ToProperties);
            }
        }

        private static void NormalizeForeignKeyProperties(IEnumerable<EdmProperty> properties)
        {
            foreach (var property in properties)
            {
                int underscoreIndex = property.Name.IndexOf('_');

                if (underscoreIndex > 0)
                    property.Name = property.Name.Remove(underscoreIndex, 1);
            }
        }
    }
}