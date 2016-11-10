namespace EmployeeDirectory.Infrastructure
{
    using System.Data.Entity;
    using System.Linq;
    using System.Threading.Tasks;
    using Domain;

    public class DbContextPermissionAuthorizer : IPermissionAuthorizer
    {
        private readonly DirectoryContext _db;

        public DbContextPermissionAuthorizer(DirectoryContext db)
        {
            _db = db;
        }

        public Task<bool> HasPermission(string username, Permission permission)
        {
            return _db.EmployeeRoles
                .Where(er => er.Employee.Username == username)
                .Where(er => er.Role.RolePermissions.Any(rp => rp.Permission == permission))
                .AnyAsync();
        }
    }
}