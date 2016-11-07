namespace EmployeeDirectory.Infrastructure
{
    using System.Data.Entity;

    /// <summary>
    /// This class is automatically discovered and used by EntityFramework.
    /// </summary>
    public class DirectoryDbConfiguration : DbConfiguration
    {
        public DirectoryDbConfiguration()
        {
            DisableAutomaticDatabaseInitialization();

            SetProviderServices("System.Data.SqlClient",
                 System.Data.Entity.SqlServer.SqlProviderServices.Instance);
        }

        private void DisableAutomaticDatabaseInitialization()
        {
            SetDatabaseInitializer<DirectoryContext>(null);
        }
    }
}