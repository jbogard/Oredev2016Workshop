namespace EmployeeDirectory.Infrastructure
{
    using System;
    using System.Data;
    using System.Data.Entity;
    using System.Data.Entity.ModelConfiguration.Conventions;
    using System.Threading.Tasks;
    using Domain;

    [DbConfigurationType(typeof(DirectoryDbConfiguration))]
    public class DirectoryContext : DbContext
    {
        private DbContextTransaction _currentTransaction;

        public DirectoryContext(string connectionString)
            : base(connectionString)
        {
        }

        public DbSet<Employee> Employees { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<RolePermission> RolePermissions { get; set; }
        public DbSet<EmployeeRole> EmployeeRoles { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            UseIdValuesGeneratedByTheDatabase(modelBuilder);
            UseSimpleForeignKeyNamingConvention(modelBuilder);
            UseSingularTableNames(modelBuilder);
            SearchThisAssemblyForEntityMappings(modelBuilder);
        }

        private static void UseIdValuesGeneratedByTheDatabase(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Add<IdentityConvention>();
        }

        private static void UseSimpleForeignKeyNamingConvention(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Add<ForeignKeyNamingConvention>();
        }

        private static void UseSingularTableNames(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

        private static void SearchThisAssemblyForEntityMappings(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.AddFromAssembly(typeof(DirectoryContext).Assembly);
        }

        public void BeginTransaction()
        {
            if (_currentTransaction != null)
            {
                return;
            }

            _currentTransaction = Database.BeginTransaction(IsolationLevel.ReadCommitted);
        }

        public async Task CommitTransactionAsync()
        {
            try
            {
                await SaveChangesAsync();

                _currentTransaction?.Commit();
            }
            catch (Exception)
            {
                RollbackTransaction();
            }
            finally
            {
                if (_currentTransaction != null)
                {
                    _currentTransaction.Dispose();
                    _currentTransaction = null;
                }
            }
        }

        public void RollbackTransaction()
        {
            try
            {
                _currentTransaction?.Rollback();
            }
            finally
            {
                if (_currentTransaction != null)
                {
                    _currentTransaction.Dispose();
                    _currentTransaction = null;
                }
            }
        }
    }
}